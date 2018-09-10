From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] of: Split up name & type in modalias generation
Date: Mon, 10 Sep 2018 11:08:20 +0200
Message-ID: <20180910090820.GB702@ulmo>
References: <20180907142247.2931-1-thierry.reding@gmail.com>
 <CAL_JsqJ0VZftZ+Qve+=91tbvgYof68NW+dBf4bPv+b8uQ0y1hg@mail.gmail.com>
 <32ff0b7e-a710-2c23-75ad-8c527d3453c7@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <32ff0b7e-a710-2c23-75ad-8c527d3453c7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 07, 2018 at 12:56:09PM -0700, Frank Rowand wrote:
> On 09/07/18 11:49, Rob Herring wrote:
> > On Fri, Sep 7, 2018 at 9:22 AM Thierry Reding <thierry.reding@gmail.com=
> wrote:
> >>
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> The kernel's vsnprintf() implementation discards all alpha-numeric
> >> characters following a %p conversion specifier. This is done in order =
to
> >> generically skip any of the various modifiers that the kernel supports.
> >> Unfortunately, the OF modalias is generated with a format string that
> >> violates the assumption made by vsnprintf():
> >>
> >>         of:N%pOFnT%s
> >>
> >> While processing the above format string, vsnprintf() will eat the 'T'
> >> character, assuming that it belongs to the preceeding %p specifier. Th=
is
> >> results in a modalias with an incompatible format, which in turn causes
> >> the automatic loading of drivers based on modalias to no longer work.
> >>
> >> To fix this, split up the generation of the name & type fields into two
> >> separate snprintf() calls to avoid confusing the parser.
> >>
> >> Fixes: 73813f8483b1 ("of: Convert to using %pOFn instead of device_nod=
e.name")
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >> Note that a more elegant fix would be to make the %p format specifier
> >> parser report back the exact number of characters consumed. I briefly
> >> tried to implement it, but quickly ran into numerous special cases
> >> that make this solution rather involved.
> >>
> >> I can spend some more time to improve this in general if that's what we
> >> ultimately want, but I think this patch is a better short-term fix to
> >> workaround the issue.
> >=20
> > See my reply on the original patch. I've updated the patch in my
> > dt/next branch with the fix to use %c.
> >=20
> > Rob
> >=20
>=20
> Agreed, your updated patch is more compact and looks cleaner.

Not sure about "cleaner", but yeah, that works as well.

Thierry

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluWNIQACgkQ3SOs138+
s6FxtA/8CkU+Oilip3vkyQ8zmTV9Xx9m9Vu3e9+JcvWaGt2cY/xNd6ALpt7KsTm4
K10jW+Jam9u4KPN6IeIHQD6bFgOxU9BJewEFA4WmKE2cO2ttlsNIApgqBFuSrwOX
xR/mUXUGrIX9vtw7Bg2vjiCzX6eSjJt7XsFMVOD/P7aMSeMyv5p8/Qwcmh7/t4rj
iZ64lB194AdtcR/7gdBXiOtpu9R5NFWZSjcwIiln0cHpsW7vzzIhLfqMKwEJ0E0F
Iolfc3FqnxWO+Iv43Fqhh9rtqjuYrJfECGN38fNkxa/8SblEUMrVi2+tWhBiie6J
NGope74WcAulWExj4j2dDAFVxCEcMnqdg9rrUYZiNr5JhQhrxzM1Lbn0UQfaACli
fn9VnlRaF1PvXxgUb/3J29GKsdI3OzS2YFuPRdFjFyXff+k2iJsjapOCUvC+p/M8
IDrs/ms1ouaZCRxPWSpazM3+28Eh20nUB9f8KuerdqMIwOsaKPgPVd7aiZURFvBV
trRB1CDBeGA+s6cZxQzyHDeRkDjGLersietcfjBShEhhS4Wthahr2tYGwxdB81+y
/rxQdxHTZnQy3AqDoEMRZSxnazpk6W7hxuEuUX/DKDOHW0nodvPlIJNnsdiEyIyp
Fc2bLClevU0Ha5cS6HPfw5H2+IgnVkWGgQcreIQ/VLkBS8uMNOs=
=03b9
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
