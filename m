From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: realview: Fix PBX-A9 cache description
Date: Fri, 22 Jul 2016 17:02:26 +0200
Message-ID: <CACRpkdYTp2V_qR80ykn_3SxaBVg9mj71OZmU=T8knMZqo_i2rw@mail.gmail.com>
References: <dbf8749c4af9aa5ffb85e961b7ae09ffeefa7f2a.1468583959.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dbf8749c4af9aa5ffb85e961b7ae09ffeefa7f2a.1468583959.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 15, 2016 at 2:19 PM, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> wrote:

> Clearly QEMU is very permissive in how its PL310 model may be set up,
> but the real hardware turns out to be far more particular about things
> actually being correct. Fix up the DT description so that the real
> thing actually boots:
>
> - The arm,data-latency and arm,tag-latency properties need 3 cells to
>   be valid, otherwise we end up retaining the default 8-cycle latencies
>   which leads pretty quickly to lockup.
> - The arm,dirty-latency property is only relevant to L210/L220, so get
>   rid of it.
> - The cache geometry override also leads to lockup and/or general
>   misbehaviour. Irritatingly, the manual doesn't state the actual PL310
>   configuration, but based on the boardfile code and poking registers
>   from the Boot Monitor, it would seem to be 8 sets of 16KB ways.
>
> With that, we can successfully boot to enjoy the fun of mismatched FPUs...
>
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

Sorry for screwing things up! :(

Patch applied with Rutland's Test tag, I will carry this to ARM SoC as a fix.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
