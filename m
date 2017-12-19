From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 05/15] drm/sun4i: Fix error path handling
Date: Tue, 19 Dec 2017 09:59:50 +0100
Message-ID: <20171219085950.domvcod2dyqdi3v3@flea.lan>
References: <cover.e46a07c0e181d735c807dc94fe0ce0ea013788be.1512662253.git-series.maxime.ripard@free-electrons.com>
 <f83c1cebc731f0b4251f5ddd7b38c718cd79bb0b.1512662253.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2010099398=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f83c1cebc731f0b4251f5ddd7b38c718cd79bb0b.1512662253.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, jernej.skrabec@siol.net, plaes@plaes.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, thierry.reding@gmail.com, stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org


--===============2010099398==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qo2r5u2xkd6kbbgp"
Content-Disposition: inline


--qo2r5u2xkd6kbbgp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2017 at 04:58:50PM +0100, Maxime Ripard wrote:
> The commit 4c7f16d14a33 ("drm/sun4i: Fix TCON clock and regmap
> initialization sequence") moved a bunch of logic around, but forgot to
> update the gotos after the introduction of the err_free_dotclock label.
>=20
> It means that if we fail later that the one introduced in that commit,
> we'll just to the old label which isn't free the clock we created. This
> will result in a breakage as soon as someone tries to do something with
> that clock, since its resources will have been long reclaimed.
>=20
> Cc: <stable@vger.kernel.org>
> Fixes: 4c7f16d14a33 ("drm/sun4i: Fix TCON clock and regmap initialization=
 sequence")
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Applied this one as a fix.
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qo2r5u2xkd6kbbgp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlo41QUACgkQ0rTAlCFN
r3SYEw/8Clz+lWHHPnqE4HvxfoOj/9vflEUxAmONWRkvsMffwemIAQlZ845K4NkH
54HAyFh/xsm3++f95ALrmiTHBvYp1Jnl6CH0XeVr/b8NY3kLGdTFAPoWxZphewxZ
e+pMPsMkpsyZsqJX5pz9nfgdYyULtg6XIZ0Edxr5ANlSSqa/oxTIuN6r0bXXSB/E
Q/nUb8OaKTUxiH+LPtb4lQtWdTPFFv37qgYZSKYEGCxTomafOPI3L6gPJJu0SSqm
cYgdcFK9E6Vvbdbvepz43jxuddXv+XcgDguqy5CkBO5ojQJCZIGaIiZlsf8ocwwl
RvoU9D3pACGC6HwM9dbOEf7AoRdfHo6ZjJMhumZLRaO7TP7/qjlUqaUQZRTuWTJR
wodqfZvDmhkroSMTFQEXyjB83eBUiBcw/j+fQGQXHX+rrnSUxN3DnClMS0YVKN+b
kriqLj9ngzaV8uyk6hcj7qrM10rAUEKzMjRd7KnV7Hf9iIykKwiV1lcUxfgika78
IPXVKlYG1lbAnmtGPkr1B+M0wIXJAKR1gEYi5UktqP1BLq7G4falYTGX9yYWnHxH
jDUMC3paNcUTzxSyLlKOCYYtLo42X8tnFUNmDqhU/9HVWKxGg4qJy+tFOFWYaUcO
INjcwRVG0xj/w90h9/ISiYiCyBFhLxU0ZG+2EagqL/AREJ2lzIs=
=AEqR
-----END PGP SIGNATURE-----

--qo2r5u2xkd6kbbgp--

--===============2010099398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2010099398==--
