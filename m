From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Revert "ARM: dts: rockchip: set PWM delay backlight
 settings for Minnie"
Date: Tue, 18 Jun 2019 14:02:21 +0200
Message-ID: <20190618120221.GA20524@amd>
References: <20190614224533.169881-1-mka@chromium.org>
 <20190616154143.GA28583@atrey.karlin.mff.cuni.cz>
 <20190617161625.GR137143@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190617161625.GR137143@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-06-17 09:16:25, Matthias Kaehlcke wrote:
> Hi Pavel,
>=20
> On Sun, Jun 16, 2019 at 05:41:43PM +0200, Pavel Machek wrote:
> > Hi!
> >=20
> > > This reverts commit 288ceb85b505c19abe1895df068dda5ed20cf482.
> > >=20
> > > According to the commit message the AUO B101EAN01 panel on minnie
> > > requires a PWM delay of 200 ms, however this is not what the
> > > datasheet says. The datasheet mentions a *max* delay of 200 ms
> > > for T2 ("delay from LCDVDD to black video generation") and T3
> > > ("delay from LCDVDD to HPD high"), which aren't related to the
> > > PWM. The backlight power sequence does not specify min/max
> > > constraints for T15 (time from PWM on to BL enable) or T16
> > > (time from BL disable to PWM off).
> > >=20
> > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > ---
> > > Enric, if you think I misinterpreted the datasheet please holler!
> >=20
> > Was this tested?
>=20
> I performed limited manually testing.
>=20
> minnie ships with the Chrome OS 3.14 downstream, which doesn't include
> this delay, to my knowledge there are no open display related bugs for
> minnie. One could argue that a the configuration without the delay was
> widely field tested
>=20
> > Does patch being reverted actually break anything?
>=20
> To my knowledge it doesn't really break anything, however there is a
> short user perceptible delay between switching on the LCD and
> switching on the backlight. It's not the end of the world, but if it's
> not actually needed better avoid it.
>=20
> > If so, cc stable?
>=20
> I guess this is an edge case, were you could go either way. I'm fine
> with respinning and cc-ing stable.

Ok, if it is just a small delay, stable probably does not need to be
involved.

Thanks,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0I0s0ACgkQMOfwapXb+vIDhwCgoXg7BeLdOOaZditUE387gqIo
RsQAn0zNp/RpUuk4d69n9e90MTNfL8OK
=uTEM
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
