From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] arm: dts: stm32: remove useless clocksource nodes
Date: Sun, 17 Sep 2017 15:34:23 +0200
Message-ID: <CA+M3ks6WjdJ-z5pcfXDk7va5CS0zQ6gud85GGHRS9zh2d6YSuQ@mail.gmail.com>
References: <1505375812-19037-1-git-send-email-benjamin.gaignard@linaro.org>
 <1505375812-19037-3-git-send-email-benjamin.gaignard@linaro.org> <20170915210347.GA1831@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915210347.GA1831@mai>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-09-15 23:03 GMT+02:00 Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> On Thu, Sep 14, 2017 at 09:56:52AM +0200, Benjamin Gaignard wrote:
>> 16 bits timers aren't accurate enough to be used as
>> clocksource, remove them from stm32f4 and stm32f7 devicetree.
>
> Do you really want to remove the description? The timers are disabled, aren't they?

Yes because they are 16 bits timers and they won't be accepted anymore in
driver's probe function.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
