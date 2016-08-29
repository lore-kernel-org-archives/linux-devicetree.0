From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dts: imx6ul iomuxc syscon is compatible to imx6q
Date: Mon, 29 Aug 2016 22:34:47 +0800
Message-ID: <20160829143447.GV30790@tiger>
References: <1472480743-8405-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472480743-8405-1-git-send-email-Anson.Huang-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 29, 2016 at 10:25:43PM +0800, Anson Huang wrote:
> The imx6ul iomuxc syscon is compatible to imx6q,
> so let's add compatible string 'fsl,imx6q-iomuxc-gpr'
> for imx6ul iomuxc syscon node.
> 
> Signed-off-by: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>

Will this patch still be needed if you implement imx6ul suspend support
with PSCI?

Shawn

> ---
> changes since V1:
> 	improve commit message.
>  arch/arm/boot/dts/imx6ul.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index 33b95d7..acc9486 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -644,7 +644,8 @@
>  			};
>  
>  			gpr: iomuxc-gpr@020e4000 {
> -				compatible = "fsl,imx6ul-iomuxc-gpr", "syscon";
> +				compatible = "fsl,imx6ul-iomuxc-gpr",
> +					     "fsl,imx6q-iomuxc-gpr", "syscon";
>  				reg = <0x020e4000 0x4000>;
>  			};
>  
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
