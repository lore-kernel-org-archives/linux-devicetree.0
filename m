From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [RFC PATCH 1/7] ARM: dts: vf610: Add missing QuadSPI register
 mapping and names.
Date: Thu, 02 Jul 2015 15:34:58 +0200
Message-ID: <cfce9c6cf3d8f1cab843ec4aed37e1f5@agner.ch>
References: <1435782010-9809-1-git-send-email-cory.tusar@pid1solutions.com>
 <1435782010-9809-3-git-send-email-cory.tusar@pid1solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435782010-9809-3-git-send-email-cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015-07-01 22:20, Cory Tusar wrote:
> Both 'reg' and 'reg-names' are required properties according to binding
> documentation, and both should contain two items.
> 
> Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index 4aa3351..089a263 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -242,7 +242,8 @@
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				compatible = "fsl,vf610-qspi";
> -				reg = <0x40044000 0x1000>;
> +				reg = <0x40044000 0x1000>, <0x20000000 0x10000000>;
> +				reg-names = "QuadSPI", "QuadSPI-memory";
>  				interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks VF610_CLK_QSPI0_EN>,
>  					<&clks VF610_CLK_QSPI0>;

Hm, this seem to have been wrong since the beginning...

Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
