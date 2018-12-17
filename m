Return-Path: <SRS0=2g+B=O2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400113.outbound.protection.outlook.com ([40.107.140.113]:12055
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726767AbeLQMR6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 17 Dec 2018 07:17:58 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 11/17] arm64: dts: renesas: r8a774c0: Add USB-DMAC and
 HSUSB device nodes
Date: Mon, 17 Dec 2018 12:17:12 +0000
Message-ID: <TY1PR01MB1770B4A08F1C04979B88C0FBC0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-12-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181217105437.u2lgri7iuomjn7wq@verge.net.au>
In-Reply-To: <20181217105437.u2lgri7iuomjn7wq@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 17 December 2018 10:55
> To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Subject: Re: [PATCH 11/17] arm64: dts: renesas: r8a774c0: Add USB-DMAC an=
d HSUSB device nodes
>
> On Fri, Dec 14, 2018 at 09:37:34AM +0000, Fabrizio Castro wrote:
> > Add usb dmac and hsusb device nodes on RZ/G2E SoC dtsi.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 45 +++++++++++++++++++++++=
++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a774c0.dtsi
> > index 0ab3aa6..79cdaac 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > @@ -514,6 +514,51 @@
> >  status =3D "disabled";
> >  };
> >
> > +hsusb: usb@e6590000 {
> > +compatible =3D "renesas,usbhs-r8a774c0",
> > +     "renesas,rcar-gen3-usbhs";
> > +reg =3D <0 0xe6590000 0 0x200>;
>
> The above looks good but while reviewing this patch I noticed
> that the size of the hsusb register range on in the DT for r8a774a1
> is 0x100, Is that correct?

That is a good catch! No, I don't think it's correct, I'll send a patch to =
fix that.

Thanks,
Fab

>
> As for this patch, it looks good to me but I will wait to see if there ar=
e
> other reviews before applying.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
> > +interrupts =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
> > +dmas =3D <&usb_dmac0 0>, <&usb_dmac0 1>,
> > +       <&usb_dmac1 0>, <&usb_dmac1 1>;
> > +dma-names =3D "ch0", "ch1", "ch2", "ch3";
> > +renesas,buswait =3D <11>;
> > +phys =3D <&usb2_phy0>;
> > +phy-names =3D "usb";
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 704>, <&cpg 703>;
> > +status =3D "disabled";
> > +};
> > +
> > +usb_dmac0: dma-controller@e65a0000 {
> > +compatible =3D "renesas,r8a774c0-usb-dmac",
> > +     "renesas,usb-dmac";
> > +reg =3D <0 0xe65a0000 0 0x100>;
> > +interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> > +interrupt-names =3D "ch0", "ch1";
> > +clocks =3D <&cpg CPG_MOD 330>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 330>;
> > +#dma-cells =3D <1>;
> > +dma-channels =3D <2>;
> > +};
> > +
> > +usb_dmac1: dma-controller@e65b0000 {
> > +compatible =3D "renesas,r8a774c0-usb-dmac",
> > +     "renesas,usb-dmac";
> > +reg =3D <0 0xe65b0000 0 0x100>;
> > +interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
> > +      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> > +interrupt-names =3D "ch0", "ch1";
> > +clocks =3D <&cpg CPG_MOD 331>;
> > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 331>;
> > +#dma-cells =3D <1>;
> > +dma-channels =3D <2>;
> > +};
> > +
> >  dmac0: dma-controller@e6700000 {
> >  compatible =3D "renesas,dmac-r8a774c0",
> >       "renesas,rcar-dmac";
> > --
> > 2.7.4
> >


[https://www2.renesas.eu/media/email/unicef.jpg]

This Christmas, instead of sending out cards, Renesas Electronics Europe ha=
ve decided to support Unicef with a donation. For further details click her=
e<https://www.unicef.org/> to find out about the valuable work they do, hel=
ping children all over the world.
We would like to take this opportunity to wish you a Merry Christmas and a =
prosperous New Year.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
