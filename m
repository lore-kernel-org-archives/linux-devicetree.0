From: NeilBrown <neilb@suse.de>
Subject: Re: [Gta04-owner] [PATCH 2/3] TTY: add support for tty_slave
 devices.
Date: Thu, 26 Mar 2015 08:17:29 +1100
Message-ID: <20150326081729.700a7a6e@notabene.brown>
References: <20150318055437.21025.13990.stgit@notabene.brown>
	<20150318055831.21025.85317.stgit@notabene.brown>
	<5512E288.4020703@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/e.=9rr6EAOHBrdwoJN1pMvG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5512E288.4020703@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, GTA04 owners <gta04-owner@goldelico.com>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>
List-Id: devicetree@vger.kernel.org

--Sig_/e.=9rr6EAOHBrdwoJN1pMvG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Mar 2015 12:30:00 -0400 Peter Hurley <peter@hurleysoftware.com>
wrote:

> On 03/18/2015 01:58 AM, NeilBrown wrote:
>=20
> > + * A "tty-slave" is a device permanently attached to a particularly
> > + * tty, typically wired to a UART.
>=20
> Why "permanently"?
> Is that a limitation of the implementation or design?
>=20

The slave is described in devicetree - that only happens for permanently
attached devices, doesn't it?

I guess that with device-tree overlays and 'capes' for boards you could have
a device attached to the uart "for this power session" rather than
"permanently", but I think it is a rather subtle distinction.

Did you have something else in mind?

NeilBrown

--Sig_/e.=9rr6EAOHBrdwoJN1pMvG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVRMl9Dnsnt1WYoG5AQIsQRAAwZ3KInv0Gyai61YQnTg3vxOh99W7ZLuf
/XfEJE5S5AIAazxVSZpVaZn9LOtkB0UcmUs7MgpIgqfwnFewzUFd3sNRkvyk4stO
p84UbPOXehwk6zAyS2hPhsUq+dTNUsmdptD5pqupHYgEs85OaLuHGYQmVy2Q6pML
KXpgnrS1KuSfyNvRfZA9n+MzQ7nhnzr6e5eUpYOWXwqsYtRT1HT0KI7gd34jNpMg
/AxiweeMyPWNW+XgEAaAei35kzLnPKVEt+dR0IHePltAQyO+TFHt1zG48ZpNj6yr
pao5onNo4sChVT2vDEDkaR7A0Utcdl9GMyhLOBfpJmbRDb0QgxA8TQaupaDT8ph/
Ofd8wf3g9CU/Bap5NyECUyc58CEBntVzt0sXK6h7AmbF9/JfgVnSBTwYdhxhOBpw
7k01vz7A6docg727COxhofIvlx2y/gkIl/NcEJ6iNER/O/LNq0eMBdPTal1jS56o
u11n+LJ76yJuA84nJi54TTw+EFwXHrz8HkSSjYiXfPjX8ZFRKRqqxjsQ3ersbcAE
j6Ri7BdRXA7piFU05gVIJBbVt7mKgJGRHUg/Ugs/+fYYxon11+MSnQjWW77BXgLi
Mgv5Ax0H4xXbEFPycq+QWbChQikj317MKwplHDAnhXVwl3kq2+UZYRtzRpUWrR4a
9B/d/t3zMes=
=dgsW
-----END PGP SIGNATURE-----

--Sig_/e.=9rr6EAOHBrdwoJN1pMvG--
