From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v6 06/15] usb: phy-mxs: Add anatop regmap
Date: Thu, 12 Dec 2013 22:26:27 -0600
Message-ID: <20131213042627.GF867@saruman.home>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-7-git-send-email-peter.chen@freescale.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CXFpZVxO6m2Ol4tQ"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386897825-6130-7-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--CXFpZVxO6m2Ol4tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 13, 2013 at 09:23:36AM +0800, Peter Chen wrote:
> @@ -226,6 +235,16 @@ static int mxs_phy_probe(struct platform_device *pde=
v)
> =20
>  	platform_set_drvdata(pdev, mxs_phy);
> =20
> +	if (mxs_phy->data->flags & MXS_PHY_HAS_ANATOP) {

instead of the flag, you can check if that binding exist and use the
binding itself as a flag.

--=20
balbi

--CXFpZVxO6m2Ol4tQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSqoxyAAoJEIaOsuA1yqRE8dcP/1fOw9ogIjqvXw9UY1exgmKD
3yfkuWm8gmZ2sWN1Chz2LFWBS6fUlIqWr6Ug01qRlGWxBIu2IX+q0S/UgmJOQEne
7eQif8SoY1ULOaquuzEjvS549i5fYMLvb7+VqoWaupuWL3SpddHh91w94pw/BqoV
ezLBZdJkhfoeYf3eVgw53/GdG4sR+INccObrpj2UybmKW2bzRJCp9RwD+WOjpqaR
OwuBjXIS18KLFIKgCWuemDuLgDTb0py/5nX/5QjEtqQom8ICCAAfctW01GKWdVdL
496B/+7kEzzwA+Uqq/l/JevmdV5HQnG3TxAW1JdwFIhAWFFIMARbkkgmJgddRXnQ
wvGs9XinOsB2DVP4NRZt4h98C1dpqPqbv/rlMRMPRDRLrV41jQlI1q5JMWgZ866g
qg4bMmPzBkRZsAfURsBVuRx6cxhcIBI6xnIqy157U8M6m9UV2qMokKukBTT40Plq
o1H+O03skejdKkwlR1xTL0wmlH9KrSa12F66MNjnhIvXZHeXKvliUajOi5zknI2q
sz51cVMxIQ5B9M/JjXGdJHxN5u1FrbK3f8O56brCzNSbht0Ue8joY6vT3O1BHXIv
nBzHgX7bbNgKDctIkWgN027TfrcjeujFs9ovM66Pj3ad6urT0kGv/ywZFLV5ANKr
14/9YwPUemHbgHy9/xA1
=Bixr
-----END PGP SIGNATURE-----

--CXFpZVxO6m2Ol4tQ--
