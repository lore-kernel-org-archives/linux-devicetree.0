From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: Re: [PATCH v2] arm64: allwinner: h6:
 orangepi-one-plus: Add Ethernet support
Date: Mon, 6 May 2019 15:31:01 +0200
Message-ID: <20190506133101.c3twwwydy5mez3db@core.my.home>
References: <20190503115928.27662-1-jagan@amarulasolutions.com>
 <20190503144651.ttqfha656dykqjzo@flea>
 <CAMty3ZCQTiX5OvCG_uMRS02vFu0c1-bkcyauLD6oaFcd=y3RNA@mail.gmail.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBF7OYDTAKGQEDIWRQRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMty3ZCQTiX5OvCG_uMRS02vFu0c1-bkcyauLD6oaFcd=y3RNA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amarula <linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 06, 2019 at 03:03:15PM +0530, Jagan Teki wrote:
> On Fri, May 3, 2019 at 8:16 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Fri, May 03, 2019 at 05:29:28PM +0530, Jagan Teki wrote:
> > > Add Ethernet support for orangepi-one-plus board,
> > >
> > > - Ethernet port connected via RTL8211E PHY
> > > - PHY suppiled with
> > >   GMAC-2V5, fixed regulator with GMAC_EN pin via PD6
> > >   GMAC-3V, which is supplied by VCC3V3-MAC via aldo2
> > > - RGMII-RESET pin connected via PD14
> > >
> > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> >
> > Your commit log should be improved. We can get those informations from
> > the patch itself...
> 
> Thought it was a clear commit log :)  will update anyway.
> 
> >
> > > ---
> > > Changes for v2:
> > > - emac changes on top of https://patchwork.kernel.org/cover/10899529/
> > >   series
> > >
> > >  .../allwinner/sun50i-h6-orangepi-one-plus.dts |  8 ++++
> > >  .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 42 +++++++++++++++++++
> > >  2 files changed, 50 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > > index 12e17567ab56..9e8ed1053715 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > > @@ -9,4 +9,12 @@
> > >  / {
> > >       model = "OrangePi One Plus";
> > >       compatible = "xunlong,orangepi-one-plus", "allwinner,sun50i-h6";
> > > +
> > > +     aliases {
> > > +             ethernet0 = &emac;
> > > +     };
> > > +};
> > > +
> > > +&emac {
> > > +     status = "okay";
> > >  };
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > > index 62e27948a3fa..c48e24acaf8a 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > > @@ -45,6 +45,48 @@
> > >               regulator-max-microvolt = <5000000>;
> > >               regulator-always-on;
> > >       };
> > > +
> > > +     /*
> > > +      * The board uses 2.5V RGMII signalling. Power sequence to enable
> > > +      * the phy is to enable GMAC-2V5 and GMAC-3V (aldo2) power rails
> > > +      * at the same time and to wait 100ms.
> > > +      */
> > > +     reg_gmac_2v5: gmac-2v5 {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "gmac-2v5";
> > > +             regulator-min-microvolt = <2500000>;
> > > +             regulator-max-microvolt = <2500000>;
> > > +             startup-delay-us = <100000>;
> > > +             enable-active-high;
> > > +             gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* GMAC_EN: PD6 */
> > > +
> > > +             /* The real parent of gmac-2v5 is reg_vcc5v, but we need to
> > > +              * enable two regulators to power the phy. This is one way
> > > +              * to achieve that.
> > > +              */
> > > +             vin-supply = <&reg_aldo2>; /* VCC3V3-MAC: GMAC-3V */
> > > +     };
> > > +};
> > > +
> > > +&emac {
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&ext_rgmii_pins>;
> > > +     phy-mode = "rgmii";
> > > +     phy-handle = <&ext_rgmii_phy>;
> > > +     phy-supply = <&reg_gmac_2v5>;
> > > +     allwinner,rx-delay-ps = <1500>;
> > > +     allwinner,tx-delay-ps = <700>;
> > > +};
> > > +
> > > +&mdio {
> > > +     ext_rgmii_phy: ethernet-phy@1 {
> > > +             compatible = "ethernet-phy-ieee802.3-c22";
> > > +             reg = <1>;
> > > +
> > > +             reset-gpios = <&pio 3 14 GPIO_ACTIVE_LOW>; /* RGMII-RESET: PD14 */
> > > +             reset-assert-us = <15000>;
> > > +             reset-deassert-us = <40000>;
> > > +     };
> > >  };
> >
> > ... however, at no point in time you explain why you made that switch,
> > and while most of the definition of the EMAC nodes is in the DTSI, you
> > only enable it in one DTS.
> 
> The dtsi is shared b/w 1+ and lite2 and 1+ has emac, so I enabled the
> status directly on dts and keeping the relevant nodes on dtsi just
> like SoC dtsi does. do I need to mention this in commit log?

Lite 2 doesn't have reg_gmac_2v5 and it also doesn't have the external phy.
But with this patch, reg_gmac_2v5 will also show up in the Lite 2's final
DTB.

Comapred to SoC dtsi, the SoC always has things that are in the dtsi, they
are just not enabled/used by the board, but they are present on the chip.

So this comes down to what the meaning of board-level dtsi should be. I
doubt we want it to mean "a collection of stuff that may or may not be
present on the boards that depend on it".

regards,
	o.

> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
