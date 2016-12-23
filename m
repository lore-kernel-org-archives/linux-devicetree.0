From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM64: dts: meson-gxbb-odroidc2: linux,usable-memory
Date: Fri, 23 Dec 2016 20:48:42 +0100
Message-ID: <585D7F9A.6030203@baylibre.com>
References: <20161223125213.5461-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161223125213.5461-1-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 23/12/2016 13:52, Heinrich Schuchardt a écrit :
> After reading the fdt u-boot overwrites the reg property of the
> memory node with <0x0 0x0 0x0 0x78000000>.
> 
> To override this setting we have to use the property
> linux,usable-memory.
> 
> If the first 16MB of the 2GB physical memory are used by
> the Linux kernel oops occur on the Odroid C2.
> 
> For the Odroid C2 this patch replaces
> [RFT PATCH] ARM64: dts: meson-gxbb: Add reserved memory zone and
> usable memory range
> https://lkml.org/lkml/2016/12/12/127
> 
> Fixes: 855960342d1e7 ARM64: dts: amlogic: add Hardkernel ODROID-C2
> CC: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> CC: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 238fbeacd330..82ab94417940 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -61,7 +61,7 @@
>  
>  	memory@0 {
>  		device_type = "memory";
> -		reg = <0x0 0x0 0x0 0x80000000>;
> +		linux,usable-memory = <0x0 0x01000000 0x0 0x7f000000>;
>  	};
>  
>  	usb_otg_pwr: regulator-usb-pwrs {
> 

Hi Heinrich,

Thanks a lot for testing and pushing this patch, indeed I missed this point abou u-boot overwriting reg.

I will test this next week, and hopefully get these merged.
Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
