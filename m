From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/6] mfd: Add support for the MediaTek MT6358 PMIC
Date: Thu, 7 Feb 2019 12:03:22 +0000
Message-ID: <20190207120322.GA6190@sirena.org.uk>
References: <1548839891-20932-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1548839891-20932-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20190207093450.GH4672@dell>
 <345df368-b247-9c4b-a69d-e95f14bff8b6@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <345df368-b247-9c4b-a69d-e95f14bff8b6@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Lee Jones <lee.jones@linaro.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, tglx@linutronix.de, jason@lakedaemon.net
List-Id: devicetree@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2019 at 10:04:50AM +0000, Marc Zyngier wrote:
> On 07/02/2019 09:34, Lee Jones wrote:

> >> +static struct irq_top_t mt6358_ints[] =3D {
> >> +	MT6358_TOP_GEN(BUCK),
> >> +	MT6358_TOP_GEN(LDO),
> >> +	MT6358_TOP_GEN(PSC),
> >> +	MT6358_TOP_GEN(SCK),
> >> +	MT6358_TOP_GEN(BM),
> >> +	MT6358_TOP_GEN(HK),
> >> +	MT6358_TOP_GEN(AUD),
> >> +	MT6358_TOP_GEN(MISC),
> >> +};

> > What is a 'top' IRQ?

It looks like it's an intermediate parent IRQ controller; that's quite a
common design for MFDs on slow buses to cut down on the number of status
registers to poll.  IIRC there at least used to be some framework reason
for not using normal chained interrupts for these but I can't remember
it any more - possibly something to do with threaded handlers.

This is all looking very famililar, I suspect it's based on other
drivers dating back years rather than doing anything original.  There's
certainly a bunch of other drivers with very similar patterns in tree,
this doesn't look like it's got any problems over what most similar
drivers are doing.  The patterns all predate drivers/irqchip and a lot
of them will come from me.

> >> +static void pmic_irq_enable(struct irq_data *data)
> >> +{
> >> +	unsigned int hwirq =3D irqd_to_hwirq(data);
> >> +	struct mt6397_chip *chip =3D irq_data_get_irq_chip_data(data);
> >> +	struct pmic_irq_data *irq_data =3D chip->irq_data;
> >> +
> >> +	irq_data->enable_hwirq[hwirq] =3D 1;
> >> +}

> > I see that you're doing your own caching operations.  Is that
> > required?  I think I'm going to stop here and as for some IRQ guy's
> > input on this.

> Dunno either. I thought that's what regmap was for?

IIRC from when I wrote drivers for chips like this these operations are
called with interrupts disabled so you can't write to interrupt driven
buses so you need to cache the write and flush in sync_unlock().  You
can't do this with regmap as it stands since on a device that can't be
accessed with interrupts disabled you'd need to disable the writes
before going into the interrupts off section and there's a risk that
having the device cache disabled would disrupt some other function on
the chip that was expecting writes to get posted immediately. =20

It would be possible to add per-register cache only behaviour but
someone would need to do that and it's not clear that it's worth the
effort, especially since for slow buses we currently lock the entire
regmap including the cache with mutexes so you can't actually access the
cache with interrupts off at the minute.

> >> +	for (i =3D 0; i < irq_data->num_pmic_irqs; i++) {
> >> +		if (irq_data->enable_hwirq[i] =3D=3D
> >> +				irq_data->cache_hwirq[i])
> >> +			continue;

> Please explain what you are trying to do here. The unlock operation is
> supposed to affect exactly one interrupt. Instead, you seem to deal with
> a bunch of them at once. Operations are supposed to happen on the "leaf"
> IRQs, not on the multiplexing interrupt.

IIRC it was done this way because it wasn't altogether clear if
operations on multiple interrupts could ever be batched or not and given
that we're dealing with slow buses the cost of the loop is negligable.

> Also, the whole cache thing seems pretty pointless. Why isn't regmap
> doing that for you?

See above.

> >> +	for (i =3D 0; i < mt6358_irq_data->num_top; i++) {
> >> +		if (top_int_status & BIT(mt6358_ints[i].top_offset))
> >> +			mt6358_irq_sp_handler(chip, i);
> >> +	}
> >> +
> >> +	return IRQ_HANDLED;
> >> +}

> Why isn't this a normal chained irq flow, instead of a homegrown irq
> handler? Is that because this is a threaded handler?

I think that's it but like I say I can't remember clearly any more, it's
been a decade.

> >> +	ret =3D devm_request_threaded_irq(chip->dev, chip->irq, NULL,
> >> +					mt6358_irq_handler, IRQF_ONESHOT,
> >> +					mt6358_irq_chip.name, chip);
> >> +	if (ret) {
> >> +		dev_err(chip->dev, "failed to register irq=3D%d; err: %d\n",
> >> +			chip->irq, ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	enable_irq_wake(chip->irq);

> Why is that decided at probe time, from kernel space?

IIRC it's due to it being the main interrupt for the device and there
being at some point issues with this getting propagated to parent
interrupts so wake just got turned on all the time for the parent and we
relied on controlling the children.  Making things be proper chained
interrupt controllers would solve that I think.

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxcHocACgkQJNaLcl1U
h9B9mAf/RuWwFpw3PPjPrnHv+xB/CJ53tlD3ne/pLesX3Dj2s5CJwyZ4IQSzAGFi
B8KuBsT4410iudGgjRUBaa/S/CxDa+krUbCDhsSQJtYtKrnluYU0H8oxTCHklMJa
TwOOY9wb3DHgtkfqpPW9rGYEh9QVf6eBBDwVdxFezg7L6zkpZo5jNhSn11bpfnQK
XoEvqqNcQlUaPHQYxLO7UUwLjHwQf6RPJ7Apz+cq+Ba1PodachBYgorlmwpri1Uo
rQoaK1gWRrhfYo6t5seS/boh1lh3UG8wcPsOCC8oUsK+slMnoh/JgMR12D1EMy0I
Hab61OGqyBJKO3G+lhhm+xRtWYADHg==
=wiwY
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
