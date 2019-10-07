From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RFCv1 2/5] arm64: dts: meson: Add missing pwm control gpio
 signal for pwm-regulator
Date: Mon, 7 Oct 2019 21:00:44 +0530
Message-ID: <CANAwSgS=r_Rz0fc6GDsD7Rk6udq3LcYtB-Ag_=kjVa-EApchJQ@mail.gmail.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com> <20191007131649.1768-3-linux.amoon@gmail.com>
 <8a74834e-5cfa-3f3b-9ba6-e88e265b67a0@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8a74834e-5cfa-3f3b-9ba6-e88e265b67a0@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Mon, 7 Oct 2019 at 19:50, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 07/10/2019 15:16, Anand Moon wrote:
> > As per schematics add missing VDDCPUA_PWM and VDDCPUB_PWM
> > gpio signal use to enable/disable the pwm regulator for DVFS.
> >
> > Fixes: d14734a04a8a (arm64: dts: meson-g12b-odroid-n2: enable DVFS)
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > index a9a661258886..66262a6ab3fe 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -135,6 +135,8 @@
> >
> >               regulator-boot-on;
> >               regulator-always-on;
> > +             /* VDDCPUA_PWM */
> > +             enable-gpios = <&gpio GPIOE_1 GPIO_ACTIVE_HIGH>;
> >       };
> >
> >       vddcpu_b: regulator-vddcpu-b {
> > @@ -154,6 +156,8 @@
> >
> >               regulator-boot-on;
> >               regulator-always-on;
> > +             /* VDDCPUB_PWM */
> > +             enable-gpios = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
> >       };
> >
> >       hub_5v: regulator-hub_5v {
> >
>
> Same as 5V_EN, This GPIO is handled by the BL301 SCP firmware, I'm personally against
> adding this to the DT since it's out of control of Linux or any OS.
>
> This GPIO id controlles by the PSCI call to SCP to enable/disable
> the CPU clusters.
>
> Neil

Thanks for your input's.

Best Regards
-Anand
