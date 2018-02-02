From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/2] ARM: dts: sunxi: Switch MMC nodes away from
 cd-inverted property
Date: Fri, 2 Feb 2018 09:54:42 +0100
Message-ID: <20180202085442.adhkkuymltlw5r2t@flea.lan>
References: <20171222205738.2389-1-tuomas@tuxera.com>
 <20180104150352.rsvtvviafxyuq2jp@flea.lan>
 <1517498160.5907.6.camel@tuxera.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1900563601167591728=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1517498160.5907.6.camel@tuxera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tuomas Tynkkynen <tuomas@tuxera.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1900563601167591728==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4ie6hh7ht4rytupz"
Content-Disposition: inline


--4ie6hh7ht4rytupz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 01, 2018 at 05:16:00PM +0200, Tuomas Tynkkynen wrote:
> Hi Maxime,
>=20
> On Thu, 2018-01-04 at 16:03 +0100, Maxime Ripard wrote:
> > On Fri, Dec 22, 2017 at 10:57:37PM +0200, Tuomas Tynkkynen wrote:
> > > Using the cd-inverted property is not useful when GPIOs are used as
> > > card
> > > detects since the polarity can be specified with the usual
> > > GPIO_ACTIVE_(HIGH|LOW) GPIO flags. It has also caused confusion for
> > > U-Boot developers, so migrate all sunxi boards away from cd-
> > > inverted.
> > >=20
> > > Signed-off-by: Tuomas Tynkkynen <tuomas@tuxera.com>
> >=20
> > Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> I was assuming these patches will go in through the sunxi tree but I
> don't see them applied anywhere, have these patches fallen through the
> cracks perhaps?

It did, sorry.

I queued both for 4.17, thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--4ie6hh7ht4rytupz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlp0J1EACgkQ0rTAlCFN
r3TM1A//WYQTN8N1saUweWaY3gyKhhvhRAFpcgJJp4k2yl2BHC68vpdr9/53bu6v
+Ipk2Zmhn2hMu5cz45KzDrfEltqX10XTnL95Z6/MmiWgMsGy+nyEe/K+IzohLQKh
flDE2NsKgcx/xBwlL7G8+DlJyPpdi2lP9ucEtYWFLyGKeYg2hAvwglz0vlfFo7cV
vFa46JHZU5RGQhnwSUj9/+96M+UFxbL+dVWnRJmbmdFzm61wO5miqTMHcBf0EVgW
8ezfv1SLSIwwpPX6P5fU9cMe1OI7d90FRYwt5C19YhHHWUcYyiv5Rp29cufQphV/
W4Yy+jdmaVWQdU2aumk0qt5CN5I/G8MxO97FGRJaYHlajqiEzbLdc27AgBJ9DpnH
79gvHfbzy99rf5vG94zBcz6jqu1VPH1mpSPAUnwUppeRNLeeSvDUTH+NpBqY5hvt
x0J6/AubSkRWRgu1qo1TEznNVfTFnGfgf7m583H6YkBkXG4XBpEoRszq7kBy5KIM
ab/JFccvIKBxlNhrYipidae798ehm2+7Avcdaaz0nclTTPJLo08RTRRdmSIDlY2Q
A+5BeXSKFyRnscA7MAtfrdLdLjWr4U0udJXMygvS4/Pwf4Cghe5HU0f0rC9Bnoq3
sEXP6By0CQqNUU/0ncle1IR9jFUliYaE0LZZ8DZzp1a2GQwu4gI=
=6gfh
-----END PGP SIGNATURE-----

--4ie6hh7ht4rytupz--


--===============1900563601167591728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1900563601167591728==--
