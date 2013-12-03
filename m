From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v4 17/17] usb: phy-mxs: do not set PWD.RXPWD1PT1 for low
 speed connection
Date: Tue, 03 Dec 2013 10:28:44 +0100
Message-ID: <529DA44C.9090702@pengutronix.de>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com> <1386056231-17258-18-git-send-email-peter.chen@freescale.com> <529D9BF7.1080707@pengutronix.de> <F281D0F91ED19E4D8E63A7504E8A649804141031@039-SN2MPN1-021.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="KgXBMnhoBNhDRxgKuj6o9w8lpmJcMsMqV"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <F281D0F91ED19E4D8E63A7504E8A649804141031@039-SN2MPN1-021.039d.mgd.msft.net>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <Peter.Chen@freescale.com>
Cc: "balbi@ti.com" <balbi@ti.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "marex@denx.de" <marex@denx.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>, Frank Li <Frank.Li@freescale.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KgXBMnhoBNhDRxgKuj6o9w8lpmJcMsMqV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/03/2013 10:19 AM, Peter Chen wrote:
>> On 12/03/2013 08:37 AM, Peter Chen wrote:
>>> At very rare cases, the SoF will not send out after resume with
>>> low speed connection. The workaround is do not power down
>>> PWD.RXPWD1PT1 bit during the suspend.
>>
>> Is this also a fix for newly added code? If so please also squash.

> No, it is a workaround for new problem.

If this would be a fix, it's better to put this as first patch into a
series, so that it can be applied to the stable trees easier.

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--KgXBMnhoBNhDRxgKuj6o9w8lpmJcMsMqV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlKdpE0ACgkQjTAFq1RaXHPccQCePPdsKbIKP6thf6h8iatvCM3A
IUcAoIu22q07amWdoLctslkVsuWTAlZn
=074L
-----END PGP SIGNATURE-----

--KgXBMnhoBNhDRxgKuj6o9w8lpmJcMsMqV--
