From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: meson-gx: Fix sensors reporting from SCP
Date: Mon, 05 Jun 2017 14:54:00 -0700
Message-ID: <m2mv9mdrt3.fsf@baylibre.com>
References: <20170605200350.1113-1-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170605200350.1113-1-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> (Carlo Caione's message
        of "Mon, 5 Jun 2017 22:03:50 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> writes:

> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>
> Switch to use the new compatible for the SCPI sensors so that the
> sensor readings are reported using the correct scale.
>
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 436b875..3128fa5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -200,7 +200,7 @@
>  		};
>  
>  		scpi_sensors: sensors {
> -			compatible = "arm,scpi-sensors";
> +			compatible = "amlogic,meson-gxbb-scpi-sensors";

Shouldn't this be:

			compatible = "amlogic,meson-gxbb-scpi-sensors", "arm,scpi-sensors";

For a safe fallback on kernels without the new compatible?

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
