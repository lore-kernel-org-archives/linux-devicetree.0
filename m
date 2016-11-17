From: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH 1/3] arm: hisi: add ARCH_MULTI_V5 support
Date: Thu, 17 Nov 2016 11:03:42 +0800
Message-ID: <114569cb-79ab-a46d-8582-6169f182a32c@hisilicon.com>
References: <20161017120705.3726-1-wenpan@hisilicon.com>
 <20161017120705.3726-2-wenpan@hisilicon.com> <5893354.6MrIxqzRoI@wuerfel>
 <e78a288b-8bab-9441-2edb-6ec08e5103d7@hisilicon.com>
 <582C2785.2010804@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <582C2785.2010804-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: wenpan <wenpan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marty Plummer <netz.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, howell.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jalen.hsu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lvkuanliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kevin.lixu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, qinxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Wei，

On 2016/11/16 17:31, Wei Xu wrote:
> Hi Pan,
> 
> On 2016/11/16 8:56, wenpan wrote:
>> Hi Marty，
>> Does this confict with your patch？ If not，I hope this could be merged first.  Besides could you tell me the link to your related patch?
> 
> This is the link: https://patchwork.kernel.org/patch/9334743/
> 

Thank you for offering this.If I want to give some comments on Marty's patch,
what should I do?

For Marty's patch, I think there's no need to add specific config item ARCH_HIxxxx
for every chipset. Some existing chipsets depend on ARCH_HISI directly like Hi3519
and Hi3798CV200. If some options like ARM_GIC is removed from ARCH_HISI, this kind
of chipsets will must choose other place to select it. I suggest we should keep selecting
ARM_GIC under ARCH_HISI as Pan's patch do.

The code may be like this:

config ARCH_HISI
 	bool "Hisilicon SoC Support"
-	depends on ARCH_MULTI_V7
+	depends on ARCH_MULTI_V5 || ARCH_MULTI_V6 || ARCH_MULTI_V7
 	select ARM_AMBA
-	select ARM_GIC
+	select ARM_GIC if ARCH_MULTI_V7
+	select ARM_VIC if ARCH_MULTI_V5 || depends on ARCH_MULTI_V6
 	select ARM_TIMER_SP804
 	select POWER_RESET
 	select POWER_RESET_HISI
 	select POWER_SUPPLY

What's your opinion?

Best Regards,
Jiancheng

>> On 2016/10/17 21:48, Arnd Bergmann wrote:
>>> On Monday, October 17, 2016 8:07:03 PM CEST Pan Wen wrote:
>>>> Add support for some HiSilicon SoCs which depend on ARCH_MULTI_V5.
>>>>
>>>> Signed-off-by: Pan Wen <wenpan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>>>>
>>>
>>> Looks ok. I've added Marty Plummer to Cc, he was recently proposing
>>> patches for Hi3520, which I think is closely related to this one.
>>> Please try to work together so the patches don't conflict. It should
>>> be fairly straightforward since you are basically doing the same
>>> change here.
>>>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
