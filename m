From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v4 16/17] usb: phy-mxs: fix the problem by only using
 1st controller's register
Date: Tue, 03 Dec 2013 09:34:09 +0100
Message-ID: <529D9781.1080209@pengutronix.de>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com> <1386056231-17258-17-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="uEdrAdKAU6FTIjg0Bdia0GTJBNdVBANkq"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386056231-17258-17-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uEdrAdKAU6FTIjg0Bdia0GTJBNdVBANkq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/03/2013 08:37 AM, Peter Chen wrote:
> We fix the problem that we only use the 1st controller's related
> registers at mxs_phy_disconnect_line, but in fact, it needs to
> access registers according to different PHYs.

Are you fixing the code that has been added in this series before? If
so, please squash into the patch. Don't add the broken code in the first
place.

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--uEdrAdKAU6FTIjg0Bdia0GTJBNdVBANkq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlKdl4EACgkQjTAFq1RaXHOaqQCcCMhUX+j3j+PkOf53wXyQx51b
VSkAn1hRKcbfWpGwy1lrOFMcCe64IPz/
=Vwab
-----END PGP SIGNATURE-----

--uEdrAdKAU6FTIjg0Bdia0GTJBNdVBANkq--
