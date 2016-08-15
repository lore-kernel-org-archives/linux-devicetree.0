From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: imx6sx-udoo-neo: Add SD
Date: Mon, 15 Aug 2016 20:38:23 +0800
Message-ID: <20160815123823.GC500@tiger>
References: <1467691450-22975-1-git-send-email-afaerber@suse.de>
 <1467691450-22975-4-git-send-email-afaerber@suse.de>
 <20160808141248.GI4678@tiger>
 <16912a4e-88c8-b11a-16bb-927ee6bf1775@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <16912a4e-88c8-b11a-16bb-927ee6bf1775-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ettore Chimenti <ettore.chimenti-GcR40IO4/Fc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 08, 2016 at 05:00:41PM +0200, Andreas Färber wrote:
> Am 08.08.2016 um 16:12 schrieb Shawn Guo:
> > On Tue, Jul 05, 2016 at 06:04:10AM +0200, Andreas Färber wrote:
> >> Enable the SDHC node and model the SDIO_PWR GPIO as a regulator.
> >> Use the SD card as default trigger for the red LED.
> >>
> >> Cc: Ettore Chimenti <ettore.chimenti-GcR40IO4/Fc@public.gmane.org>
> >> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> >> ---
> >>  
> >>
> >>  arch/arm/boot/dts/imx6sx-udoo-neo.dtsi | 34 ++++++++++++++++++++++++++++++++++
> >>  1 file changed, 34 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
> >> index e074409644d8..85f5e8606dab 100644
> >> --- a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
> >> +++ b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
> >> @@ -56,6 +56,7 @@
> >>  			label = "udoo-neo:red:mmc";
> >>  			gpios = <&gpio6 0 GPIO_ACTIVE_HIGH>;
> >>  			default-state = "off";
> >> +			linux,default-trigger = "mmc0";
> >>  		};
> >>  
> >>  		orange {
> >> @@ -64,6 +65,17 @@
> >>  			default-state = "keep";
> >>  		};
> >>  	};
> >> +
> >> +	sdio_pwr_reg: sd-gpio-regulator {
> >> +		compatible = "regulator-fixed";
> >> +		gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
> >> +		enable-active-high;
> >> +		regulator-name = "SDIO_PWR";
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-max-microvolt = <3300000>;
> >> +		regulator-boot-on;
> >> +		regulator-always-on;
> >> +	};
> > 
> > Is it correct to model SDIO power control GPIO as a boot-on and
> > always-on fixed regulator?  It will be powered-on even when SDIO driver
> > is not enabled or loaded.
> 
> AFAIR the issue was that the driver does not use any -supply properties
> where we could hook this regulator up for enabling. So modeling it as an
> always-on regulator seemed like the only way to ensure it gets enabled
> without relying on the bootloader?

If I understand it correctly, SDHCI driver calls
mmc_regulator_get_supply() to handle vmmc and vqmmc supply.  Can
vmmc-supply be used here?

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
