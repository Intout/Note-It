//
//  NoteDetailsViewController.swift
//  Note It
//
//  Created by Mert Tecimen on 21.08.2022.
//

import UIKit

class NoteDetailsViewController: UIViewController {

    var viewModel = ViewModel()
    var collectionViewHelper: CollectionViewHelper?
    
    private lazy var scrollView: UIScrollView = {
       
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delaysContentTouches = true
        return scrollView
        
    }()
    
    private lazy var collectionView: UICollectionView = {
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: 50, height: 50)
        collectionViewFlowLayout.minimumLineSpacing = 20
        collectionViewFlowLayout.minimumInteritemSpacing = 20
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
        
    }()
    
    
    private lazy var textContainterView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var vStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 25
        //stackView.distribution = .fillProportionally
        stackView.layoutMargins = UIEdgeInsets(top: 25, left: 50, bottom: 0, right: 50)
        return stackView
    }()
    
    private lazy var titleTextField: UITextField = {
        
        var textField = UITextField()
        
        let attributedPlaceHolderText = NSMutableAttributedString(string: "Title")
        attributedPlaceHolderText.addAttribute(NSMutableAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: NSRange(location: 0, length: attributedPlaceHolderText.length))
        attributedPlaceHolderText.addAttribute(NSMutableAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 30), range: NSRange(location: 0, length: attributedPlaceHolderText.length))
        
        textField.font = .boldSystemFont(ofSize: 30)
        
        textField.attributedPlaceholder = attributedPlaceHolderText
        textField.backgroundColor = .clear
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addBottomBorder(with: UIColor.orange, andWidth: 1, offset: 10)
        return textField
        
    }()
    
    private lazy var subtitleTextField: UITextField = {
        
        var textField = UITextField()
        
        let attributedPlaceHolderText = NSMutableAttributedString(string: "Subtitle")
        attributedPlaceHolderText.addAttribute(NSMutableAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: NSRange(location: 0, length: attributedPlaceHolderText.length))
        attributedPlaceHolderText.addAttribute(NSMutableAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: NSRange(location: 0, length: attributedPlaceHolderText.length))
        
        textField.font = .boldSystemFont(ofSize: 20)
        
        textField.attributedPlaceholder = attributedPlaceHolderText
        textField.backgroundColor = .clear
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addBottomBorder(with: UIColor.orange, andWidth: 1, offset: 10)
        return textField
        
    }()
    
    private lazy var bodyTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 15)
        textView.isScrollEnabled = false
        textView.text = "Text goes here..."
        return textView
    }()
    
    fileprivate lazy var doneButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonPressed))
        
        button.tintColor = UIColor.black
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        collectionViewHelper = CollectionViewHelper(collectionView: collectionView)
        collectionViewHelper?.delegate = self
        viewModel.viewDidLoad()
        
        
        setupUI()
    }
    
    private func setupUI(){
        
        view.backgroundColor = UIColor(red: 254/255, green: 223/255, blue: 191/255, alpha: 1)
        
        self.navigationItem.rightBarButtonItem = doneButton
        self.navigationController?.navigationBar.tintColor = .black
        view.addSubview(scrollView)
       
        
        scrollView.addSubview(textContainterView)
        
        textContainterView.addSubview(vStack)
        
        vStack.addArrangedSubview(collectionView)
        vStack.addArrangedSubview(titleTextField)
        vStack.addArrangedSubview(subtitleTextField)
        vStack.addArrangedSubview(bodyTextView)
        
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            textContainterView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            textContainterView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            textContainterView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            textContainterView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            textContainterView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            vStack.rightAnchor.constraint(equalTo: textContainterView.rightAnchor, constant: -5),
            vStack.leftAnchor.constraint(equalTo: textContainterView.leftAnchor, constant: 5),
            vStack.topAnchor.constraint(equalTo: textContainterView.topAnchor),
            vStack.bottomAnchor.constraint(equalTo: textContainterView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 50),
        ])
    
        if let view = vStack.arrangedSubviews.last{
            NSLayoutConstraint.activate([
                view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
                
            ])
        }
        
        
        
        
    }
    
    @objc func doneButtonPressed(){
        
        if titleTextField.text?.count ?? 0 > 0 && subtitleTextField.text?.count ?? 0 > 0{
            viewModel.doneButtonEvent(title: titleTextField.text ?? "", subtitle: subtitleTextField.text ?? "", body: bodyTextView.text ?? "")
        }
        
    }

}

extension UIView{
    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat, offset: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height + offset, width: frame.size.width, height: borderWidth)
        self.addSubview(border)
    }
}

extension NoteDetailsViewController: NoteDetailsViewModelDelegate{
    func dataDidFetched(data: NoteData?) {
        if let data = data{
            titleTextField.text = data.title
            subtitleTextField.text = data.subTitle
            bodyTextView.text = data.body
            collectionViewHelper?.setData(name: viewModel.selectedImage)
        }
    }
}

extension NoteDetailsViewController: CollectionViewHelperDelegate{
    func rowSelected(for name: String) {
        viewModel.selectedImage = name
        collectionViewHelper?.setData(name: name)
        print(name)
    }
}
