From: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
Subject: Re: [PATCH v2 05/10] net: hisilicon: HI13X1_GMAX need dreq reset at
 first
Date: Wed, 10 Jul 2019 13:05:20 +0800
Message-ID: <5e3eda91-dedc-e687-6a18-b1aec1e9fe63@huawei.com>
References: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
 <1562643071-46811-6-git-send-email-xiaojiangfeng@huawei.com>
 <890c48d1-76b8-5aea-e175-aa7d9967acd2@cogentembedded.com>
 <101b8c68-75f5-00a7-9845-e59c0467768c@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <101b8c68-75f5-00a7-9845-e59c0467768c@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, davem@davemloft.net, robh+dt@kernel.org, yisen.zhuang@huawei.com, salil.mehta@huawei.com, mark.rutland@arm.com, dingtianhong@huawei.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leeyou.li@huawei.com, nixiaoming@huawei.com, jianping.liu@huawei.com, xiekunxun@huawei.com
List-Id: devicetree@vger.kernel.org



On 2019/7/9 21:48, Jiangfeng Xiao wrote:
> 
> 
> On 2019/7/9 17:35, Sergei Shtylyov wrote:
>> Hello!
>>
>> On 09.07.2019 6:31, Jiangfeng Xiao wrote:
>>
[...]
>>> @@ -853,6 +867,15 @@ static int hip04_mac_probe(struct platform_device *pdev)
>>>           goto init_fail;
>>>       }
>>>   +#if defined(CONFIG_HI13X1_GMAC)
>>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>>> +    priv->sysctrl_base = devm_ioremap_resource(d, res);
>>
>>    There's devm_platform_ioremap_resource() now.
> 
> Thank you for your review, Great issue, which makes my code more concise.
> 
> I will fix it in v3. Or submit a patch to modify it separately, if maintainer
> applies this patch series.
> 
I decided to wait for this series of patches to sync to the mainline
and then fix this based on the mainline.

Because the mainline does not currently have this part of the code,
if I submit the changes, and the patch is accidentally merged into
another branch or another maintainer to handle, a conflict will occur.

As we all know, maintianer has to deal with many commits every day,
I don't want to increase the burden of maintainer.

So I decided to wait until the patch is synced to the mainline
and then modify it, which is more safe.
