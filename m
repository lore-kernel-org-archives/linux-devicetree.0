From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: sun5i: Add mk802_a10s board
Date: Mon, 19 Jan 2015 10:57:23 +0100
Message-ID: <20150119095723.GC4367@lukather>
References: <1421582985-26087-1-git-send-email-hdegoede@redhat.com>
 <1421582985-26087-3-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421582985-26087-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2015 at 01:09:45PM +0100, Hans de Goede wrote:
> The mk802_a10s re-uses is the "classic" mk802 case and functionality, but=
 has
> an A10s SoC inside rather then the A10, it features 512M or 1G RAM, 4G na=
nd,
> a mini-hdmi female connector, USB-A receptacle, mini-usb receptacle (OTG)
> and a sdio realtek wifi chip. Unlike the original mk802 it does have a pm=
ic,
> the axp152.
>=20
> For more details see: http://linux-sunxi.org/Semitime_g2
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied these three patches.

This patch was not applying properly because of the missing t004 DTS
in my tree.

I also change the board compatible to a10s-mk802, to match what we
have with other boards in a similar case (olinuxinos, pcduinos,
cubieboards, etc.), and dropped the _a10s from the pinctrl nodes for
the same reasons.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUvNUDAAoJEBx+YmzsjxAgAKkP/0mGmyniAo223/13pZrX4wkc
Dq66tQT2YCc0cWyAjpjuGxyzbeBRu+xM4a2W/r0UWJT5ZL8Sgf+9k0DfRGC7dV7A
ax9d7vQblYyDRqhj7o7/2FUV9aMNwh+69a11eQXSRWCDItr5d/R4FImC0Ga3G18T
+OZzqD9ZkedrmiM/Q7etmX+cpfLYrjBYw7kRkGOmsvZ7rzVZqhvab5egVBnLmL5Z
CTW1ooCOSNALX/LFiLOKxCSYBL/3pfKpY0sDvCJ+kbBCto9qD0MxxD2PfgDe/7CM
KglkCAguxht63t/jCE6cTKxNZQAf/q8HE2XQ8PSkB8bYRw/nYBFdaoyafBAHZ/hb
8ByS+23OFr7TsvzL3z3qaF7mNkCKW6Q6smB/bsa3CG6kulIisc6SOQgPIhw0fspx
uGKgPkkHZbbDHP8SfXD5OQQ0rn48+UBcrkRrInkwpxkShsloOm3+rZ6vcWv8HmWf
b5bHze1FWkDDa0b6CFygtdh8PCReoWCgZzzF7AXQqy9ycKFMSvMQkvNuGCXLnAQ5
V8fkh0lxzQc/yKhkrpkMJ3pO6bYW6TJxbkxtKlpEka6RsA7UaUYBE/sfKGHA1II0
5FyNS67XZBSn1lxvRq95L64MM7zaHvh9Sm+T9p9RqYcesgM8fUDKABBwj4bB8/va
AC/1KS0AZnznaLhMR4nA
=BYvk
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
