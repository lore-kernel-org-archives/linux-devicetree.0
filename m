From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v5 09/15] usb: phy-mxs: Enable IC fixes for related SoCs
Date: Mon, 09 Dec 2013 10:52:33 +0100
Message-ID: <52A592E1.7040506@pengutronix.de>
References: <1386570664-6713-1-git-send-email-peter.chen@freescale.com> <1386570664-6713-10-git-send-email-peter.chen@freescale.com> <52A58179.2050702@pengutronix.de> <20131209090749.GB5291@shlinux1.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="RwSlFax1wsCuTUhx09Oksa6JmabEGp2cc"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131209090749.GB5291@shlinux1.ap.freescale.net>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RwSlFax1wsCuTUhx09Oksa6JmabEGp2cc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/09/2013 10:07 AM, Peter Chen wrote:
> On Mon, Dec 09, 2013 at 09:38:17AM +0100, Marc Kleine-Budde wrote:
>> On 12/09/2013 07:30 AM, Peter Chen wrote:
>>> Some PHY bugs are fixed by IC logic, but these bits are not
>>> enabled by default, so we enable them at driver.
>>
>> Which bugs are fixed by enabling this bit? Is it only suspend related?=

>> Can you document them or better add a pointer to the documentation.
>=20
> I will add more, in fact, it fixes the bug which flag BIT(1) and BIT(2)=

> stands for.
>=20
>>
>> Further I don't like the idea of adding code, or enabling a feature on=

>> certain hardware, that is broken in the first place and fixing it in a=

>> later patch. Think about squashing it into the correct patch.
>=20
> No fixes are related with this patch, you can see there is no "-"
> at this patch.

Yes, there isn't any broken code (thus no "-"), but you first enable a
feature in the hardware and in a later patch (this one) make it work
properly.

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--RwSlFax1wsCuTUhx09Oksa6JmabEGp2cc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlKlkuEACgkQjTAFq1RaXHOnjQCdFUytPXVFQuxaUgxUVWeW/Mqv
HAQAn0iXDgWmmAM11iytjkF8Ya1bI4eD
=YGz9
-----END PGP SIGNATURE-----

--RwSlFax1wsCuTUhx09Oksa6JmabEGp2cc--
