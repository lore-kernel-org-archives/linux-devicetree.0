From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 0/2] clocksource: npcm: add NPCM7xx timer driver
Date: Sun, 1 Oct 2017 18:47:26 +0200
Message-ID: <20171001164726.GB2290@mai>
References: <1506849098-18290-1-git-send-email-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1506849098-18290-1-git-send-email-tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 01, 2017 at 12:11:36PM +0300, Tomer Maimon wrote:
> This patch set adds clocksource support for the Nuvoton NPCM7xx Baseboard
> Management Controller (BMC).
> 
> The clocksource Enable 24-bit TIMER0 and TIMER1 counters in the NPCM7xx BMC,
> while TIMER0 serves as clockevent and TIMER1 serves as clocksource.
> 
> clocksource patch set depand on approval of basic support for Nuvoton BMCs
> and Nuvoton NPCM750 device tree patches.
> https://patchwork.kernel.org/bundle/brendanhiggins/arm:%20npcm:%20add%20basic%20support%20for%20Nuvoton%20BMCs/
> 
> Tomer Maimon (2):
>   clocksource: npcm: add NPCM7xx timer driver
>   dt-binding: timer: document NPCM7xx timer DT bindings
> 
>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  25 +++
>  drivers/clocksource/Kconfig                        |   9 +
>  drivers/clocksource/Makefile                       |   1 +
>  drivers/clocksource/npcm7xx_timer.c                | 205 +++++++++++++++++++++
>  4 files changed, 240 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt

Add me in copy of the binding, so I can take the patch along with the driver.

Thanks.

  -- Daniel

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
