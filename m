From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/7] drm/vc4: Add KMS support for Raspberry Pi.
Date: Thu, 13 Aug 2015 12:45:09 +0100
Message-ID: <CACvgo527EEmC-iMf3waUHpBXVZzu2fNjk_UtHQENUGmd8fepYQ@mail.gmail.com>
References: <1439427380-2436-1-git-send-email-eric@anholt.net>
	<1439427380-2436-4-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439427380-2436-4-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13 August 2015 at 01:56, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
> This is the start of a full VC4 driver.  Right now this just supports
> configuring the display using a pre-existing video mode (because
> changing the pixel clock isn't available yet, and doesn't work when it
> is).  However, this is enough for fbcon and bringing up X using
> xf86-video-modesetting.
>
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
...
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/Makefile
> @@ -0,0 +1,18 @@
> +ccflags-y := -Iinclude/drm
> +
> +# Please keep these build lists sorted!
> +
> +# core driver code
> +vc4-y := \
> +       vc4_bo.o \
> +       vc4_crtc.o \
> +       vc4_drv.o \
> +       vc4_kms.o \
> +       vc4_hdmi.o \
> +       vc4_hvs.o \
> +       vc4_plane.o \
> +       $()
> +
In case anyone is curious - this is the first sentinel in the whole
kernel (some 2000+ Makefiles) :-)

-Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
