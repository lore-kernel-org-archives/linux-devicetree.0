From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V1 0/3] fix clock issue for fsl,spdif
Date: Tue, 25 Aug 2015 11:45:27 -0700
Message-ID: <20150825184527.31346.52324@quantum>
References: <cover.1439284957.git.shengjiu.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1439284957.git.shengjiu.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shengjiu Wang <shengjiu.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Shengjiu Wang (2015-08-11 02:26:51)
> fix clock issue for fsl,spdif
> 
> Shengjiu Wang (3):
>   ARM: imx6q: Add SPDIF_GCLK clock in clock tree
>   ARM: imx6sl: Add SPDIF_GCLK clock in clock tree
>   ARM: imx6sx: Add SPDIF_GCLK clock in clock tree

Hello Shengjiu Wang,

Please move the dts changes into separate patches. I can take the
changes to the clock driver and the header through the clk tree, but the
dt patches need to go through arm-soc.

Regards,
Mike

> 
>  arch/arm/boot/dts/imx6qdl.dtsi            |  2 +-
>  arch/arm/boot/dts/imx6sl.dtsi             | 16 ++++++++++++++++
>  arch/arm/boot/dts/imx6sx.dtsi             |  2 +-
>  drivers/clk/imx/clk-imx6q.c               |  4 +++-
>  drivers/clk/imx/clk-imx6sl.c              |  4 +++-
>  drivers/clk/imx/clk-imx6sx.c              |  1 +
>  include/dt-bindings/clock/imx6qdl-clock.h |  3 ++-
>  include/dt-bindings/clock/imx6sl-clock.h  |  3 ++-
>  include/dt-bindings/clock/imx6sx-clock.h  |  3 ++-
>  9 files changed, 31 insertions(+), 7 deletions(-)
> 
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
