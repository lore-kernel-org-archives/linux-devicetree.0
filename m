From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 4/9] usb: chipidea: ci13xxx-imx: add "dr_mode" property
 to device tree bindings
Date: Fri, 16 Nov 2012 12:55:13 +0100
Message-ID: <50A629A1.1010202@pengutronix.de>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de> <1352909950-32555-5-git-send-email-m.grzeschik@pengutronix.de> <878va17oii.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigD4E48E5856DDB30B9D1C7CC4"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <878va17oii.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigD4E48E5856DDB30B9D1C7CC4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11/16/2012 12:53 PM, Alexander Shishkin wrote:
> Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>=20
>> From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>
>> Its necessary to limit a hostonly soc to its single role, since
>> debugging has shown that reading on the "CAP_DCCPARAMS" register insid=
e
>> a host-only port, what ci_hdrc_gadget_init does, can lead to an
>> instable behaviour of the IC.
>=20
> Probably typos: should be "it's" and "unstable".
>=20
> [snip]
>=20
>> --- a/drivers/usb/chipidea/ci13xxx_imx.c
>> +++ b/drivers/usb/chipidea/ci13xxx_imx.c
>> @@ -237,6 +237,8 @@ static int __devinit ci13xxx_imx_probe(struct plat=
form_device *pdev)
>>  		}
>>  	}
>> =20
>> +	ci13xxx_get_dr_mode(pdev->dev.of_node, pdata);
>> +
>>  	plat_ci =3D ci13xxx_add_device(&pdev->dev,
>>  				pdev->resource, pdev->num_resources,
>>  				pdata);
>> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c=

>> index b50b77a..3e3e159 100644
>> --- a/drivers/usb/chipidea/core.c
>> +++ b/drivers/usb/chipidea/core.c
>> @@ -63,6 +63,7 @@
>>  #include <linux/kernel.h>
>>  #include <linux/slab.h>
>>  #include <linux/pm_runtime.h>
>> +#include <linux/of_platform.h>
>>  #include <linux/usb/ch9.h>
>>  #include <linux/usb/gadget.h>
>>  #include <linux/usb/otg.h>
>> @@ -521,6 +522,23 @@ void ci13xxx_remove_device(struct platform_device=
 *pdev)
>>  }
>>  EXPORT_SYMBOL_GPL(ci13xxx_remove_device);
>> =20
>> +void ci13xxx_get_dr_mode(struct device_node *of_node, struct ci13xxx_=
platform_data *pdata)
>> +{
>> +	const unsigned char *dr_mode;
>> +
>> +	dr_mode =3D of_get_property(of_node, "dr_mode", NULL);
>> +	if (!dr_mode)
>> +		return;
>> +
>> +	if (!strcmp(dr_mode, "host"))
>> +		pdata->flags |=3D CI13XXX_DR_MODE_HOST;
>> +	else if (!strcmp(dr_mode, "peripheral"))
>> +		pdata->flags |=3D CI13XXX_DR_MODE_PERIPHERAL;
>> +	else if (!strcmp(dr_mode, "otg"))
>> +		pdata->flags |=3D CI13XXX_DR_MODE_HOST | CI13XXX_DR_MODE_PERIPHERAL=
;
>> +}
>> +EXPORT_SYMBOL_GPL(ci13xxx_get_dr_mode);
>> +
>=20
> I'd prefer this function to live in ci13xxx_imx, since that's where it'=
s
> used and it doesn't really need anything from core.c anyway. Or maybe i=
t
> would make sense to make it even more generic (for other devitetree
> users), since you're saying that other drivers are using this already.

+1

Move it next to the phy-mode and make it work the same way (i.e. return
an enum).

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enigD4E48E5856DDB30B9D1C7CC4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iEYEARECAAYFAlCmKaQACgkQjTAFq1RaXHOYhACfVHlD83zE6ibRVt5ZYfbcRNb2
mjgAn3BpXFyoJOvOxuZX1g7wgHKS33U6
=84RH
-----END PGP SIGNATURE-----

--------------enigD4E48E5856DDB30B9D1C7CC4--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
