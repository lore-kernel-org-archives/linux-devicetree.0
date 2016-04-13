From: Yao Yuan <yao.yuan-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v6 2/2] dts/ls2080a: update the DTS for QSPI and DSPI
 support
Date: Wed, 13 Apr 2016 02:42:40 +0000
Message-ID: <AM2PR04MB0722F1D9C594CB50DC117D1D89960@AM2PR04MB0722.eurprd04.prod.outlook.com>
References: <1457518926-18518-1-git-send-email-yao.yuan@freescale.com>
 <1457518926-18518-3-git-send-email-yao.yuan@freescale.com>
 <20160413022939.GE28903@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160413022939.GE28903@tiger>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks for your review and work.

Best Regards,
Yuan Yao


> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Wednesday, April 13, 2016 10:30 AM
> To: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; pawel.moll-5wv7dgnIgG8@public.gmane.org; Han
> Xu <han.xu-3arQi8VN3Tc@public.gmane.org>; Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Yao Yuan <yao.yuan-3arQi8VN3Tc@public.gmane.org>
> Subject: Re: [PATCH v6 2/2] dts/ls2080a: update the DTS for QSPI and DSPI
> support
> 
> On Wed, Mar 09, 2016 at 06:22:06PM +0800, Yuan Yao wrote:
> > Signed-off-by: Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>
> > Acked-by: Han xu <han.xu-3arQi8VN3Tc@public.gmane.org>
> 
> Changed subject prefix to 'arm64: dts: ls2080a: ', and then applied the patch.
> 
> Shawn
> 
> > ---
> > Changed in v6:
> > No changes.
> >
> > Changed in v5:
> > Resend base on arm-soc.
> >
> > Changed in v4:
> > No changes.
> >
> > Changed in v3:
> > No changes.
> >
> > Changed in v2:
> > Update my email to <yao.yuan-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts | 9 ++++++++-
> >  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi    | 4 ++--
> >  2 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
> > b/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
> > index 4cb996d..e8801fa 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
> > @@ -178,7 +178,14 @@
> >
> >  &qspi {
> >  	status = "okay";
> > -	qflash0: s25fl008k {
> > +	flash0: s25fl256s1@0 {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		compatible = "st,m25p80";
> > +		spi-max-frequency = <20000000>;
> > +		reg = <0>;
> > +	};
> > +	flash2: s25fl256s1@2 {
> >  		#address-cells = <1>;
> >  		#size-cells = <1>;
> >  		compatible = "st,m25p80";
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> > index 2b23d03..65e612a 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> > @@ -318,7 +318,7 @@
> >
> >  		dspi: dspi@2100000 {
> >  			status = "disabled";
> > -			compatible = "fsl,vf610-dspi";
> > +			compatible = "fsl,ls2080a-dspi", "fsl,ls2085a-dspi";
> >  			#address-cells = <1>;
> >  			#size-cells = <0>;
> >  			reg = <0x0 0x2100000 0x0 0x10000>; @@ -444,7 +444,7
> @@
> >
> >  		qspi: quadspi@20c0000 {
> >  			status = "disabled";
> > -			compatible = "fsl,vf610-qspi";
> > +			compatible = "fsl,ls2080a-qspi", "fsl,ls1021a-qspi";
> >  			#address-cells = <1>;
> >  			#size-cells = <0>;
> >  			reg = <0x0 0x20c0000 0x0 0x10000>,
> > --
> > 2.1.0.27.g96db324
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
