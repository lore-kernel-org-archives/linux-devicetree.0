From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 2/9] irqchip: add Amlogic Meson GPIO irqchip driver
Date: Fri, 09 Jun 2017 14:15:45 -0700
Message-ID: <m2vao46ewu.fsf@baylibre.com>
References: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
        <89d02a38-7386-fcdc-4dce-ea7e531c90b4@gmail.com>
        <1496999266.3552.61.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496999266.3552.61.camel-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Jerome Brunet's message
        of "Fri, 09 Jun 2017 11:07:46 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thierry.reding@gmail.com" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> On Thu, 2017-06-08 at 21:38 +0200, Heiner Kallweit wrote:
>> Add a driver supporting the GPIO interrupt controller on certain
>> Amlogic meson SoC's.
>>=20
>> Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

[...]

>> +static unsigned int meson_irq_startup(struct irq_data *data)
>> +{
>> +	irq_chip_unmask_parent(data);
>> +	/*
>> +	=C2=A0* An extra bit was added to allow having the same gpio hwirq twi=
ce
>> +	=C2=A0* for handling IRQ_TYPE_EDGE_BOTH. Remove this bit to get the
>> +	=C2=A0* gpio hwirq.
>> +	=C2=A0*/
>> +	meson_irq_set_hwirq(data, data->hwirq >> 1);
>
> Please keep in mind that any device can use this controller as irq parent.
> It has to make sense, even when not serving the gpio driver.
>
> This hack means that, in DT, we'd have to multiply by 2 the values given =
under
> section "22.3 GPIO interrupts" of the datasheet. This is an example Linux
> specific stuff in DT.
> It also means that the controller declares a lot more lines that it reall=
y has
> ...=20
>
> This is all to accommodate your hack around IRQ_TYPE_BOTH and creating the
> mapping from the irq_set_type callback of the GPIO driver, which is still=
 think
> should be dropped at this point.

+1

Please drop the hack for IRQ_TYPE_BOTH so we can reach agreement on the
basic design and functionality.  The gymnastics required to support this
hack (due to broken hardware) are getting in the way of getting basic
functionality merged.

Also, we already know from previous discussions between Jerome and the
IRQ maintainers that hacks for IRQ_TYPE_BOTH like this have been very
thoroughly rejected.  So while the IRQ maintainers haven't chimed in on
this series, we have a very good idea what they will say when they do.

So please, pretty please, let's avoid giving the IRQ maintainers a fun
reason to NAK, and drop the IRQ_TYPE_BOTH stuff until we have an agreed
upon way to support the hardware that actually works.

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
