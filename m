From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC PATCH v2 3/4] drm: rockchip: hdmi: add RK3229 HDMI support
Date: Thu, 07 Jan 2016 17:50:24 +0100
Message-ID: <1452185424.4776.36.camel@pengutronix.de>
References: <1452156811-18150-1-git-send-email-ykk@rock-chips.com>
	 <1452157373-18783-1-git-send-email-ykk@rock-chips.com>
	 <1452161052.4776.7.camel@pengutronix.de> <568E3AD0.1020904@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <568E3AD0.1020904-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Zheng Yang <zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Yakir,

Am Donnerstag, den 07.01.2016, 18:15 +0800 schrieb Yakir Yang:
> Hi Philipp,
> 
> Thanks for your fast respond :)
> 
> On 01/07/2016 06:04 PM, Philipp Zabel wrote:
> > Am Donnerstag, den 07.01.2016, 17:02 +0800 schrieb Yakir Yang:
> >> RK3229 integrate an DesignedWare HDMI2.0 controller and an INNO HDMI2.0 phy,
> >> the max output resolution is 4K.
> >>
> >> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > It sounds like the INNO HDMI2.0 phy is not necessarily specific to
> > RK3229 but might also appear in other SoCs? If so, I think this should
> > be implemented in a separate phy driver and be used by dw_hdmi-rockchip.
> 
> Do you mean I should create a new phy driver that place in "driver/phy" 
> directly ?

Possibly, yes. The exynos video phys are already there. I have kept the
mediatek dsi/hdmi phys together with the DRM driver, but I suppose I
could move them there, too.

> I have think about this idea, and it would make things much clean. But 
> INNO PHY
> driver need the target pixel clock in drm_display_mode, I didn't find a 
> good way
> to pass this variable to separate phy driver. Do you have some idea ?

We'd need to extend the PHY API for this. For the mediatek phys we have
side-stepped the issue by wiring up the PLL output to the common clock
framework.
I expect besides the pixel clock frequency, it might also be necessary
to inform the PHY about cycles per pixel for deep color modes.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
