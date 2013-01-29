From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH,RFC] usb: add devicetree helpers for determining
 dr_mode and phy_type
Date: Tue, 29 Jan 2013 14:53:36 +0100
Message-ID: <20130129135336.GA3323@pengutronix.de>
References: <1359458548-25071-1-git-send-email-s.hauer@pengutronix.de>
 <5107D253.5030400@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5107D253.5030400-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon <kishon-l0cyMroinI0@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >+	err =3D of_property_read_string(np, "phy_type", &phy_type);
> >+	if (err < 0)
> >+		return USBPHY_INTERFACE_MODE_NA;
>=20
> Why don't we use a u32 property type for the *phy-type*? IMHO we
> should use string property only when the property should be
> absolutely unambiguous (e.g., compatible property should be string).

If we would use u32-numbers in the compatible entry, this would also be
unambiguous, no? 0xd00dfeed would be the at24-driver. Pretty specific.

I don't mind having readable devicetrees. And we have it for ethernet
phys already with strings, so it would be consistent.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlEH1F8ACgkQD27XaX1/VRs41wCgwvmADunNm/ChKB4eb/n0JYQY
9NsAn0ZCVwmG9qm8hoou4G4m9Umrhefe
=PEAG
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
