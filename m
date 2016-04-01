From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 3/4] ARM: dts: vfxxx: Add OCROM and phandle entries
 for Vybrid SoC bus driver
Date: Fri, 1 Apr 2016 14:00:46 +0800
Message-ID: <20160401060046.GG18833@tiger>
References: <cover.1457684688.git.maitysanchayan@gmail.com>
 <39ab1c08dacb7fc4e36a3f3517da16d4da47710b.1457684688.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <39ab1c08dacb7fc4e36a3f3517da16d4da47710b.1457684688.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2016 at 02:29:30PM +0530, Sanchayan Maity wrote:
> Add OCROM node and introduce phandles to OCROM, MSCM and NVMEM
> OCOTP for use by the Vybrid SoC bus driver.
> 
> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index db9157e..0dd7ad5 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -87,9 +87,19 @@
>  	soc {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -		compatible = "simple-bus";
> +		compatible = "fsl,vf610-soc-bus", "simple-bus";
>  		interrupt-parent = <&mscm_ir>;
>  		ranges;
> +		fsl,rom-revision = <&ocrom 0x80>;
> +		fsl,cpu-count = <&mscm_cpucfg 0x2C>;
> +		fsl,l2-size = <&mscm_cpucfg 0x14>;

We need a bindings doc for these new properties and compatible.

Shawn

> +		nvmem-cells = <&ocotp_cfg0>, <&ocotp_cfg1>;
> +		nvmem-cell-names = "cfg0", "cfg1";
> +
> +		ocrom: ocrom@00000000 {
> +			compatible = "fsl,vf610-ocrom", "syscon";
> +			reg = <0x00000000 0x18000>;
> +		};
>  
>  		aips0: aips-bus@40000000 {
>  			compatible = "fsl,aips-bus", "simple-bus";
> -- 
> 2.7.2
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
