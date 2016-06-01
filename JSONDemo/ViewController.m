//
//  ViewController.m
//  JSONDemo
//
//  Created by student on 16/3/14.
//  Copyright © 2016年 胡锦涛. All rights reserved.
//

#import "ViewController.h"
#import "People.h"
#import "CustomTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
NSMutableArray *dataArr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    获取data.txt该文件的路径
    NSString * path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"txt"];
    //根据文件路径将文件的内容转化成NSData 数据
    NSData * data = [NSData dataWithContentsOfFile:path];
//    将data转化成字典 （JSON 数据解析：SBJson）
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@",dic);
//    输出之后知道它的value以及它的层级结构
//    最外层是字典，然后是数组，最里边是字典
    NSArray * array = dic[@"result"];
    NSLog(@"==========>>>>>>%@",array);
//   初始化数据源
    dataArr = @[].mutableCopy;
//    从字典中取出cover。"imgsum，replynum，setname等属性
    for (NSDictionary * dataDic in array) {
        People * p = [[People alloc] init];
        p.cover =dataDic[@"cover"];
        p.imgsum = [dataDic[@"imgsum"] intValue];
        p.replynum = [dataDic[@"replynum"] intValue];
        p.setname = dataDic[@"setname"];
        [dataArr addObject:p];
    }
    //创建tableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:nil options:nil] lastObject];
    }
    [cell setPeople:dataArr[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
