//
//  HomeViewController.m
//  SonyApp
//
//  Created by Chen on 16/4/12.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "HomeViewController.h"
#import "SNSearchBar.h"
#import "QRCodeReaderViewController.h"
#import "SNLoginViewController.h"

#import "SDCycleScrollView.h"
#import "MJExtension.h"
//#import "SNSquareTool.h"
#import "SNSquareButton.h"
#import "SNHomeCategoryCell.h"
#import "SNBannerDownsCell.h"
#import "SNHomePageModel.h"

#import "JZNetworkSingleton.h"
#import "SVProgressHUD.h"
#import "SNHotRecommendCell.h"

#import <AFNetworking.h>

@interface HomeViewController ()<SDCycleScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,HomeCategoryDelegate,SNBannerDownsCellDelegate>

@property (nonatomic,weak)UIView *bigView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign)CGFloat categoryCellHeight;

@end

@implementation HomeViewController

- (UITableView *)tableView{
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor blueColor];
        _tableView.showsVerticalScrollIndicator = NO;// 关闭滚动条
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
    }
    return _tableView;
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    
    [self setNavAndSearch];
    
    [self.view addSubview:self.tableView];
    
    //注册   通过这个表示去缓存池中找ID的cell 找不到创建SN类型的cell
//        [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SNHotRecommendCell class]) bundle:nil] forCellReuseIdentifier:ID];
//    [self.tableView registerClass:[CELL CLASS] forCellReuseIdentifier:ID];// CLASS->ALLOC,INIT
    

}
//设置导航条和搜索条
-(void)setNavAndSearch{
    
    SNSearchBar *searchBar = [[SNSearchBar alloc]initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 80), 35)];
    searchBar.placeholder   = @"双十二促销";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithOriginalName:@"app"] style:UIBarButtonItemStyleBordered target:self action:@selector(pop)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStyleBordered target: self action:@selector(login)];
    self.navigationItem.titleView = searchBar;
    
    //    导航栏变为透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    
    //        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}


//请求banner轮播数据





#pragma mark - UITableViewDataSource
//headerview的高度
//-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//
//    if (section == 0 ) {
//        return 0;
//    }
//    return 20;
//}

// 每行的高度
-(void)cellWithHeight:(CGFloat)value{
   CZLog(@"%s======%f",__func__,value);
    _categoryCellHeight = value;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
    
        return 184;// 184
    }else if(indexPath.row == 1){

        if (self.view.width == 320) {
            return 133;
        }else{
            return 160;
        }
        
    
    }else if (indexPath.row == 2){
    
        return 341;
    }
    return 80;
}

// 每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}
// 有几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0)
    {
        static NSString *cellIndentifier = @"kvcell";
        SNHomeCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil)
        {
            cell = [[ SNHomeCategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier menuArray:nil];
        }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 1){
        static NSString *banner = @"bannerDown";
        SNBannerDownsCell *cell = [tableView dequeueReusableCellWithIdentifier:banner];
        if (cell == nil) {
            cell = [[SNBannerDownsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:banner menuArray:nil];
                    }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
        return cell;
    }else if (indexPath.row == 2){
    
        static NSString *ID = @"recommend";

        SNHotRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if(cell == nil){
        
            cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([SNHotRecommendCell class]) owner:nil options:nil]firstObject];

        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    
    
        
    
    
    
    }

    
 static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = @"add";
    return cell;
    
    
}






-(void)showSuccessHUD:(NSString *)string{
    [SVProgressHUD showInfoWithStatus:string];
}

-(void)showErrorHUD:(NSString *)string{
    [SVProgressHUD showErrorWithStatus:string];
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    [self setTableview ];
//
//    SNSearchBar *searchBar = [[SNSearchBar alloc]initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 80), 35)];
//    searchBar.placeholder   = @"双十二促销";
//      self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithOriginalName:@"app"] style:UIBarButtonItemStyleBordered target:self action:@selector(pop)];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStyleBordered target: self action:@selector(login)];
//    self.navigationItem.titleView = searchBar;
//    
//    //    导航栏变为透明
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
//    //    让黑线消失的方法
////    self.navigationController.navigationBar.shadowImage=[UIImage new];
////    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100. green:arc4random_uniform(100)/100. blue:arc4random_uniform(100)/100. alpha:1.0];
//
////    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    
//    
////    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 300, 375, 200)];
////    bigView.backgroundColor = [UIColor yellowColor];
////    _bigView = bigView;
////    [self.view addSubview:bigView];
//    [self setUpSquare];
//
//#pragma 轮播
//    
//    CGFloat w = self.view.bounds.size.width;
//    NSArray *imagesURLStrings = @[
//                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
//                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
//                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
//                                  ];
//    
//    
//
//    // 网络加载 --- 创建带标题的图片轮播器
//    CGFloat cycleY = -64;
//    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,cycleY, w, 200) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    
//    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
////    cycleScrollView2.titlesGroup = titles;
//    cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
//    [self.scrollView addSubview:cycleScrollView];
//
//    //         --- 模拟加载延迟
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        cycleScrollView.imageURLStringsGroup = imagesURLStrings;
//    });
//    
////     block监听点击方式
//     
//     cycleScrollView.clickItemOperationBlock = ^(NSInteger index) {
//     NSLog(@">>>>>  %ld", (long)index);
//     }; 
//    
//}
//
////setTableview
//-(void)setTableview{
//    
//    self.scrollView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width,600 ) style:UITableViewStylePlain];
////    self.scrollView.contentSize = CGSizeMake(self.view.width, 5000);
//    [self.view  addSubview:self.scrollView];
//    
////    self.scrollView.transform = CGAffineTransformMake(0, 0, 0, 0, 0, 300);
//    
//    
//}
////  设置按钮
//-(void)setUpSquare{
//    
////    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 200-64, 375, self.bigView.height)];
//    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0,0, 375, self.bigView.height)];
//        bigView.backgroundColor = [UIColor yellowColor];
//        _bigView = bigView;
//        self.scrollView.tableHeaderView = bigView;
//    
//    //一共4列
//    NSInteger maxCols = 7;
//    CGFloat btnW = (self.view.width -(maxCols - 1) ) / maxCols;
//    
//    CGFloat btnH = btnW;
//    SNSquareTool *tool = [[SNSquareTool alloc]init];
//    NSLog(@"%s1",__func__);
//    [tool getSquareData:^(NSArray *squareItems) {
//        
//        for (NSInteger i = 0; i < squareItems.count; i++) {
//            SNSquareButton *button = [[SNSquareButton alloc]init];
//            button.square = squareItems[i];
//            NSInteger col = i % maxCols;//第几列
//            NSInteger row = i / maxCols;//第几行
//            CGFloat btnX = col * btnW;
//            CGFloat btnY = row * btnH+200;
//            button.frame = CGRectMake(btnX, btnY, btnW, btnH);
//            [self.bigView addSubview:button];
//        }
////        //算出cell的高度
////        self.height = (squareItems.count + maxCols - 1)/maxCols *  btnH;
////        [self setNeedsDisplay];
//        self.bigView.height =((squareItems.count + maxCols - 1 )/ maxCols *btnH)+200 ;
//        NSLog(@"2");
//    }];
//    NSLog(@"3");
//
//    
//    
//    
//    
//}


-(void)pop {
    
    
    static QRCodeReaderViewController *reader = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        reader                        = [QRCodeReaderViewController new];
        reader.modalPresentationStyle = UIModalPresentationFormSheet;// 跳转方式
//        NSLog(@"%@",[NSThread currentThread]);
    });
    reader.delegate = self;
    
#warning 打印扫描到的结果
    
    [reader setCompletionWithBlock:^(NSString *resultAsString) {
        CZLog(@"Completion with result: %@", resultAsString);
    }];
    
    [self presentViewController:reader animated:YES completion:NULL];
    
}
-(void)login {
    
    
    SNLoginViewController *login = [[SNLoginViewController alloc]initWithNibName:nil bundle:nil];
    login.hidesBottomBarWhenPushed = YES;// 只会隐藏系统自带的tabbar
    
    [self.navigationController pushViewController:login animated:YES];

    self.bigView.clipsToBounds = YES;
    UIView *shopView = [[UIView alloc]init];
    shopView.backgroundColor = [UIColor blueColor];
    //每个商品的宽度
    CGFloat shopw = 60;
    CGFloat shoph = 90;
    CGFloat margin = 10;
    int cols = 4;//列数
    int rows = 2;
    // 每列之间的间距
    CGFloat marginCol =((self.bigView.frame.size.width - cols * shopw) - margin * 2) / (cols - 1);
    CGFloat marginRow = ((self.bigView.frame.size.height - rows *shoph) - margin * 2) / (rows - 1);
//    CZLog(@"%f",self.bigView.frame.size.height );
    // 商品的x值
    NSInteger index = self.bigView.subviews.count;// 索引
    NSInteger col = index % cols;// 索引 对列数取余 3 % 4 = 4
    NSInteger row = index / cols;//  索引 / 列数  3 / 4 = 0 行
    
    CGFloat shopx = margin + col * (shopw + marginCol);
    CGFloat shopy = margin + row * (shoph + marginRow);
    
    shopView.frame = CGRectMake(shopx, shopy, shopw, shoph);
    
    UIImageView *iconView = [[UIImageView alloc]init];
    iconView.image = [UIImage imageNamed:@"tempShop"];
    iconView.frame = CGRectMake(0, 0, shopw, shopw);
    iconView.backgroundColor = [UIColor blueColor];
    [shopView addSubview:iconView];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"888";
    label.frame = CGRectMake(0, shopw, shopw, shoph);
    [shopView addSubview:label];
    
    [self.bigView addSubview:shopView];
    
}


#pragma mark - QRCodeReader Delegate Methods

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QRCodeReader" message:result delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}





























@end
