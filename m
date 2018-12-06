From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 5/5] arm64: dts: allwinner: a64-amarula-relic: Add OV5640
 camera node
Date: Thu, 6 Dec 2018 16:43:33 +0530
Message-ID: <CAMty3ZBBcum5CF1xQ_ePNUkcMoBPXngbiwf2V7hWHrH7-k3xuQ@mail.gmail.com>
References: <20181203100747.16442-1-jagan@amarulasolutions.com>
 <20181203100747.16442-6-jagan@amarulasolutions.com> <CAGb2v6441wV7PM6q=vF2cpJtP9BGdYjQQqNU54rqELNJ5YcmdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v6441wV7PM6q=vF2cpJtP9BGdYjQQqNU54rqELNJ5YcmdQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-media <linux-media@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 3, 2018 at 3:55 PM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Mon, Dec 3, 2018 at 6:08 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Amarula A64-Relic board by default bound with OV5640 camera,
> > so add support for it with below pin information.
> >
> > - PE13, PE12 via i2c-gpio bitbanging
> > - CLK_CSI_MCLK as external clock
> > - PE1 as external clock pin muxing
> > - DLDO3 as vcc-csi supply
> > - DLDO3 as AVDD supply
> > - ALDO1 as DOVDD supply
> > - ELDO3 as DVDD supply
> > - PE14 gpio for reset pin
> > - PE15 gpio for powerdown pin
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  .../allwinner/sun50i-a64-amarula-relic.dts    | 54 +++++++++++++++++++
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  5 ++
> >  2 files changed, 59 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > index 6cb2b7f0c817..9ac6d773188b 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > @@ -22,6 +22,41 @@
> >                 stdout-path = "serial0:115200n8";
> >         };
> >
> > +       i2c-csi {
> > +               compatible = "i2c-gpio";
> > +               sda-gpios = <&pio 4 13 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> > +               scl-gpios = <&pio 4 12 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>
> FYI our hardware doesn't do open drain.

True, but the kernel is enforcing it seems, from the change from [1].
does that mean Linux use open drain even though hardware doens't have?
or did I miss anything?

[    3.659235] gpio-141 (sda): enforced open drain please flag it
properly in DT/ACPI DSDT/board file
[    3.679954] gpio-140 (scl): enforced open drain please flag it
properly in DT/ACPI DSDT/board file
[    3.814878] i2c-gpio i2c-csi: using lines 141 (SDA) and 140 (SCL)

>
> > +               i2c-gpio,delay-us = <5>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               ov5640: camera@3c {
> > +                       compatible = "ovti,ov5640";
> > +                       reg = <0x3c>;
> > +                       pinctrl-names = "default";
> > +                       pinctrl-0 = <&csi_mclk_pin>;
> > +                       clocks = <&ccu CLK_CSI_MCLK>;
> > +                       clock-names = "xclk";
> > +
> > +                       AVDD-supply = <&reg_dldo3>;
> > +                       DOVDD-supply = <&reg_aldo1>;
>
> DOVDD is the supply for I/O. You say it is ALDO1 here.
>
> > +                       DVDD-supply = <&reg_eldo3>;
> > +                       reset-gpios = <&pio 4 14 GPIO_ACTIVE_LOW>; /* CSI-RST-R: PE14 */
> > +                       powerdown-gpios = <&pio 4 15 GPIO_ACTIVE_HIGH>; /* CSI-STBY-R: PE15 */
> > +
> > +                       port {
> > +                               ov5640_ep: endpoint {
> > +                                       remote-endpoint = <&csi_ep>;
> > +                                       bus-width = <8>;
> > +                                       hsync-active = <1>; /* Active high */
> > +                                       vsync-active = <0>; /* Active low */
> > +                                       data-active = <1>;  /* Active high */
> > +                                       pclk-sample = <1>;  /* Rising */
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +
> >         wifi_pwrseq: wifi-pwrseq {
> >                 compatible = "mmc-pwrseq-simple";
> >                 clocks = <&rtc 1>;
> > @@ -30,6 +65,25 @@
> >         };
> >  };
> >
> > +&csi {
> > +       vcc-csi-supply = <&reg_dldo3>;
>
> But here you say the SoC-side pins are driven from DLDO3.
>
> This is a somewhat odd mismatch.
>
> Regardless, the ov5640 driver enables all three regulators at probe time.
> Shouldn't that be enough to get the I2C bus working? The pin voltage
> supply does not belong here.

It is working w/o supplying PE group, but I think that may be reason
of supplying similar regulator via DOVDD on sensor side. But we need
to make sure the pin-group must be powered right like DSI, HDMI? if
yes may be we do something via power-domain driver like other SoC's
does or do we have any other option.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpio/gpiolib.c?id=f926dfc112bc6cf41d7068ee5e3f261e13a5bec8
