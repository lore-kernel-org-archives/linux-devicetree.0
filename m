From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: BCM2835: Split peripheral definitions off to
 a common include.
Date: Thu, 23 Apr 2015 22:28:37 -0600
Message-ID: <5539C675.7020306@wwwdotorg.org>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <1429639796-2169-3-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429639796-2169-3-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/21/2015 12:09 PM, Eric Anholt wrote:
> The 2836 dts will inherit all of this, because it shares the same
> peripherals as 2835.

> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi

>  #include <dt-bindings/pinctrl/bcm2835.h>
>  #include "skeleton.dtsi"
> +#include "bcm283x-common.dtsi"

skeleton is included there.

> diff --git a/arch/arm/boot/dts/bcm283x-common.dtsi b/arch/arm/boot/dts/bcm283x-common.dtsi

> +/include/ "skeleton.dtsi"

So there's no need to include it here.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
