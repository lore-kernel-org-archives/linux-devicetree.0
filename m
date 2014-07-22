From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v8 00/11] ARM: brcmstb: Add Broadcom STB SoC support
Date: Tue, 22 Jul 2014 09:35:45 +0200
Message-ID: <5675728.WLk3P96IBM@wuerfel>
References: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405976886-27807-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 21 July 2014 14:07:55 Brian Norris wrote:
> I'm taking over the latest resubmission of this patch series.
> There are a few moderate changes for v8 (noted below), but we
> are waiting mostly for an Ack for the reboot driver.
> 
> This patchset contains the board support package for the
> Broadcom BCM7445 ARM-based SoC [1]. These changes contain a
> minimal set of code needed for a BCM7445-based board to boot
> the Linux kernel.
> 
> These changes heavily leverage the OF/devicetree framework. The
> machine is also built into the multi-platform ARMv7 image.
> 
> Changes are also available here:
> 
>   https://github.com/brcm/linux/tree/brcmstb-v8
>   git://github.com/brcm/linux.git +brcmstb-v8

Whole series

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

I think we should try to get this merged into 3.17, it's already
taken too long and the patches look good.

Please add the core architecture patches for arch/arm into Russell's
patch tracker http://www.arm.linux.org.uk/developer/patches/.

For the platform changes in the first patch, I would prefer to have
Matt pick up the first patch, but we can also apply it directly into
arm-soc if he prefers that.

The reset driver can ideally go through the drivers/power/ maintainers,
but if they are not interested in merging it, we can also take that
through arm-soc. See also my one comment on that driver.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
