From: Pramod Gurav <pramod.gurav-edOiRQu9Xnj5XLMNweQjbQ@public.gmane.org>
Subject: Re: [PATCH] ARM: DT: apq8064: Add Support for SD Card Detect for
 ifc6410 board
Date: Mon, 20 Oct 2014 17:16:53 +0530
Message-ID: <5444F62D.1090801@smartplayin.com>
References: <1413805194-4360-1-git-send-email-pramod.gurav@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413805194-4360-1-git-send-email-pramod.gurav-edOiRQu9Xnj5XLMNweQjbQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pramod Gurav <pramod.gurav-edOiRQu9Xnj5XLMNweQjbQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+linux-arm-msm

On Monday 20 October 2014 05:09 PM, Pramod Gurav wrote:
> This changes muxes in gpio26 pin to function as gpio and adds support
> for sd card detect for apq8064 based IFC6410 board.
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Signed-off-by: Pramod Gurav <pramod.gurav-edOiRQu9Xnj5XLMNweQjbQ@public.gmane.org>
> 
> ---
>  arch/arm/boot/dts/qcom-apq8064-ifc6410.dts |   11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> index b396c83..bf6262f 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> @@ -12,6 +12,14 @@
>  					function = "gsbi1";
>  				};
>  			};
> +
> +			card_detect: card_detect {
> +				mux {
> +					pins = "gpio26";
> +					function = "gpio";
> +					bias-disable;
> +				};
> +			};
>  		};
>  
>  		gsbi@12440000 {
> @@ -49,6 +57,9 @@
>  			/* External micro SD card */
>  			sdcc3: sdcc@12180000 {
>  				status = "okay";
> +				pinctrl-names	= "default";
> +				pinctrl-0	= <&card_detect>;
> +				cd-gpios	= <&tlmm_pinmux 26 1>;
>  			};
>  			/* WLAN */
>  			sdcc4: sdcc@121c0000 {
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
