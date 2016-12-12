From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: Support DTB build for NanoPi M1
Date: Mon, 12 Dec 2016 16:49:03 +0100
Message-ID: <20161212154903.wy3vgp3grr3y3bs3@lukather>
References: <20161209014758.27368-1-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nub7hhhcbpkuo4da"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161209014758.27368-1-woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nub7hhhcbpkuo4da
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 09, 2016 at 10:47:58AM +0900, Milo Kim wrote:
> The commit 10efbf5f1633 introduced NanoPi M1 board but it's missing in
> Allwinner H3 DTB build.
>=20
> Signed-off-by: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

checkpatch reports an error on this one (commit format), please fix
and resend.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nub7hhhcbpkuo4da
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYTsbvAAoJEBx+YmzsjxAgSyAP/j2nIUE88AJOOYaOsCeppc7g
eWDBECAzvWcsdgZM4+r4kBS5WUFfgsPZ1HyKBs1QtUnkh07lNUfiQyli+HbQGZtP
ujOjS+g9UX8TgpWRL/N7UK0CSLOlpat9zi1W9zuvJVG9uDGJ8KkEcQnGuQw461gg
mKVW+LOO2qJxHIEcRzosT8MYnJTKk41p8rv2V3Ipi9D1pTD7IU4zFUrAzqQ6YLEL
7xbRYvqgfJ1QZOAQHQoakHUVk4759BkMWW7OFDvCzj+rK2NYRkUIV8MIAagyxXwP
cjNbSVqdRms1JMcQ7nDYNcZw4M0Dh4KxWP/6Jd5MHi0wt3fvACK54OkMCp9niUJU
tK0qD2T+Wc05pjEqi4ornw+VZcWzde4M7Qx6frY7BmzrYyOSF9MmqGsf9rjZQj9m
VVDH91OEkDuFo49EFY6p9vSSgICIL8ohf+cQze3WJlBcHfx4Vw7aAB133LzKaNot
CUfQgwiDfxvSSGN6rbLTilSKhUfjI0hke0mLnKAnk3GQ+bvBEmIw2Sl7ir9deZTC
kELOARnyxFxyUDaMQu5G57od6TJDkrdvGPJjQCUNG54qyMYmwDo6yo9POyd0WbmC
NFfA7i8+zVcFV+GwFSVkCdMtA4GQmCZa73BC2GFpciUOG6UXG1SVmtScKoYVhaGn
XJV8to+up+YbQtoQGuRM
=E0Xy
-----END PGP SIGNATURE-----

--nub7hhhcbpkuo4da--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
