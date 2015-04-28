From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] gpio: Allow userspace export from DT
Date: Tue, 28 Apr 2015 14:56:11 +0200
Message-ID: <CACRpkdYw6fY0CKonAO+HtUosjCt5oJjCy3RoRxsDyLCgJCMfLw@mail.gmail.com>
References: <20150413110515.9681.58848.stgit@localhost>
	<CAL_JsqJorndYh4ROdKbJfpG1KY=Xosjc6BMFYRPrb+BsauFsnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJorndYh4ROdKbJfpG1KY=Xosjc6BMFYRPrb+BsauFsnQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 15, 2015 at 3:19 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Apr 13, 2015 at 6:05 AM, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org> wrote:

>> That number, in the case of gpio drviers using dynamic allocation, is not fixed,
>> and may change when:
>> * The kernel version changes and ARCH_NR_GPIOS is changed (happened in 3.17)
>> * The kernel version changes and probe order changes for gpio chips.
>> * The kernel configuration is changed if CONFIG_ARCH_NR_GPIO is used
>> * The board is redesigned (eg switching an externally visible signal from a
>> SoC provided GPIO to an I2C expander chip or vice versa).
>> * Other GPIO chips are added to the system.
>
> Isn't there some plan/desire to fix the GPIO sysfs interface?

Desire yes. But well noone seems to do it...

There is also the perpetual abuse of sysfs to do things that should
be done in the kernel, like driving LEDs or reading switches.
But that's another problem I guess.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
