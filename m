From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC PATCH 2/2] ARM: i.MX: dts: add fsl, imx25-wdt compatible to
 all relevant watchdog nodes
Date: Mon, 26 Sep 2016 08:27:59 +0200
Message-ID: <20160926062759.3eoezyezog6clz6x@pengutronix.de>
References: <1474850361-20884-1-git-send-email-vz@mleia.com>
 <1474850361-20884-3-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1474850361-20884-3-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Vladimir,

On Mon, Sep 26, 2016 at 03:39:21AM +0300, Vladimir Zapolskiy wrote:
> Watchdog device controller found on all modern SoCs from i.MX series
> and firstly introduced in i.MX25 is not one in one compatible with the
> watchdog controllers on i.MX21, i.MX27 and i.MX31, the latter
> controlles don't have WICR (and pretimeout notification support) and
> WMCR registers. To get benefit from the more advanced watchdog device
> and to avoid operations over non-existing registers on legacy SoCs add
> fsl,imx25-wdt compatible to descriptions of all i.MX25 compatible
> watchdog controllers.
> 
> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx35.dtsi   |  3 ++-
>  arch/arm/boot/dts/imx50.dtsi   |  3 ++-
>  arch/arm/boot/dts/imx51.dtsi   |  6 ++++--
>  arch/arm/boot/dts/imx53.dtsi   |  6 ++++--
>  arch/arm/boot/dts/imx6qdl.dtsi |  6 ++++--
>  arch/arm/boot/dts/imx6sl.dtsi  |  6 ++++--
>  arch/arm/boot/dts/imx6sx.dtsi  |  9 ++++++---
>  arch/arm/boot/dts/imx6ul.dtsi  |  6 ++++--
>  arch/arm/boot/dts/imx7s.dtsi   | 12 ++++++++----
>  arch/arm/boot/dts/ls1021a.dtsi |  2 +-
>  arch/arm/boot/dts/vfxxx.dtsi   |  3 ++-
>  11 files changed, 41 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx35.dtsi b/arch/arm/boot/dts/imx35.dtsi
> index 490b7b4..8fd4482 100644
> --- a/arch/arm/boot/dts/imx35.dtsi
> +++ b/arch/arm/boot/dts/imx35.dtsi
> @@ -284,7 +284,8 @@
>  			};
>  
>  			wdog: wdog@53fdc000 {
> -				compatible = "fsl,imx35-wdt", "fsl,imx21-wdt";
> +				compatible = "fsl,imx35-wdt", "fsl,imx25-wdt",
> +					     "fsl,imx21-wdt";

When this is used on an old kernel that doesn't know about fsl,imx25-wdt
this picks up the imx21 driver logic. As this is wrong I think you
should drop imx21-wdt here. Can one of the dt-people comfirm?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
