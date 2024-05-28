//
//  HomeResources.swift
//  TestAssignment
//
//  Created by Hitexa Kakadiya on 27/05/24.
//

import Foundation

struct PostResource
{
    func postApi(pageNumber: Int, limit: Int, completion : @escaping (_ result: [PostResponse]?) -> Void)
    {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_page=\(pageNumber)&_limit=\(limit)")!
        let httpUtility = HttpUtility()
        httpUtility.getApiData(requestUrl: url, resultType: [PostResponse].self) { result in
            _ = completion(result)
        }
    }
}
