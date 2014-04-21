From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: at91-sama5d3_xplained: add the regulator
 device node
Date: Mon, 21 Apr 2014 11:54:43 +0200
Message-ID: <20140421095443.GA3461@piout.net>
References: <1398054547-5834-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398054547-5834-1-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7PKcE1GVeWGA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 21/04/2014 at 12:29:07 +0800, Wenyou Yang wrote :
> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/at91-sama5d3_xplained.dts |   42 +++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> index ce13755..57cdd83 100644
> --- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> +++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> @@ -48,6 +48,48 @@
>  
>  			i2c1: i2c@f0018000 {
>  				status = "okay";
> +
> +				pmic: act8865@5b {
> +					compatible = "active-semi,act8865";
> +					reg = <0x5b>;
> +					status = "okay";
> +
> +					regulators {
> +						vcc_1v8_reg: DCDC_REG1 {
> +							regulator-name = "VCC_1V8";
> +							regulator-min-microvolt = <1800000>;
> +							regulator-max-microvolt = <1800000>;
> +							regulator-always-on;
> +						};
> +
> +						vcc_1v2_reg: DCDC_REG2 {
> +							regulator-name = "VCC_1V2";
> +							regulator-min-microvolt = <1200000>;
> +							regulator-max-microvolt = <1200000>;
> +							regulator-always-on;
> +						};
> +
> +						vcc_3v3_reg: DCDC_REG3 {
> +							regulator-name = "VCC_3V3";
> +							regulator-min-microvolt = <3300000>;
> +							regulator-max-microvolt = <3300000>;
> +							regulator-always-on;
> +						};
> +
> +						vddfuse_reg: LDO_REG1 {
> +							regulator-name = "FUSE_2V5";
> +							regulator-min-microvolt = <2500000>;
> +							regulator-max-microvolt = <2500000>;
> +						};
> +
> +						vddana_reg: LDO_REG2 {
> +							regulator-name = "VDDANA";
> +							regulator-min-microvolt = <3300000>;
> +							regulator-max-microvolt = <3300000>;
> +							regulator-always-on;

I'm pretty sure that one is not always on as you actually have to
configure it to get any voltage. Are you sure you want to set the
regulator-always-on property here ?

> +						};
> +					};
> +				};
>  			};
>  
>  			macb0: ethernet@f0028000 {
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
