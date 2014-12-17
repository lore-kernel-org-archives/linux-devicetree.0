From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 5/8] watchdog: bindings: Provide ST bindings for ST's LPC Watchdog device
Date: Wed, 17 Dec 2014 22:54:12 +0100
Message-ID: <5479005.CEJLtxOOIa@wuerfel>
References: <1418834727-1602-1-git-send-email-lee.jones@linaro.org> <1418834727-1602-6-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418834727-1602-6-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 17 December 2014 16:45:24 Lee Jones wrote:
> +- compatible   : Must be one of: "st,stih407-lpc" "st,stih416-lpc"
> +                                 "st,stih415-lpc" "st,stid127-lpc"
> +- reg          : LPC registers base address + size
> +- interrupts    : LPC interrupt line number and associated flags
> +- clocks       : Clock used by LPC device (See: ../clock/clock-bindings.txt)
> +- st,lpc-mode  : The LPC can run either one of two modes ST_LPC_MODE_RTC [0] or
> +                 ST_LPC_MODE_WDT [1].  One (and only one) mode must be
> +                 selected.
> 

I'm glad you got it to work with two drivers for the same device.

With this binding, I'm still a bit unhappy about the st,lpc-mode property,
in particular since you rely on a shared include file for something that
can only be set in one way or another and always has to be present.

Why not just use a boolean property that enforces one mode when present
and another mode when absent?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
