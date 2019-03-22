Return-Path: <SRS0=3D6E=RZ=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 1/2] ARM: dts: r8a77470: Add DU support
Date: Fri, 22 Mar 2019 10:53:16 +0000
Message-ID: 
 <TY1PR01MB17703031AFD18BE75E5E554DC0430@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1552998099-22972-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1552998099-22972-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190322104641.hywslvn6mt4pjqbr@verge.net.au>
In-Reply-To: <20190322104641.hywslvn6mt4pjqbr@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 22 March 2019 10:47
> Subject: Re: [PATCH 1/2] ARM: dts: r8a77470: Add DU support
>=20
> On Tue, Mar 19, 2019 at 12:21:38PM +0000, Fabrizio Castro wrote:
> > This commit adds DU support to the RZ/G1C (a.k.a. r8a77470)
> > specific device tree.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/r8a77470.dtsi | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a774=
70.dtsi
> > index f4e232b..493cf2b 100644
> > --- a/arch/arm/boot/dts/r8a77470.dtsi
> > +++ b/arch/arm/boot/dts/r8a77470.dtsi
> > @@ -643,6 +643,38 @@
> >  			resets =3D <&cpg 408>;
> >  		};
> >
> > +		du: display@feb00000 {
> > +			compatible =3D "renesas,du-r8a77470";
> > +			reg =3D <0 0xfeb00000 0 0x40000>;
> > +			interrupts =3D <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 724>,
> > +				 <&cpg CPG_MOD 723>;
>=20
> I do not see MSTP 7 bit 23 documented as used by DU
> in the User's Manual: Hardware v1.00 Oct 13, 2017.
>=20
> Do you have more recent documentation or some insight in this area?

I have the same document, and I can see the bit defined in page 7A-16.
Perhaps you checked the Software Reset Register?

Thanks,
Fab

>=20
> > +			clock-names =3D "du.0", "du.1";
> > +			status =3D "disabled";
> > +
> > +			ports {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				port@0 {
> > +					reg =3D <0>;
> > +					du_out_rgb0: endpoint {
> > +					};
> > +				};
> > +				port@1 {
> > +					reg =3D <1>;
> > +					du_out_rgb1: endpoint {
> > +					};
> > +				};
> > +				port@2 {
> > +					reg =3D <2>;
> > +					du_out_lvds0: endpoint {
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> >  		prr: chipid@ff000044 {
> >  			compatible =3D "renesas,prr";
> >  			reg =3D <0 0xff000044 0 4>;
> > --
> > 2.7.4
> >
