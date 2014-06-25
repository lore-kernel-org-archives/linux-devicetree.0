From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 6/6] ARM: sun8i: Add basic clock nodes to
 the DTSI
Date: Wed, 25 Jun 2014 22:36:14 +0800
Message-ID: <CAGb2v667uLQVs3ck2JCnRW3Ov09iHa53WjfHXxxgJCfR9TDakg@mail.gmail.com>
References: <1403603980-31101-1-git-send-email-wens@csie.org> <1403603980-31101-7-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB454VOOQKGQEB5IOVCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1403603980-31101-7-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 24, 2014 at 5:59 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> Now that we have support for sun8i specific clocks in the driver,
> add the corresponding clock nodes to the DTSI.
>
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a23.dtsi | 115 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a23.dtsi b/arch/arm/boot/dts/sun8i-a23.dtsi
> index ac5f69a..559ab08 100644
> --- a/arch/arm/boot/dts/sun8i-a23.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a23.dtsi
> @@ -64,6 +64,121 @@
>                         clock-frequency = <32768>;
>                         clock-output-names = "osc32k";
>                 };
> +
> +               pll1: clk@01c20000 {
> +                       #clock-cells = <0>;
> +                       compatible = "allwinner,sun8i-a23-pll1-clk";
> +                       reg = <0x01c20000 0x4>;
> +                       clocks = <&osc24M>;
> +                       clock-output-names = "pll1";
> +               };
> +
> +               /* dummy clock until actually implemented */
> +               pll6: pll6_clk {
> +                       #clock-cells = <0>;
> +                       compatible = "fixed-clock";
> +                       clock-frequency = <600000000>;
> +                       clock-output-names = "pll6";
> +               };
> +
> +               cpu: cpu_clk@01c20050 {
> +                       #clock-cells = <0>;
> +                       compatible = "allwinner,sun4i-a10-cpu-clk";
> +                       reg = <0x01c20050 0x4>;
> +
> +                       /*
> +                        * PLL1 is listed twice here.
> +                        * While it looks suspicious, it's actually documented
> +                        * that way both in the datasheet and in the code from
> +                        * Allwinner.
> +                        */
> +                       clocks = <&osc32k>, <&osc24M>, <&pll1>, <&pll1>;
> +                       clock-output-names = "cpu";
> +               };

Nack on this one. I pulled the wrong files.

> +
> +               axi: axi_clk@01c20050 {
> +                       #clock-cells = <0>;
> +                       compatible = "allwinner,sun4i-a10-axi-clk";
> +                       reg = <0x01c20050 0x4>;
> +                       clocks = <&cpu>;
> +                       clock-output-names = "axi";
> +               };
> +
> +               ahb1_mux: ahb1_mux_clk@01c20054 {
> +                       #clock-cells = <0>;
> +                       compatible = "allwinner,sun6i-a31-ahb1-mux-clk";
> +                       reg = <0x01c20054 0x4>;
> +                       clocks = <&osc32k>, <&osc24M>, <&axi>, <&pll6>;
> +                       clock-output-names = "ahb1_mux";
> +               };
> +
> +               ahb1: ahb1_clk@01c20054 {
> +                       #clock-cells = <0>;
> +                       compatible = "allwinner,sun4i-a10-ahb-clk";
> +                       reg = <0x01c20054 0x4>;
> +                       clocks = <&ahb1_mux>;
> +                       clock-output-names = "ahb1";
> +               };
> +
> +               apb1: apb1_clk@01c20054 {
> +                       #clock-cells = <0>;
> +                       compatible = "allwinner,sun4i-a10-apb0-clk";
> +                       reg = <0x01c20054 0x4>;
> +                       clocks = <&ahb1>;
> +                       clock-output-names = "apb1";
> +               };
> +
> +               ahb1_gates: clk@01c20060 {
> +                       #clock-cells = <1>;
> +                       compatible = "allwinner,sun8i-a23-ahb1-gates-clk";
> +                       reg = <0x01c20060 0x8>;
> +                       clocks = <&ahb1>;
> +                       clock-output-names = "ahb1_mipidsi", "ahb1_dma",
> +                                       "ahb1_mmc0", "ahb1_mmc1", "ahb1_mmc2",
> +                                       "ahb1_nand", "ahb1_sdram",
> +                                       "ahb1_hstimer", "ahb1_spi0",
> +                                       "ahb1_spi1", "ahb1_otg", "ahb1_ehci",
> +                                       "ahb1_ohci", "ahb1_ve", "ahb1_lcd",
> +                                       "ahb1_csi", "ahb1_be",  "ahb1_fe",
> +                                       "ahb1_gpu", "ahb1_spinlock",
> +                                       "ahb1_drc";
> +               };
> +
> +               apb1_gates: clk@01c20068 {
> +                       #clock-cells = <1>;
> +                       compatible = "allwinner,sun8i-a23-apb1-gates-clk";
> +                       reg = <0x01c20068 0x4>;
> +                       clocks = <&apb1>;
> +                       clock-output-names = "apb1_codec", "apb1_pio",
> +                                       "apb1_daudio0", "apb1_daudio1";
> +               };
> +
> +               apb2_mux: apb2_mux_clk@01c20058 {
> +                       #clock-cells = <0>;
> +                       compatible = "allwinner,sun4i-a10-apb1-mux-clk";
> +                       reg = <0x01c20058 0x4>;
> +                       clocks = <&osc32k>, <&osc24M>, <&pll6>, <&pll6>;
> +                       clock-output-names = "apb2_mux";
> +               };
> +
> +               apb2: apb2_clk@01c20058 {
> +                       #clock-cells = <0>;
> +                       compatible = "allwinner,sun6i-a31-apb2-div-clk";
> +                       reg = <0x01c20058 0x4>;
> +                       clocks = <&apb2_mux>;
> +                       clock-output-names = "apb2";
> +               };
> +
> +               apb2_gates: clk@01c2006c {
> +                       #clock-cells = <1>;
> +                       compatible = "allwinner,sun8i-a23-apb2-gates-clk";
> +                       reg = <0x01c2006c 0x4>;
> +                       clocks = <&apb2>;
> +                       clock-output-names = "apb2_i2c0", "apb2_i2c1",
> +                                       "apb2_i2c2", "apb2_uart0",
> +                                       "apb2_uart1", "apb2_uart2",
> +                                       "apb2_uart3", "apb2_uart4";
> +               };
>         };
>
>         soc@01c00000 {
> --
> 2.0.0
>
