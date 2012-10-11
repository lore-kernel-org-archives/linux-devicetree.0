From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH] pinctrl: remove duplicated include from pinctrl-xway.c
Date: Thu, 11 Oct 2012 17:03:19 +0200
Message-ID: <5076DFB7.40709@openwrt.org>
References: <CAPgLHd_XnZU_E3zso2F1y1GFYHewrGUSSSf8yG9LRjVkbpGL=w@mail.gmail.com> <CACRpkdYxSRAVjsKyYwMDvZ7qGW1zBBQn4SwfEV-GGGPc=ukayw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYxSRAVjsKyYwMDvZ7qGW1zBBQn4SwfEV-GGGPc=ukayw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, grant.likely@secretlab.ca, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 11/10/12 16:00, Linus Walleij wrote:
> On Wed, Oct 10, 2012 at 2:59 PM, Wei Yongjun<weiyj.lk@gmail.com>  wrote:
>
>> From: Wei Yongjun<yongjun_wei@trendmicro.com.cn>
>>
>> Remove duplicated include.
>>
>> dpatch engine is used to auto generate this patch.
>> (https://github.com/weiyj/dpatch)
>>
>> Signed-off-by: Wei Yongjun<yongjun_wei@trendmicro.com.cn>
> Applied to my fixes branch, unless John C has objections, I'll
> keep it there.
>

no objections from me ... thanks for the fix !

     John
