//
//  Storage.swift
//  Navigation
//
//  Created by Евгений Кряквин on 22.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import iOSIntPackage

struct PostPage {
    let image: String
    let description: String
    let author: String
    var likes: Int
    var views: Int
    var filter: ColorFilter
}

struct PostPageSection {
    let posts: [PostPage]
}

struct Storage {
    static let postTableModel = [
        PostPageSection(
            posts: [
                PostPage(image: "BMW", description: "Двигайтесь вперед. Только вперед. Отправляйтесь навстречу горизонту изящно и со вкусом на этом роскошном и быстром туристическом мотоцикле. Новый BMW K 1600 GTL – это вершина качества, невероятный комфорт и мощность легендарного шестицилиндрового двигателя. Модернизированная модель оснащена новейшим поколением систем Dynamic ESA и ABS Pro, а также задним ходом и системой адаптивного освещения поворотов уже в базовой комплектации. Будьте спокойны на любых дорогах и в любых погодных условиях. Наслаждайтесь превосходным контролем и легким управлением во всех своих приключениях. Путешествуя на мотоцикле K 1600 GTL, вы попадаете в новое измерение – стильное, мощное и роскошное. Вас ждут первоклассные впечатления! ", author: "BMW Motorrad", likes: 100, views:200, filter: .noir),
                PostPage(image: "Cross", description: "Мотокросс — это одна из разновидностей гонок по бездорожью. Соревнования проводятся на специально организованных замкнутых трассах длиной 1,5-2 км, не включающих участки дорог общего пользования. Они имеют естественное покрытие и обязательно оснащаются дополнительными препятствиями вроде неровностей рельефа или небольших трамплинов.В зависимости от масштабов соревнований, гонка проводится в 2-3 заезда, на каждый из которых отводится, в среднем, 20-40 минут + 2 дополнительных круга. Участниками используется особая экипировка и специальные кроссовые модели мотоциклов, в зависимости от объема двигателя которых производится деление гонок на классы. При этом существующие классы и конкретные требования к оборудованию в рамках каждого из них указываются для каждого чемпионата отдельно.", author: "mfr.ru", likes: 200, views: 200, filter: .bloom(intensity: 0.5)),
                PostPage(image: "Honda", description: "Выпуская на рынок Хонду Валькирия 1800, компания наверняка рассчитывала завоевать сердца тех, кому по душе технические характеристики «Голд Винга», но не нравится обилие пластика. Возможно, задумка бы удалась, если бы не смелый и инновационный облик байка, который был встречен очень противоречиво. Сыграла свою роль и ценовая политика, из-за которой разница в цене между Valkyrie и полноценным Gold Wing была не так уж и велика. В итоге модель, поступив в продажу в 2014 году, в 2020 уже прекратила своё существование. Впрочем, ещё в 2004 ограниченной серией была выпущена мелкосерийная Honda NRX1800 Valkyrie Rune, но это совсем другой байк, и о нём мы расскажем подробнее чуть ниже.", author: "teamspro.ru", likes: 150, views: 300, filter: .colorInvert),
                PostPage(image: "Voge300ac", description: "Loncin и его итальянский партнер в лице MV Agusta в ближайшем будущем выпустят малокубаторные модели, которые выйдут на рынок под именем Voge. Но уже сейчас в мотосалонах «Мегамото» и Universal Motors появились родстеры 300AC, доступные по цене от 267 тысяч рублей и 300R от 253 тысячи рублей, спортбайк 300RR, продающийся по цене от 260 тысяч рублей и старшая модель 500R - от 392 тысячи рублей. Voge 300AC весит всего около 150 кг и оснащается четырёхтактным 292-кубовым двигателем с водяным охлаждением. Байк обладает шестиступенчатой механической трансмиссией. Максимальная скорость достигает 150 км/ч.", author: "carsweek.ru", likes: 250, views: 300, filter: .monochrome(color: .magenta, intensity: 1.5))
               
        ])
     ]
}
