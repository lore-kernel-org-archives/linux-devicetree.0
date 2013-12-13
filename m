From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v6 14/15] usb: phy-mxs: Add system suspend/resume API
Date: Thu, 12 Dec 2013 22:38:38 -0600
Message-ID: <20131213043838.GI867@saruman.home>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-15-git-send-email-peter.chen@freescale.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v2/QI0iRXglpx0hK"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386897825-6130-15-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--v2/QI0iRXglpx0hK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 09:23:44AM +0800, Peter Chen wrote:
> +SIMPLE_DEV_PM_OPS(mxs_phy_pm, mxs_phy_system_suspend, mxs_phy_system_res=
ume);

should be static.

--=20
balbi

--v2/QI0iRXglpx0hK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSqo9OAAoJEIaOsuA1yqRE27wQALBI8Z12ixqbj5A6WDL/vP7I
hbFQxo4lU2RBgMyk0Z35xW/aS0WLal6lCcR4OaQmFCbvreNk9dCkF7ye1ondCeul
4G9sve6KhFFy0dwjPG/VTDThFV9aGEjqY9ZNPqPpeQRFmQ6xdrHFbojqXnMHEPkd
T6EPSRd+1grI+MxbmJgOb+Q4OmSl6L8xawDyimr55RFozJcHwbzNu99qpStDAme9
lWabXFbbSpjv10fvkk9UaTF3ZkvVTtUGve/MC1LjOT2j3JicPP4mZYOlE+dnvOjm
ccC4yF01KW/6IwveHt3GRVTWGXKc6dzxHZ6hmTtsaGHcgABQ4gg1ZS1uy5a3IVWI
RGrjpW+8PmhM/Ou9VbAqT6cYBPiYmW5JOVqG+ua9lBoZSjnoNIs6HYNRVk6i/5V0
tz3y2dbTtYCilgVQjSl6bv8taDqCAzDAcbzxf2GJ+xjSpH5gApcF/+bJfPdDwb7N
ciH/CmTJp9PNXEqAkbU2C3CgPcdZJAITUDhMi/HMCCc5XQR4nkXvrTyNMd+XsBVr
fkn7CKmS1v0zHCrrtqIStukMSXX8XHZxuagtB6qwYrJGRutd9RpMve/mRvwyIGHx
SiuUZxJDMYf9d84/eS3QFk/AcaUA8neaKAFiN8wh53ENiYMM2FbHsfvY9kj2ZKVV
h6VLh6SSi95DN0VBQeBV
=MgWJ
-----END PGP SIGNATURE-----

--v2/QI0iRXglpx0hK--
