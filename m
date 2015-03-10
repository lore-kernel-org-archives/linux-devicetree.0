From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 0/3] add power-supply support to dw_hdmi
Date: Tue, 10 Mar 2015 09:58:18 +0000
Message-ID: <20150310095818.GG8656@n2100.arm.linux.org.uk>
References: <1429128.MSqYm0qZ9p@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429128.MSqYm0qZ9p@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 10, 2015 at 12:21:21AM +0100, Heiko Stuebner wrote:
> At least the Rockchip variant of the dw_hdmi should control its supplying
> regulators. A cursory glance at the imx manual didn't any equivalent there,
> so I'm not sure if there are similar controllable regulators present.
> 
> Patch1 is only a small fix to keep {devm_}regulator_bulk_get quiet in
> the deferring case and could go directly to the regulator tree, if ok.
> 
> Patch3 is the addition of the supplies to the rk3288 boards and I would
> take it into my dts branch if patch2 gets deemed acceptable.

I have a problem with this approach.

Rather than trying to shove everything into the generic part of the driver,
what we should be doing is ensuring that the generic part stays generic,
and the specific implementation details end up in the appropriate place.

As Rockchip needs these external regulators, they should be in that part
of the driver, and controlled appropriately from the encoder callbacks.
The encoder has sufficient callbacks to be able to turn on/off regulators
both before and after the bridge has been disabled/enabled.

When we see more implementations with regulators, then we can think about
moving it into the core dw_hdmi driver code.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
