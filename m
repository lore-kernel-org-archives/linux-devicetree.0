From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH] ARM: imx: add HDMI support for SolidRun HummingBoard and
 Cubox-i
Date: Sat, 19 Apr 2014 13:41:35 +0800
Message-ID: <20140419054134.GV2523@dragon>
References: <E1Wb5br-0002ZE-T3@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <E1Wb5br-0002ZE-T3@rmk-PC.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, arm@kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 18, 2014 at 11:01:27AM +0100, Russell King wrote:
> Add the HDMI DT configuration for the SolidRun HummingBoard and Cubox-i.
> 
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
>  arch/arm/boot/dts/imx6dl-hummingboard.dts | 28 ++++++++++++++++++++++++++++
>  arch/arm/boot/dts/imx6qdl-cubox-i.dtsi    | 28 ++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-hummingboard.dts b/arch/arm/boot/dts/imx6dl-hummingboard.dts
> index 5bfae54fb780..d3095f58bf7b 100644
> --- a/arch/arm/boot/dts/imx6dl-hummingboard.dts
> +++ b/arch/arm/boot/dts/imx6dl-hummingboard.dts
> @@ -67,6 +67,14 @@
>  	status = "okay";
>  };
>  
> +&hdmi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hummingboard_hdmi>;
> +	ddc-i2c-bus = <&i2c2>;
> +	status = "okay";
> +	crtcs = <&ipu1 0>;

The 'crtcs' should be dropped now, right?

> +};
> +
>  &i2c1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_hummingboard_i2c1>;
> @@ -82,6 +90,13 @@
>  	 */
>  };
>  
> +&i2c2 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hummingboard_i2c2>;
> +	status = "okay";
> +};
> +
>  &iomuxc {
>  	hummingboard {
>  		pinctrl_hummingboard_flexcan1: hummingboard-flexcan1 {
> @@ -97,6 +112,12 @@
>  			>;
>  		};
>  
> +		pinctrl_hummingboard_hdmi: hummingboard-hdmi {
> +			fsl,pins = <
> +				MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE 0x1f8b0
> +			>;
> +		};
> +

Is CEC already supported by imx-hdmi driver?  Just a question.

Shawn

>  		pinctrl_hummingboard_i2c1: hummingboard-i2c1 {
>  			fsl,pins = <
>  				MX6QDL_PAD_EIM_D21__I2C1_SCL 0x4001b8b1
> @@ -104,6 +125,13 @@
>  			>;
>  		};
>  
> +		pinctrl_hummingboard_i2c2: hummingboard-i2c2 {
> +			fsl,pins = <
> +				MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b8b1
> +				MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
> +			>;
> +		};
> +
>  		pinctrl_hummingboard_spdif: hummingboard-spdif {
>  			fsl,pins = <MX6QDL_PAD_GPIO_17__SPDIF_OUT 0x13091>;
>  		};
> diff --git a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
> index c2a24888a276..5b9e7bceedaa 100644
> --- a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
> @@ -55,6 +55,21 @@
>  	};
>  };
>  
> +&hdmi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_cubox_i_hdmi>;
> +	ddc-i2c-bus = <&i2c2>;
> +	status = "okay";
> +	crtcs = <&ipu1 0>;
> +};
> +
> +&i2c2 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_cubox_i_i2c2>;
> +	status = "okay";
> +};
> +
>  &i2c3 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_cubox_i_i2c3>;
> @@ -69,6 +84,19 @@
>  
>  &iomuxc {
>  	cubox_i {
> +		pinctrl_cubox_i_hdmi: cubox-i-hdmi {
> +			fsl,pins = <
> +				MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE 0x1f8b0
> +			>;
> +		};
> +
> +		pinctrl_cubox_i_i2c2: cubox-i-i2c2 {
> +			fsl,pins = <
> +				MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b8b1
> +				MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
> +			>;
> +		};
> +
>  		pinctrl_cubox_i_i2c3: cubox-i-i2c3 {
>  			fsl,pins = <
>  				MX6QDL_PAD_EIM_D17__I2C3_SCL 0x4001b8b1
> -- 
> 1.8.3.1
> 
> 
> 
