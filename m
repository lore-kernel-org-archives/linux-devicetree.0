From: NeilBrown <neilb@suse.de>
Subject: Re: [Gta04-owner] [PATCH 2/3] TTY: add support for tty_slave
 devices.
Date: Tue, 31 Mar 2015 11:33:50 +1100
Message-ID: <20150331113350.3302bde8@notabene.brown>
References: <20150318055437.21025.13990.stgit@notabene.brown>
	<20150318055831.21025.85317.stgit@notabene.brown>
	<5512E288.4020703@hurleysoftware.com>
	<20150326081729.700a7a6e@notabene.brown>
	<55153A84.8000302@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/g/wF3FVl=R3/xtTy8KrNT3T"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55153A84.8000302@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, GTA04 owners <gta04-owner@goldelico.com>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>
List-Id: devicetree@vger.kernel.org

--Sig_/g/wF3FVl=R3/xtTy8KrNT3T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Mar 2015 07:09:56 -0400 Peter Hurley <peter@hurleysoftware.com>
wrote:

> On 03/25/2015 05:17 PM, NeilBrown wrote:
> > On Wed, 25 Mar 2015 12:30:00 -0400 Peter Hurley <peter@hurleysoftware.c=
om>
> > wrote:
> >=20
> >> On 03/18/2015 01:58 AM, NeilBrown wrote:
> >>
> >>> + * A "tty-slave" is a device permanently attached to a particularly
> >>> + * tty, typically wired to a UART.
> >>
> >> Why "permanently"?
> >> Is that a limitation of the implementation or design?
> >>
> >=20
> > The slave is described in devicetree - that only happens for permanently
> > attached devices, doesn't it?
> >=20
> > I guess that with device-tree overlays and 'capes' for boards you could=
 have
> > a device attached to the uart "for this power session" rather than
> > "permanently", but I think it is a rather subtle distinction.
> >=20
> > Did you have something else in mind?
>=20
> My primary concern is that the abstraction match the scope.
>=20
> If the abstraction is at the tty layer, then the scope of the design
> should support tty devices, not just hard-wired, devicetree-defined uarts.

I think I see your point, and I tend to agree.  However there is a limit to
how closely we can reach the ideal...

I see a lot of conceptual overlap between line discipline and tty_slaves.
They both provide extra driver support for the thing which the tty talks to.

Line disciplines can be configured at runtime depending on what is found to
be attached.  tty_slaves are configure at boot time depending what is
declared to be attached in device-tree.

line disciplines are a lot like device drivers, but aren't implemented that
way for sound historical reasons.  I think it would be nice if they were, b=
ut
they aren't.
tty_slaves really need to be devices with device drivers so that they can
utilise information from devicetree.

line disciplines do not and cannot know about any hardware other than the
standard UART.  tty_slaves exist so that they can know about regulators and
GPIOs and anything else that might combine with the UART to control a
particular device.

So tty_slaves are really specifically for devices which present a tty, but
have more hardware controls than just a UART.  Anything that doesn't have
more hardware controls is probably best handled from user-space or in a line
discipline.

And if there are more hardware controls, then it is sure to be permanently
attached.

Does that make sense?  Does it allay your concerns?

Thanks,
NeilBrown

--Sig_/g/wF3FVl=R3/xtTy8KrNT3T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVRnrbjnsnt1WYoG5AQLX3g//RzozEQbezwj3ZsXMSVhmRgNCuL0EqFOn
QxaRthsVDDGLYiqR1L/kV16mn8zQZJ7waMRUSSpPgycIKVhTHMLcsiU5nUVHuOo/
BpFt67Gvle9gBdKrrIvQAC7DxbOLlFRK5wWCqp4KX0bBFYyxSKN+W+8D5qSX6+Qz
8OUI09yZoQ/EDUxmxOiWHhADXjMChUZI4LkVlFWmVPNrjVroZ7yJZMfm4bqHfB9R
DCRn4cwN2itd4Vq73RPMq6ftIZ/lKuEvRRwafIoc4VtLkMdHYjHDCZm79CgTTHXU
9kiPOCv7mfMMxe16sK4cQzJnIHOXly7ly/jS9LWrcMRTc7H9/y+D21equmpqZqGt
A/EBbkpSB39WsDMdjaJJSUHsEPuhIVQB/kDXL5Lf6QjN/gp9kWDOm0lfdy/NTSCj
bsViHB/lERkmtKaGxLoDvNRBTFDIDZs4JmExpL4uDBVnc9kcsoiRBss1AYlLnEi1
fsNkOCgROMKp8jBq2/93FOYyC723lLr5TJrjUZLRwQgCOlXRCMimBB2Va0KYlTWl
eq2UhLUAye/aTZNTR3YPwzS5eAb1IN0SBrz2yH5yeHPeKVvxKVqQuLVpPwynLr+m
1ft3KdyNq2vA1w6jygqEC8PaNjsO2pdRdi+N1ymCW+/GYkfsT/X2ITlbpcT20+h6
ovZMg+D7VCU=
=X030
-----END PGP SIGNATURE-----

--Sig_/g/wF3FVl=R3/xtTy8KrNT3T--
