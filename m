From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH RESEND 1/1] ARM: dts: AM33XX: Add LCDC info into am335x-evm
Date: Tue, 25 Jun 2013 08:50:43 +0200
Message-ID: <1372143043.4488.50.camel@coredoba.hi.pengutronix.de>
References: <1372105967-26669-1-git-send-email-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372105967-26669-1-git-send-email-bparrot-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2013-06-24 at 15:32 -0500, Benoit Parrot wrote:
> Add LCDC device node in DT for am33xx
> Add LCDC and Panel info in DT for am335x-evm

> diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
> index 0423298..40d7a3f 100644
> --- a/arch/arm/boot/dts/am335x-evm.dts
> +++ b/arch/arm/boot/dts/am335x-evm.dts
> @@ -102,6 +136,16 @@
>  				reg = <0x48>;
>  			};
>  		};
> +
> +		lcdc {
> +			compatible = "ti,am33xx-tilcdc";
> +			reg = <0x4830e000 0x1000>;
> +			interrupt-parent = <&intc>;
> +			interrupts = <36>;
> +			ti,hwmods = "lcdc";
> +			ti,allow-non-reduced-blanking-modes;
> +			status = "okay";
> +		};
>  	};
>  
>  	vbat: fixedregulator@0 {
>  /include/ "tps65910.dtsi"
> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
> index 8e1248f..05b2c4a 100644
> --- a/arch/arm/boot/dts/am33xx.dtsi
> +++ b/arch/arm/boot/dts/am33xx.dtsi
> @@ -415,5 +415,14 @@
>  			#size-cells = <1>;
>  			status = "disabled";
>  		};
> +
> +		lcdc: lcdc@4830e000 {
> +			compatible = "ti,am33xx-tilcdc";
> +			reg = <0x4830e000 0x1000>;
> +			interrupt-parent = <&intc>;
> +			interrupts = <36>;
> +			ti,hwmods = "lcdc";
> +			status = "disabled";
> +		};
>  	};
>  };

am335x-evm.dts includes am33xx.dtsi, so you shouldn't need to provide
all SoC-specific settings again in the board dts. The way it's done
here, you get two nodes ("lcdc" and "lcdc@4830e000") for the same HW
module.

It seems you just need status and maybe
ti,allow-non-reduced-blanking-modes (for which I didn't see either the
binding or the driver code yet).

Regards,
Jan
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
