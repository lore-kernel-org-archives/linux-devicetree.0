From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sunxi: sun6i-a31s-primo81.dts: add touchscreen
 axis swapping property
Date: Wed, 28 Oct 2015 07:20:38 +0100
Message-ID: <20151028062038.GF6114@lukather>
References: <20151024205716.GA16644@excalibur.cnev.de>
 <1445720851-2148-1-git-send-email-merker@debian.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1445720851-2148-1-git-send-email-merker@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Karsten Merker <merker@debian.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>, Siarhei Siamashka <siarhei.siamashka@gmail.com>
List-Id: devicetree@vger.kernel.org


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 24, 2015 at 11:07:31PM +0200, Karsten Merker wrote:
> The MSI Primo81 has a display in portrait mode but a touchscreen
> in landscape mode.  To have both of them use the same coordinate
> system, the touchscreen-swapped-x-y property has to be set
> for the touchscreen.
>=20
> Signed-off-by: Karsten Merker <merker@debian.org>

Queued as a fix for 4.4.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWMGk2AAoJEBx+YmzsjxAgkQAP/3iKQn5PUfeirTeJl6FOrVYb
aLxoXVi+gsQYPYsu6yecQh14Qfgg5fPja3AvZRPs8lm2s5A/54t1WiKWz8XNXTS7
a2RhcaDpKm7BOnUtqF9/FDA7SrC8zF448v92Gmcskfrfex+W7p8whuAT0IKILQZ7
+0p01KAeORg/uC04N+nFDzxE/+YaQKEv9k5oxyFJ6eNqhWsFEKOOWghQVWL5MTeM
Xcor1I9n9B9TXzAoQEm/pQA+esd2F+mV8RuMeHLnIKNGZqvWHcpbFN658uqp2riz
vauTSCVSqcf5Hck5R4wBmc5S8y140uDL7bXIjPfyHnR3gSafgmyPOn5rrQyeTA58
7ptg+nBC6GMxuxXU3gcrFsNhrSpH00LvYsbMHcv76zy6PRTwfiD75y+3PDhxnTbh
0SHHbf779tLOkNTOjjvfd8O40VQiDIQ3WNDoZEy2tlKN57PO5eYXvSSswvB+Hbt7
x6G/RkxbYRwngy2zwleqJ4wbMx07zaYvSZCA2zue+b883lDXPUwWYyTJX4D+aTTx
AhsHALesunMreYXjRuzWHSLitDG6KOzbofmislzL4dIhdFiPwyjqJNMpfkAgixeS
kUMOvtfh849JNkaO1/wHTc3NvBmPnZqUP7NCyYm7xmkZ2hW9II+hDQ38/Sw/pZy7
rWNUK5Seg6NiLd5eRaBt
=+sGV
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--
