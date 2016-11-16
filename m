From: wenpan <wenpan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH 1/3] arm: hisi: add ARCH_MULTI_V5 support
Date: Wed, 16 Nov 2016 16:56:44 +0800
Message-ID: <e78a288b-8bab-9441-2edb-6ec08e5103d7@hisilicon.com>
References: <20161017120705.3726-1-wenpan@hisilicon.com>
 <20161017120705.3726-2-wenpan@hisilicon.com> <5893354.6MrIxqzRoI@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5893354.6MrIxqzRoI@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marty Plummer <netz.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, howell.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jalen.hsu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lvkuanliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kevin.lixu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, qinxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Martyo<
Does this confict with your patcho< If noto<I hope this could be merged first.  Besides could you tell me the link to your related patch?

Thanks,
Pan

On 2016/10/17 21:48, Arnd Bergmann wrote:
> On Monday, October 17, 2016 8:07:03 PM CEST Pan Wen wrote:
>> Add support for some HiSilicon SoCs which depend on ARCH_MULTI_V5.
>>
>> Signed-off-by: Pan Wen <wenpan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>>
> 
> Looks ok. I've added Marty Plummer to Cc, he was recently proposing
> patches for Hi3520, which I think is closely related to this one.
> Please try to work together so the patches don't conflict. It should
> be fairly straightforward since you are basically doing the same
> change here.
> 
> 	Arnd
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
