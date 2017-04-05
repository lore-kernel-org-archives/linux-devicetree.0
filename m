From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] phy: sun4i-usb: enable PHY0 dual route switching for
 A64 USB PHY
Date: Wed, 5 Apr 2017 09:03:51 +0200
Message-ID: <20170405070351.etpupeqjeo7dhyxl@lukather>
References: <20170404184518.33610-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w5fq67mx5xpb27qm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170404184518.33610-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--w5fq67mx5xpb27qm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2017 at 02:45:16AM +0800, Icenowy Zheng wrote:
> Allwinner A64 SoC features a switchable PHY0 like the one in H3, which
> can switch between a MUSB controller and a pair of OHCI/EHCI controller.
>=20
> Enable PHY0 route auto switching for A64.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--w5fq67mx5xpb27qm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY5JbXAAoJEBx+YmzsjxAgYiIQAIEuzMuiQr7Oyy3ObKJTmMAb
y81TLLT1GkZ4wmehm2L4qRZwPZ0xVh19+8tXUG6li/2syaVh1+TWe2hZmYNyX77G
onPavXdyJImCDcXEbM8GRlBSWPcTP3Os2z8KRu/5yZcPkymOv8Jeh8mGBj6yM2WY
tBU+Cn/I1iMV7RvLYaXBh4eF+A+OHBrNKbo2j2y5iItM8eGykI1hmVh9IHb2eJ8r
gGVlbgtnAOWl1n17fw0Uqf/c0aIq7dh2t0ax9i/IjOf4wJGhl9bIt2RVPphNKV4P
iuXk2pRBUJgpoQo+9K+pHI49egqaGwgaB2cQnZsqUjFfDhgddkfVCyjtXZOC37dt
CkcFvEDw3B6nZKX1/hKka5N0K7ZUDkKQLdejyywbiNxvQxvat1weIsgeCX+BipOY
0Jg3jBCGv7+eWj819f5sq1ERfXdXwKFScGCVEtR7XVTZ+j0Zif5L2TxuOGNS3fzc
07NwZkcVrHEy4c6XLBdf7uA7tNmNe3pr3nMiDqxrWQwNG7IEfbqLwI7zYOZaULoy
lm0ceTNf4wmMJgbkiU9RVkS6+7UyeX4WPAbtJsWQHYlWXo7a6BnhlWwO1v6EgaM2
ga1e5oxeKzk2rP1soxcMlyEoMC0jj8bDyZ3bkKI9osdWwFRG5Wbul61VRXxNU+Nd
nf7qPoV6hLiYuM7OD5fo
=ssZ2
-----END PGP SIGNATURE-----

--w5fq67mx5xpb27qm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
