From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/5] irqchip: add dumb demultiplexer implementation
Date: Wed, 14 Jan 2015 15:43:29 +0100
Message-ID: <54B68091.7080109@atmel.com>
References: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com>	<1421174781-4340-2-git-send-email-boris.brezillon@free-electrons.com>	<54B670EA.1010800@atmel.com> <20150114150332.09fecbea@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150114150332.09fecbea@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 14/01/2015 15:03, Boris Brezillon a =C3=A9crit :
> On Wed, 14 Jan 2015 14:36:42 +0100
> Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
>=20
>> Le 13/01/2015 19:46, Boris Brezillon a =C3=A9crit :
>>> Some interrupt controllers are multiplexing several peripheral IRQs=
 on
>>> a single interrupt line.
>>> While this is not a problem for most IRQs (as long as all periphera=
ls
>>> request the interrupt with IRQF_SHARED flag set), multiplexing time=
rs and
>>> other type of peripherals will generate a WARNING (mixing IRQF_NO_S=
USPEND
>>> and !IRQF_NO_SUSPEND is prohibited).
>>>
>>> Create a dumb irq demultiplexer which simply forwards interrupts to=
 all
>>> peripherals (exactly what's happening with IRQ_SHARED) but keep a u=
nique
>>> irq number for each peripheral, thus preventing the IRQF_NO_SUSPEND
>>> and !IRQF_NO_SUSPEND mix on a given interrupt.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> ---
>>>  drivers/irqchip/Kconfig          |   4 ++
>>>  drivers/irqchip/Makefile         |   1 +
>>>  drivers/irqchip/irq-dumb-demux.c |  70 ++++++++++++++++++++
>>>  include/linux/irq.h              |  49 ++++++++++++++
>>>  include/linux/irqdomain.h        |   1 +
>>>  kernel/irq/Kconfig               |   5 ++
>>>  kernel/irq/Makefile              |   1 +
>>>  kernel/irq/chip.c                |  41 ++++++++++++
>>>  kernel/irq/dumb-demux-chip.c     | 140 +++++++++++++++++++++++++++=
++++++++++++
>>>  kernel/irq/handle.c              |  31 ++++++++-
>>>  kernel/irq/internals.h           |   3 +
>>>  11 files changed, 344 insertions(+), 2 deletions(-)
>>>  create mode 100644 drivers/irqchip/irq-dumb-demux.c
>>>  create mode 100644 kernel/irq/dumb-demux-chip.c

[..]

>>> +static void irq_dumb_demux_mask(struct irq_data *d)
>>> +{
>>> +	struct irq_chip_dumb_demux *demux =3D irq_data_get_irq_chip_data(=
d);
>>> +
>>> +	clear_bit(d->hwirq, &demux->unmasked);
>>> +
>>> +	if (!demux->unmasked)
>>> +		disable_irq_nosync(demux->src_irq);
>>> +}
>>> +
>>> +static void irq_dumb_demux_unmask(struct irq_data *d)
>>> +{
>>> +	struct irq_chip_dumb_demux *demux =3D irq_data_get_irq_chip_data(=
d);
>>> +	bool enable_src_irq =3D !demux->unmasked;
>>
>> Why this additional "bool" unlike the other function above?
>=20
> Because set_bit will modify the unmasked status and we must check if =
it
> is equal to 0 (in other terms, all irqs are masked) before modifying =
it
> in order to know whether we should enable the src irq or not.

pfffff! ok, sorry for the noise then ;-)


>>> +
>>> +	set_bit(d->hwirq, &demux->unmasked);
>>> +
>>> +	if (enable_src_irq)
>>> +		enable_irq(demux->src_irq);
>>> +}
>>> +

[...]

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
