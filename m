From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH,RFC] usb: add devicetree helpers for determining dr_mode
 and phy_type
Date: Tue, 29 Jan 2013 16:05:44 +0100
Message-ID: <5107E548.4080402@pengutronix.de>
References: <1359458548-25071-1-git-send-email-s.hauer@pengutronix.de> <5107D253.5030400@ti.com> <20130129135336.GA3323@pengutronix.de> <5107D84F.80401@ti.com> <20130129143302.GF2046@arwen.pp.htv.fi> <20130129145500.GB3323@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2BSOXXCLHXUWDNUKEMGQI"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130129145500.GB3323-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, kishon <kishon-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2BSOXXCLHXUWDNUKEMGQI
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 01/29/2013 03:55 PM, Wolfram Sang wrote:
>=20
>> I prefer u32 here, because we have the matching enum. Otherwise we end=

>> up with:
>>
>> of_property_read_string(...,&type);
>>
>> if (!strcmp(type, "ulpi"))
>> 	foo();
>> else if (!strcmp(type, "utmi"))
>> 	bar();
>> else if (!strcmp(type, "pipe3"))
>> 	baz();
>> else
>> 	BUG();
>>
>> and I don't like that, it's ugly and error prone.
>=20
> Error prone? I guess my mileage varies. Especially compared to the
> probability devicetree creators pick the wrong number.
>=20
> It also removes the (probably implicit) rule that the enum mustn't be
> modified since it is exported to users.
>=20
> Also, you could map the strings to the enum first and then switch-case
> over it to make the code nicer.

That's what the code already does.

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


------enig2BSOXXCLHXUWDNUKEMGQI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlEH5UgACgkQjTAFq1RaXHO5rgCggTBcyrJBmIoUQNGVI2wJeeHa
W6MAn2DJwDbpHmQ2DWl9s6CFf3m2WDXs
=HG97
-----END PGP SIGNATURE-----

------enig2BSOXXCLHXUWDNUKEMGQI--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
