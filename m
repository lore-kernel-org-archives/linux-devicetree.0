From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 6/8] dt-bindings: gpu: mali: Add optional OPPs
Date: Mon, 27 Feb 2017 15:39:58 +0100
Message-ID: <20170227143958.4tkfrdvu7vdqyivh@lukather>
References: <cover.7101c7323e6f22e281ad70b93488cf44caca4ca0.1486655917.git-series.maxime.ripard@free-electrons.com>
 <29cb6b892a6e7002d2f6271157a5efa648b0dd9b.1486655917.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0946414835=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <29cb6b892a6e7002d2f6271157a5efa648b0dd9b.1486655917.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0946414835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ople6vvjdej7kc2c"
Content-Disposition: inline


--ople6vvjdej7kc2c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2017 at 05:39:20PM +0100, Maxime Ripard wrote:
> The operating-points-v2 binding gives a way to provide the OPP of the GPU.
> Let's use it.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Applied with Rob Acked-by.
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ople6vvjdej7kc2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYtDo+AAoJEBx+YmzsjxAgPwAP/RXy+0TExGiae8psGEf9tKYd
GMl9cF45A/OCcPKoLe0FWctYA4byQR9r4+lAGWEQjbsRW9mfssSpy6bioWueu5yf
UsSNusGa9NYTP3aad+XprsGMBc9TDtS7iU6MgLiEqXAfaXqK3+rlYNnfpSDQWuUS
WO351F1YrI4PmsBolUTqZXqxgMfrPoAzVXL10DGDz1G0rItxyKfrOVtTGas73e2N
jUCWGedSq4BtfgaMYPQCIvMq9hCwU4ygA3ih6MvArA0yaMHOJKA51JU7WWQigqie
9cEQMC/ZvpKQnM+q+bb4dlUbKJE2vZnTYp+flVo0DGb78HImke3jYw2cEHENGZuZ
Be1Seh3MIWejWnaIVad+bF8GKMzsmRjwKM9cdtmfa87sRdXsKauOWgI91Bi7ntTH
rl4OGxh8YtysBXqUCVefhypL/6MYcJXZn6r+7QMo5sZ42m9EwF4InZ2E4SZPjEQx
viRoeH1aVYFhAqkj2LCN+/ppjZJPItU79gq+YFyfW8zvpgYpl9EQZKUA+XGOSqIF
X9VtStdv+hgKL6iW743/WN/w4gXN8M/CedjdBWmYK2W3Qsq3jeUdUCEWU9UrjnYd
i0fYsjooTW5jVYHr/GzZx1JhR9mE97uBvId71D7qdBGmXLNPN6EVuL6oWUerNafv
RiJopMVAoaQoe6UoxaR7
=L0Gd
-----END PGP SIGNATURE-----

--ople6vvjdej7kc2c--

--===============0946414835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0946414835==--
