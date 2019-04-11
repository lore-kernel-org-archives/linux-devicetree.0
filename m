From: Frank Rowand <frowand.list@gmail.com>
Subject: =?UTF-8?B?UmU6IFxcIOetlOWkjTogW1BBVENIXSBvZjogZGVsIHJlZHVuZGFudCB0?=
 =?UTF-8?Q?ype_conversion?=
Date: Wed, 10 Apr 2019 21:13:58 -0700
Message-ID: <5739f2b6-5909-adf0-4fa6-dfaa1614a22a@gmail.com>
References: <BE69D0C4DC96EF4BA3F03246F234C4BD01FDE17F@dggeml512-mbx.china.huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BE69D0C4DC96EF4BA3F03246F234C4BD01FDE17F@dggeml512-mbx.china.huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: xiaojiangfeng <xiaojiangfeng@huawei.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 4/10/19 6:51 PM, xiaojiangfeng wrote:
> My pleasure.
> 
> I am very new to sparse.
> 
> I guess the warning is caused by the macro min.

I think the warning is likely because the type of data is 'void *'.

Removing the (int) cast is a good fix, but does not resolve
the sparse warning.

-Frank


> Then I submitted my changes.
> 
> Thanks for code review.
> 
> 
> -----邮件原件-----
> 发件人: Frank Rowand [mailto:frowand.list@gmail.com] 
> 发送时间: 2019年4月11日 2:50
> 收件人: xiaojiangfeng <xiaojiangfeng@huawei.com>; robh+dt@kernel.org; robh@kernel.org
> 抄送: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> 主题: Re: [PATCH] of: del redundant type conversion
> 
> On 4/10/19 1:29 AM, xiaojiangfeng wrote:
>> The type of variable l in early_init_dt_scan_chosen is int, there is 
>> no need to convert to int.
>>
>> Signed-off-by: xiaojiangfeng <xiaojiangfeng@huawei.com>
>> ---
>>  drivers/of/fdt.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c index 
>> 4734223..de893c9 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -1091,7 +1091,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>>  	/* Retrieve command line */
>>  	p = of_get_flat_dt_prop(node, "bootargs", &l);
>>  	if (p != NULL && l > 0)
>> -		strlcpy(data, p, min((int)l, COMMAND_LINE_SIZE));
>> +		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
>>  
>>  	/*
>>  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
>>
> 
> Thanks for catching the redundant cast.
> 
> There is a second problem detected by sparse on that line:
> 
>   drivers/of/fdt.c:1094:34: warning: expression using sizeof(void)
> 
> Can you please fix both issues?
> 
> Thanks,
> 
> Frank
> 
