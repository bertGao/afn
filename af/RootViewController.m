//
//  RootViewController.m
//  af
//
//  Created by dllo on 15/4/17.
//  Copyright (c) 2015年 dllo. All rights reserved.
//

#import "RootViewController.h"
#import"AFNetworking.h"
@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, retain)UITableView *tableView;
@property(nonatomic,retain)NSMutableArray *arr;

@end

@implementation RootViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.arr = [NSMutableArray array];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlPath = @"http://online.dongting.com/recomm/recomm_modules?&app=ttpod&v=v7.7.0.2015012818&uid=&mid=iPhone4&f=f320&s=s310&imsi=&hid=&splus=7.1.1&active=1&net=2&openudid=ad6f50f586818c4f36ff4358053c1b53fee58cdf&idfa=E2EAC64B-1F1C-4AC5-A0E1-8BE37A03FB96&utdid=VTCyBQSkYzwDAALO9zZTFfPC&alf=201200&version=1429340403";
    
    //1.使用 NSURLConnection版本的AFNetworking
    
    //1.1创建一个AFN管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
   
    
    //使用GET下载数据
//    NSDictionary *params = [[NSDictionary alloc]init];
    
    [manager GET:urlPath parameters:nil success:
     
     ^(AFHTTPRequestOperation *operation, id responseObject) {
         
         NSData *data = operation.responseData;
         
         NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
         
         NSDictionary*dic=[dict valueForKey:@"data"];
         NSArray *arr=[dic valueForKey:@"songlists"];
        for (int i = 0; i < arr.count; i++) {
            NSMutableDictionary *dic2 = arr[i];
            NSString * str=[dic2 valueForKey:@"name"];
//            [stu setValuesForKeysWithDictionary:dic2];
            [self.arr addObject:str];
            [self.tableView reloadData];
            NSLog(@"%@" , str);
        }
         
     }
     
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             NSLog(@"下载错误 is %@",error);
             
         }];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuse = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
//    cell.textLabel.text = [[self.arr objectAtIndex:indexPath.row]objectForKey:@"name"];
    cell.textLabel.text = [self.arr objectAtIndex:indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
