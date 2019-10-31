//
//  Pet.swift
//  PetShop
//
//  Created by Sipos Eduard on 28/10/2019.
//  Copyright © 2019 Sipos Eduard. All rights reserved.
//

struct Pet: Codable {
    let id: Int?
    let name: String
    let age: Int
    let type: String
    let details: String
    let price: Float
    let imageUrl: String
    
    static func dummyPets() -> [Pet] {
        return [
            Pet(
                id: 1,
                name: "Beagle",
                age: 8,
                type: "Dog",
                details: "Prietenos, jucăuș și sociabil, acceptă ușor străinii și se împacă bine cu copiii.",
                price: 100.0,
                imageUrl: "https://4pede.ro/wp-content/uploads/2015/05/rasa-beagle.jpg"
                ),
            Pet(
                id: 2,
                name: "Cavalier King Charles Spaniel",
                age: 1,
                type: "Dog",
                details: "Cățelul e vioi, jucaus, prietenoș, inteligenț având o prezență elegantă, regală. Ideali ca si animale de companie pentru familie.",
                price: 500,
                imageUrl: "https://hellobark.com/wp-content/uploads/pixel-cavalier.jpg"
            ),
            Pet(
                id: 3,
                name: "Husky",
                age: 6,
                type: "Dog",
                details: "Husky Siberian este un câine nobil și prietenos, însă în același timp îndrăzneț și alert. Nu are sub nici o formă calitățile unui câine de pază și apărare, nu este suspicios față de străini și nici agresiv cu alți câini.",
                price: 250,
                imageUrl: "https://pbs.twimg.com/profile_images/639599645925076994/7Egv8qXQ.jpg"
            ),
            Pet(
                id: 4,
                name: "Shiba Inu",
                age: 4,
                type: "Dog",
                details: "A spirited boldness, a good nature, and an unaffected forthrightness, which together yield dignity and natural beauty. The Shiba has an independent nature and can be reserved toward strangers but is loyal and affectionate to those who earn his respect.",
                price: 1000,
                imageUrl: "https://gfp-2a3tnpzj.stackpathdns.com/wp-content/uploads/2016/07/Shiba-Inu-1600x700.jpg"
            ),
            Pet(
                id: 5,
                name: "Australian Shepherd",
                age: 2,
                type: "Dog",
                details: "are puternice instincte de turmă și îi place să ia parte la viața de familie, bucurându-se de compania stăpânilor săi. El poate fi inițial rezervat față de persoanele noi, astfel încât socializarea timpurie este esențială.",
                price: 600,
                imageUrl: "https://cutzucutzu.com/wp-content/uploads/2019/05/cea-mai-buna-hrana-ciobanesc-australian-2-1024x576.jpg"
            ),
            Pet(
                id: 6,
                name: "Scottish Fold",
                age: 1,
                type: "Cat",
                details: "Scottish Folds are good-natured and and adjust to other animals within a household extremely well. They tend to become very attached to their human caregivers and are by nature quite affectionate.",
                price: 400,
                imageUrl: "https://cupisici.ro/wp-content/uploads/2018/03/pisica-scottish-fold3.jpg"
            ),
            Pet(
                id: 7,
                name: "Ragdoll",
                age: 1,
                type: "Cat",
                details: "temperament docil și placid, au o natura afectuoasă.",
                price: 500,
                imageUrl: "https://www.thehappycatsite.com/wp-content/uploads/2018/06/ragdoll-cat-colors-header.jpg"
            ),
            Pet(
                id: 8,
                name: "American Shorthair",
                age: 8,
                type: "Cat",
                details: "American Shorthairs are low-maintenance cats that are generally healthy, easy-going, affectionate with owners and social with strangers.",
                price: 450,
                imageUrl: "https://scritch-production.imgix.net/b88a5750-137b-11e9-9aa0-05f277f78f75?w=1200&h=1200&fit=crop"
            ),
            Pet(
                id: 9,
                name: "Snowshoe",
                age: 1,
                type: "Cat",
                details: "Snowshoes are generally affectionate, sweet-tempered, and mellow. They enjoy the company of humans and being given attention, and are compatible with children and other pets.",
                price: 500,
                imageUrl: "https://img.pixers.pics/pho_wat(s3:700/FO/60/01/55/14/700_FO60015514_51d82b105f4ec1741270ea02d7f62c0a.jpg,551,700,cms:2018/10/5bd1b6b8d04b8_220x50-watermark.png,over,331,650,jpg)/stickers-chat-de-raquette-isole-sur-fond-blanc.jpg.jpg"
            ),
            Pet(
                id: 10,
                name: "Exotic Shorthair",
                age: 3,
                type: "Cat",
                details: "Pisica linistita, ce nu face tumbe si salturi gigant precum alte rase cu par scurt. De asemenea, este o pisica tacuta, ce arareori miauna.",
                price: 350,
                imageUrl: "https://thumbaymedia.com/petsplus/wp-content/uploads/2016/04/Exotic-Shorthair.jpg"
            )
        ]
    }
}
