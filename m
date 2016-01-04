From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] Re: [PATCH v3 2/3] ARM: dts: sun8i: Add Allwinner
 A83T dtsi
Date: Mon, 4 Jan 2016 11:04:08 +0100
Message-ID: <20160104100408.GB11722@lukather>
References: <1450445451-311-1-git-send-email-vishnupatekar0510@gmail.com>
 <1450445451-311-3-git-send-email-vishnupatekar0510@gmail.com>
 <20151218214112.GU30359@lukather>
 <567537FF.9010601@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <567537FF.9010601@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Vishnu Patekar <vishnupatekar0510@gmail.com>, robh+dt@kernel.org, corbet@lwn.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, emilio@elopez.com.ar, linus.walleij@linaro.org, jenskuske@gmail.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 19, 2015 at 11:57:03AM +0100, Hans de Goede wrote:
> >>+	memory {
> >>+		reg =3D <0x40000000 0x80000000>;
> >>+	};
> >
> >Is mainline u-boot usable ? If so, you can remove that node entirely.
>=20
> mainline u-boot works for me when cold-booting from a sdcard, so I consid=
er
> it usable :)

I'm glad we have the same definition of usable ;)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWikOYAAoJEBx+YmzsjxAgM0sQAI37JwR9RFmpabddZuW9Sy1v
8ULDzQD4cmZ/+4sPuwZgw6AsCqvvDIhXm7HZjkCDxgp/2Bl3EhkjAJ1WNH0zS9wN
4rjisdEzByJvoCemIeRwcyjdtz443aC7qtjuPYnz8FSDMOemptsl5TlXwQhRudMP
LaU6sNJNbXcUxtSx/KUf5xQ1LOJyCQ/2DnryH+W7jFFPJsaW4OnCifkC2ivYuDvD
b0iMOFEhwliHvMnJUui7SyPFv8m5Bm0HvKHGhWU5qgL8ThjZlsY0d/3lWHoSwN9r
/sfju4MNUUffaPbUTwZ1yUjtz6V06YyXNLHrSACDrIua0USrtYWx20lMIzHq+FcX
NRgwDdn/+QgUp7EKmzB0StHyVpiOS4yn7uanBVmR3qZ6/bFFLE1ZgyDBm/xvT8rm
EJ4ho5iZvE7uwO9WVge1WBtQqNPk2+u+arcJZ+L1BTltSOzTFqJRbKVwfXj9Lm9P
gfK9N+B97WipsDX7yZfonVz5iXt80E5B6uzs6H+TPbIbqpnoUGjs7gvz+eCnAe61
aCvoEUkITsCCqg7FOUAr89eEGf+eeO2AxI2my3jlUvs4dxE09uV/7GefgnqjGuto
i63R+qCk103RYcNzoETTqbTYLQgfLHcTkWIQ79ooiDTWQlT+8CH2BZMCzrOVQIjn
bvBKIrPwjP9otkS1/oXf
=3m9s
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
