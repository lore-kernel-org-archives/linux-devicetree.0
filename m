From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: add cdn-dp node for rk3399.
Date: Tue, 13 Feb 2018 11:42:59 +0100
Message-ID: <d8ec2613-b773-9bab-cb4c-1f58eb1c1356@collabora.com>
References: <20180207163150.16332-1-enric.balletbo@collabora.com>
 <20180207163150.16332-2-enric.balletbo@collabora.com>
 <6229682.fDmaELEjz4@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6229682.fDmaELEjz4@phil>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 10/02/18 17:16, Heiko Stuebner wrote:
> Hi Enric,
> 
> Am Mittwoch, 7. Februar 2018, 17:31:49 CET schrieb Enric Balletbo i Serra:
>> From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> Add a node for the cdn DP controller which is embedded in the rk3399
>> SoC.
>>
>> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 50 ++++++++++++++++++++++++++++++++
> 
> It looks like there is no binding document at all for cdn-dp? At least
> I couldn't find one and the original series also didn't seem to include one.
> 
> And while I don't see anything problematic right with the used properties
> right now, I'd think we should really have a binding and give dt-maintainers
> a chance to complain, before adding devicetree nodes based on it.
> 
> I'd guess a mostly usable binding doc should already sit in the chromeos
> tree, which you could base a v2 of this series on?
> 
> 

Sure, I'll send a v2 for this series. Thanks.

  Enric

> Thanks
> Heiko
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
