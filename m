From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RFCv1 1/5] arm64: dts: meson: Add missing 5V_EN gpio signal for
 VCC5V regulator
Date: Mon, 7 Oct 2019 20:58:47 +0530
Message-ID: <CANAwSgQi=56RPQK-a7CM2W9dOt3mzDzdtfNABKmpdsYRN8vLwQ@mail.gmail.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com> <20191007131649.1768-2-linux.amoon@gmail.com>
 <c99adf31-42df-c88e-40d4-1dc383c990b1@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c99adf31-42df-c88e-40d4-1dc383c990b1@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Mon, 7 Oct 2019 at 19:49, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Anand,
>
> On 07/10/2019 15:16, Anand Moon wrote:
> > As per schematics add missing 5V_EN gpio signal to enable
> > VCC5V regulator node.
> >
> > Fixes: c35f6dc5c377 (arm64: dts: meson: Add minimal support for Odroid-N2)
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > index 42f15405750c..a9a661258886 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -94,6 +94,9 @@
> >               regulator-max-microvolt = <5000000>;
> >               regulator-always-on;
> >               vin-supply = <&main_12v>;
> > +             /* U12 NB679GD 5V_EN */
> > +             gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> > +             enable-active-high;
>
> This GPIO is handled by the BL301 SCP firmware, I'm personally against
> adding this to the DT since it's out of control of Linux or any OS.
>
> Neil
>

Thanks for your input.

> >       };
> >
> >       vcc_1v8: regulator-vcc_1v8 {
> >
>

Best Regards
-Anand
