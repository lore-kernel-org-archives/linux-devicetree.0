From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 0/6] stm32 clocksource driver rework
Date: Tue, 7 Nov 2017 11:16:34 +0100
Message-ID: <CA+M3ks4T9rQ91d7hqBmS=saJkVXvCSO=9pi3L7oX48vFmAcc0A@mail.gmail.com>
References: <1508752722-4489-1-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508752722-4489-1-git-send-email-benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, Julien Thierry <julien.thierry-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-10-23 11:58 GMT+02:00 Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> version 7:
>  - reword "clocksource: stm32: only use 32 bits timers" commit message
>    to give more details about why 16 bits are problematics.

Gentle ping in this last version.
The first patch for timer core has been merge but driver patches still
need to be reviewed

Thanks,
Benjamin

>
> version 6:
>  - add dedicated patch min delta change
>  - rework commit messages, I hope it will be better now
>  - change new function name from timer_of_deinit to timer_of_exit
>  - make stm32_clock_event_set_next_event() safer like done in other
>    drivers
>
> version 6:
> - add timer_of_deinit function in core
> - rework failure cases in probe function
>
> version 5:
> - rebase on top of timer/core branch
> - rework commit message of the first patch
>
> version 4:
> - split patch in 3 parts
>   - convert code to timer_of
>   - only use 32 bits timers
>   - add clocksource support
>
> version 3:
> - fix comments done by Daniel
> - use timer_of helper functions
>
> version 2:
> - fix uninitialized variable
>
>
> Benjamin Gaignard (6):
>   timer: add timer_of_exit function
>   clocksource: stm32: convert driver to timer_of
>   clocksource: stm32: increase min delta value
>   clocksource: stm32: only use 32 bits timers
>   clocksource: stm32: add clocksource support
>   arm: dts: stm32: remove useless clocksource nodes
>
>  arch/arm/boot/dts/stm32f429.dtsi  |  32 -----
>  arch/arm/boot/dts/stm32f746.dtsi  |  32 -----
>  drivers/clocksource/Kconfig       |   1 +
>  drivers/clocksource/timer-of.c    |  12 ++
>  drivers/clocksource/timer-of.h    |   3 +
>  drivers/clocksource/timer-stm32.c | 241 ++++++++++++++++++++------------------
>  6 files changed, 144 insertions(+), 177 deletions(-)
>
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
