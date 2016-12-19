From: Alan Tull <atull@kernel.org>
Subject: Re: [PATCH v6 5/5] ARM: dts: imx6q-evi: support cyclone-ps-spi
Date: Sun, 18 Dec 2016 20:23:47 -0600 (CST)
Message-ID: <alpine.DEB.2.10.1612182023220.2528@atull-730U3E-740U3E>
References: <cover.1481918884.git.stillcompiling@gmail.com>
 <26327c58cbf5acd8078c50e87d23293c80ee89a2.1481918884.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <26327c58cbf5acd8078c50e87d23293c80ee89a2.1481918884.git.stillcompiling@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joshua Clayton <stillcompiling@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Alan Tull <atull@opensource.altera.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-fpga@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Anatolij Gustschin <agust@denx.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 16 Dec 2016, Joshua Clayton wrote:

> Add support for Altera cyclone V FPGA connected to an spi port
> to the evi devicetree file
> 
> Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>

Acked-by: Alan Tull <atull@opensource.altera.com>

> ---
>  arch/arm/boot/dts/imx6q-evi.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6q-evi.dts b/arch/arm/boot/dts/imx6q-evi.dts
> index 7c7c1a8..ec4d365 100644
> --- a/arch/arm/boot/dts/imx6q-evi.dts
> +++ b/arch/arm/boot/dts/imx6q-evi.dts
> @@ -95,6 +95,15 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1cs>;
>  	status = "okay";
> +
> +	fpga_spi: cyclonespi@0 {
> +		compatible = "altr,cyclone-ps-spi-fpga-mgr";
> +		spi-max-frequency = <20000000>;
> +		reg = <0>;
> +		pinctrl-0 = <&pinctrl_fpgaspi>;
> +		config-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
> +		status-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
> +	};
>  };
>  
>  &ecspi3 {
> @@ -322,6 +331,13 @@
>  		>;
>  	};
>  
> +	pinctrl_fpgaspi: fpgaspigrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_KEY_ROW1__GPIO4_IO09 0x1b0b0
> +			MX6QDL_PAD_KEY_ROW2__GPIO4_IO11 0x1b0b0
> +		>;
> +	};
> +
>  	pinctrl_gpminand: gpminandgrp {
>  		fsl,pins = <
>  			MX6QDL_PAD_NANDF_CLE__NAND_CLE 0xb0b1
> -- 
> 2.9.3
> 
> 
