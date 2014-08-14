From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add sdio0 and sdio1 to the rk3288
Date: Thu, 14 Aug 2014 08:47:23 -0700
Message-ID: <CAD=FV=XxF0zTVtV75FRDbiVq1MCrWpXak-vkP0iofPXXtE_OHg@mail.gmail.com>
References: <1407995360-26009-1-git-send-email-addy.ke@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407995360-26009-1-git-send-email-addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, han jiang <hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Chris <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?5aea5pm65oOF?= <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "zhenfu.fang" <zhenfu.fang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, wei.luo
List-Id: devicetree@vger.kernel.org

Addy,

On Wed, Aug 13, 2014 at 10:49 PM, Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Signed-off-by: Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288.dtsi | 76 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 7a9173d..a440869 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -120,6 +120,32 @@
>                 //fifo-depth = <0x100>;
>         };
>
> +       sdio0: dwmmc@ff0d0000 {
> +               compatible = "rockchip,rk3288-dw-mshc";
> +               reg = <0xff0d0000 0x4000>;
> +               interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               clocks = <&cru HCLK_SDIO0>, <&cru SCLK_SDIO0>;
> +               clock-names = "biu", "ciu";
> +
> +               fifo-depth = <0x100>;
> +       };

Please repost and match what's in Heiko's "wip/v3.18-next/dts" tree
for the other dwmmc controllers.  Specifically:

* No more #address-cells and #size-cells.
* By default status = "disabled".
* Sort properties alphabetically.


> +
> +       sdio1: dwmmc@ff0e0000 {
> +               compatible = "rockchip,rk3288-dw-mshc";
> +               reg = <0xff0e0000 0x4000>;
> +               interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               clocks = <&cru HCLK_SDIO1>, <&cru SCLK_SDIO1>;
> +               clock-names = "biu", "ciu";
> +
> +               fifo-depth = <0x100>;
> +       };
> +
>         emmc: dwmmc@ff0f0000 {
>                 compatible = "rockchip,rk3288-dw-mshc";
>                 reg = <0xff0f0000 0x4000>;
> @@ -589,6 +615,56 @@
>                         };
>                 };
>
> +               sdio0 {
> +                       sdio0_clk: sdio0-clk {
> +                               rockchip,pins = <4 25 RK_FUNC_1 &pcfg_pull_none>;
> +                       };
> +
> +                       sdio0_cmd: sdio0-cmd {
> +                               rockchip,pins = <4 24 RK_FUNC_1 &pcfg_pull_up>;
> +                       };
> +
> +                       sdio0_pwr: sdio0-pwr {
> +                               rockchip,pins = <4 28 RK_FUNC_1 &pcfg_pull_up>;
> +                       };
> +
> +                       sdio0_bus1: sdio0-bus1 {
> +                               rockchip,pins = <4 20 RK_FUNC_1 &pcfg_pull_up>;
> +                       };
> +
> +                       sdio0_bus4: sdio0-bus4 {
> +                               rockchip,pins = <4 20 RK_FUNC_1 &pcfg_pull_up>,
> +                                               <4 21 RK_FUNC_1 &pcfg_pull_up>,
> +                                               <4 22 RK_FUNC_1 &pcfg_pull_up>,
> +                                               <4 23 RK_FUNC_1 &pcfg_pull_up>;
> +                       };

Can you add the card detect line here?  How about the write protect
line?  What about the "bkpwr" and "int" lines?


> +               };
> +
> +               sdio1 {
> +                       sdio1_clk: sdio1-clk {
> +                               rockchip,pins = <4 7 RK_FUNC_4 &pcfg_pull_none>;

This requires that <https://patchwork.kernel.org/patch/4701721/> land
in order to compile.  Since that hasn't landed you should explicitly
reference it.



> +                       };
> +
> +                       sdio1_cmd: sdio1-cmd {
> +                               rockchip,pins = <4 6 RK_FUNC_4 &pcfg_pull_up>;
> +                       };
> +
> +                       sdio1_pwr: sdio1-pwr {
> +                               rockchip,pins = <4 9 RK_FUNC_4 &pcfg_pull_up>;
> +                       };
> +
> +                       sdio1_bus1: sdio1-bus1 {
> +                               rockchip,pins = <4 24 RK_FUNC_4 &pcfg_pull_up>;

This is probably wrong and should be <3 24 ...>, not <4 24 ...>.

> +                       };
> +
> +                       sdio1_bus4: sdio1-bus4 {
> +                               rockchip,pins = <3 24 RK_FUNC_4 &pcfg_pull_up>,
> +                                               <3 25 RK_FUNC_4 &pcfg_pull_up>,
> +                                               <3 26 RK_FUNC_4 &pcfg_pull_up>,
> +                                               <3 27 RK_FUNC_4 &pcfg_pull_up>;
> +                       };
> +               };
> +
>                 emmc {
>                         emmc_clk: emmc-clk {
>                                 rockchip,pins = <3 18 RK_FUNC_2 &pcfg_pull_none>;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
