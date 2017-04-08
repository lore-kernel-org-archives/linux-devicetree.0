From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 4/4] arm64: dts: salvator-x: Add current sense
 amplifiers
Date: Sat, 8 Apr 2017 17:02:53 +0100
Message-ID: <8cc2a7a4-57be-15d7-2190-eb3d3cad3972@kernel.org>
References: <1491488454-22468-1-git-send-email-jacopo+renesas@jmondi.org>
 <1491488454-22468-5-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491488454-22468-5-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/04/17 15:20, Jacopo Mondi wrote:
> Add device nodes for two Maxim max961x current sense amplifiers
> sensing VDD_08 and DVFS_08 lines.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Driver now applied and should make the coming merge window easily,
so I'll assume this will head upstream via an appropriate tree.

Thanks,

Jonathan
> ---
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> index c7f40f8..c4860a1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> @@ -257,6 +257,24 @@
>  	status = "okay";
>  };
>  
> +&i2c4 {
> +	status = "okay";
> +
> +	csa_vdd: adc@7c {
> +		compatible = "maxim,max9611";
> +		reg = <0x7c>;
> +
> +		shunt-resistor-micro-ohms = <5000>;
> +	};
> +
> +	csa_dvfs: adc@7f {
> +		compatible = "maxim,max9611";
> +		reg = <0x7f>;
> +
> +		shunt-resistor-micro-ohms = <5000>;
> +	};
> +};
> +
>  &wdt0 {
>  	timeout-sec = <60>;
>  	status = "okay";
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
