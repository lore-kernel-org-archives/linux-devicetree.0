From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: allwinner: a64-sopine: Fix to use dcdc1
 regulator instead of vcc3v3
Date: Tue, 5 Dec 2017 09:33:16 +0100
Message-ID: <20171205083316.p4hpqkpzulov6aok@flea.lan>
References: <1512363187-8353-1-git-send-email-jagan@amarulasolutions.com>
 <1512363187-8353-2-git-send-email-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sdz33nqxkrell6tx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512363187-8353-2-git-send-email-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--sdz33nqxkrell6tx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2017 at 10:23:07AM +0530, Jagan Teki wrote:
> Since current tree support AXP803 regulators,
> replace fixed regulator vcc3v3 with AXP803 dcdc1 regulator where ever
> it need to replace.
>=20
> Tested mmc0 on sopine baseboard.
>=20
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

Queued as a fix, thanks

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sdz33nqxkrell6tx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlomWckACgkQ0rTAlCFN
r3RzIQ/9FtqWbjiVm9He/Of37b7zIn8ZxXKVlNSWDw6bTQy8Fe0XkDum6dxYmjBO
wF30jdxbogyLaWe2Gx+hgiuZP9r5TLhep0HVqnffP2AJcfQ/+vV0Q1lm0MS1bKVE
kxRlK82xRf3T6PzXJ8OdXb2VZVrSvhGDvVpxexokrH4TyQ0gP8h3B1jZyAo9WtpW
khILV4ci0hH3JR3ZJDqVi5Chi3Kw8CLRAwSXznUiQ/tE4Apn6uO+gY7enjjQZbvp
Ii3LBwk9YtVQZ6jGa0O4kHLldkE0Wjej+v7pk+bTh8k2egbJwcrFl/MF5s9IshJU
IGZ0RIPsOqX4KZUiybquhrRzbqhRDe4racEPSZG6KJLTkdPe2Lza7Dn/bCOg3YUn
Jll5Q4Rw6hT4cnXt7RKTxwlNIqSLmeuJIyEPD+yiYp5TH4FCkA3gz2AEYwrWfsyV
doJ3bmVCDVaTCfLJWOqHEfsjkwKM96rKYUWXyUhV1UTu1kU0nfAIOhvVveaDJ6Mj
yNvyxz8QiIz+8/aHnJCcNPSQ6tw9rZqtTQYyWE+aUn2Ry0yflgNxuv+vXHA8gW1j
LQBhkdW0aQt+lsVjqEY7HoiDaxT0eUSwpn1tCFXt7XF8tw8j4/Q7sQP740IDhCd+
riDjeQonDqatjJFYSMdcsDIon1wk3tpj2mFHPED+jUz1VKiV3ng=
=NuJ+
-----END PGP SIGNATURE-----

--sdz33nqxkrell6tx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
