//
//  main.m
//  proglive_objc1_4
//
//  Created by admin on 12.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Figure.h"
#import "Circle.h"
#import "Rectangle.h"
#import "Ellipse.h"

typedef enum {
    circle,
    rectangle,
    ellipse
} FigureType;

unsigned length(Figure* first);
BOOL insert(Figure* first, Figure* newElement);
Figure* createRandomChain();
NSString* chainToString(Figure *first);
BOOL deleteElement(Figure* first, unsigned number);
Figure* getRandomFigure();
BOOL swipe(Figure *prev, Figure *a, Figure *b);
Figure* bubbleSort(Figure *chain);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Figure* chainFirst = createRandomChain();
        NSLog(@"Длина списка = %i", length(chainFirst));
        NSLog(@"%@", chainToString(chainFirst));
        
        Figure *chainSort = bubbleSort(chainFirst);
        NSLog(@"%@", chainToString(chainSort));
    }
    return 0;
}

unsigned length(Figure* first) {
    int count = 0;
    Figure* temp = first;
    while (temp) {
        temp = temp->next;
        count++;
    }
    return count;
}

BOOL insert(Figure* first, Figure* newElement) {
    Figure* temp = first;
    Figure* tail = nil;
    while (temp) {
        if (temp->next == nil) {
            tail = temp;
        }
        temp = temp->next;
    }
    if (tail) {
        tail->next = newElement;
        return YES;
    }
    else {
        return NO;
    }
}

Figure* createRandomChain() {
    int n = arc4random_uniform(5) + 7;
    Figure* first = getRandomFigure();
    if (n > 1) {
        Figure* tail = first;
        for (int i = 0; i < n - 1; i++) {
            Figure* temp = getRandomFigure();
            tail->next = temp;
            tail = temp;
        }
    }
    return first;
}

NSString* chainToString(Figure* first) {
    NSString* res = [[NSString alloc] init];
    res = @"\n";
    Figure* temp = first;
    int count = 0;
    while (temp) {
        //Каждый объект, наследуемый от Figure умеют конвертировать себя в строку
        NSString* append = [[NSString alloc] init];
        append = [NSString stringWithFormat:@"[%i] %@\n", count, [temp toString]];
        res = [res stringByAppendingString: append];
        temp = temp->next;
        count++;
    }
    return res;
}

BOOL deleteElement(Figure* first, unsigned number) {
    int len = length(first);
    //Подразумеваем, что индексация начинается с 0. Невозможно удаление единственного элемента цепочки
    if ( (number > len - 1 ) || (len == 1) || (number == 0) ) {
        return NO;
    }
    else {
        Figure* previous = first;
        Figure* current  = first->next;
        
        for (int i = 0; i < number - 1; i++) {
            previous = current;
            current = current->next;
        }
        previous->next = current->next;
        [current release];
    }
    return YES;
}

Figure* getRandomFigure() {
    Figure* figure;
    FigureType type = arc4random_uniform(3);
    switch (type) {
        case circle:
            figure = [[Circle alloc] initWithRandom];
            break;
            
        case rectangle:
            figure = [[Rectangle alloc] initWithRandom];
            break;
            
        case ellipse:
            figure = [[Ellipse alloc] initWithRandom];
            break;
            
    }
    return figure;
}

BOOL swipe(Figure *prev, Figure *a, Figure *b) {
    prev->next = b;
    a->next = b->next;
    b->next = a;
    return YES;
}

//Тут такая жесть из-за односвязности списка. Если мы свайпаем первый элемент, то функция должна вернуть указатель на "новый" первый элемент.
//Также косяк из-за односвязности списка возникает с самим свайпом. Приходится отправлять ссылки на 3 элемента, по-другому тоже никак!
//Вобщем смысл такой: первую итерацию внешнего цикла делаем ручками, т.к. она "особая" :)
Figure* bubbleSort(Figure *chain) {
    unsigned len = length(chain);
    Figure *first  = chain;
    Figure *second;
    Figure *prev, *a, *b;
    
    for(int i = 0; i < len - 1; i++) {
        if ( [first square] > [first->next square] ) {
            second = first->next;
            first->next = second->next;
            second->next = first;
            first = second;
        }
        prev = first;
        a    = first->next;
        b    = first->next->next;
        for(int j = 0; j < len - i - 2; j++) {
            if ( [a square] > [b square] ) {
                swipe(prev, a, b);
                prev = b;
                a = a;
                b = a->next;
            } else {
                prev = a;
                a = b;
                b = b->next;
            }
        }
    }
    
    return first;
}