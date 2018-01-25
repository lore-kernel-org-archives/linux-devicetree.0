From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: sun8i: NanoPi NEO Air add WiFi / eMMC
Date: Thu, 25 Jan 2018 16:38:07 +0100
Message-ID: <20180125153807.dmtzly56iphnilxq@flea.lan>
References: <20180123235844.5511-1-mkelly@xevo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bi2xv5ybqtnyg7zh"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180123235844.5511-1-mkelly-s2cxlsp5qxs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kelly <mkelly-s2cxlsp5qxs@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--bi2xv5ybqtnyg7zh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 23, 2018 at 03:58:44PM -0800, Martin Kelly wrote:
> From: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
>=20
> Enable the WiFi (AP6212) chip and eMMC support for the NanoPi NEO Air.
>=20
> This patch was originally submitted by Jelle van der Waa. Martin Kelly
> modified it to compile on the latest kernel, fixed up some review
> comments from Maxime Ripard, and re-tested the patch.
>=20
> These are the original patch submissions:
>=20
> https://patchwork.kernel.org/patch/9581613/
> https://patchwork.kernel.org/patch/9642071/
>=20
> Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
> Signed-off-by: Martin Kelly <mkelly-s2cxlsp5qxs@public.gmane.org>

I've reworked a bit the commit title and removed the links, and queued
it for 4.17.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bi2xv5ybqtnyg7zh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpp+d4ACgkQ0rTAlCFN
r3SAuw/+MIwxu4LZv/c45H7iTQmIU9n0wbAzjSqrD0AVj7eLU6r/4cGT8Bu/Mtv/
IYjME92AiliPGrG4+Av1KaJXyeYbpJjoov8IF1NqlSiFscIP/zXR4JQXXMt7eoOW
8RuvzhDugJ9YfsGJaaR7k+gtMDJEbsJtFTE6vKeZir2QG0LaLOMxM2j4CrQzdsiB
R5+YebBsyCM/BNN/Fw5q1H5AsdRb+/oypzPrj3gpjziXNTToNGvS5Jvyf9pOAG9C
F6ErEVI+QFpRKcHOg0NEER8CiFyDrE6orAgSMMMfZ0hGg+vZ58KV8epIvwAFVepr
yKFPi5MZhJbJtIF2jyafBwMmv8ACW23E49UgyJrXpE35T9tEOTiGKKA2PTuZyHGb
sOkkUI9UJNDLxSStJ+2VdIwhFOJWAKbnhxl4LYwl3yTCAbOVC3ZKy8g5fX9PWEaW
GsSJwApDWYSI9qt8xhwpT+SggTKNVuHO+cZsKkM0/DO4kZDs/SmlQqHHSr7vvtPA
GZYf61MO9cfyeXTP5l8x+KXHTCXda470xTbF0FpTYsinNI9yvf0wIMryeN4sFz/K
K6YyU5KeHUFPkARG4xDWe75gCtLToyW3OO+HMVTtzHqq92iusPdOeUalFzP32s6z
arOzLxk+8O3pH5ljJg99u1DgwY2TJlzXtEp0d+zUarYtsQZg1Cg=
=QoY7
-----END PGP SIGNATURE-----

--bi2xv5ybqtnyg7zh--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
