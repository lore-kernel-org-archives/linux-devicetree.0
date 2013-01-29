From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH, RFC] usb: add devicetree helpers for determining dr_mode
 and phy_type
Date: Tue, 29 Jan 2013 18:16:02 +0100
Message-ID: <510803D2.4080603@pengutronix.de>
References: <1359458548-25071-1-git-send-email-s.hauer@pengutronix.de> <510802C3.7090803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2CLSWHDDJTSSBDQKFDLWF"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <510802C3.7090803-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2CLSWHDDJTSSBDQKFDLWF
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 01/29/2013 06:11 PM, Stephen Warren wrote:
> On 01/29/2013 04:22 AM, Sascha Hauer wrote:
>> From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>
>> This adds two little devicetree helper functions for determining the
>> dr_mode (host, peripheral, otg) and phy_type (utmi, ulpi,...) from
>> the devicetree.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>>
>> The properties and their values have been taken from the fsl-mph-dr dr=
iver.
>> This binding is also documented (though currently not used) for the te=
gra
>> ehci driver (Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci=
=2Etxt).
>> This is a first attempt to parse these bindings at a common place so t=
hat
>> others can make use of it.
>>
>> Basically I want to know whether this binding is recommended for new d=
rivers
>> since normally the devicetree uses '-' instead of '_', and maybe there=
 are
>> other problems with it.
>=20
> It's certainly typical to use - not _ for freshly defined properties.
> However, since this property already exists and is in-use, I don't thin=
k
> there's any choice but to maintain its current definition.
>=20
> The code looked fine to me.

The code for phy_type is lifted from the ethernet guys and adopted to
the usb phy types.

"dr_mode" is, as Sascha pointed out, only used in
drivers/usb/host/fsl-mph-dr-of.c

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


------enig2CLSWHDDJTSSBDQKFDLWF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlEIA9wACgkQjTAFq1RaXHP3FQCfexnz7mX1WNtwYWmfHHkqu8OK
e/kAnjXXvNhlNit+MQjqGujErDOtqU6O
=hxEw
-----END PGP SIGNATURE-----

------enig2CLSWHDDJTSSBDQKFDLWF--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
