From: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 3/3] TTY/slave: add driver for w2sg0004 GPS
Date: Fri, 12 Dec 2014 16:06:07 +1100
Message-ID: <20141212160607.361d20db@notabene.brown>
References: <20141211214801.4127.93914.stgit@notabene.brown>
	<20141211215944.4127.57146.stgit@notabene.brown>
	<20141211231100.05782a30@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/bLC/IEv4J8WX/Uoqrn=Vqhz"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141211231100.05782a30-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/bLC/IEv4J8WX/Uoqrn=Vqhz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Dec 2014 23:11:00 +0000 One Thousand Gnomes
<gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> wrote:

> > +w2sg0004 UART-attached GPS receiver
> > +
>=20
> I'm wondering why it's tied to the w2sg0004
>=20
>=20
> > +struct w2sg_data {
> > +	int		gpio;
> > +	int		irq;	/* irq line from RX pin when pinctrl
> > +				 * set to 'idle' */
> > +	struct regulator *reg;
> > +
> > +	unsigned long	last_toggle;	/* jiffies when last toggle completed. */
> > +	unsigned long	backoff;	/* jiffies since last_toggle when
> > +					 * we try again
> > +					 */
> > +	enum {Idle, Down, Up} state;	/* state-machine state. */
> > +	bool		requested, is_on;
> > +	bool		suspended;
> > +	bool		reg_enabled;
> > +
> > +	struct delayed_work work;
> > +	spinlock_t	lock;
> > +	struct device	*dev;
> > +
> > +	struct rfkill	*rfkill;
>=20
> So its
> - a regulator (optional)
> - an irq (optional)
> - a gpio  (could be optional)
> - an optional rfkill
> - a pulse time (10ms fixed)
> - a backoff time (1 second fixed)
>=20
>=20
> It looks identical to half a dozen other widgets that are found in
> Android phones. Would it perhaps be better to make the tiny tweaks to
> make it generic
>=20
> - make the timers configurable
> - make the pulse time or high/low selectable for on/off
> - make the gpio optional
>=20
> and just have one driver with the right DT for all similar devices?
>=20
> Am I missing some w2sg004 specific bits here ?

There is particular behaviour that the device is both turned on and turned
off by toggling a GPIO, and the only way to detect which state it is in is
to watch the RX uart line (by reconfiguring it as a GPIO).

I'm sure that could describe other devices, but I don't personally know of
any.

I want to avoid premature generalisation.   When we have another device it
would certainly make sense to extend this driver to support the new device.
Values like the timeouts could be tied to the particular 'compatible' value.

I guess the one drive could support both of my devices, as the simpler one
just needs a regulator to be enabled/disabled, and this driver can do that.

But then we would need a name for this driver.  "generic.c" ???

>=20
>=20
> I think the general model is right, and there will be other slaves that
> don't fit the pattern but I do think this one could be generalised.

Thanks,
NeilBrown

>=20
> Alan
>=20


--Sig_/bLC/IEv4J8WX/Uoqrn=Vqhz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVIp3vznsnt1WYoG5AQKYIBAAnEJCBDk6Dv4tQitreni4dxr35vceIfxt
mAqE/J+F+OwRGdzVq1gQmF31wMTIOoFLBq/c/afkdXTAxL26T03HYKCpwL7ci/Zo
uYkCwcs3uH4PcbKaFgt+bxi9p394LhVqP2WN489tsiq1SMfrcZ3ojDvj1kSWCUuH
Dio1g4KTUVCPJ3gSL6ce4Lyhat/cXTBDTbgNk+VA6Bi+f0tJtakGCtXwEQJAQ9R1
Pcpz79T+pKljeik3IPzSUeawfjpZ841WDCmA0cLy3kvQemcDInYy7XIxGzyN2imI
/ekU920Gy1PiaJkGmB5dkxJ9zw3U84xe9ek+B37Bu3TK944yhtRNm3LQ3eEB0Bim
2q9jFb+pM3UccvArSxERzO+lyEY6OIFLgttMHec8FPtux17zi9d2nQ8PC44dsrNQ
T/tn28+qIXixRykDtKMwUUSkUHtoQIzdZO18e3VxJthwMZAx0ddEiH5aUFlI0Kz/
ZlWgRscBfkqY+xXDkkscRkmUJG89cVM4wCvtmUjqMpzroBNYM4vWjysb4LOwL3eH
B1ZW4gJH4RNnhyb1dLUn2ds5ByQkBk3uZsCrlq9TytDekU+YKjVwa4dZwrTB5L3p
9vHGxcRSqSxyynINmsb68HOxHHv5yAMYNuTYJ0pkC1eI7nbN27PZnbeZ1Z1NAS0H
zFXP12auiM8=
=pbBu
-----END PGP SIGNATURE-----

--Sig_/bLC/IEv4J8WX/Uoqrn=Vqhz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
