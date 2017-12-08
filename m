From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH v9 5/6] clocksource: stm32: Update license and copyright
Date: Fri, 8 Dec 2017 14:46:25 +0100
Message-ID: <CAOFm3uEGweexMydumojVKBuJ6QskBV+zWXUQBCx67dZvhiXrxg@mail.gmail.com>
References: <20171208113250.359-1-benjamin.gaignard@st.com> <20171208113250.359-6-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171208113250.359-6-benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 8, 2017 at 12:32 PM, Benjamin Gaignard
<benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Adopt SPDX License Identifier and add STMicroelectronics
> copyright
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
> ---
>  drivers/clocksource/timer-stm32.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/timer-stm32.c
> index c9aed2314194..21479c3cfcb9 100644
> --- a/drivers/clocksource/timer-stm32.c
> +++ b/drivers/clocksource/timer-stm32.c
> @@ -1,7 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (C) Maxime Coquelin 2015
> + * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
>   * Author:  Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> - * License terms:  GNU General Public License (GPL), version 2
> + * Author: Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org> for STMicroelectronics.
>   *
>   * Inspired by time-efm32.c from Uwe Kleine-Koenig
>   */
> --
> 2.15.0
>

Benjamin,

Thank you for this: every little bit of help counts towards making the
whole kernel licensing easily greppable!

FWIW:

Reviewed-by: Philippe Ombredanne <pombredanne-kIH2VFuay/A@public.gmane.org>

--
Philippe
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
