From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/7] drm/vc4: Add KMS support for Raspberry Pi.
Date: Fri, 14 Aug 2015 22:45:12 -0600
Message-ID: <55CEC3D8.7060103@wwwdotorg.org>
References: <1439427380-2436-1-git-send-email-eric@anholt.net> <1439427380-2436-4-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439427380-2436-4-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/12/2015 06:56 PM, Eric Anholt wrote:
> This is the start of a full VC4 driver.  Right now this just supports
> configuring the display using a pre-existing video mode (because
> changing the pixel clock isn't available yet, and doesn't work when it
> is).  However, this is enough for fbcon and bringing up X using
> xf86-video-modesetting.

> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig

> +config DRM_VC4
> +	tristate "Broadcom VC4 Graphics"

> +	help
> +	  Choose this option if you have a system that has a Broadcom
> +	  VC4 GPU, such as the Raspberry Pi or other BCM2708/BCM2835.
> +
> +	  This driver requires that "avoid_warnings=2" be present in
> +	  the config.txt for the firmware, to keep it from smashing
> +	  our display setup.

The need for "avoid_warnings=2" seems like it will trip people up. I
don't think it's in any config.txt I've seen. Can you expand more on that?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
