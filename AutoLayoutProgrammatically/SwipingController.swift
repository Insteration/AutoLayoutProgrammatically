//
//  SwipingController.swift
//  AutoLayoutProgrammatically
//
//  Created by Артём Кармазь on 12/21/18.
//  Copyright © 2018 Артём Кармазь. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let pages = [
        Page(imageName: "mishalov", headerText: "Слава", bodyText: "Че там у Фрегата?"),
        Page(imageName: "petrenko", headerText: "Костян", bodyText: "Меня лучше не трогайте."),
        Page(imageName: "shishkin", headerText: "Серёга 'Шиша Информатрикс'", bodyText: "Киношные ленты однако."),
        Page(imageName: "artem", headerText: "Артёмчик", bodyText: "Есть код? А если найду? Вашему коду недоджуниор не нужен?"),
        Page(imageName: "shevchuk", headerText: "Димон", bodyText: "Кальян и деньги - это мои два орудия."),
        Page(imageName: "cherniy", headerText: "Санёчек 'ОПАСНОСТЬ'", bodyText: "Эй детка, не хочешь немного любви?"),
        Page(imageName: "gurin", headerText: "Майор Гурин", bodyText: "Тайное становится явным, следствие идёт."),
        Page(imageName: "galat", headerText: "Mr. G", bodyText: "353  VLAN353 D4-CA-6D-52-50-AA 22 Dynamic")
    ]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrevious() {
        //        print("Trying to advance previous")
        
        let previousIndex = max(pageControl.currentPage - 1, 0)
        
        let indexPath = IndexPath(item: previousIndex, section: 0)
        pageControl.currentPage = previousIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        //        print("Trying to advance next")
        
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
     lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        //        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        //        pc.currentPageIndicatorTintColor = pinkColor
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    fileprivate func setupButtonControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        //        bottomControlsStackView.axis = .vertical
        
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            //            previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    //    let imageNames = ["mishalov", "petrenko", "shishkin", "shevchuk"]
    //    let headerStrings = ["Join us today in out", "More bitcoins and keepers slicly", "Wash informator out VIP", "Granade!!!!!!!!"]
    
    // point dragger
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
        print(x, view.frame.width, x / view.frame.width)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonControls()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    
    // delete spacing tab when swiping cells
   
}
