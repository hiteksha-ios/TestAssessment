//
//  HomeViewModel.swift
//  TestAssignment
//
//  Created by Hitexa Kakadiya on 27/05/24.
//

import Foundation

protocol PostViewModelDelegate {
    func didReceivePostResponse(response: [PostResponse]?)
}

struct PostViewModel
{
    var delegate : PostViewModelDelegate?

    func getPostApi(pageNumber: Int, limit: Int)
    {
        let postResource = PostResource()
        postResource.postApi(pageNumber: pageNumber, limit: limit) { result in
            DispatchQueue.main.async {
                self.delegate?.didReceivePostResponse(response: result)
            }
        }
    }
}
