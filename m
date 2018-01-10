From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add a ngpios-ranges property
Date: Wed, 10 Jan 2018 14:37:53 +0100
Message-ID: <CACRpkdaN6vmV4L4U76DvD5BN+j1RYCQakTysA+GGPdT8Chc-iw@mail.gmail.com>
References: <20180110015848.11480-1-sboyd@codeaurora.org> <20180110015848.11480-3-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180110015848.11480-3-sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 10, 2018 at 2:58 AM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:

> Some qcom platforms make some GPIOs or pins unavailable for use
> by non-secure operating systems, and thus reading or writing the
> registers for those pins will cause access control issues.
> Introduce a DT property to describe the set of GPIOs that are
> available for use so that higher level OSes are able to know what
> pins to avoid reading/writing.
>
> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

I like the idea, let's check what we think about the details regarding
naming and semantics, I need feedback from some DT people
in particular.

Paging in Grant on this as he might have some input.

> I stuck this inside msm8996, but maybe it can go somewhere more generic?

Yeah just put it in Documentation/devicetree/bindings/gpio/gpio.txt
Everyone and its dog doing GPIO reservations "from another world"
will need to use this.

> +- ngpios-ranges:
> +       Usage: optional
> +       Value type: <prop-encoded-array>
> +       Definition: Tuples of GPIO ranges (base, size) indicating
> +                   GPIOs available for use.
> +
>  Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
>  a general description of GPIO and interrupt bindings.

I like the tuples syntax. That's fine. It's like gpio-ranges we have
already to map between pin controllers and GPIO.

I don't think we can reuse gpio-ranges because that is
exclusively for pin control ATM, it would be fine if the ranges
were for a specific device, like pin control does, like:

gpio-ranges = <&secure_world_thing 0 20 10>;

But you definately would need a node to tie it to, so that the
driver for that node can specify that it's gonna take the
GPIOs.

But I think the semantics should be the inverse. That you
point out "holes" with the lines we *can't* use.

We already support a generic property "ngpios" that says how
many of the GPIOs (counted from zero) that can be used,
so if those should be able to use this as a generic property it
is better with the inverse semantics and say that the
"reserved-gpio-ranges", "secureworld-gpio-ranges"
(or whatever we decide to call it) takes precedence over
ngpios so we don't end up in ambigous places.

Then, will it be possible to put the parsing, handling and
disablement of these ranges into drivers/gpio/gpiolib-of.c
where we handle the ranges today, or do we need to
do it in the individual drivers?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
