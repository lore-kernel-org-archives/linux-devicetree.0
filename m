From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Add support for G121X1-L03
Date: Mon, 23 Nov 2015 12:20:39 +0100
Message-ID: <20151123112039.GG31868@ulmo.nvidia.com>
References: <1447880267-13422-1-git-send-email-akshay.bhat@timesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1049884751=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1447880267-13422-1-git-send-email-akshay.bhat@timesys.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Akshay Bhat <akshay.bhat@timesys.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, justin.waters@timesys.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org


--===============1049884751==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t4apE7yKrX2dGgJC"
Content-Disposition: inline


--t4apE7yKrX2dGgJC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2015 at 03:57:47PM -0500, Akshay Bhat wrote:
> Add support for Innolux CheMei 12" G121X1-L03 XGA LVDS display.
>=20
> Datasheet: http://www.azdisplays.com/PDF/G121X1-L03.pdf
> Signed-off-by: Akshay Bhat <akshay.bhat@timesys.com>
> ---
>  .../bindings/display/panel/innolux,g121x1-l03.txt  |  7 +++++
>  drivers/gpu/drm/panel/panel-simple.c               | 31 ++++++++++++++++=
++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innol=
ux,g121x1-l03.txt

Applied, thanks.

Thierry

--t4apE7yKrX2dGgJC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWUvaHAAoJEN0jrNd/PrOhv98P/2uOe86CTbV3O83oEBfYh49z
Rq0ceStnaUqwOiR4ruGSIJonbKQsJQDll6TwfJDDD5b/0YlufhwFmjojulHWsRcQ
vYdMMDp7sEXUDZ4Xv/7WotQBqEOTVTXB86YrjbzavV+IAzI9JXQXPlyCD9VTrpz7
kF2LQWq6pmSE4HDe/TGCoa1xzvo2guSOzw+Hgnk45io0l+cN9EBz7Ii5EhTAerBL
ElefuwT7Xm2+M6qvKgLkQO5HwWnpqvKM59zEh0u4LL7wiXLcUryrre26SlLupLep
ErEXXSocYV9eGQQ5eGlA/cr6KYSJPKxG0wHO2ydPHJDjhsq4Xs8JW5HjWQAaO8Rj
q/FbMFt5ravoTDUwKdb2t8Twh5+clp7NNJcpCSsmqXvoR/nDZh4aeF+u3gKe0cea
Rlzi05JT6BmNicWZiqNNWry8e9JYepIpRnTBSqHa5Thi4Z0YLSnQllHQdNWSpw4U
rsDyobqNTPxtn/reyosd66viScalLp/Y29MnUR2X0slptkm21JNWSakA2eKYmZ4+
R6cVQcyBy1ZXF5b4M0qskOBv6ZvteUlmp7Rj5XOXhcN5qoMo9aP3pYSpOuQfBRNB
CCmt0iuIrubp4/ZVRcMK3U4gL303K+SO8zzM0Bm5JCFM23JnJ/wHDK1KSa1MRs2D
KsU7LsZJCFOL8OTtShL9
=QcsL
-----END PGP SIGNATURE-----

--t4apE7yKrX2dGgJC--

--===============1049884751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1049884751==--
