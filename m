From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 5/6] ARM: dts: enable clock support for Broadcom Cygnus
Date: Thu, 18 Jun 2015 12:51:55 -0700
Message-ID: <20150618195155.9112.72056@quantum>
References: <1430849603-15849-1-git-send-email-rjui@broadcom.com>
 <1430849603-15849-6-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430849603-15849-6-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov
	<dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>,
	linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Ray
	Jui" <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Ray Jui (2015-05-05 11:13:22)
> Replace current device tree dummy clocks with real clock support for
> Broadcom Cygnus SoC
> 
> Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Patches 1-4 & 6 are applied to clk-next. You can add my Ack to this
patch:

Acked-by: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

arm-soc guys,

Any chance you can pick this up? Alternatively I can take it through the
clk tree with an Ack.

Regards,
Mike

> ---
>  arch/arm/boot/dts/bcm-cygnus-clock.dtsi |   89 +++++++++++++++++++++----------
>  1 file changed, 61 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/bcm-cygnus-clock.dtsi b/arch/arm/boot/dts/bcm-cygnus-clock.dtsi
> index 60d8389..32bcd45 100644
> --- a/arch/arm/boot/dts/bcm-cygnus-clock.dtsi
> +++ b/arch/arm/boot/dts/bcm-cygnus-clock.dtsi
> @@ -36,56 +36,89 @@ clocks {
>         ranges;
>  
>         osc: oscillator {
> +               #clock-cells = <0>;
>                 compatible = "fixed-clock";
> -               #clock-cells = <1>;
>                 clock-frequency = <25000000>;
>         };
>  
> -       apb_clk: apb_clk {
> -               compatible = "fixed-clock";
> +       /* Cygnus ARM PLL */
> +       armpll: armpll {
>                 #clock-cells = <0>;
> -               clock-frequency = <1000000000>;
> +               compatible = "brcm,cygnus-armpll";
> +               clocks = <&osc>;
> +               reg = <0x19000000 0x1000>;
>         };
>  
> -       periph_clk: periph_clk {
> -               compatible = "fixed-clock";
> +       /* peripheral clock for system timer */
> +       periph_clk: arm_periph_clk {
>                 #clock-cells = <0>;
> -               clock-frequency = <500000000>;
> +               compatible = "fixed-factor-clock";
> +               clocks = <&armpll>;
> +               clock-div = <2>;
> +               clock-mult = <1>;
>         };
>  
> -       sdio_clk: lcpll_ch2 {
> -               compatible = "fixed-clock";
> +       /* APB bus clock */
> +       apb_clk: apb_clk {
>                 #clock-cells = <0>;
> -               clock-frequency = <200000000>;
> +               compatible = "fixed-factor-clock";
> +               clocks = <&armpll>;
> +               clock-div = <4>;
> +               clock-mult = <1>;
>         };
>  
> -       axi81_clk: axi81_clk {
> -               compatible = "fixed-clock";
> -               #clock-cells = <0>;
> -               clock-frequency = <100000000>;
> +       genpll: genpll {
> +               #clock-cells = <1>;
> +               compatible = "brcm,cygnus-genpll";
> +               reg = <0x0301d000 0x2c>, <0x0301c020 0x4>;
> +               clocks = <&osc>;
> +               clock-output-names = "genpll", "axi21", "250mhz", "ihost_sys",
> +                                    "enet_sw", "audio_125", "can";
>         };
>  
> -       keypad_clk: keypad_clk {
> -               compatible = "fixed-clock";
> +       /* always 1/2 of the axi21 clock */
> +       axi41_clk: axi41_clk {
>                 #clock-cells = <0>;
> -               clock-frequency = <31806>;
> +               compatible = "fixed-factor-clock";
> +               clocks = <&genpll 1>;
> +               clock-div = <2>;
> +               clock-mult = <1>;
>         };
>  
> -       adc_clk: adc_clk {
> -               compatible = "fixed-clock";
> +       /* always 1/4 of the axi21 clock */
> +       axi81_clk: axi81_clk {
>                 #clock-cells = <0>;
> -               clock-frequency = <1562500>;
> +               compatible = "fixed-factor-clock";
> +               clocks = <&genpll 1>;
> +               clock-div = <4>;
> +               clock-mult = <1>;
>         };
>  
> -       pwm_clk: pwm_clk {
> -               compatible = "fixed-clock";
> -               #clock-cells = <0>;
> -               clock-frequency = <1000000>;
> +       lcpll0: lcpll0 {
> +               #clock-cells = <1>;
> +               compatible = "brcm,cygnus-lcpll0";
> +               reg = <0x0301d02c 0x1c>, <0x0301c020 0x4>;
> +               clocks = <&osc>;
> +               clock-output-names = "lcpll0", "pcie_phy", "ddr_phy", "sdio",
> +                                    "usb_phy", "smart_card", "ch5";
>         };
>  
> -       lcd_clk: mipipll_ch1 {
> -               compatible = "fixed-clock";
> -               #clock-cells = <0>;
> -               clock-frequency = <100000000>;
> +       mipipll: mipipll {
> +               #clock-cells = <1>;
> +               compatible = "brcm,cygnus-mipipll";
> +               reg = <0x180a9800 0x2c>, <0x0301c020 0x4>, <0x180aa024 0x4>;
> +               clocks = <&osc>;
> +               clock-output-names = "mipipll", "ch0_unused", "ch1_lcd",
> +                                    "ch2_v3d", "ch3_unused", "ch4_unused",
> +                                    "ch5_unused";
> +       };
> +
> +       asiu_clks: asiu_clks {
> +               #clock-cells = <1>;
> +               compatible = "brcm,cygnus-asiu-clk";
> +               reg = <0x0301d048 0xc>, <0x180aa024 0x4>;
> +
> +               clocks = <&osc>;
> +               clock-output-names = "keypad", "adc/touch", "pwm";
>         };
>  };
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
