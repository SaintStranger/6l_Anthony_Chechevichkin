//
//  main.swift
//  6l_Anthony_Chechevichkin
//
//  Created by Katerina on 21.07.2020.
//  Copyright © 2020 CHAS. All rights reserved.
//

import Foundation

struct Queue<T> {

    typealias DictionaryType = [T]

    private var contents: [T] = []

    init() { }

    init<S: Sequence>(_ sequence: S) where
        S.Iterator.Element == T {
            for element in sequence {
                contents.append(element)
            }
    }

    public mutating func enqueue(_ element: T) {
        contents.append(element)
    }

    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return contents.removeFirst()
        }
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: contents)
    }
}

extension Queue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

extension Queue: Sequence {
    typealias Iterator = AnyIterator<(T)>

    func makeIterator() -> Iterator {
        var iterator = contents.makeIterator()

        return AnyIterator {
            return iterator.next()
        }
    }
}

extension Queue: Collection {
    // 1
    typealias Index = DictionaryType.Index
    typealias Element = DictionaryType.Element

    var startIndex: Index { return contents.startIndex }
    var endIndex: Index { return contents.endIndex }

    subscript(index: Index) -> Iterator.Element {
        get { return contents[index] }
    }

    func index(after i: Index) -> Index {
        return contents.index(after: i)
    }
}




var numbersRow: Queue = [1,2,3,4,5,6,7,8,9,10]

print(numbersRow[3])

print(numbersRow.count)

numbersRow.enqueue(24)
print(numbersRow)
numbersRow.dequeue()
numbersRow.dequeue()
numbersRow.dequeue()
print(numbersRow)


for item in numbersRow {
    print ("Печатаем следующее в очереди", item)
}


let sportSarsBrands: Queue = ["McLAren", "Aston Martin", "Ferrari", "Mercedes"]

let sportCars = sportSarsBrands.filter { $0.count < 4 }
print(sportCars)



//На самом деле это заглушка, скопированная с других примеров, что нельзя считать осознанным решением.
//Но опять проволить срок непозволительно))
//Можно, пожалуйста, когда я, наконец, допру все моменты данной темы, отдельно пришлю, например в личку? Мне буквально вечер ещ> посидеть не спеша. Не больше.
