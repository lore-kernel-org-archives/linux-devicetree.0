From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a77995: add GPIO device nodes
Date: Wed, 13 Sep 2017 07:56:13 +0000
Message-ID: <TY1PR06MB09922EEDDAC86AD23A966B2ED86E0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1505285528-7033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170913074934.GH6756@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170913074934.GH6756@verge.net.au>
Content-Language: ja-JP
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon-san,

> From: Simon Horman
> Sent: Wednesday, September 13, 2017 4:50 PM
>=20
> On Wed, Sep 13, 2017 at 03:52:08PM +0900, Yoshihiro Shimoda wrote:
> > This patch adds GPIO device nodes for r8a77995.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  This patch should be applied after the following patch is applied:
> >   "gpio: rcar: Add r8a77995 (R-Car D3) support".
>=20
> I think it can be applied in parallel with that patch as the driver
> will match on "renesas,rcar-gen3-gpio". Right?

That's right.
My little concern was checkpatch.pl output warning if we didn't applied
the gpio patch :)

Best regards,
Yoshihiro Shimoda

> >  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 112 ++++++++++++++++++++++=
++++++++
> >  1 file changed, 112 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a77995.dtsi
> > index 84b6bd5..a1c9271 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > @@ -139,6 +139,118 @@
> >  			#power-domain-cells =3D <1>;
> >  		};
> >
> > +		gpio0: gpio@e6050000 {
> > +			compatible =3D "renesas,gpio-r8a77995",
> > +				     "renesas,rcar-gen3-gpio",
> > +				     "renesas,gpio-rcar";
> > +			reg =3D <0 0xe6050000 0 0x50>;
> > +			interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&pfc 0 0 9>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			clocks =3D <&cpg CPG_MOD 912>;
> > +			power-domains =3D <&cpg>;
> > +			resets =3D <&cpg 912>;
> > +		};
>=20
> ...
