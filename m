From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 4/4] irqchip: Add bcm2836 interrupt controller for Raspberry Pi 2.
Date: Mon, 13 Jul 2015 09:06:10 -0700
Message-ID: <878uakqbyl.fsf@eliezer.anholt.net>
References: <1436303617-17185-1-git-send-email-eric@anholt.net> <1436303617-17185-5-git-send-email-eric@anholt.net> <55A0A5EB.4090007@wwwdotorg.org> <alpine.DEB.2.11.1507110940420.17353@nanos>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1507110940420.17353@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrea Merello <andrea.merello@gmail.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thomas Gleixner <tglx@linutronix.de> writes:

> On Fri, 10 Jul 2015, Stephen Warren wrote:
>> On 07/07/2015 03:13 PM, Eric Anholt wrote:
>> > +static void bcm2836_mask_per_cpu_irq(unsigned int reg, unsigned int b=
it)
>> > +{
>> > +	void __iomem *reg_base =3D intc.base + reg;
>> > +	unsigned int i;
>> > +
>> > +	for (i =3D 0; i < 4; i++)
>>=20
>> Is "4" there the CPU count? Perhaps this should use one of the Linux
>> APIs to query the CPU count rather than hard-coding it?
>>=20
>> Should per-CPU IRQs automatically be masked on all CPUs at once, or only
>> on the current CPU? A very quick look at the ARM GIC driver implies it
>> doesn't iterate over all CPUs when masking per-CPU IRQs.
>
> Usually per cpu interrupts are only masked on the cpu which is calling
> the function. The whole reason why per cpu interrupts exist is that
> you can share the same interrupt number for all cores.
>
> So masking all interrupts is not a good idea. In this case if a cpu is
> hot unplugged, then all other cpus would not longer get timer
> interrupts. Not what you really want, right?

I was replicating the behavior of the downstream driver, but it seemed
suspicious.  Converting to using smp_processor_id() to just mask/unmask
this CPU's interrupts seems to have gone fine.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVo+HzAAoJELXWKTbR/J7o0g8P/iJiJ5gr3R0ML3cxzE42iFO3
kfuD/1jpkEt9tCywJ57OSVaXTUtAbNyQty1SQUwOe+o3GWmhbQdR/OZf8MFm9AOn
F3NPDhLCrxTSdCRr/ZCkEP3fKmkhbjNZOF8TGBW3IfWNRq3fkUxoxPL21lBKI54V
Yq3qjFttpw7GR/UfHtlYtnwegNGmYhGfiqKGvfy8zjng8w40I89EIdjbf8sYqwpf
pELh2X6dqCSN/OQej1kKKRUO7GtOwzOBTYgi3jVOl3J4i5ww0jDJlOKgSoW/lQZ7
+YAmkyjYzO5/wMNZVd/WOrl6q9H+jvg1ubqTQX1FUkeRhlMCkGn+EcVPRPNHC5AO
fE7oaviUpXjj+Lf/WK6CP5sOMW+vI+hiSd3EaacndPY44SkyZgD1jz9bh4mHbVDw
RM3vtLggaLM2PYoUpYdkYe/HelPsMiMi25QcWew5wwe9sglXuoC6PlYH/ZM45au5
mtz8HVC8HnbJFas72axIcCDr8gqWvhUOr3freuA7EMNwmWb+h1VitubHBJMAzv8E
Dnb3+TbRknCLKmx0ZQWJvmEfzhWF9azC5D6PHGX5lZ3iw5PC5UkFY+fdrJKqnJg+
09n1hVO3RzdZrt7CHwp5839SsdhNQi/CrcPqMUi9AvznWAPdklRPnIGW/MppLJlz
ZkldkbHW7XHVorI6Bbf7
=VJo0
-----END PGP SIGNATURE-----
--=-=-=--
