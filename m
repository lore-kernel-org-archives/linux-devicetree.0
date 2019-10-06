From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx7s: Correct GPT's ipg clock source
Date: Sun, 6 Oct 2019 16:32:35 +0800
Message-ID: <20191006083233.GB7150@dragon>
References: <1568622549-15819-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1568622549-15819-1-git-send-email-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2019 at 04:29:09PM +0800, Anson Huang wrote:
> i.MX7S/D's GPT ipg clock should be from GPT clock root and
> controlled by CCM's GPT CCGR, using correct clock source for
> GPT ipg clock instead of IMX7D_CLK_DUMMY.

So both 'ipg' and 'per' clock are coming from GPT root clock?

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

It looks like a fix, so do we need a Fixes tag here?

Shawn

> ---
>  arch/arm/boot/dts/imx7s.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 710f850..e2e604d 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -448,7 +448,7 @@
>  				compatible = "fsl,imx7d-gpt", "fsl,imx6sx-gpt";
>  				reg = <0x302d0000 0x10000>;
>  				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clks IMX7D_CLK_DUMMY>,
> +				clocks = <&clks IMX7D_GPT1_ROOT_CLK>,
>  					 <&clks IMX7D_GPT1_ROOT_CLK>;
>  				clock-names = "ipg", "per";
>  			};
> @@ -457,7 +457,7 @@
>  				compatible = "fsl,imx7d-gpt", "fsl,imx6sx-gpt";
>  				reg = <0x302e0000 0x10000>;
>  				interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clks IMX7D_CLK_DUMMY>,
> +				clocks = <&clks IMX7D_GPT2_ROOT_CLK>,
>  					 <&clks IMX7D_GPT2_ROOT_CLK>;
>  				clock-names = "ipg", "per";
>  				status = "disabled";
> @@ -467,7 +467,7 @@
>  				compatible = "fsl,imx7d-gpt", "fsl,imx6sx-gpt";
>  				reg = <0x302f0000 0x10000>;
>  				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clks IMX7D_CLK_DUMMY>,
> +				clocks = <&clks IMX7D_GPT3_ROOT_CLK>,
>  					 <&clks IMX7D_GPT3_ROOT_CLK>;
>  				clock-names = "ipg", "per";
>  				status = "disabled";
> @@ -477,7 +477,7 @@
>  				compatible = "fsl,imx7d-gpt", "fsl,imx6sx-gpt";
>  				reg = <0x30300000 0x10000>;
>  				interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clks IMX7D_CLK_DUMMY>,
> +				clocks = <&clks IMX7D_GPT4_ROOT_CLK>,
>  					 <&clks IMX7D_GPT4_ROOT_CLK>;
>  				clock-names = "ipg", "per";
>  				status = "disabled";
> -- 
> 2.7.4
> 
