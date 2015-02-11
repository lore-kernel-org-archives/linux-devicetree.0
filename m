From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH RFC v8 11/21] Documentation: dt-bindings: Add bindings
 for Synopsys DW MIPI DSI DRM bridge driver
Date: Wed, 11 Feb 2015 16:23:01 +0100
Message-ID: <1423668181.4680.24.camel@pengutronix.de>
References: <1420014219-915-1-git-send-email-Ying.Liu@freescale.com>
	 <1420014219-915-12-git-send-email-Ying.Liu@freescale.com>
	 <1423131004.3207.27.camel@pengutronix.de> <20150206081318.GA15088@victor>
	 <20150211072128.GA13301@victor> <1423659648.4680.18.camel@pengutronix.de>
	 <20150211140931.GA6666@victor>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150211140931.GA6666@victor>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: stefan.wahren-eS4NqCHxEME@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, andyshrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 11.02.2015, 22:09 +0800 schrieb Liu Ying:
> BTW, regarding the compatible string topic, shall I keep my implementation
> unchanged and don't append the additional "snps,dw-mipi-dsi" as I shared
> my concerns about it before?

Leave the implementation unchanged. Still, I'd like to see
"snps,dw-mipi-dsi" appended to the mipi_dsi compatible property in
Documentation/devicetree/bindings/drm/bridge/dw_mipi_dsi.txt
and in arch/arm/boot/dts/imx6qdl.dtsi. After all, Freescale's i.MX6
specific implementation is register compatible to Synopsys' design,
isn't it?

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
