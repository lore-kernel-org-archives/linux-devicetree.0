From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun8i: r40: add watchdog device node
Date: Mon, 16 Oct 2017 11:09:51 +0200
Message-ID: <20171016090950.jqz5ekfwhjqvsxtm@flea.lan>
References: <20171013112621.18932-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cooda2fochwq2ffo"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171013112621.18932-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cooda2fochwq2ffo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2017 at 07:26:21PM +0800, Icenowy Zheng wrote:
> The R40 SoC has a watchdog like the one on A20, in the timer memory zone
> (which is also the same on A20).
>=20
> Add the device tree node for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cooda2fochwq2ffo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ5HdeAAoJEBx+YmzsjxAgU4kP/RyXikVUkG0ld5MguAOpWkMB
xv2KvswxWvmPHX+RKecHq8xVKLzNsV9ClJ8d/m+cSNIszfE/UHpu08jP08zs5LuU
srg76KOU5cf43mvbBpb73LUb41g52ktvMzpyDYT2wIcYi4DHw/OT1fxCFFs3EGN4
Q2zRZMOuHHI3f3zJxQs77nRaDt9otNWAo3K4No2qssr2MlgUrq70/PUatrUo5fyK
wVJXeBRfauwDWzHkJE28fCB07JoIF/CUgu//7yF4O5lo0DpvllnOM1naf5hPGlYj
38TUaN+zIPM58hUROwGs/GHW4snx/2mjgiWSy72DoWeATULIEm/d0uOpKo/VMq5m
u+ciqrVcH4dEjoKEaYYuwHABgl/MYVMqUUzrPzUwtn2/+Kibq4F2lBNPawYI3arN
71/ypKqBvuwNAy5ulOyeaBHU2YvHQ0MCoUvVE8kuzh53TyWdlM5xE4UuaI9S1KE0
ZGOtHwnWUraXv/MbIp/+fKrIAUYOyp9w2abtwke2NcQhn2jljrxnFkqAvqJuIzCm
iJdRl/vlZt/N1BOJ2Hz867S0lpb6If745gHowdOTZQjhoE3HdW30l6Mlr6z9ZkeI
qfQ+OFX3Gu3B6XrAT0p/y9Kb/xdSIKrJBd06UCW4lKKXvXOHEvAWmGOuKT+x8zfk
xkDNzgyHXU0I0dv7w67u
=iXOt
-----END PGP SIGNATURE-----

--cooda2fochwq2ffo--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
