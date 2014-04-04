From: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: add SMP support for Broadcom mobile SoCs
Date: Thu, 03 Apr 2014 21:26:03 -0500
Message-ID: <533E183B.9080105@linaro.org>
References: <1396577891-2713-1-git-send-email-elder@linaro.org> <1396577891-2713-3-git-send-email-elder@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396577891-2713-3-git-send-email-elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/03/2014 09:18 PM, Alex Elder wrote:
> This patch adds SMP support for BCM281XX and BCM21664 family SoCs.
> 
> This feature is controlled with a distinct config option such that a
> SMP-enabled multi-v7 binary can be configured to run these SoCs in
> uniprocessor mode.  Since this SMP functionality is used for
> multiple Broadcom mobile chip families the config option is called
> ARCH_BCM_MOBILE_SMP (for lack of a better name).
> 
> On SoCs of this type, the secondary core is not held in reset on
> power-on.  Instead it loops in a ROM-based holding pen.  To release
> it, one must write into a special register a jump address whose
> low-order bits have been replaced with a secondary core's id, then
> trigger an event with SEV.  On receipt of an event, the ROM code
> will examine the register's contents, and if the low-order bits
> match its cpu id, it will clear them and write the value back to the
> register just prior to jumping to the address specified.
> 
> The location of the special register is defined in the device tree
> using a "secondary-boot-reg" property in a node whose "enable-method"
> matches.
> 
> Derived from code originally provided by Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> 
> Signed-off-by: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---

. . .

> diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
> index b2279e3..929579f 100644
> --- a/arch/arm/mach-bcm/Makefile
> +++ b/arch/arm/mach-bcm/Makefile
> @@ -15,7 +15,10 @@ obj-$(CONFIG_ARCH_BCM_281XX)	+= board_bcm281xx.o
>  plus_sec := $(call as-instr,.arch_extension sec,+sec)
>  
>  # BCM21664
> -obj-$(CONFIG_ARCH_BCM_21664)	+= board_bcm21664.o
> +obj-$(CONFIG_ARCH_BCM_21664)	:= board_bcm21664.o

The above was a mistake, it should still be +=.

(I'll fix it.)

. . .

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
