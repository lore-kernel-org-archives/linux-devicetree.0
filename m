From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [Patch v2 1/2] gpio: add GPIO hogging mechanism
Date: Tue, 2 Dec 2014 23:13:31 +0900
Message-ID: <CAAVeFuLTupDenZdSi8KO+dYsf-ekcqjsDaQ2GEzYpBG34oF7Zw@mail.gmail.com>
References: <1416527684-19017-1-git-send-email-bparrot@ti.com>
 <1416527684-19017-2-git-send-email-bparrot@ti.com> <CAAVeFu+VZiuzobB7McSAUehKUHJjBv1o8ZpYjSHJAKjr3o5wTA@mail.gmail.com>
 <20141201163639.GI25249@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20141201163639.GI25249@lukather>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Benoit Parrot <bparrot@ti.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 2, 2014 at 1:36 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi,
>
> On Fri, Nov 28, 2014 at 04:30:01PM +0900, Alexandre Courbot wrote:
>> > +/**
>> > + * do_gpio_hog - Given node is a GPIO hog configuration, handle it
>> > + * @np:                device node to get GPIO from
>> > + *
>> > + * This is only used by of_gpiochip_add to request/set GPIO initial
>> > + * configuration.
>> > + */
>> > +static int do_gpio_hog(struct device_node *np)
>> > +{
>> > +       struct gpio_desc *desc = NULL;
>> > +       int err;
>> > +       const char *name;
>> > +       enum gpio_lookup_flags lflags;
>> > +       enum gpiod_flags dflags;
>> > +
>> > +       desc = of_get_gpio_hog(np, &name, &lflags, &dflags);
>> > +       if (!desc)
>> > +               return -ENOTSUPP;
>> > +       else if (IS_ERR(desc))
>> > +               return PTR_ERR(desc);
>> > +
>> > +       err = gpiod_request(desc, name);
>>
>> Using this function means that a GPIO chip module cannot be unloaded
>> if it uses GPIO hogs. Is it the intended behavior? If not, please use
>> gpiochip_request_own_desc() instead, and make sure to call
>> gpiochip_free_own_desc() for each hog when the driver is unloaded.
>
> The only thing I'd like to have would be that the request here would
> be non-exclusive, so that a later driver would still be allowed later
> on to request that GPIO later on and manage it itself (ideally using
> the usual gpiod_request function).

Actually we have a plan (and I have some code too) to allow multiple
consumers per GPIO. Although like Benoit I wonder why you would want
to hog a GPIO and then request it properly later. Also, that probably
means we should abandon the hog since it actively drives the line and
would interfere with the late requested. How to do that correctly is
not really clear to me.
