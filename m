From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] memory: pl17x: add support of PL175 and PL176 controllers
Date: Tue, 29 Sep 2015 22:39:05 +0200
Message-ID: <CAGhQ9VzUwkkXqRQ-WZ_cjRKCrE=co1LNwFaQfGmBbuEOsVZ6_A@mail.gmail.com>
References: <1443459043-24144-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443459043-24144-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On 28 September 2015 at 18:50, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org> wrote:
> The change adds support of ARM PrimeCell PL175 MPMC and PL176 MPMC,
> the static memory controllers on devices are similar to one found on
> ARM PrimeCell PL172, add support to the existing driver.
>
> Vladimir Zapolskiy (4):
>   memory: pl172: correct MPMC peripheral ID register bits
>   memory: pl172: add ARM PrimeCell PL175 MPMC support
>   memory: pl172: add ARM PrimeCell PL176 MPMC support
>   doc: dt: arm,pl172: add description of PL175 and PL176 controllers

Changes look good to me.

What LPC32xx board did you test this on, btw?

Also if you have added the controller to lpc32xx.dtsi it would be
great if you could also submit those changes to the lpc32xx
maintainer.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
