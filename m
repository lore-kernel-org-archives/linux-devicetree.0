From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/9] ARM: Update the device trees for 2836.
Date: Thu, 23 Apr 2015 22:36:05 -0600
Message-ID: <5539C835.1000109@wwwdotorg.org>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <1429639796-2169-5-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429639796-2169-5-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/21/2015 12:09 PM, Eric Anholt wrote:
> The bus address for peripherals comes from the platform.h diff between
> 2708 and 2709, and the CPU's DT definition is based on the 2709 DT.

I would suggest squashing this with the previous commit. I was puzzled
why patch 3 added bcm2836-rpi.dtsi, yet in that patch,
bcm2836-rpi-2-b.dts included bcm2835-rpi.dtsi instead.

git should still show that patch as a copy+edit assuming the files are
similar enough.

> diff --git a/arch/arm/boot/dts/bcm2836.dtsi b/arch/arm/boot/dts/bcm2836.dtsi

> +	__overrides__ {
> +		arm_freq = <&v7_cpu0>, "clock-frequency:0";
> +	};
>  };

We don't have any DT override/overlay/... support in the bcm2835 files
yet. Does it make sense not to only add it to bcm2836 files when we add
the equivalent everywhere?

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
