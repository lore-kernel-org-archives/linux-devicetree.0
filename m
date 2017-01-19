From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Thu, 19 Jan 2017 16:51:03 +0100
Message-ID: <20170119155103.e6hctoqllfgypesm@lukather>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <20170116184906.r62di7xiil5lae33@kozik-lap>
 <20170117093813.mxp2hgoxbgske6ru@lukather>
 <4f5b8608-af6c-3ef5-aaf0-e7e034d006cd@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p4pnyitabb6rntbf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4f5b8608-af6c-3ef5-aaf0-e7e034d006cd-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--p4pnyitabb6rntbf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Tue, Jan 17, 2017 at 11:22:22AM +0100, Neil Armstrong wrote:
> On 01/17/2017 10:38 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Jan 16, 2017 at 08:49:06PM +0200, Krzysztof Kozlowski wrote:
> >> On Mon, Jan 16, 2017 at 02:24:23PM +0100, Maxime Ripard wrote:
> >>> The ARM Mali Utgard GPU family is embedded into a number of SoCs from
> >>> Allwinner, Amlogic, Mediatek or Rockchip.
> >>>
> >>> Add a binding for the GPU of that family.
> >>>
> >>> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >>> ---
> >>>  .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 76 ++++++++++++=
++++++++++
> >>>  1 file changed, 76 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-ut=
gard.txt
> >>
> >> Do you have a driver in kernel which will implement these bindings?
> >=20
> > No, but we have bindings for out-of-tree drivers already.
> >=20
> >> Defining them for out-of-tree driver does not bring any benefits
> >> (3rd party driver will not respect them anyway).
> >=20
> > You could see it the other way around too. The out-of-tree drivers
> > don't respect it at the moment because there's no binding to respect.
> >=20
> > And at least for us, we definitely plan on doing that.
> >=20
> > Maxime
>=20
> Hi Maxime, Krzysztof,
>=20
> We hope this will be accepted so it will solve the same issue we
> have on Amlogic SoCs and all the other mali powered SoCs.

Do you have any requirements (or weird case) that is not covered by
the current doc?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--p4pnyitabb6rntbf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgOBnAAoJEBx+YmzsjxAg3NYP/j/dMVncPN9fzPv8swV+PB1V
mxnEeMwCrw9HXPIlJvHHCT9n1TYKJ9EOnllxJs40Xr9FRvXhhTRJNhP8QUpyYEKT
JBFrMogA7VXHZV+adzhe+yh3jlrEGuegA0/LgOagXsxencJQeVYSUqcP4TDgDYqE
Jl/r9a8nWANs+1T4LgzRSdLrHv0KkVXepdlXoRK4I6dt5yBKHWAOpzYwPW7S/JKf
MiYs8kFmb9SBU9hablA2m0ta/cx8GdFsJYMe7221X8SOovolY5scsCyg/5InGFIe
SSK6cvxqGhxKE2HkGjQjwuHXDP+ixBzpVn1tjJpm2atAqf8+khRIcMGi17r33g1+
ijNo7R5H0aWcgnTkOPBTwh42bkExk2pakEX5S9u14IMV30dd5km3yU7dizgb5jKP
ex5Y7hvcOmTsTjtuHcsiiq2b9vhy8T/OfimDlLhRFNxQCQyKkrkJV4kF37AcyyWI
drkQ+/ludQJmkuqJD6kMoieg1s4iALkMWJvG4/BnraqQv4IcOw7QzeUIDM6HfCdC
KtTnFCWJn0OIDnPavO2RgC7kId8nq1Eig8dBdXNSSl3pJcxY8hBTm6NTZDJVpzZr
sgmG+YNT8DmyTUgWTDc4pOZlSQG11WtyL39oYl8vlRlqJ6f88op/0vplrM5UejPV
RDKrBoOZNx/NFIZknxkH
=uDfu
-----END PGP SIGNATURE-----

--p4pnyitabb6rntbf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
