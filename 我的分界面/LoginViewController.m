//
//  LoginViewController.m
//  我的分界面
//
//  Created by 可乐 on 14-3-11.
//  Copyright (c) 2014年 可乐. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "MineViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIScrollView * scrol = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,320, self.view.frame.size.height)];
    [scrol setContentSize:CGSizeMake(0, 600)];
    [self.view addSubview:scrol];
    [scrol release];
    
    
    //背景图
    UIImageView * iamge = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 600)];
    [iamge setImage:[UIImage imageNamed:@"account_login_prompt_ok.png"]];
    iamge.userInteractionEnabled = YES;
    [scrol addSubview:iamge];
    [iamge release];
    
    
    //   返回按钮
    UIButton * backbutton = [[UIButton alloc] initWithFrame:CGRectMake(10, 22, 20, 20)];
    
    [backbutton setBackgroundImage:[UIImage imageNamed:@"gallery_back.png"] forState:UIControlStateNormal ];
    //       [backbutton setBackgroundColor:[UIColor whiteColor]];
    [iamge addSubview: backbutton];
    [backbutton release];
    
    
    //    logo图标
    UIImageView * logo = [[UIImageView alloc] initWithFrame:CGRectMake(30, 50, 50, 50)];
    [logo setImage:[UIImage imageNamed:@"tudou.png"]];
    [iamge addSubview:logo];
    [logo release];
    
    
    //    土豆旅行字
    UILabel * tudoulb = [[UILabel alloc] initWithFrame:CGRectMake(85, 50, 50, 20)];
    [tudoulb setText:@"potato"];
    [tudoulb setTextColor:[UIColor whiteColor]];
    [iamge addSubview:tudoulb];
    [tudoulb release];
    //    土豆旅行字
    UILabel * tudoulb1 = [[UILabel alloc] initWithFrame:CGRectMake(85, 75, 50, 20)];
    [tudoulb1 setText:@"travel"];
    [tudoulb1 setTextColor:[UIColor whiteColor]];
    [iamge addSubview:tudoulb1];
    [tudoulb1 release];
    
//    注册按钮
    UIButton * registerbt = [[UIButton alloc] initWithFrame:CGRectMake(200, 50, 70, 50)];
    [registerbt setImage:[UIImage imageNamed:@"account_register.png"] forState:UIControlStateNormal];
    [registerbt addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [registerbt setTitle:@"注册" forState:UIControlStateNormal];
    
    //    改变字体位置 上左下右
    [registerbt setTitleEdgeInsets:UIEdgeInsetsMake(0, 7, 0, 0)];
    //    //    改变图片位置
    [registerbt setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 45)];

    [iamge addSubview:registerbt];
    [registerbt release];
    
    

    
    //用户名
    _nametext = [[UITextField alloc] initWithFrame:CGRectMake(30, 115, 250, 38)];
    _nametext.placeholder = @"用户名/邮箱";
    [_nametext setBackgroundColor:[UIColor whiteColor]];
    [iamge addSubview:_nametext];
    [_nametext release];
    
    //密码
    _passwdtext = [[UITextField alloc] initWithFrame:CGRectMake(30, 170, 250, 38)];
    _passwdtext.secureTextEntry = YES;
    _passwdtext.placeholder = @"登录密码";
    [_passwdtext setBackgroundColor:[UIColor whiteColor]];
    [iamge addSubview:_passwdtext];
    [_passwdtext release];
    
    // 登录按钮
    UIButton * myregister = [[UIButton alloc] initWithFrame:CGRectMake(30, 220, 250, 38)];
    [myregister setTitle:@"登录" forState:UIControlStateNormal];
    [myregister addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [myregister setBackgroundColor:[UIColor greenColor]];
    [iamge addSubview:myregister];
    [myregister release];
    
    //    或者从以下方式登录
    UIImageView * otherview = [[UIImageView alloc] initWithFrame:CGRectMake(30,290 , 250, 10)];
    [otherview setImage: [UIImage imageNamed:@"login_seperate_bar@2x"]];
    [iamge addSubview:otherview];
    [otherview release];
    
//    新浪登录
    UIButton * sinabt = [[UIButton alloc] initWithFrame:CGRectMake(30, 320, 83, 50)];
    [sinabt setBackgroundImage:[UIImage imageNamed:@"sina_login@2x.png"] forState:UIControlStateNormal];
    [iamge addSubview:sinabt];
    [sinabt release];
    
    UIButton * qqbt = [[UIButton alloc] initWithFrame:CGRectMake(113, 320, 83, 50)];
    [qqbt setBackgroundImage:[UIImage imageNamed:@"qq_login@2x.png"] forState:UIControlStateNormal];
    [iamge addSubview:qqbt];
    [qqbt release];
    
    UIButton * weibobt = [[UIButton alloc] initWithFrame:CGRectMake(196, 320, 83, 50)];
    [weibobt setBackgroundImage:[UIImage imageNamed:@"tencent_login@2x.png"] forState:UIControlStateNormal];
    [iamge addSubview:weibobt];
    [weibobt release];
    
    
}
-(void)loginAction:(id)sender
{
    
    NSLog(@" 登录——————");
    NSString *str1 = _nametext.text;
    NSString *str2 = _passwdtext.text;
 
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:str2,@"password",str1,@"username", nil];
    NSLog(@"++++++++%@",dic);
    
//   链接登录接口
    [AsynconnectModel connectionWithUrl:RS_TripConnection parmaters:dic finishBlock:^(id response){
        
//        单例
        NSUserDefaults * userdefults = [NSUserDefaults standardUserDefaults];
        
        if ([response isKindOfClass:[NSDictionary class]] ) {
            
            [_dic addEntriesFromDictionary:response];
            
            [userdefults setObject:str1 forKey:@"username"];
            [userdefults setObject:str2 forKey:@"password"];
            NSLog(@"*********%@***********",response);
        }
        if ([response isKindOfClass:[NSString class]]) {
            [_arr addObject:response];
            
            [userdefults setObject:str1 forKey:@"username"];
            [userdefults setObject:str2 forKey:@"password"];
            NSLog(@"----------%@",response);
        }
        if ([userdefults objectForKey:@"username"]) {
            MineViewController * mine = [[MineViewController alloc] init];
            [self presentViewController:mine animated:YES completion:Nil];
            [mine release];
            
        }
//       ＊＊＊＊ 同步存储
        [userdefults synchronize];
        
    }];
    
}
//点击进入注册页面
-(void)registerAction:(id)sender
{
    RegisterViewController * regis = [[RegisterViewController alloc] init];
    [self presentViewController:regis animated:YES completion:Nil];
    [regis release];



}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
