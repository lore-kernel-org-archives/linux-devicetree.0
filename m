Return-Path: <SRS0=TAEE=NJ=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 3/7] ARM: dts: r8a77470: Add USB PHY DT support
Date: Mon, 29 Oct 2018 11:03:25 +0000
Message-ID: 
 <OSBPR01MB229342BBEA17FA4940A8BA7DD8F30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
 <1540475819-47950-4-git-send-email-biju.das@bp.renesas.com>
 <OSBPR01MB2293701427C81C84346C6972D8F30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSBPR01MB2103F5FC0A00589A4EBE02D4B8F30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB2103F5FC0A00589A4EBE02D4B8F30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju-san,

> From: Biju Das, Sent: Monday, October 29, 2018 6:15 PM
> > -----Original Message-----
> > From: Yoshihiro Shimoda
> > Sent: 29 October 2018 08:42
> >
> > Hi Biju-san,
> >
> > > From: Biju Das, Sent: Thursday, October 25, 2018 10:57 PM
> > >
> > > Define the r8a77470 generic part of the USB PHY device node.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > > This patch is tested against renesas-devel
> >
> > Thank you for the patch!
> >
> > <snip>
> > > +		usbphy1: usb-phy@e6598100 {
> > > +			compatible =3D "renesas,usb-phy-r8a77470",
> > > +				     "renesas,rcar-gen2-usb-phy";
> > > +			reg =3D <0 0xe6598100 0 0x100>,
> > > +			      <0 0xee0c0200 0 0x118>;
> > > +			#address-cells =3D <1>;
> > > +			#size-cells =3D <0>;
> > > +			clocks =3D <&cpg CPG_MOD 706>, <&cpg CPG_MOD
> > 705>;
> > > +			clock-names =3D "usbhs", "usb20_host";
> > > +			status =3D "disabled";
>=20
> 'status =3D "disabled"'.

Oops! I overlooked this line...

> > > +			resets =3D <&cpg 706>, <&cpg 705>;
> > > +			power-domains =3D <&sysc
> > R8A77470_PD_ALWAYS_ON>;
> > > +
> > > +			usb1: usb-channel@0 {
> > > +				reg =3D <0>;
> > > +				#phy-cells =3D <1>;
> > > +			};
> > > +		};
> >
> > I think this usbphy1 has to have 'status =3D "disabled"'.
>=20
> It is already disabled please see above.

Indeed.
However, I prefer that properties order of both usbphy0 and usbphy1
are the same because it improves readability.

Best regards,
Yoshihiro Shimoda


> Regards,
> Biju
