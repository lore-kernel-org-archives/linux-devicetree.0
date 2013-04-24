From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH -next v3] gpu: host1x: gr2d: fix error return code in
 gr2d_submit()
Date: Wed, 24 Apr 2013 09:41:58 +0200
Message-ID: <20130424074158.GB2833@avionic-0098.mockup.avionic-design.de>
References: <CAPgLHd8cEvvxnRYK3H6FbykXsiyHRWFxV2LtSyayzp2gNejhFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPgLHd8cEvvxnRYK3H6FbykXsiyHRWFxV2LtSyayzp2gNejhFw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, tbergstrom@nvidia.com, amerilainen@nvidia.com, yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2013 at 02:50:51PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> Fix to return -ENOENT in the host1x_bo lookup error handling
> case instead of 0, as done elsewhere in this function.
>=20
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

I've applied this to my fixes branch with the same modifications as for
the other patch.

Thanks,
Thierry

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRd4zGAAoJEN0jrNd/PrOhiOwQAKTXH6i7p1rOqZoYUcuYKVaO
swvU9nyttTRn70UGLcYKSd5TtYYDIjjMYBjTfaO6d/O04Uss0DPAS2cD+mhjNgcf
YNHZTGTtTLuzAJA7sSu/xPEXuWtNh+z0EbZcdbmSfAHYihhOvSjhdNkXjEPsDNuP
Q2TI9wI5SCRKtS82egpYtesCBeIMq04enuXNw59TRUIMDvpRqRJ46oGnjsXY0YeV
NFstSKwYTCszle+DHsK5wy6APpvyGO8X/X3IdYSznOQDZ1yD6AiVqOFB87EeMiFl
cel72CSaRw17pspSMUsnwcOHLvO/muKW5Ad2Qci+Jx5ILjSqV/UuGhXxmD6014bu
7riBxYH6A0t06jnjDFqZAaCoUuiQ9FHqpQc550DY7PdFYYm/hMtnTrpXfjjZ0yIk
8A/va1gVB0dT9m21TAbmOPWaEnEuY6tAnUARbVULbqHrbnKzC0cSNlxSoJxQhjwq
ZOcgAhahNufaq7S6ofGD3kA9NlyRCUBD8JQhiq36hf4TluhUKtAYJnlKyUnQZGH5
gSx2bEcLGHkBi4u+qEjPot7oq9qwJBBzQ8fkIiVExhiEQIb3ND3GwCIsxci/VIHi
kOfpaZpMMHGelxKHd1CO8/nE0FfrCfjURoX3Fguv28Pxtfu/Jh7tBFN29C0r0Top
uwdkaRKia3MLTSGTUrG0
=tkHf
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
