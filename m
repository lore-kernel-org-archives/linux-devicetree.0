From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 0/2] drm/panel: Add support for the Sitronix ST7789V
Date: Mon, 6 Feb 2017 12:29:31 +0100
Message-ID: <a4634b34-ee70-449e-74c3-2ede4ea8c569@tronnes.org>
References: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
 <2db19e6e-9857-1c92-dc77-c6b862cc771f@tronnes.org>
 <20170206103938.3yghvugiwpzkij6r@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170206103938.3yghvugiwpzkij6r@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org


Den 06.02.2017 11.39, skrev Maxime Ripard:
> Hi Noralf,
>
> On Fri, Feb 03, 2017 at 07:48:51PM +0100, Noralf Trønnes wrote:
>> Den 03.02.2017 10.59, skrev Maxime Ripard:
>>> Hi,
>>>
>>> Here is an attempt at supporting the ST7789V LCD controller from Sitronix.
>> What happens if there's another panel driven by ST7789V that needs
>> a different controller initialization?
> You know those panels / controllers much better than I do, but why
> would that be the case?
>
>> Maybe it's better to name it after the panel, not the controller.
> I guess you could also use that panel directly without the controller?

A controller can drive many different panels that can require different
initializations. I faced that with staging/fbtft, when I wrote
controller drivers having initialization code, and then came across
displays with the same controller but with a different initialization.

Trying to write controller drivers for these controllers is very
difficult with all the possible permutations. On top of that we have
those undocumented commands/registers.

Some panels come with embedded controllers, in which case it makes
sense to write a driver for the panel.

But if the panel and controller are separate, then I don't know. Maybe
the chance of coming across two uncompatible ST7789V and panel
combinations in drm/panel is extremly low.


Noralf.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
