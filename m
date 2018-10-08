From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl-udoo: Add Pincfgs for UART4
Date: Mon, 8 Oct 2018 14:05:03 +0800
Message-ID: <20181008060500.GI3587@dragon>
References: <1538663639-3427-1-git-send-email-kueffner.markus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1538663639-3427-1-git-send-email-kueffner.markus@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Markus Kueffner <kueffner.markus@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Robert Nelson <robertcnelson@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a few udoo board users for comment.

On Thu, Oct 04, 2018 at 04:33:59PM +0200, Markus Kueffner wrote:
> From: Markus Kueffner <kueffner.markus@gmail.com>
> 
> Add Pincfgs for UART4 to enable Communication with the onboard SAM3X
> 
> Signed-off-by: Markus Kueffner <kueffner.markus@gmail.com>
> ---
>  arch/arm/boot/dts/imx6qdl-udoo.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-udoo.dtsi b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
> index 4f27861..5614170 100644
> --- a/arch/arm/boot/dts/imx6qdl-udoo.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
> @@ -195,6 +195,13 @@
>  			>;
>  		};
>  
> +		pinctrl_uart4: uart4grp {
> +			fsl,pins = <
> +				MX6QDL_PAD_KEY_COL0__UART4_TX_DATA	0x1b0b1
> +				MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA	0x1b0b1
> +			>;
> +		};
> +
>  		pinctrl_usbh: usbhgrp {
>  			fsl,pins = <
>  				MX6QDL_PAD_GPIO_17__GPIO7_IO12 0x80000000
> @@ -265,6 +272,12 @@
>  	status = "okay";
>  };
>  
> +&uart4 { // iMX6-Arduino internal serial port - ttymxc3
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart4>;
> +	status = "okay";
> +};
> +
>  &usbh1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_usbh>;
> -- 
> 2.7.4
> 
