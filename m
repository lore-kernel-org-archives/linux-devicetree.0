From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/9] ARM: dts: update Boundary Devices boards support
Date: Wed, 30 Sep 2015 14:03:13 +0800
Message-ID: <20150930060312.GC16362@tiger>
References: <1441645069-27263-1-git-send-email-gary.bisson@boundarydevices.com>
 <1441801853-10264-1-git-send-email-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441801853-10264-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 09, 2015 at 02:30:44PM +0200, Gary Bisson wrote:
> Hi all,
> 
> This series is a follow-up to the previous series that added LCD display
> support.
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-August/364425.html

The MAINTAINERS file has been updated for a couple of release cycles
with my new email address.  Please stop sending patches to
shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, and resend any patches you want me to collect to
shawnguo-DgEjT+Ai2yi4UlQgPVntAg@public.gmane.org

Shawn

> 
> This one aims at adding touchscreen and WiFi support for Nitrogen6x as well as
> adding two boards: Nitrogen6_Max and Nit6xlite.
> 
> It also takes care of updating the licenses to be GPLv2/X11.
> 
> The series has been tested against linux-next tag next-20150909.
> 
> Note that imx_v6_v7_defconfig has been used with the following additions:
> CONFIG_TOUCHSCREEN_EDT_FT5X06=y
> CONFIG_I2C_MUX_GPIO=y
> CONFIG_RTC_DRV_M41T80=y
> 
> Modifications:
> v2->v3:
> - Rename nodes to general class of device as suggested by Philipp and Russell.
> - Remove useless wakeup-gpio field for edt,ft5x06 touchscreen
> - Add missing muxing for interrupt GPIO
> - Rebased on next-20150909
> v1->v2:
> - Add Boundary Devices Inc. to vendor prefixes
> - Relicense devices trees to GPLv2/X11 as suggested by Fabio for:
>   - Nitrogen6x
>   - SabreLite
>   - Nit6xLite
>   - Nitrogen6_MAX
> - Change manufacturer to Boundary Devices as suggested by Fabio for:
>   - Nitrogen6x
>   - Nit6xLite
>   - Nitrogen6_MAX
> - Fixed missing macros for gpio/irq values as suggested by Philipp.
> - Rebased on next-20150908
> 
> Regards,
> Gary
> 
> Gary Bisson (9):
>   ARM: dts: imx6dql-nitrogen6x: add touchscreen support
>   ARM: dts: imx6qdl-nitrogen6x: add wifi wl1271 support
>   ARM: dts: imx6qdl-nitrogen6x: relicense under GPLv2/X11
>   ARM: dts: imx6qdl-sabrelite: relicense under GPLv2/X11
>   of: Add Boundary Devices Inc. vendor prefix
>   ARM: dts: imx6q-nitrogen6x: change manufacturer to Boundary Devices
>   ARM: dts: imx6dl-nitrogen6x: change manufacturer to Boundary Devices
>   ARM: dts: imx: add Boundary Devices Nitrogen6_Max board
>   ARM: dts: imx: add Boundary Devices Nitrogen6_Lite board
> 
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  arch/arm/boot/dts/Makefile                         |   2 +
>  arch/arm/boot/dts/imx6dl-nit6xlite.dts             |  49 ++
>  arch/arm/boot/dts/imx6dl-nitrogen6x.dts            |  44 +-
>  arch/arm/boot/dts/imx6dl-sabrelite.dts             |  40 +-
>  arch/arm/boot/dts/imx6q-nitrogen6_max.dts          |  53 ++
>  arch/arm/boot/dts/imx6q-nitrogen6x.dts             |  44 +-
>  arch/arm/boot/dts/imx6q-sabrelite.dts              |  40 +-
>  ...6qdl-nitrogen6x.dtsi => imx6qdl-nit6xlite.dtsi} | 396 ++++++----
>  arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi       | 873 +++++++++++++++++++++
>  arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi          | 111 ++-
>  arch/arm/boot/dts/imx6qdl-sabrelite.dtsi           |  40 +-
>  12 files changed, 1523 insertions(+), 170 deletions(-)
>  create mode 100644 arch/arm/boot/dts/imx6dl-nit6xlite.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-nitrogen6_max.dts
>  copy arch/arm/boot/dts/{imx6qdl-nitrogen6x.dtsi => imx6qdl-nit6xlite.dtsi} (50%)
>  create mode 100644 arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
> 
> -- 
> 2.5.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
