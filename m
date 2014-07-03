From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] dts: add devicetree bindings for pxa27x clocks
Date: Thu, 3 Jul 2014 14:14:33 +0800
Message-ID: <CAN1soZys4k6g5RgPLbreopOxTwDJ+bfPOq8XPwsNpyt5+YURjg@mail.gmail.com>
References: <1404066744-13416-1-git-send-email-robert.jarzmik@free.fr>
	<1404066744-13416-3-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404066744-13416-3-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 30, 2014 at 2:32 AM, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> wrote:
> Add the clock tree description for the PXA27x based boards.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> ---
>  arch/arm/boot/dts/pxa27x.dtsi            | 134 ++++++++++++++++++++++++++++++-
>  include/dt-bindings/clock/pxa2xx-clock.h |  45 +++++++++++
>  2 files changed, 178 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/pxa2xx-clock.h
>
> diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
> index a705469..badaa71 100644
> --- a/arch/arm/boot/dts/pxa27x.dtsi
> +++ b/arch/arm/boot/dts/pxa27x.dtsi
> @@ -1,5 +1,6 @@
>  /* The pxa3xx skeleton simply augments the 2xx version */
> -/include/ "pxa2xx.dtsi"
> +#include "pxa2xx.dtsi"
> +#include "dt-bindings/clock/pxa2xx-clock.h"
>
>  / {
>         model = "Marvell PXA27x familiy SoC";
> @@ -35,4 +36,135 @@
>                         #pwm-cells = <1>;
>                 };
>         };
> +
> +       clocks {
> +              /*
> +               * The muxing of external clocks/internal dividers for osc* clock
> +               * sources has been hidden under the carpet by now.
> +               */
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               osc13mhz:osc13mhz {
> +                       compatible = "fixed-clock";
> +                        #clock-cells = <0>;
> +                       clock-frequency = <13000000>;
> +               };
> +
> +               osc32_768khz:osc32_768khz {
> +                       compatible = "fixed-clock";
> +                        #clock-cells = <0>;
> +                       clock-frequency = <32768>;
> +               };
> +
> +               pll_312mhz:pll_312mhz {
> +                       compatible = "fixed-factor-clock";
> +                        #clock-cells = <0>;
> +                       clocks = <&osc13mhz>;
> +                       clock-div = <1>;
> +                       clock-mult = <24>;
> +               };
> +
> +               clk_48mhz:clk_48mhz {
> +                       compatible = "fixed-factor-clock";
> +                        #clock-cells = <0>;
> +                       clocks = <&pll_312mhz>;
> +                       clock-div = <13>;
> +                       clock-mult = <2>;
> +               };
> +
> +               clk_32_842mhz:clk_32_842mhz {
> +                       compatible = "fixed-factor-clock";
> +                        #clock-cells = <0>;
> +                       clocks = <&pll_312mhz>;
> +                       clock-div = <19>;
> +                       clock-mult = <2>;
> +               };
> +
> +               clk_19_5mhz:clk_19_5mhz {
> +                       compatible = "fixed-factor-clock";
> +                        #clock-cells = <0>;
> +                       clocks = <&pll_312mhz>;
> +                       clock-div = <32>;
> +                       clock-mult = <2>;
> +               };
> +
> +               clk_14_857mhz:clk_14_857mhz {
> +                       compatible = "fixed-factor-clock";
> +                        #clock-cells = <0>;
> +                       clocks = <&pll_312mhz>;
> +                       clock-div = <42>;
> +                       clock-mult = <2>;
> +               };
> +
> +               clk_14_682mhz:clk_14_682mhz {
> +                       compatible = "fixed-factor-clock";
> +                        #clock-cells = <0>;
> +                       clocks = <&pll_312mhz>;
> +                       clock-div = <51>;
> +                       clock-mult = <2>;
> +               };
> +
> +               clk_13mhz:clk_13mhz {
> +                       compatible = "fixed-factor-clock";
> +                        #clock-cells = <0>;
> +                       clocks = <&osc13mhz>;
> +                       clock-div = <1>;
> +                       clock-mult = <1>;
> +               };
> +
> +               clk_dummy:clk_dummy {
> +                       compatible = "fixed-clock";
> +                        #clock-cells = <0>;
> +                       clock-frequency = <0>;
> +               };
> +
> +               clk_ostimer:clk_ostimer {
> +                       compatible = "fixed-factor-clock";
> +                        #clock-cells = <0>;
> +                       clocks = <&osc13mhz>;
> +                       clock-div = <4>;
> +                       clock-mult = <1>;
> +               };
> +
> +               pxa27x_sysclks:pxa27x_sysclks {
> +                       compatible = "marvell,pxa270-core-clocks";
> +                       #clock-cells = <1>;
> +                       clocks = <&osc13mhz>;
> +                       clock-output-names = "run mode", "half-turbo mode",
> +                               "turbo mode", "cpu core", "system bus", "memory", "lcd";
> +               };
> +
> +               pxa2xx_clks: pxa2xx_clks@41300004 {
> +                       compatible = "marvell,pxa-clocks";
> +                       reg = <0x41300004 0x4>;
> +                       clocks =
> +                               <&clk_13mhz>, <&clk_13mhz>, <&clk_dummy>, <&clk_13mhz>,
> +                               <&clk_13mhz>, <&clk_14_857mhz>, <&clk_14_857mhz>, <&clk_14_857mhz>,
> +                               <&clk_14_682mhz>, <&clk_ostimer>, <&clk_48mhz>, <&clk_48mhz>,
> +                               <&clk_19_5mhz>, <&clk_48mhz>, <&clk_32_842mhz>, <&clk_13mhz>,
> +                               <&pxa27x_sysclks 6>, <&clk_48mhz>, <&clk_48mhz>, <&osc32_768khz>,
> +                               <&clk_dummy>, <&clk_19_5mhz>, <&pxa27x_sysclks 4>, <&clk_13mhz>,
> +                               <&pxa27x_sysclks 6>, <&clk_dummy>;
> +                       #clock-cells = <1>;
> +                       clock-output-names =
> +                               "pwm 0,2", "pwm 1,3", "ac97", "ssp2",
> +                               "ssp3,hwuart", "stuart", "ffuart", "btuart",
> +                               "i2s", "nssp,ostimer", "usb host,assp", "usb udc",
> +                               "mmc", "ficp", "i2c", "pwri2c",
> +                               "lcd", "msl", "usim", "keypad",
> +                                "im", "memstk", "memc", "ssp1",
> +                                "camera", "ac97conf";
> +                       clock-indices = <
> +                               CKEN_PWM0 CKEN_PWM1 CKEN_AC97 CKEN_SSP2
> +                               CKEN_SSP3 CKEN_STUART CKEN_FFUART CKEN_BTUART
> +                               CKEN_I2S CKEN_OSTIMER CKEN_USBHOST CKEN_USB
> +                               CKEN_MMC CKEN_FICP CKEN_I2C CKEN_PWRI2C
> +                               CKEN_LCD CKEN_MSL CKEN_USIM CKEN_KEYPAD
> +                               CKEN_IM CKEN_MEMSTK 65 CKEN_SSP1
> +                               CKEN_CAMERA CKEN_AC97CONF >;
> +               };
> +       };
> +
>  };

Maybe defining these clocks in pxa27x clock driver is better.

Regards
Haojian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
