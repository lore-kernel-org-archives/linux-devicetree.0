From: Sriram Dash <sriram.dash-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [linux-devel] [PATCH 1/3] dts: usb3: Add configure-gfladj
 property       to USB3 nod
Date: Fri, 11 Aug 2017 17:56:25 +0000
Message-ID: <AM3PR04MB12018E640B04B627D7890AF5F5890@AM3PR04MB1201.eurprd04.prod.outlook.com>
References: <1502443796-5255-1-git-send-email-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502443796-5255-1-git-send-email-yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yinbo Zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>, "linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org" <linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org>Yinbo Zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: open list <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, open list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bart Van Assche <bart.vanassche-XdAiOPVOjttBDgjK7y7TUQ@public.gmane.org>, moderated list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>From: linux-devel-bounces-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org [mailto:linux-devel-
>bounces-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org] On Behalf Of yinbo.zhu-3arQi8VN3Tc@public.gmane.org
>Subject: [linux-devel] [PATCH 1/3] dts: usb3: Add configure-gfladj propert=
y to USB3
>nod
>
>From: "yinbo.zhu" <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
>
>Signed-off-by: yinbo.zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
>---
> arch/arm/boot/dts/ls1021a.dtsi | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dt=
si index
>ffbf3cf..f525297 100644
>--- a/arch/arm/boot/dts/ls1021a.dtsi
>+++ b/arch/arm/boot/dts/ls1021a.dtsi
>@@ -731,6 +731,8 @@
> 			interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> 			dr_mode =3D "host";
> 			snps,quirk-frame-length-adjustment =3D <0x20>;
>+			configure-gfladj;

I reckon the "configure-gfladj" is replaced with "snps,quirk-frame-length-a=
djustment"
in open source, which sets fladj reg value.
Please verify.

>+			dma-coherent;

> 			snps,dis_rxdet_inp3_quirk;
> 		};
>
>--
>2.1.0.27.g96db324
>
>_______________________________________________
>linux-devel mailing list
>linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org
>http://gforge.freescale.net/mailman/listinfo/linux-devel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
