From: Sylvain Rochet <gradator-XWGZPxRNpGHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Thu, 19 Feb 2015 19:12:18 +0100
Message-ID: <20150219181218.GA5048@gradator.net>
References: <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20150218154106.GC29429@leverpostej>
 <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com>
 <20150218173115.GG29429@leverpostej>
 <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com>
 <54E613E7.2020405@gmail.com>
 <670D0881-DBF0-45E8-A502-A6DB2B77A750@konsulko.com>
 <54E61DD2.3060002@gmail.com>
 <53F2F94C-0C43-4A54-B8CD-EEC454A0AC19@konsulko.com>
 <1424368919.13604.9.camel@sakura.staff.proxad.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424368919.13604.9.camel-MdnFuL0m/hCw+z8RR+d9WEZ2mhrpEnA6@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Feb 19, 2015 at 07:01:59PM +0100, Maxime Bizon wrote:
> On Thu, 2015-02-19 at 19:38 +0200, Pantelis Antoniou wrote:
>=20
> > Having to boot and tweak the bootloader settings to select the correct
> > dtb (even if it=E2=80=99s present on the flash medium) takes time and is
> > error-prone.
>=20
> Dedicate a set of GPIO for board/PCB revision detection (it only costs a
> few resistors connected to VCC or GND), then use that information to
> choose the correct DTB.

Or use a 1-wire or I2C EEPROM to store your board information.

Or, even better, if you have an I2C device, just chose a different=20
address on each board for this device and then probe I2C devices in your=20
boot loader until you found one you are looking for, this way, you don't=20
need spare GPIO at all. You don't even need to populate the same I2C=20
device on all boards, you can actually probe anything.

Sylvain

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlTmJ4IACgkQDFub3qtEsS80mwCfevIvIuQtD5uKbP+9T08R7KQN
X94An36Sviep4vYhaI30ufjuOuG5mY2V
=2kNf
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
