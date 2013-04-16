From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] clk: si5351: make clk-si5351 depend on CONFIG_OF
Date: Tue, 16 Apr 2013 10:55:13 +1000
Message-ID: <20130416105513.913219ac889b1db952876197@canb.auug.org.au>
References: <1366009214-32234-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__16_Apr_2013_10_55_13_+1000_x5Z/EyDV9pgwCeaa"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1366009214-32234-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <thierry.reding@avionic-design.de>, Dom Cobley <popcornmix@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rabeeh Khoury <rabeeh@solid-run.com>, Daniel Mack <zonque@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, Lars-Peter Clausen <lars@metafoo.de>, Guenter Roeck <linux@roeck-us.net>, Michal Bachraty <michal.bachraty@streamunlimited.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@li
List-Id: devicetree@vger.kernel.org

--Signature=_Tue__16_Apr_2013_10_55_13_+1000_x5Z/EyDV9pgwCeaa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Mon, 15 Apr 2013 09:00:14 +0200 Sebastian Hesselbarth <sebastian.hesselb=
arth@gmail.com> wrote:
>
> Calling clk-si5351 driver non-OF ready was too early. This patch
> makes clk-si5351 depend on CONFIG_OF again, until things get sorted out.
>=20
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Reported-by: Stephen Rottweil <sfr@canb.auug.org.au>

My name is spelt "Rothwell" (as in the Cc: line below) :-(

> ---
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__16_Apr_2013_10_55_13_+1000_x5Z/EyDV9pgwCeaa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRbKFxAAoJEECxmPOUX5FELx4P/RgbtQw8CwKDVn9ctbFgTb94
H86QQVYrdlaIYQR6Jd8bZDQ78eWIDyDvh2xD+7Xea576S5NUtd6G6K6ZE7Eikj5D
VFaOXqwlNiLFCJvGhYtDcXJlCxqG26FAGy/StcrimiX2Z6/6ZC0XsJElpxYRWPZu
RIePtUrGFLPut4WCy+pAF2Q9l4O7ooz7Vtq9LJkk3mAfDCxfxM4mlGgsWsPwKn3P
JtZ1dN1Di9Lajg00Yo1slhxJGxruW165fPlyJ6uP4fm0I4/6DLQCVAOtyUZlQ0MO
Sx0GvNEF8UtAqMvN1uqYNFK77i9yGK5iM7wJKinytl4SvE5zkMqqge/7W1eJmNQG
IxgAw/GTMRPPcAStcA2AbYyEhy+ZI3dctLzFNabF3zOzcdZ7LQTVyk2yscqDIpa+
YyvbX74JbA0uvsWnixw9SW/XhFzrVzo/15Tp8AcmbxZEX5DiYv3wEDrlAJI4v5p1
maty6l+ICaddR99ZQhJOX3cgi096f4XrNOb7NWc8HuFJQ5HfTOinj1PtJaRIvXYa
dpAi7SCALFry86a0OSqhcalWLEEcIVo9kjHsXloqe9Edft+IsyIhLkc4KJHWxeyT
rAUmI0sgHF060re1vU4ylCK1bW+oeswkRhSHLw3C+oS2/xRP1TebwKYtUHnMPl9X
WpMq/Dscm5/Mo3aPkm1+
=Gl38
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Apr_2013_10_55_13_+1000_x5Z/EyDV9pgwCeaa--
