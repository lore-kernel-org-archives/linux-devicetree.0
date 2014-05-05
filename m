From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: sunxi: Enable syscon for the system controller
Date: Mon, 5 May 2014 17:55:17 -0500
Message-ID: <20140505225517.GE9464@lukather>
References: <1399212160-26934-1-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399212160-26934-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 04, 2014 at 04:02:38PM +0200, Carlo Caione wrote:
> The so called "system controller" in Allwinner A20 and A31 SoCs is
> multi-purpose controller that tries to add misc functionality to one
> memory region.
> In these SoCs it controls the internal SRAM partitioning but it also
> includes registers for chip versioning and NMI control.
> This patch adds the proper nodes in the DTS files and enable the syscon
> in the defconfig files.
>=20
> Even though the system controller includes also register for managing the
> NMI controller, these register are not mapped in the syscon since they
> are directly used and mapped by the NMI controller itself.

Hmmm, what exactly do you want to achieve with this?

The NMI controller won't be able to use it, since it's initialized
much earlier than syscon and regmap.

Moreover, the A31 doesn't seem to have this system controller, or at
least this overlap.

And since on the A20, registers seem to have one usage only, so I
guess we can just split this IP into several nodes, just like we did
with the NMI.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTaBbVAAoJEBx+YmzsjxAgph4P/RM4HTwTh0WXyOwYLFAd2DfI
SzK3CCOd3qTj/T2SMqcGk59ub0sGz+CAzXw6miGymikCnR8NSygqETI9Ordxl9yp
AOiWuPd66QlgkHeOvVdR5DPGA4T2ZjiZ8S0KIgTpyT0LOjaej/NII/zJQHtS215b
jEFGf/1lWyYhHNI3DQvRNLdBjZx3ozneQ9aL9a1ky14xqEa2fast2Fh2zW5LZ/Ol
J8Vd+PxJ8hLTHj+ZwesCOCtwD7C6HjTpCEFFmfn1FqWcQTGINphB9hvdQQQpR0y3
DOX38y6uggRzm1hHWy71mJ53RxxxwW0/90j1Lle1RFC/3zpJkAmuTsml9VyJxWPN
wkOKUW9PL/1k6SNhpSzGOyMzUWjqH9fQMYc5sdszkw9xUk2p07INpXjDAty0QEq6
Q2UlF04WJuZvLtjytBkjBLejJlh9HY3ETR6ftn6rx0H3o7avVsHUwCUDVL2Np/oE
bqY72dXYJmjdXBG+mn4Fhc1iqUb+vIaTMyj98qPhnX2HsRIafglBZCPs/VeFSZ5W
WraQeCnWdsUcnq3oW/FmTmSPnpy8IhmZyVB0gtZ4h/3HjA4dOQpZ1lm3CRyH4dYg
J/ftsLksijk7vGxO495hPmfRxHJmWSOnrUpEU0ewI2BJN99aYwmSaqcQx5I4dP2b
b3PbnnGe3Vr2R1JVavMT
=3UYU
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
