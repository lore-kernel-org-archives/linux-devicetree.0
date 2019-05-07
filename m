From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2] arm64: allwinner: h6:
 orangepi-one-plus: Add Ethernet support
Date: Tue, 7 May 2019 18:27:35 +0530
Message-ID: <CAMty3ZDNi7t-FSj=Wt3p39=CWx-o6QzKgbMKYd93mgDLBMVrbg@mail.gmail.com>
References: <20190503115928.27662-1-jagan@amarulasolutions.com>
 <20190503144651.ttqfha656dykqjzo@flea> <CAMty3ZCQTiX5OvCG_uMRS02vFu0c1-bkcyauLD6oaFcd=y3RNA@mail.gmail.com>
 <20190506133101.c3twwwydy5mez3db@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190506133101.c3twwwydy5mez3db@core.my.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-amarula <linux-amarula@amarulasolutions.com>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 6, 2019 at 7:01 PM Ond=C5=99ej Jirman <megous@megous.com> wrote=
:
>
> On Mon, May 06, 2019 at 03:03:15PM +0530, Jagan Teki wrote:
> > On Fri, May 3, 2019 at 8:16 PM Maxime Ripard <maxime.ripard@bootlin.com=
> wrote:
> > >
> > > On Fri, May 03, 2019 at 05:29:28PM +0530, Jagan Teki wrote:
> > > > Add Ethernet support for orangepi-one-plus board,
> > > >
> > > > - Ethernet port connected via RTL8211E PHY
> > > > - PHY suppiled with
> > > >   GMAC-2V5, fixed regulator with GMAC_EN pin via PD6
> > > >   GMAC-3V, which is supplied by VCC3V3-MAC via aldo2
> > > > - RGMII-RESET pin connected via PD14
> > > >
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >
> > > Your commit log should be improved. We can get those informations fro=
m
> > > the patch itself...
> >
> > Thought it was a clear commit log :)  will update anyway.
> >
> > >
> > > > ---
> > > > Changes for v2:
> > > > - emac changes on top of https://patchwork.kernel.org/cover/1089952=
9/
> > > >   series
> > > >
> > > >  .../allwinner/sun50i-h6-orangepi-one-plus.dts |  8 ++++
> > > >  .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 42 +++++++++++++++=
++++
> > > >  2 files changed, 50 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-p=
lus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > > > index 12e17567ab56..9e8ed1053715 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > > > @@ -9,4 +9,12 @@
> > > >  / {
> > > >       model =3D "OrangePi One Plus";
> > > >       compatible =3D "xunlong,orangepi-one-plus", "allwinner,sun50i=
-h6";
> > > > +
> > > > +     aliases {
> > > > +             ethernet0 =3D &emac;
> > > > +     };
> > > > +};
> > > > +
> > > > +&emac {
> > > > +     status =3D "okay";
> > > >  };
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi =
b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > > > index 62e27948a3fa..c48e24acaf8a 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > > > @@ -45,6 +45,48 @@
> > > >               regulator-max-microvolt =3D <5000000>;
> > > >               regulator-always-on;
> > > >       };
> > > > +
> > > > +     /*
> > > > +      * The board uses 2.5V RGMII signalling. Power sequence to en=
able
> > > > +      * the phy is to enable GMAC-2V5 and GMAC-3V (aldo2) power ra=
ils
> > > > +      * at the same time and to wait 100ms.
> > > > +      */
> > > > +     reg_gmac_2v5: gmac-2v5 {
> > > > +             compatible =3D "regulator-fixed";
> > > > +             regulator-name =3D "gmac-2v5";
> > > > +             regulator-min-microvolt =3D <2500000>;
> > > > +             regulator-max-microvolt =3D <2500000>;
> > > > +             startup-delay-us =3D <100000>;
> > > > +             enable-active-high;
> > > > +             gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>; /* GMAC_EN: PD6=
 */
> > > > +
> > > > +             /* The real parent of gmac-2v5 is reg_vcc5v, but we n=
eed to
> > > > +              * enable two regulators to power the phy. This is on=
e way
> > > > +              * to achieve that.
> > > > +              */
> > > > +             vin-supply =3D <&reg_aldo2>; /* VCC3V3-MAC: GMAC-3V *=
/
> > > > +     };
> > > > +};
> > > > +
> > > > +&emac {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&ext_rgmii_pins>;
> > > > +     phy-mode =3D "rgmii";
> > > > +     phy-handle =3D <&ext_rgmii_phy>;
> > > > +     phy-supply =3D <&reg_gmac_2v5>;
> > > > +     allwinner,rx-delay-ps =3D <1500>;
> > > > +     allwinner,tx-delay-ps =3D <700>;
> > > > +};
> > > > +
> > > > +&mdio {
> > > > +     ext_rgmii_phy: ethernet-phy@1 {
> > > > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > > > +             reg =3D <1>;
> > > > +
> > > > +             reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* RGMII=
-RESET: PD14 */
> > > > +             reset-assert-us =3D <15000>;
> > > > +             reset-deassert-us =3D <40000>;
> > > > +     };
> > > >  };
> > >
> > > ... however, at no point in time you explain why you made that switch=
,
> > > and while most of the definition of the EMAC nodes is in the DTSI, yo=
u
> > > only enable it in one DTS.
> >
> > The dtsi is shared b/w 1+ and lite2 and 1+ has emac, so I enabled the
> > status directly on dts and keeping the relevant nodes on dtsi just
> > like SoC dtsi does. do I need to mention this in commit log?
>
> Lite 2 doesn't have reg_gmac_2v5 and it also doesn't have the external ph=
y.
> But with this patch, reg_gmac_2v5 will also show up in the Lite 2's final
> DTB.
>
> Comapred to SoC dtsi, the SoC always has things that are in the dtsi, the=
y
> are just not enabled/used by the board, but they are present on the chip.
>
> So this comes down to what the meaning of board-level dtsi should be. I
> doubt we want it to mean "a collection of stuff that may or may not be
> present on the boards that depend on it".

Was thinking in another direction, thanks for the info. agreed.
