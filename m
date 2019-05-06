From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v2] arm64: allwinner: h6: orangepi-one-plus:
 Add Ethernet support
Date: Mon, 6 May 2019 15:03:15 +0530
Message-ID: <CAMty3ZCQTiX5OvCG_uMRS02vFu0c1-bkcyauLD6oaFcd=y3RNA@mail.gmail.com>
References: <20190503115928.27662-1-jagan@amarulasolutions.com> <20190503144651.ttqfha656dykqjzo@flea>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBB2H6X7TAKGQEELEKNRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190503144651.ttqfha656dykqjzo@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amarula <linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 3, 2019 at 8:16 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On Fri, May 03, 2019 at 05:29:28PM +0530, Jagan Teki wrote:
> > Add Ethernet support for orangepi-one-plus board,
> >
> > - Ethernet port connected via RTL8211E PHY
> > - PHY suppiled with
> >   GMAC-2V5, fixed regulator with GMAC_EN pin via PD6
> >   GMAC-3V, which is supplied by VCC3V3-MAC via aldo2
> > - RGMII-RESET pin connected via PD14
> >
> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>
> Your commit log should be improved. We can get those informations from
> the patch itself...

Thought it was a clear commit log :)  will update anyway.

>
> > ---
> > Changes for v2:
> > - emac changes on top of https://patchwork.kernel.org/cover/10899529/
> >   series
> >
> >  .../allwinner/sun50i-h6-orangepi-one-plus.dts |  8 ++++
> >  .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 42 +++++++++++++++++++
> >  2 files changed, 50 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > index 12e17567ab56..9e8ed1053715 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > @@ -9,4 +9,12 @@
> >  / {
> >       model = "OrangePi One Plus";
> >       compatible = "xunlong,orangepi-one-plus", "allwinner,sun50i-h6";
> > +
> > +     aliases {
> > +             ethernet0 = &emac;
> > +     };
> > +};
> > +
> > +&emac {
> > +     status = "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > index 62e27948a3fa..c48e24acaf8a 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > @@ -45,6 +45,48 @@
> >               regulator-max-microvolt = <5000000>;
> >               regulator-always-on;
> >       };
> > +
> > +     /*
> > +      * The board uses 2.5V RGMII signalling. Power sequence to enable
> > +      * the phy is to enable GMAC-2V5 and GMAC-3V (aldo2) power rails
> > +      * at the same time and to wait 100ms.
> > +      */
> > +     reg_gmac_2v5: gmac-2v5 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "gmac-2v5";
> > +             regulator-min-microvolt = <2500000>;
> > +             regulator-max-microvolt = <2500000>;
> > +             startup-delay-us = <100000>;
> > +             enable-active-high;
> > +             gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* GMAC_EN: PD6 */
> > +
> > +             /* The real parent of gmac-2v5 is reg_vcc5v, but we need to
> > +              * enable two regulators to power the phy. This is one way
> > +              * to achieve that.
> > +              */
> > +             vin-supply = <&reg_aldo2>; /* VCC3V3-MAC: GMAC-3V */
> > +     };
> > +};
> > +
> > +&emac {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&ext_rgmii_pins>;
> > +     phy-mode = "rgmii";
> > +     phy-handle = <&ext_rgmii_phy>;
> > +     phy-supply = <&reg_gmac_2v5>;
> > +     allwinner,rx-delay-ps = <1500>;
> > +     allwinner,tx-delay-ps = <700>;
> > +};
> > +
> > +&mdio {
> > +     ext_rgmii_phy: ethernet-phy@1 {
> > +             compatible = "ethernet-phy-ieee802.3-c22";
> > +             reg = <1>;
> > +
> > +             reset-gpios = <&pio 3 14 GPIO_ACTIVE_LOW>; /* RGMII-RESET: PD14 */
> > +             reset-assert-us = <15000>;
> > +             reset-deassert-us = <40000>;
> > +     };
> >  };
>
> ... however, at no point in time you explain why you made that switch,
> and while most of the definition of the EMAC nodes is in the DTSI, you
> only enable it in one DTS.

The dtsi is shared b/w 1+ and lite2 and 1+ has emac, so I enabled the
status directly on dts and keeping the relevant nodes on dtsi just
like SoC dtsi does. do I need to mention this in commit log?
