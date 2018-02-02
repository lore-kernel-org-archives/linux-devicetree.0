From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: imx6q-bx50v3: disable SD card
Date: Fri, 2 Feb 2018 15:10:14 +0800
Message-ID: <20180202071013.GC25699@dragon>
References: <8de710254808e8d80295b75ff28ccd14afe2ad94.1515410930.git.ian.ray@ge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8de710254808e8d80295b75ff28ccd14afe2ad94.1515410930.git.ian.ray-JJi787mZWgc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 08, 2018 at 01:29:01PM +0200, Ian Ray wrote:
> Default boot medium must be internal eMMC, we don't want the SDIO to be
> used for these devices.  This commit disables the SD card interface for
> GE Healthcare Bx50v3 devices.
> 
> Signed-off-by: Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>
> Signed-off-by: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

Romain's SoB doesn't make too much sense here, and the email address
bounced messages.  So I dropped his SoB and applied patch.

Shawn

> ---
>  arch/arm/boot/dts/imx6q-bx50v3.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> index b915837..a530169 100644
> --- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> +++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> @@ -303,6 +303,10 @@
>  	};
>  };
>  
> +&usdhc2 {
> +	status = "disabled";
> +};
> +
>  &usdhc4 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_usdhc4>;
> -- 
> 2.10.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
