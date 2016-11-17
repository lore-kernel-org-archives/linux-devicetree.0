From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun5i: Add touchscreen node to
 reference-design-tablet.dtsi
Date: Thu, 17 Nov 2016 21:24:49 +0100
Message-ID: <20161117202449.hgn5ws4l3nowx563@lukather>
References: <20161116131508.12541-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x4zywx2kedxyxomf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161116131508.12541-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--x4zywx2kedxyxomf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2016 at 02:15:08PM +0100, Hans de Goede wrote:
> Just like on sun8i all sun5i tablets use the same interrupt and power
> gpios for their touchscreens. I've checked all known a13 fex files and
> only the UTOO P66 uses a different gpio for the interrupt.
>=20
> Add a touchscreen node to sun5i-reference-design-tablet.dtsi, which
> fills in the necessary gpios to avoid duplication in the tablet dts files,
> just like we do in sun8i-reference-design-tablet.dtsi.
>=20
> This will make future patches adding touchscreen nodes to a13 tablets
> simpler.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--x4zywx2kedxyxomf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYLhIQAAoJEBx+YmzsjxAg4lkQAMLmXTZKrRIaBxSdK33JCLOg
UtRD+xn985YLuqFaX2KG5SaUAFfayAlTs0xyhYtfMqH5INy2l62ud7tOOQxKqGlM
5CA59tjRMmmkXhf2Bs5TLesaW8r1dpOuUTvMkFuTCXfrAsr5G4frF1biclqjxAuk
QxkGqnnODTrpPrf+65/xExa3Y8tvRIn3eYxuV4KbOP/372nv1XwEph8Y4uYT0d3y
kBFyOo537dmnvFTnp3Y4VPmFRXIKo+XAIr67DaBSpA4v0Doyhdkvaob+hZ0gxlTx
00vnm70r+KNvsDvuhe+elXDviovdQaSAhvibClfY4nGlZY+Osxe+ZTFWwJei5gk2
e0hF3e9/dUNYZdogZjsKU+DJgiLpmIrXTmu+7gBxQTHoNcKY+nQNN9c+8GMeSngn
Q8XKK7I6T45JmCjnt8yGSBswSJPUhurq6qNZhgAqEYrObl8aQxfHCDbu/xxlj3pY
bGNbbwqMhYpN4jdWWJ2AMo5sK3omK9uOIpzC77Wn8RqmDv96e1UfZUCOYbKkcZmk
flTWOR9JR25OIy15Rr9dgDkiL55TlGbjZNXGL+S9Sp6CANuaYjM/A4uBxh2g3K/K
3r7paQr0Ub4rsAP4ZwPFk8o78+7Wqs6TfmvAsIxyJTOYDAadYCRXmUw0AGTwTXNq
JWBAS3MNphveb/UIWGHH
=aSG9
-----END PGP SIGNATURE-----

--x4zywx2kedxyxomf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
