From: Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH] kbuild: avoid unrecognized option error for external DTC
Date: Mon, 27 Feb 2017 14:06:56 +0000
Message-ID: <1488204416.2819.9.camel@decadent.org.uk>
References: <1488174052-2530-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-34dSXzycV0LBKz+SA5yC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488174052-2530-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alessio Igor Bogani <alessio.bogani-9b6o1nMz89Julxpn9UvDqw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-c6x-dev-jPsnJVOj+W6hPH1hqNUYSQ@public.gmane.org, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marcin Nowakowski <marcin.nowakowski-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linux-kernel-u79uwXL29TZUIDd8j+nm9g@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-34dSXzycV0LBKz+SA5yC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-02-27 at 14:40 +0900, Masahiro Yamada wrote:
> Since commit 6b22b3d1614a ("kbuild: Allow using host dtc instead of
> kernel's copy"), it is possible to use an external dtc.=C2=A0=C2=A0In thi=
s
> case, we do not know which options are supported on it.
>=20
> Commit bc553986a2f7 ("dtc: turn off dtc unit address warnings by
> default") gives -Wno-unit_address_vs_reg, but this options is only
> recognized by v1.4.2 or later.
>=20
> If an older version is specified, the build fails:

But the option to use an external dtc was intended to allow testing of
newer versions.  If there's no reason to use this option to run an
older version, why bother trying to support that?

[...]
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -171,6 +171,20 @@ ld-version =3D $(shell $(LD) --version | $(srctree)/=
scripts/ld-version.sh)
> =C2=A0# Usage:=C2=A0=C2=A0$(call ld-ifversion, -ge, 22252, y)
> =C2=A0ld-ifversion =3D $(shell [ $(ld-version) $(1) $(2) ] && echo $(3) |=
| echo $(4))
> =C2=A0
> +# dtc-option
> +# Usage:=C2=A0=C2=A0DTC_FLAGS +=3D $(call dtc-option,-Wno-unit_address_v=
s_reg)
> +#
> +# When we use the external dtc, check if the desired options are support=
ed.
> +# When we use the kernel's copy (scripts/dtc/dtc), just use the fixed op=
tion.
> +# Until Kbuild descends into the scripts/dtc/ directory, scripts/dtc/dtc=
 may
> +# not exist, i.e. $(call try-run,...) may not work.
> +ifeq ("$(origin DTC)", "command line")
[...]

It could also be specified as an environment variable (assignment with
"?=3D" doesn't override them, but "=3D" does).

Ben.

--=20
Ben Hutchings
This sentence contradicts itself - no actually it doesn't.


--=-34dSXzycV0LBKz+SA5yC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAli0MoAACgkQ57/I7JWG
EQnf9xAAsrFofDAMb/8Y7FdR1SB9TyigTo5kslryzW1w9ge3wdkEst3DCrXIuAJg
rYlVL4Rlu+kvW8tQExD345wZKNbVZ1vkaviJfr7mqHP+EHRlyJR3qVlpZMsnSuZm
ZwhaB+J3Nl6jMo7G9nj4+YGa8smPWANwj3svFuuZv+VHSXipsIzYDKjWsjE9F2xs
cX3T2ESaUV7yGKGiMiGyQN7LOMyPawNuKYGxq3g9B8rfS/twEd3CD/uA+99rftsZ
ycwwSIzlulBUKbie9bv/5tZ/Jkt9x8/iF3iun87AJYUSaiwv9S+iUbhQJDx2cpm4
LAC4DXBsQllfEjKQCFaZZ8NnkRM5VYGinNvVy69gv/Q/iXQWaqVFqcrnFw+pW5u9
EUzdz2H4ebhXJM0pi+pUowJKH6e8ySrLAbkY1CqcCJno5IvpUR2YhLJp3Gq/CElZ
D8rlWNaY7NTPddckwLNh1AYZpVF31AIkFDFxSG9A5xTudyPmP1j8gA/MS1DLiH7b
xe5i7qdYeR5noHgc5CqM7SPCqUHSv2rbaCDbdC8oAfSxVK2mGPMcurOcz6rhrf07
Mot8XYtGglXs+VnQFxSX0I+brqw5TDEHPAaa89VuwoFbxaABpGWkRwOpED1mTCSM
sWEe1LEReCMYKF/oQygec5jhf2QhWKMKgXZjo7CVDV+ljYzHm1o=
=UfrQ
-----END PGP SIGNATURE-----

--=-34dSXzycV0LBKz+SA5yC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
