From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v5 15/15] usb: phy-mxs: Add sync time after controller
 clear phcd
Date: Mon, 09 Dec 2013 11:00:39 +0100
Message-ID: <52A594C7.2000007@pengutronix.de>
References: <1386570664-6713-1-git-send-email-peter.chen@freescale.com> <1386570664-6713-16-git-send-email-peter.chen@freescale.com> <52A587CD.7010203@pengutronix.de> <20131209091951.GD5291@shlinux1.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="bbVhgT820CTgHBPKmrWqCVMewPCX3IXQt"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131209091951.GD5291@shlinux1.ap.freescale.net>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bbVhgT820CTgHBPKmrWqCVMewPCX3IXQt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/09/2013 10:19 AM, Peter Chen wrote:
> On Mon, Dec 09, 2013 at 10:05:17AM +0100, Marc Kleine-Budde wrote:
>> On 12/09/2013 07:31 AM, Peter Chen wrote:
>>> After clear portsc.phcd, PHY needs 200us stable time for switch
>>> 32K clock to AHB clock.
>>
>> If this is a general bugbix, please move it to the start of this serie=
s
>> and add stable on Cc. I think I hit the bug on the second USB port of =
a
>> custom MX28 board, the stmp_reset_block() in the USB phy will fail.
>=20
> Not a bug-fix, just the requirement for the PHY leaves low power mode.
> Does the bug exists with my this patchset, or just current mainline cod=
e?

I see, I found this strange thing on v3.8, but can try on v3.13-rc3.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--bbVhgT820CTgHBPKmrWqCVMewPCX3IXQt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlKllMcACgkQjTAFq1RaXHP7mQCdE8woG7fgTQad1TqFMxICUQ9j
CgAAnidX3ICoOcuF1+WJez0f/2LaJjPI
=nks9
-----END PGP SIGNATURE-----

--bbVhgT820CTgHBPKmrWqCVMewPCX3IXQt--
