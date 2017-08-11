From: Leo Li <leoyang.li@nxp.com>
Subject: RE: [linux-devel] [PATCH 1/3] dts: usb3: Add configure-gfladj
 property       to USB3 nod
Date: Fri, 11 Aug 2017 16:24:49 +0000
Message-ID: <AM4PR0401MB1699817496EBA074245E96A28F890@AM4PR0401MB1699.eurprd04.prod.outlook.com>
References: <1502443796-5255-1-git-send-email-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502443796-5255-1-git-send-email-yinbo.zhu@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yinbo Zhu <yinbo.zhu@nxp.com>Yinbo Zhu <yinbo.zhu@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Felipe Balbi <balbi@kernel.org>
Cc: open list <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Catalin Marinas <catalin.marinas@arm.com>, open list <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bart Van Assche <bart.vanassche@sandisk.com>, moderated list <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: linux-devel-bounces@gforge.freescale.net [mailto:linux-devel-
> bounces@gforge.freescale.net] On Behalf Of yinbo.zhu@nxp.com
> Sent: Friday, August 11, 2017 4:30 AM
> To: linux-devel@gforge.freescale.net; Yinbo Zhu <yinbo.zhu@nxp.com>; Rob
> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> Russell King <linux@armlinux.org.uk>; Felipe Balbi <balbi@kernel.org>
> Cc: open list <devicetree@vger.kernel.org>; Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>; Catalin Marinas
> <catalin.marinas@arm.com>; open list <linux-usb@vger.kernel.org>; open li=
st
> <linux-kernel@vger.kernel.org>; Doug Ledford <dledford@redhat.com>;
> Stefano Stabellini <sstabellini@kernel.org>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Bart Van Assche
> <bart.vanassche@sandisk.com>; moderated list <linux-arm-
> kernel@lists.infradead.org>
> Subject: [linux-devel] [PATCH 1/3] dts: usb3: Add configure-gfladj proper=
ty to
> USB3 nod
>=20
> From: "yinbo.zhu" <yinbo.zhu@nxp.com>
>=20

There is no device tree binding for this property.  You need to add the bin=
ding first before you add it to the dts.  And normally you need to describe=
 why the change is needed in the commit message.

> Signed-off-by: yinbo.zhu <yinbo.zhu@nxp.com>
> ---
>  arch/arm/boot/dts/ls1021a.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.d=
tsi
> index ffbf3cf..f525297 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -731,6 +731,8 @@
>  			interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
>  			dr_mode =3D "host";
>  			snps,quirk-frame-length-adjustment =3D <0x20>;
> +			configure-gfladj;
> +			dma-coherent;

This change is not aligned with your patch title.

>  			snps,dis_rxdet_inp3_quirk;
>  		};
>=20
> --
> 2.1.0.27.g96db324
>=20
> _______________________________________________
> linux-devel mailing list
> linux-devel@gforge.freescale.net
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgforg=
e.
> freescale.net%2Fmailman%2Flistinfo%2Flinux-
> devel&data=3D01%7C01%7Cleoyang.li%40nxp.com%7C015b054c76ad48399ea408
> d4e09de91d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdata=3D7ioU%2Bb
> QUP4X%2F8%2BFpcQZICVDHugioStScbrHc0XOqaQs%3D&reserved=3D0
