From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 13/23] regulator: ab3100: refactor probe to use IDs
Date: Wed, 24 Apr 2013 10:54:30 +0100
Message-ID: <20130424095430.GA5019@opensource.wolfsonmicro.com>
References: <1366624634-6579-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0101280429597128361=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1366624634-6579-1-git-send-email-linus.walleij@stericsson.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@stericsson.com>
Cc: devicetree-discuss@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org


--===============0101280429597128361==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZa61AII3s1sGKYx"
Content-Disposition: inline


--YZa61AII3s1sGKYx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2013 at 11:57:14AM +0200, Linus Walleij wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
>=20
> This refactors the AB3100 regulator probe to use regulator IDs
> and pass this to a separate registration function. This works
> much smoother when migrating to device tree, as we can use a
> match table with this regulator ID encoded in the .driver_data.

Applied, thanks.

--YZa61AII3s1sGKYx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRd6vOAAoJELSic+t+oim9VE4QAIzByts0GNm7KQ4T7Ve19ONO
3ShmcQHziOoWtKQH9MlzFx+9zsGHC2NHJDNWKDVMp4mkS3PFyfekMdAfd0H3qVHf
E+yLTlprLdGQbTJjd/PL0b8BQfxCTjydXUGsd8lAvby+YyUBKYutWdtqi+ZYZ89V
MVuaBb2eeWYHDEAE1zBeYVwSsudgginEIgVwVjLMmbBRm9bBppRJkl880OwxRC5D
fRCh72rQd1qhtvljW/H83a+41SZbyHnXaBcdi6vhfo2rq7CQlKcWSKFY1PCam0Gs
GI9CNWfE7gYfMdpA/jFZg611r+ya2pmPfG7cO42Pzl85uDybL89jnOVf6mVfy1ek
Ayem6qz5Lhkz4ViqEamtXS2VJsjVi7t/e7CBxJn3V78rHcv72GbRPMZifaSLvTVm
35+ooiLeUHlwiA0AP+Tl7Uj1f9GjCkWuLsNT/q8U8mGCVbmN/yAe4x46qw/FVxPC
Rk+VW4fikhn6w/Vl9+w1TCjXhI8fJkoYarypQ0mVKTHbZyKbMocYnp5xfkBecE8Z
lAielE7Gszvll01rA20fCj8puMwwwqRsM7o417iKbdKKY+LT5a8LZJjxL0nfGn6f
vkovIfl6iFwVs3/rvNq4uQx0RDvTtPiA6zM3WL/7quvflsxUtCcM7QvyldCn2UhC
+0pan7frfT5xKR2PuCRS
=Ez94
-----END PGP SIGNATURE-----

--YZa61AII3s1sGKYx--


--===============0101280429597128361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0101280429597128361==--
