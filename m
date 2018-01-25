From: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx6sx: add ARM power domain support
Date: Thu, 25 Jan 2018 18:33:16 +0800
Message-ID: <20180125103316.GB24622@b29396-OptiPlex-7040>
References: <1516725734-32745-1-git-send-email-Anson.Huang@nxp.com>
 <1516725734-32745-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1516725734-32745-2-git-send-email-Anson.Huang-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Linux-imx-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 24, 2018 at 12:42:14AM +0800, Anson Huang wrote:
> Add ARM power domain in PGC.
> 
> Signed-off-by: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>
> ---
> this patch should be based on 0001-ARM-dts-imx6sx-add-pu-power-domain-support.patch
>  arch/arm/boot/dts/imx6sx.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
> index 42ef4c6..aa29ca6 100644
> --- a/arch/arm/boot/dts/imx6sx.dtsi
> +++ b/arch/arm/boot/dts/imx6sx.dtsi
> @@ -768,6 +768,11 @@
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> +					power-domain@0 {

Nitpick: probably an 'arm' prefix is better:
arm: power-domain@0

Anyway, it's minor depends on maintainer's perference.

Otherwise, looks fine

Acked-by: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>

Regards
Dong Aisheng

> +						reg = <0>;
> +						#power-domain-cells = <0>;
> +					};
> +
>  					pd_pu: power-domain@1 {
>  						reg = <1>;
>  						#power-domain-cells = <0>;
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
