From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 3/3] ARM: bcm2835: Add the firmware driver information
 to the RPi DT
Date: Fri, 24 Jul 2015 16:25:17 +0100
Message-ID: <20150724152517.GR3436@x1>
References: <1437198880-8467-1-git-send-email-eric@anholt.net>
 <1437198880-8467-3-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437198880-8467-3-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 17 Jul 2015, Eric Anholt wrote:

> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> Acked-by: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (previous version with pm-domains)

For this version:
  Acked-by: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
> 
> v2: Drop pm-domains stuff since I've dropped it from the firmware
>     driver for now, until we get drivers/base fixed.
> 
> v3: Rename the compatible to "raspberrypi,bcm2835-firmware"
> 
>  arch/arm/boot/dts/bcm2835-rpi.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> index 46780bb..ab5474e 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
> +++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> @@ -14,6 +14,13 @@
>  			linux,default-trigger = "heartbeat";
>  		};
>  	};
> +
> +	soc {
> +		firmware: firmware {
> +			compatible = "raspberrypi,bcm2835-firmware";
> +			mboxes = <&mailbox>;
> +		};
> +	};
>  };
>  
>  &gpio {
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
