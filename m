From: Frank Wang <frank.wang@rock-chips.com>
Subject: Re: [PATCH 1/3] arm: dts: rk322x: fix i2s1 pinctrl error
Date: Wed, 17 May 2017 17:21:01 +0800
Message-ID: <1e922ff2-d1ce-5bff-e172-3b2ddf713d9e@rock-chips.com>
References: <1494992451-32542-1-git-send-email-frank.wang@rock-chips.com>
 <1494992451-32542-2-git-send-email-frank.wang@rock-chips.com>
 <2781249.GNsgFIKA50@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2781249.GNsgFIKA50@diego>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, charles.chen@rock-chips.com, cody.xie@rock-chips.com, kevan.lan@rock-chips.com, huangtao@rock-chips.com, sugar.zhang@rock-chips.com, wmc@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2017/5/17 17:01, Heiko Stübner wrote:
> Hi Frank,
>
> Am Mittwoch, 17. Mai 2017, 11:40:49 CEST schrieb Frank Wang:
>> From: Sugar Zhang <sugar.zhang@rock-chips.com>
>>
>> Refer to Chapter 5.3.2 of rk3229 TRM, we can see that GPIO1A[2,4,5]
>> using RK_FUNC_2 not RK_FUNC_1. This patch fixes it.
>>
>> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> if the patch has another author, you should preserve his/her Signed-off-by
> line, so for example this patch would look like:
>
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
>
> Same for all other patches with differing authors in your 2 series from
> today. As this touches the developer-certificate-of-origin, this is also
> something I cannot really correct myself.

Noted and thanks for reminding, I will resend these 2 series.

BR.
Frank

>
> Heiko
>
>
>> ---
>>   arch/arm/boot/dts/rk322x.dtsi | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
>> index 48a0c1c..cc6a27d 100644
>> --- a/arch/arm/boot/dts/rk322x.dtsi
>> +++ b/arch/arm/boot/dts/rk322x.dtsi
>> @@ -621,9 +621,9 @@
>>   						<0 12 RK_FUNC_1 &pcfg_pull_none>,
>>   						<0 13 RK_FUNC_1 &pcfg_pull_none>,
>>   						<0 14 RK_FUNC_1 &pcfg_pull_none>,
>> -						<1 2 RK_FUNC_1 &pcfg_pull_none>,
>> -						<1 4 RK_FUNC_1 &pcfg_pull_none>,
>> -						<1 5 RK_FUNC_1 &pcfg_pull_none>;
>> +						<1 2 RK_FUNC_2 &pcfg_pull_none>,
>> +						<1 4 RK_FUNC_2 &pcfg_pull_none>,
>> +						<1 5 RK_FUNC_2 &pcfg_pull_none>;
>>   			};
>>   		};
>
>
>
>
