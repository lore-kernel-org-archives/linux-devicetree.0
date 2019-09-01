From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv1 2/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to VDDIO_AO3V3 regulator
Date: Sun, 1 Sep 2019 19:26:47 +0530
Message-ID: <CANAwSgTXWgcyzsU1Y6Msc4hyuRh7QPoXe9WsV5uqNc=c9_z2TA@mail.gmail.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com> <20190828202723.1145-3-linux.amoon@gmail.com>
 <CAFBinCBA-sQcshd9iAVn=ZDBKkDN3OgJs-WjKEhVLw===b0AdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCBA-sQcshd9iAVn=ZDBKkDN3OgJs-WjKEhVLw===b0AdQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Martin,

Thanks of your review comments.

On Sun, 1 Sep 2019 at 17:11, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Wed, Aug 28, 2019 at 10:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > As per shematics TFLASH_VDD, TF_IO, VCC3V3 fixed regulator output which
> typo: "schematics"
>
Ok
> > is supplied by VDDIO_AO3V3.
> please add a short sentence to the description (since you probably
> have to re-send a v2) like:
> "While here, move the comment name with the signal name in the
> schematics above the gpio property to make it consistent with other
> regulators"
>

Ok I will append this in next version.

> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> with the patch rebased (see below) and the two issues from above addressed:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> > index 98e742bf44c1..a078a1ee5004 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> > @@ -67,17 +67,19 @@
> >         };
> >
> >         tflash_vdd: regulator-tflash_vdd {
> > -               /*
> > -                * signal name from schematics: TFLASH_VDD_EN
> > -                */
> >                 compatible = "regulator-fixed";
> >
> >                 regulator-name = "TFLASH_VDD";
> >                 regulator-min-microvolt = <3300000>;
> >                 regulator-max-microvolt = <3300000>;
> >
> > +               /*
> > +                * signal name from schematics: TFLASH_VDD_EN
> > +                */
> >                 gpio = <&gpio GPIOY_12 GPIO_ACTIVE_HIGH>;
> >                 enable-active-high;
> > +               /* U16 RT9179GB */
> > +               vin-supply = <&vddio_ao3v3>;
> >         };
> >
> >         tf_io: gpio-regulator-tf_io {
> > @@ -95,6 +97,8 @@
> >
> >                 states = <3300000 0
> >                           1800000 1>;
> > +               /* U12/U13 RT9179GB */
> > +               vin-supply = <&vddio_ao3v3>;
> >         };
> thank you for the patch but I think it won't apply on top of Neil's
> "arm64: dts: meson: fix boards regulators states format" (which was
> applied just after you sent this series)
>

>
> Martin

Ok will re-base these changes on linux-next next time.

Best Regards
-Anand
