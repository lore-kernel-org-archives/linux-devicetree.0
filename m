From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf610: Extend I2C support to all available
 buses.
Date: Tue, 16 Jun 2015 10:50:56 +0200
Message-ID: <36885aa1e7792b1b0bd072b1340cd5a0@agner.ch>
References: <1434327599-3739-1-git-send-email-cory.tusar@pid1solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434327599-3739-1-git-send-email-cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015-06-15 02:19, Cory Tusar wrote:
> This commit extends the existing Vybrid I2C support to cover buses i2c1,
> i2c2, and i2c3.  Based in (very) large part on an initial patch by
> Stefan Agner that was just lacking a couple of DMA assignments.
> 
> Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>

Thx Cory for picking that up.

So with that patch we use the second Mux of DMA0 the first time. Another
option would have been to use the first Mux of DMA1, however I think its
better to leave DMA1 for dedicated purposes or the secondary Cortex-M4
core... If a board needs different configuration, one would also have
the option to overwrite the properties.

Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

--
Stefan

> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index 4aa3351..25f2615 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -347,6 +347,20 @@
>  				status = "disabled";
>  			};
>  
> +			i2c1: i2c@40067000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,vf610-i2c";
> +				reg = <0x40067000 0x1000>;
> +				interrupts = <72 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks VF610_CLK_I2C1>;
> +				clock-names = "ipg";
> +				dmas = <&edma0 0 52>,
> +					<&edma0 0 53>;
> +				dma-names = "rx","tx";
> +				status = "disabled";
> +			};
> +
>  			clks: ccm@4006b000 {
>  				compatible = "fsl,vf610-ccm";
>  				reg = <0x4006b000 0x1000>;
> @@ -520,6 +534,33 @@
>  				status = "disabled";
>  			};
>  
> +			i2c2: i2c@400e6000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,vf610-i2c";
> +				reg = <0x400e6000 0x1000>;
> +				interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks VF610_CLK_I2C2>;
> +				clock-names = "ipg";
> +				dmas = <&edma0 1 36>,
> +					<&edma0 1 37>;
> +				dma-names = "rx","tx";
> +				status = "disabled";
> +			};
> +
> +			i2c3: i2c@400e7000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,vf610-i2c";
> +				reg = <0x400e7000 0x1000>;
> +				interrupts = <74 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks VF610_CLK_I2C3>;
> +				clock-names = "ipg";
> +				dmas = <&edma0 1 38>,
> +					<&edma0 1 39>;
> +				dma-names = "rx","tx";
> +				status = "disabled";
> +			};
>  		};
>  	};
>  };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
