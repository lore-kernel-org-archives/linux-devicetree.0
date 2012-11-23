From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 6/7] usb: chipidea: usbmisc: add mx53 support
Date: Fri, 23 Nov 2012 11:02:13 +0100
Message-ID: <50AF49A5.6030708@pengutronix.de>
References: <1353506793-8354-1-git-send-email-m.grzeschik@pengutronix.de> <1353506793-8354-7-git-send-email-m.grzeschik@pengutronix.de> <20121123065340.GD22420@nchen-desktop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig8BDE0C1F2E77B6031F1AB7EE"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121123065340.GD22420@nchen-desktop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig8BDE0C1F2E77B6031F1AB7EE
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11/23/2012 07:53 AM, Peter Chen wrote:
> On Wed, Nov 21, 2012 at 03:06:32PM +0100, Michael Grzeschik wrote:
>> This adds mx53 as the next user of the usbmisc driver and makes it
>> possible to disable the overcurrent-detection of the internal phy.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>> Changes since v2:
>> * added defines for register offsets and bitmasks
>> * fixed disable_oc option for all ports
>>
>>  drivers/usb/chipidea/usbmisc_imx.c |   51 +++++++++++++++++++++++++++=
+++++++++
>>  1 file changed, 51 insertions(+)
>>
>> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea=
/usbmisc_imx.c
>> index e090e0f..b1811df 100644
>> --- a/drivers/usb/chipidea/usbmisc_imx.c
>> +++ b/drivers/usb/chipidea/usbmisc_imx.c
>> @@ -19,6 +19,13 @@
>> =20
>>  #define USB_DEV_MAX 4
>> =20
>> +#define MX53_USB_OTG_PHY_CTRL_0_OFFSET	0x08;
>> +#define MX53_USB_UH2_CTRL_OFFSET	0x14;
>> +#define MX53_USB_UH3_CTRL_OFFSET	0x18;
>> +#define MX53_BM_OVER_CUR_DIS_H1		BIT(5)
>> +#define MX53_BM_OVER_CUR_DIS_OTG	BIT(8)
>> +#define MX53_BM_OVER_CUR_DIS_UHx	BIT(30)
>> +
>>  #define MX6_BM_OVER_CUR_DIS		BIT(7)
>=20
> As every SoC platform's non-core register mapping is different,
> it is better to use .h to put register bit definition

AFAIK in the kernel we don't make extra .h files any more, if there is
only a single user of the contents.

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig8BDE0C1F2E77B6031F1AB7EE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with undefined - http://www.enigmail.net/

iEYEARECAAYFAlCvSaUACgkQjTAFq1RaXHOGBgCgl8GzdMwdFfHwtV5TTSGNfP4V
Ob4Aniund2GlL/vKOxSHa5NuJQ+oODTB
=wpOX
-----END PGP SIGNATURE-----

--------------enig8BDE0C1F2E77B6031F1AB7EE--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
