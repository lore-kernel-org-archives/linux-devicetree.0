From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] fixed ethernet binding violation for reset signal
Date: Thu, 20 Jul 2017 13:01:24 +0200
Message-ID: <29c1debd-e7ac-9858-6969-cff37ae1d06f@gmail.com>
References: <cover.1498030300.git.sean.wang@mediatek.com>
 <1500520073.25149.2.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500520073.25149.2.camel@mtkswgap22>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/20/2017 05:07 AM, Sean Wang wrote:
> Hi, Matthias
> 
> just a gentle ping on this
> 

Pushed now to v4.13-next/dts32

Thanks!

> 	Sean
> 
> 
> On Wed, 2017-06-21 at 15:49 +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
>> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>
>> Fixed binding violation and also updated related binding documentation to
>> reflect the reset signals the MediaTek Ethernet requires.
>>
>> Sean Wang (2):
>>    dt-bindings: net: mediatek: update documentation for reset signals
>>    arm: dts: mt7623: fixup binding violation missing reset in ethernet
>>      node
>>
>>   Documentation/devicetree/bindings/net/mediatek-net.txt | 6 ++++--
>>   arch/arm/boot/dts/mt7623.dtsi                          | 4 ++++
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
