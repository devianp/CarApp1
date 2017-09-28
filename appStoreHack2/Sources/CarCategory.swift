
struct CarCategory {
    let name: String
    let cars: [Car]
}

extension CarCategory {
    static var sampleCarCategories: [CarCategory] {
        return [
            CarCategory(name: "911", cars: [
                Car(name: "991.2 (2015-)"  , category: "911", imageName: "2"),
                Car(name: "991 (2012-2014)", category: "911", imageName: "2"),
                Car(name: "997 (2005-2011)", category: "911", imageName: "2"),
                Car(name: "996 (1999-2004)", category: "911", imageName: "2"),
                Car(name: "993 (1995-1998)", category: "911", imageName: "2"),
                Car(name: "964 (1989–1994)", category: "911", imageName: "2"),
                Car(name: "930 (1975-1989)", category: "911", imageName: "2"),
                Car(name: "911 (1963–1989)", category: "911", imageName: "2"),
                ]),
            CarCategory(name: "Games", cars: [
                Car(name: "991.2 (2015-)"  , category: "Games", imageName: "2"),
                Car(name: "991 (2012-2014)", category: "Games", imageName: "2"),
                Car(name: "997 (2005-2011)", category: "Games", imageName: "2"),
                Car(name: "996 (1999-2004)", category: "Games", imageName: "2"),
                Car(name: "993 (1995-1998)", category: "Games", imageName: "2"),
                Car(name: "964 (1989–1994)", category: "Games", imageName: "2"),
                Car(name: "930 (1975-1989)", category: "Games", imageName: "2"),
                Car(name: "911 (1963–1989)", category: "Games", imageName: "2"),
                ])
        ]
    }
}
