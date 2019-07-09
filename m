From: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
Subject: Re: [PATCH v2 05/10] net: hisilicon: HI13X1_GMAX need dreq reset at
 first
Date: Tue, 9 Jul 2019 21:48:56 +0800
Message-ID: <101b8c68-75f5-00a7-9845-e59c0467768c@huawei.com>
References: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
 <1562643071-46811-6-git-send-email-xiaojiangfeng@huawei.com>
 <890c48d1-76b8-5aea-e175-aa7d9967acd2@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <890c48d1-76b8-5aea-e175-aa7d9967acd2@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, davem@davemloft.net, robh+dt@kernel.org, yisen.zhuang@huawei.com, salil.mehta@huawei.com, mark.rutland@arm.com, dingtianhong@huawei.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leeyou.li@huawei.com, nixiaoming@huawei.com, jianping.liu@huawei.com, xiekunxun@huawei.com
List-Id: devicetree@vger.kernel.org



On 2019/7/9 17:35, Sergei Shtylyov wrote:
> Hello!
> 
> On 09.07.2019 6:31, Jiangfeng Xiao wrote:
> 
>> HI13X1_GMAC delete request for soft reset at first,
>> otherwise, the subsequent initialization will not
>> take effect.
>>
>> Signed-off-by: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
>> ---
>>   drivers/net/ethernet/hisilicon/hip04_eth.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/hisilicon/hip04_eth.c b/drivers/net/ethernet/hisilicon/hip04_eth.c
>> index fe61b01..19d8cfd 100644
>> --- a/drivers/net/ethernet/hisilicon/hip04_eth.c
>> +++ b/drivers/net/ethernet/hisilicon/hip04_eth.c
> [...]
>> @@ -853,6 +867,15 @@ static int hip04_mac_probe(struct platform_device *pdev)
>>           goto init_fail;
>>       }
>>   +#if defined(CONFIG_HI13X1_GMAC)
>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>> +    priv->sysctrl_base = devm_ioremap_resource(d, res);
> 
>    There's devm_platform_ioremap_resource() now.

Thank you for your review, Great issue, which makes my code more concise.

I will fix it in v3. Or submit a patch to modify it separately, if maintainer
applies this patch series.
