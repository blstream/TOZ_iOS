//
//  NewsMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class NewsResponseMapper: ArrayResponseMapper<NewsItem>, ResponseMapperProtocol {

    static func process(_ obj: AnyObject?) throws -> [NewsItem] {
        return try process(obj, mapper: { jsonNode in
            guard let publishDate = jsonNode["published"] as? Int else { return nil }
            guard let title = jsonNode["title"] as? String else { return nil }
            guard let contents = jsonNode["contents"] as? String else { return nil }
            guard let photoUrl = jsonNode["photoUrl"] as? String? else { return nil }
            let published = Date(timeIntervalSince1970: TimeInterval(publishDate))
            return NewsItem(title: title, contents: contents, photoUrl: photoUrl, published: published)
        })
    }
}
