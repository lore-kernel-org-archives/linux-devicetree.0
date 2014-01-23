From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] pinctrl: st: Add software edge trigger interrupt support.
Date: Thu, 23 Jan 2014 08:29:06 +0100
Message-ID: <CACRpkdaBAnpfHBqkgU2emZrYwHGh9KvDvqfnCvaWdU5jYgxStA@mail.gmail.com>
References: <1389886545-31498-1-git-send-email-srinivas.kandagatla@st.com>
	<1389886651-31990-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389886651-31990-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 16, 2014 at 4:37 PM,  <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org> wrote:

> ST pin controller does not have hardware support for detecting edge
> triggered interrupts, It only has level triggering support.
> This patch attempts to fake up edge triggers from hw level trigger
> support in software.

(...)


> +/*
> + * Edge triggers are not supported at hardware level, it is supported by
> + * software by exploiting the level trigger support in hardware.
> + * Software uses a virtual register (EDGE_CONF) for edge trigger configuration
> + * of each gpio pin in a GPIO bank.

(...)

> +/*
> + * As edge triggers are not supported at hardware level, it is supported by
> + * software by exploiting the level trigger support in hardware.

(...)

All this is quite hard to understand. Maybe it's just because
it's hard overall. Edge triggers are not supported by hardware
so we use the hardware edge trigger support?

That is a bit oxymoronic...

> + * Steps for detection raising edge interrupt in software.
> + *
> + * Step 1: CONFIGURE pin to detect level LOW interrupts.
> + *
> + * Step 2: DETECT level LOW interrupt and in irqmux/gpio bank interrupt handler,
> + * if the value of pin is low, then CONFIGURE pin for level HIGH interrupt.
> + * IGNORE calling the actual interrupt handler for the pin at this stage.
> + *
> + * Step 3: DETECT level HIGH interrupt and in irqmux/gpio-bank interrupt handler
> + * if the value of pin is HIGH, CONFIGURE pin for level LOW interrupt and then
> + * DISPATCH the interrupt to the interrupt handler of the pin.

But I do understand this, that's VERY clever and may be something
that can be exploited on other hardware as well some day.

So patch applied.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
