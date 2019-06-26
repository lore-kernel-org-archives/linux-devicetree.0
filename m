From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mm: Init rates and parents configs for
 clocks
Date: Wed, 26 Jun 2019 15:45:15 +0300
Message-ID: <CAEnQRZCVQ0+pRh6akiZJXU-fRugEXmnthZp8Q2=aXFXCO3vcUg@mail.gmail.com>
References: <1561469191-26840-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1561469191-26840-1-git-send-email-abel.vesa@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Anson Huang <anson.huang@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 4:42 PM Abel Vesa <abel.vesa@nxp.com> wrote:
>
> Add the initial configuration for clocks that need default parent and rate
> setting. This is based on the vendor tree clock provider parents and rates
> configuration except this is doing the setup in dts rather than using clock
> consumer API in a clock provider driver.
>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 36 +++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index 232a741..ab92108 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -451,6 +451,42 @@
>                                          <&clk_ext3>, <&clk_ext4>;
>                                 clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
>                                               "clk_ext3", "clk_ext4";
> +                               assigned-clocks = <&clk IMX8MM_CLK_AUDIO_AHB>,
> +                                               <&clk IMX8MM_CLK_IPG_AUDIO_ROOT>,
> +                                               <&clk IMX8MM_SYS_PLL3>,
> +                                               <&clk IMX8MM_VIDEO_PLL1>,
> +                                               <&clk IMX8MM_CLK_NOC>,
> +                                               <&clk IMX8MM_CLK_PCIE1_CTRL>,
> +                                               <&clk IMX8MM_CLK_PCIE1_PHY>,
> +                                               <&clk IMX8MM_CLK_CSI1_CORE>,
> +                                               <&clk IMX8MM_CLK_CSI1_PHY_REF>,
> +                                               <&clk IMX8MM_CLK_CSI1_ESC>,
> +                                               <&clk IMX8MM_CLK_DISP_AXI>,
> +                                               <&clk IMX8MM_CLK_DISP_APB>;
> +                               assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_800M>,
> +                                               <0>,
Isn't there a macro for 0? (dummy clock?)


> +                                               <0>,
> +                                               <0>,
> +                                               <&clk IMX8MM_SYS_PLL3_OUT>,
> +                                               <&clk IMX8MM_SYS_PLL2_250M>,
> +                                               <&clk IMX8MM_SYS_PLL2_100M>,
> +                                               <&clk IMX8MM_SYS_PLL2_1000M>,
> +                                               <&clk IMX8MM_SYS_PLL2_1000M>,
> +                                               <&clk IMX8MM_SYS_PLL1_800M>,
> +                                               <&clk IMX8MM_SYS_PLL2_1000M>,
> +                                               <&clk IMX8MM_SYS_PLL1_800M>;
> +                               assigned-clock-rates = <400000000>,
> +                                                       <400000000>,
> +                                                       <750000000>,
> +                                                       <594000000>,
> +                                                       <0>,
> +                                                       <0>,
> +                                                       <0>,
> +                                                       <0>,
> +                                                       <0>,
> +                                                       <0>,
> +                                                       <500000000>,
> +                                                       <200000000>;
>                         };
>
>                         src: reset-controller@30390000 {
> --
> 2.7.4
>
