From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Add num-cs for A20 spi nodes
Date: Thu, 1 Dec 2016 10:21:50 +0100
Message-ID: <20161201092150.rlo5skxd6elovlgq@lukather>
References: <20161122170616.29557-1-manu@bidouilliste.com>
 <20161124195517.qrq7briu3pwjnp4n@lukather>
 <20161124210509.be743aae84c26c6c2e666c6e@bidouilliste.com>
 <20161125152047.oadxi2xbgm4kdd7q@lukather>
 <20161125220752.c989c85e01ed202be0485c78@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3x2sjuqj3u62trdt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161125220752.c989c85e01ed202be0485c78@bidouilliste.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--3x2sjuqj3u62trdt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Emmanuel,

On Fri, Nov 25, 2016 at 10:07:52PM +0100, Emmanuel Vadot wrote:
> On Fri, 25 Nov 2016 16:20:47 +0100
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > On Thu, Nov 24, 2016 at 09:05:09PM +0100, Emmanuel Vadot wrote:
> > > On Thu, 24 Nov 2016 20:55:17 +0100
> > > Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
> > >=20
> > > > On Tue, Nov 22, 2016 at 06:06:16PM +0100, Emmanuel Vadot wrote:
> > > > > The spi0 controller on the A20 have up to 4 CS (Chip Select) whil=
e the
> > > > > others three only have 1.
> > > > > Add the num-cs property to each node.
> > > > >=20
> > > > > Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>
> > > >=20
> > > > I don't think we have any code that uses it at the moment. What is =
the
> > > > rationale behind this patch?
> > > >=20
> > > > Thanks!
> > > > Maxime
> > > >=20
> > > > --=20
> > > > Maxime Ripard, Free Electrons
> > > > Embedded Linux and Kernel engineering
> > > > http://free-electrons.com
> > >=20
> > >  Hi Maxime,
> > >=20
> > >  If num-cs isn't present nothing prevent to start a transfer with a
> > > non-valid CS pin, resulting in an error.
> > >  num-cs are default property especially made for this and a SPI driver
> > > should try to get the property at probe/attach time.
> >=20
> > Yes, but as far as I know, our driver doesn't. I'm all in for having
> > support for that in our driver, but without it, that patch is kind of
> > useless.
>=20
>  Yes the Linux driver doesn't use it but my upcoming one for FreeBSD
> uses it. So it is not useless for downstream user of DTS.

Ah, I didn't know this was for FreeBSD. So you started to use our DTs,
or do you have some modifications to it? How does that work?

Anyway, the fact that it isn't used by our driver at the moment and
that it's meant for other OSes should be mentionned in the commit log.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3x2sjuqj3u62trdt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYP+uqAAoJEBx+YmzsjxAgVBkP/0YNqIQtgrXBSoaXAjJij8BC
VJ4q6yvwNdD8W7Otv8UM7FgYmoI3uUWrJkcK1m8IvQmkWdPMLPWaZVvIojFauaWI
4+FRTT5zeCEHXUvDP7RFcmNmDIDqmrOo+X3LR5QcqUaVgx+xqBfv077SCBabLX2Z
9IOxzT8CgptN6Zxnn/zc+MG2RGaodiUiHen37CBdnGDMSdSA5DQba5JiaIUAKShG
lLAWmmg1//iv2zVB/q4Pq8Z5LcZT8fm7dvkniVMTG92VCgX6L1jSYLYL2YrbzT/k
ZIGauNC81Lj7WzeegHSdqDTAqf+OOdweQnUL/+xmOivmC70GqRUkJ8sUgGB6s99p
zxQog8QzQ3FE2wexDOvO27vfSbq3CCCANlw0Hn+Wo8ZFGCj0hj9q6YpHySJC34rE
M8AB2MVARQuH3fHR0DrVLA3sVIDPQSLlaYIAasMyTEypVOvXmTn0b6KhDYy4OA8F
5pLZl9xUgbDhrIo2iLhfGXGkGAjnYxI8gbSI8xQBkg2akj5o530x8uswl614r4DU
F2t9Tjq6EuUi9SM0G/Gro0Pj0efToDjWSRiSyQnpdqs62R59CUmjUSeCwciBLQz7
ySJidbvPYmnE5ZY3v0rDeLW3hsj5KY1ue0qV80szUpH3oJtAITTPQttDUvNgsX6S
M7jxlBD7PWgATol5B+1z
=V8Xl
-----END PGP SIGNATURE-----

--3x2sjuqj3u62trdt--
