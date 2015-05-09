From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH 0/6] ARM: sunxi: Introduce Allwinner H3
 support
Date: Sat, 09 May 2015 17:58:43 +0200
Message-ID: <554E2EB3.1000603@redhat.com>
References: <1430904693-1404-1-git-send-email-jenskuske@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430904693-1404-1-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?B?RW1pbGlvIEzDs3Bleg==?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 06-05-15 11:31, Jens Kuske wrote:
> Hi everyone,
>
> This patch series introduces basic kernel support for Allwinner's H3 SoC,
> mainly basic clocks and pinctrl. It also adds interrupts, timers,
> watchdog, RTC, dmaengine, MMC and UARTs, which are mostly compatible to
> those in earlier SoCs like A23 and A31, and can simply be reused.
>
> These patches are based on Maxime's sunxi/for-next branch from
> git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git
>
> Patch 1 adds machine support for the H3.
>
> Patch 2 adds support for the basic clocks. The AHB1/AHB2 split could
> need some discussion.
>
> Patch 3 adds the pin sets for the H3 main PIO.
>
> Patch 4 adds the H3 specific parameters to the sun6i dmaengine driver.
>
> Patch 5 adds the DTSI for the H3.
>
> Patch 6 adds a DT for the Orange Pi Plus SBC, which these patches
> were developed and tested with.

Cool stuff, thanks for your work on this. Do you have any plans to also
add support for the H3 to upstream u-boot ?

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
