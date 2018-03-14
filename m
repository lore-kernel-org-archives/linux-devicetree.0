From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] ARM: dts: sun8i-h3: Add Mali node
Date: Wed, 14 Mar 2018 09:05:00 +0100
Message-ID: <20180314080500.whywwskhp5546z7m@flea>
References: <1520936205-64723-1-git-send-email-giulio.benetti@micronovasrl.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1075062483=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1520936205-64723-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Giulio Benetti <giulio.benetti@micronovasrl.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1075062483==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="onoirhpiat4gjlaw"
Content-Disposition: inline


--onoirhpiat4gjlaw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 13, 2018 at 11:16:45AM +0100, Giulio Benetti wrote:
> The H3 has an ARM Mali 400 GPU, so add binding to our DT.
>=20
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

How was this tested?

Is there any specific reason not to share it with the H5?

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--onoirhpiat4gjlaw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqo16sACgkQ0rTAlCFN
r3S3qw/8CqCvzPe4kv7TsV4um+x3CapVmF148spt8zkl0NP+jKoaP9t/9W1WMyPn
mJwlM/lTD2MmQHBfloWPVpAkZN3Inen2Hx73s/G+vPI9I3VmbrgicMbcMRQObRbT
KCgBCzDv79lAxrikOBkpxwH5C1T63XxTzqmL9rwBwIR40iVTzjIFmNyQDFtu2svW
vuIvTWygR3xy5qrl+kaEtnUaX4q9uV3fEUzjy2crOE89yXwRnSreguV0PJ1XYBwe
X/XJoeK706foFqnRg6xhd9ssNsLK674ZFwVfmqRbeo0AF/PUYwx/0S3nHZnrReuR
oJvr5n/TnQ4QFfF16eHu+wOpvbvGc8c34bnXtrsUCOQcCJ4SVARKUj11iqxE1guR
yL6YwgPF7kkP0I9sHP3QdgonBp7zsRJMHtsfBvjOEd7O4giZQ19em+VrFFQvm/Pd
rRAEaZklhfmSreFVFl9YJUr2ny+iFq4jGkWh5oMFTKwbq2v55fXivoCbeaMH02XS
wohYYjlKUCvxSNJB7uOrUleisR6LYL4gsxNy64az++gHg/3Lxvbh8qFGHxxyfO7u
I7PxYcu5fXYSXDq5EMEJNiYigsfeiNvCFKVMhZdiXbcZlA4GaEVE0F5kjaoZ84wq
fDavQEqhsy83rWhkhM02TyVU7FPqksas314qbczkTzX1ENWK12U=
=RlC2
-----END PGP SIGNATURE-----

--onoirhpiat4gjlaw--

--===============1075062483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1075062483==--
