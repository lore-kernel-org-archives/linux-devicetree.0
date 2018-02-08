From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2] ARM: dts: imx6q-bx50v3: Enable secure-reg-access
Date: Thu, 8 Feb 2018 14:44:40 +0800
Message-ID: <20180208064438.GA31910@dragon>
References: <20180205052659.GA31354@dragon>
 <20180205170840.14045-1-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180205170840.14045-1-sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 05, 2018 at 06:08:40PM +0100, Sebastian Reichel wrote:
> From: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> 
> Enable secure debug enable register access for Bx50v3 devices to enable
> PMU and hardware counters for perf.
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Signed-off-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
> Changes since PATCHv1:
>  * add property by adding a label to the pmu node in imx6qdl and
>    referencing it in bx50v3.dtsi.
> ---
>  arch/arm/boot/dts/imx6q-bx50v3.dtsi | 4 ++++
>  arch/arm/boot/dts/imx6qdl.dtsi      | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> index 916ea94d75ca..2baffc8b9094 100644
> --- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> +++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> @@ -388,3 +388,7 @@
>  		#interrupt-cells = <1>;
>  	};
>  };
> +
> +&pmu {
> +	secure-reg-access;
> +};

The labelled node should be sorted alphabetically.  That said, it should
be added before &usdhc2.  I fixed it up and applied the patch.

Shawn

> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
> index 59ff86695a14..2b921de44c02 100644
> --- a/arch/arm/boot/dts/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> @@ -143,7 +143,7 @@
>  		};
>  	};
>  
> -	pmu {
> +	pmu: pmu {
>  		compatible = "arm,cortex-a9-pmu";
>  		interrupt-parent = <&gpc>;
>  		interrupts = <0 94 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 2.15.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
