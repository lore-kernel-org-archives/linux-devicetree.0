From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] pwm: samsung: fix return value check in
 pwm_samsung_probe()
Date: Wed, 26 Jun 2013 11:46:05 +0200
Message-ID: <20130626094604.GA9794@mithrandir>
References: <CAPgLHd8g2ChKSfyGUkFWBB-Z_6At2awyMAMRvA1fTvmCmeea+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4771660832249507468=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPgLHd8g2ChKSfyGUkFWBB-Z_6At2awyMAMRvA1fTvmCmeea+g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============4771660832249507468==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2013 at 06:55:18AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
>=20
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
>=20
> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> ---
>  drivers/pwm/pwm-samsung.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Missed another one of those. Given that this isn't merged yet, would you
mind if Tomasz and/or Kukjin squash it into their patch?

If that's okay with Wei, can you, Tomasz or Kukjin, make sure to credit
Wei properly?

Thierry

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRyrhbAAoJEN0jrNd/PrOhh20QAKRTMDSBaqJchSO6ULyajovh
VldtHT35OZ1ytXCgDjvuekdClQeJ0+KcoRGFpqGru0MS9LbrZN7LgekxzXvGshNG
rKphhKK+Sr2LACTP+SvBDsXImlEXo+dZJd0XakVR8PtnaBjmo5Aquli34Y7mElQV
Q72EWkHygQv4MNJFcyVUBPZfOKNqZnLxZtBB8Z3qf7IKrB0ii6WtRXmmKgksCzPZ
xHJNO/IB8eW7WhFJm8aAUnc5bCWlAA7I9OEUE8bV00xMU+aJNLR7eBuJHYD7Q6+4
Kg7W+5M27g4g3OcvvqjUFV7swwDFaSecFDDu3LrvAQEdlbJ5SZf0YzOPqxXQrfOb
ttLqH0K+BZybiXoiLE1nAYJnM+4A+zmYYfcHzHLRpgtCXx0lBHMrvtNwign6iKS8
WLLB1H4CYoHJEMDaXb+8zV1AsXj+DeTqryY/zL2IhmB/hhg+2Fw1JuqWfoYbQWW+
nGnxBaOC9uIcqmi9JbCSo/XtLFSTjexISky/UaI9WBtS9G5pd5VzBDPjKn/hta40
BkPl9D/TOH3wj60y1BzalxAIUqDUKcRl0LkEF7+rJCNOX4E8i5mjGfcvqO9JC3f3
qbBiQttP3IxZFMMm+JjO0gwl6TlmfbsJ28+LJrej3Uq7EPOBpk5c9Hs9DC77p+HT
NNHBU2kKVi8w5ncMXg3x
=us/M
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--

--===============4771660832249507468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4771660832249507468==--
