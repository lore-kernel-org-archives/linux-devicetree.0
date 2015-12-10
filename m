From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 5/5] gpio: tps65912: Add GPIO driver for the TPS65912 PMIC
Date: Thu, 10 Dec 2015 18:34:35 +0100
Message-ID: <CACRpkdZxZy=ZgeW-DwpNwC4KF+RvzQjYB=acVe47Wj7ALQ8Rig@mail.gmail.com>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
	<1447869580-10416-6-git-send-email-afd@ti.com>
	<CACRpkdbV+FzEXC_6HqRMRONY5fHoUWzg0HdoXq_s2N-RYphpVA@mail.gmail.com>
	<565DF7BD.6010204@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <565DF7BD.6010204-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 1, 2015 at 8:40 PM, Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org> wrote:
> On 11/30/2015 02:26 AM, Linus Walleij wrote:
>>
>> On Wed, Nov 18, 2015 at 6:59 PM, Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org> wrote:
>>
>>> This patch adds support for the TPS65912 PMIC GPIOs.
>>>
>>> TPS65912 has five configurable GPIOs that can be used for several
>>> purposes.
>>>
>>> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
>>> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>>
>> (...)
>>>
>>> +       gpio->tps = dev_get_drvdata(pdev->dev.parent);
>>> +       gpio->gpio_chip = template_chip;
>>> +       gpio->gpio_chip.dev = tps->dev;
>>
>>
>> This is now renamed .parent in linux-next. It needs to be changed if the
>> code should compile after merge.
>>
>
> Are you able to make this change when you pick this up or would you
> like me to resend this?

I guess all these need to be applied together?

It's probably best if Lee apply all and provide them on an immutable
branch, and I
will apply fixes on top after pulling that in.

I recently did exactly that with an AC97 driver from ALSA SoC.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
