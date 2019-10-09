From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] dts: Disable DMA support on the BK4 vf610 device's
 fsl_lpuart driver
Date: Wed, 9 Oct 2019 15:40:00 +0100
Message-ID: <b39b6860-9e9b-5cee-a07e-7b430c2e5119@arm.com>
References: <20191009143032.9261-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191009143032.9261-1-lukma@denx.de>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>, linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/10/2019 15:30, Lukasz Majewski wrote:
> This change disables the DMA support (RX/TX) on the NXP's fsl_lpuart
> driver - the PIO mode is used instead. This change is necessary for better
> robustness of BK4's device use cases with many potentially interrupted
> short serial transfers.
> 
> Without it the driver hangs when some distortion happens on UART lines.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>   arch/arm/boot/dts/vf610-bk4.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vf610-bk4.dts b/arch/arm/boot/dts/vf610-bk4.dts
> index 0f3870d3b099..ad20f3442d40 100644
> --- a/arch/arm/boot/dts/vf610-bk4.dts
> +++ b/arch/arm/boot/dts/vf610-bk4.dts
> @@ -259,24 +259,28 @@
>   &uart0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pinctrl_uart0>;
> +	dma-names = "","";

This looks like a horrible hack - is there any reason not to just strip 
things at compile-time, i.e. "/delete-property/ dmas;"?

Robin.

>   	status = "okay";
>   };
>   
>   &uart1 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pinctrl_uart1>;
> +	dma-names = "","";
>   	status = "okay";
>   };
>   
>   &uart2 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pinctrl_uart2>;
> +	dma-names = "","";
>   	status = "okay";
>   };
>   
>   &uart3 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pinctrl_uart3>;
> +	dma-names = "","";
>   	status = "okay";
>   };
>   
> 
