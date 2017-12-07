From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: defconfig: enable MUSB HDRC along with
 Allwinner glue
Date: Thu, 7 Dec 2017 09:46:31 +0100
Message-ID: <20171207084631.ddncr4ska56u5f4n@flea.lan>
References: <1512582598-24806-1-git-send-email-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="amm3ojmt2edbxo7y"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512582598-24806-1-git-send-email-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--amm3ojmt2edbxo7y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2017 at 11:19:58PM +0530, Jagan Teki wrote:
> Allwinner SoCs typically have a Mentor Graphics Inventra MUSB
> dual role controller for USB OTG. This is need for verifying
> gadget functions, so enable them by default.
>=20
> Tested 'otg' mode with mass storage function.
>=20
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--amm3ojmt2edbxo7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloo/+MACgkQ0rTAlCFN
r3SJuhAAhBN2L/Y1BgyTMIjA57fjCVmcJdfirUkzSHXXmnRtiwpEpzujLrMXAHQT
xud+g6J73xyaOa+e1QlWP7pXNZBn/xuUQsahZhmEuh5qGtIwVCoxkLLCD/S48DZl
X1zxT/cGdyf9nYGA5r3+23wWRKAlpg0+p/3/h7h8dIdk/GktKtz8uPowFsmYm2E9
vJctnol7riK7PMVA0/55UlHOtg1IBb7Xqe2ezssaWERFGYbnMwor4zjjw9WSqg5X
1mxRtBjryeHeX6lB1Q4xwrC6U2HemPeFAMXiYdEgmjY5yFkXGBpEbx4ylDOlVoIp
cZejydDznEAhwKbOUy2cCYU/LDNINsRuKlSv6O2DHCTwiItIbYWwQe4BD26RMVS5
JpGMlVLo3zjcR6tJdIFqASQDB2Dy77qwJUEwEoT0Zg+tDBgWM8Z6LnxPVA6Q+Nsr
nMwzk6msBdO5KdsOgT2xPGU1mPa4cvZYfyZes/B17cO9TeF1LdPSUi5TcNw08ipV
7fCCGaq9vCEF8dXCpdXbXt9fyAoARUOW++rCeY8UsXGTyeu6H+JGT0tbrFwvX1EY
2Y7iRoeMeofKcDfUVtGpdnDo243GWGfu/N0ZwjC0jqj+onP93P0kJ+UThBi6CD0t
HbmkNxeljdujFTMcDbLCU0AihvREYitVfWgYkntY1ULLSBvjR08=
=V7iH
-----END PGP SIGNATURE-----

--amm3ojmt2edbxo7y--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
