From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 3/7] usb: chipidea: usbmisc: fix a potential race condition
Date: Fri, 23 Nov 2012 11:00:21 +0100
Message-ID: <50AF4935.4000707@pengutronix.de>
References: <1353506793-8354-1-git-send-email-m.grzeschik@pengutronix.de> <1353506793-8354-4-git-send-email-m.grzeschik@pengutronix.de> <20121123053635.GB22420@nchen-desktop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig702F4C0D02A5AC94506B97D5"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121123053635.GB22420@nchen-desktop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig702F4C0D02A5AC94506B97D5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11/23/2012 06:36 AM, Peter Chen wrote:
> On Wed, Nov 21, 2012 at 03:06:29PM +0100, Michael Grzeschik wrote:
>> From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>
>> This fixes a potential race condition where the ci13xxx_imx glue code
>> could be fast enough to call one of the usbmisc_ops before he got a
>> valid value on the static usbmisc pointer. To fix that we first set
>> usbmisc, then call usbmisc_set_ops().
>=20
> usbmisc is subsys_initcall, and cil13xxx_imx is module_init. Any
> potential situation that the ci13xxx_imx's probe is ran before the
> usbmisc's probe is completed? Besides, there is usbmisc_ops value
> check at the beginning of cil13xxx_imx's probe.

It's bad practice to rely your code on some external ordering mechanism,
even more if the correct solution is so simple. And as Sascha pointed
out everything might be build as modules and loaded individually.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig702F4C0D02A5AC94506B97D5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with undefined - http://www.enigmail.net/

iEYEARECAAYFAlCvSTUACgkQjTAFq1RaXHMSdgCggmZuLyxeWkcrSdzB/1agS5BC
AcMAn3457oTuq8RfaokKbWvTR1NqDfci
=1kVD
-----END PGP SIGNATURE-----

--------------enig702F4C0D02A5AC94506B97D5--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
