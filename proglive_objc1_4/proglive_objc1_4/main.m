//
//  main.m
//  proglive_objc1_4
//
//  Created by admin on 12.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

//Сортировку не успел, свободного времени немного было за это дни.

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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Figure* chainFirst = createRandomChain();
        NSLog(@"Длина списка = %i", length(chainFirst));
        NSLog(@"%@", chainToString(chainFirst));
        deleteElement(chainFirst, 1);
        NSLog(@"%@", chainToString(chainFirst));
        insert(chainFirst, getRandomFigure());
        NSLog(@"%@", chainToString(chainFirst));
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
    int n = arc4random_uniform(10) + 1;
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