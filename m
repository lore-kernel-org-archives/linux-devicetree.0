From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] ARM: dts: Add sdio0 and sdio1 to the rk3288
Date: Tue, 19 Aug 2014 09:47:35 -0700
Message-ID: <CAD=FV=V_LMm_xKhanwqQLK5nV3WvyvpdOdBN-z5b9jGd2=TgGw@mail.gmail.com>
References: <1407995360-26009-1-git-send-email-addy.ke@rock-chips.com>
 <1408415512-17275-1-git-send-email-addy.ke@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1408415512-17275-1-git-send-email-addy.ke@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Addy Ke <addy.ke@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tao Huang <huangtao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jianqun Xu <xjq@rock-chips.com>, zhangqing <zhangqing@rock-chips.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kever Yang <kever.yang@rock-chips.com>, Chris <zyw@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, "zhenfu.fang" <zhenfu.fang@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Eddie Cai <cf@rock-chips.com>, han jiang <hj@rock-chips.com>, =?UTF-8?B?5aea5pm65oOF?= <yzq@rock-chips.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lin Huang <hl@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Addy,

On Mon, Aug 18, 2014 at 7:31 PM, Addy Ke <addy.ke@rock-chips.com> wrote:
> This patch requires that <https://patchwork.kernel.org/patch/4701721/>
> land in order to compile.
>
> Signed-off-by: Addy Ke <addy.ke@rock-chips.com>
> ---
> Changes in v2:
> - repost patch to match what's in Heiko's "wip/v3.18-next/dts" tree
>   for the other dwmmc controllers
> - add "cd" and "int" line, suggested by Doug Anderson
> - fix up sdio1 configuration error
>
>  arch/arm/boot/dts/rk3288.dtsi | 86 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 36be7bb..91576ae 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -88,6 +88,26 @@
>                 status = "disabled";
>         };
>
> +       sdio0: dwmmc@ff0d0000 {
> +               compatible = "rockchip,rk3288-dw-mshc";
> +               clocks = <&cru HCLK_SDIO0>, <&cru SCLK_SDIO0>;
> +               clock-names = "biu", "ciu";
> +               fifo-depth = <0x100>;
> +               interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +               reg = <0xff0d0000 0x4000>;
> +               status = "disabled";
> +       };
> +
> +       sdio1: dwmmc@ff0e0000 {
> +               compatible = "rockchip,rk3288-dw-mshc";
> +               clocks = <&cru HCLK_SDIO1>, <&cru SCLK_SDIO1>;
> +               clock-names = "biu", "ciu";
> +               fifo-depth = <0x100>;
> +               interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +               reg = <0xff0e0000 0x4000>;
> +               status = "disabled";
> +       };
> +
>         emmc: dwmmc@ff0f0000 {
>                 compatible = "rockchip,rk3288-dw-mshc";
>                 clocks = <&cru HCLK_EMMC>, <&cru SCLK_EMMC>;
> @@ -508,6 +528,72 @@
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
> +                       sdio0_cd: sdio0-cd {
> +                               rockchip,pins = <4 26 RK_FUNC_1 &pcfg_pull_up>;
> +                       };
> +
> +                       sdio0_pwr: sdio0-pwr {
> +                               rockchip,pins = <4 28 RK_FUNC_1 &pcfg_pull_up>;
> +                       };
> +
> +                       sdio0_int: sdio0-int {
> +                               rockchip,pins = <4 30 RK_FUNC_1 &pcfg_pull_up>;
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

Can you make sure to include all of the sdio0 pins?  I think you're
still missing gpio4d3 (write protect).  You're also missing gpio4d5
(bkpwr), not that I know what that actually is.

Also: I know that sdmmc isn't sorted properly (should probably fix
that), but can you sort sdio0 and sdio1 by pin number?  So list data
lines first, then cmd, then clock, then detect, then write protect,
...


Same comments apply to sdio1.

> +               };
> +
> +               sdio1 {
> +                       sdio1_clk: sdio1-clk {
> +                               rockchip,pins = <4 7 RK_FUNC_4 &pcfg_pull_none>;
> +                       };
> +
> +                       sdio1_cmd: sdio1-cmd {
> +                               rockchip,pins = <4 6 RK_FUNC_4 &pcfg_pull_up>;
> +                       };
> +
> +                       sdio1_cd: sdio1-cd {
> +                               rockchip,pins = <3 28 RK_FUNC_4 &pcfg_pull_up>;
> +                       };
> +
> +                       sdio1_pwr: sdio1-pwr {
> +                               rockchip,pins = <4 9 RK_FUNC_4 &pcfg_pull_up>;
> +                       };
> +
> +                       sdio1_int: sdio1-int {
> +                               rockchip,pins = <3 31 RK_FUNC_4 &pcfg_pull_up>;
> +                       };
> +
> +                       sdio1_bus1: sdio1-bus1 {
> +                               rockchip,pins = <3 24 RK_FUNC_4 &pcfg_pull_up>;
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
> --
> 1.8.3.2
>
>
