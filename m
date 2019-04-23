From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: drm: panel: Add Samsung s6e63m0
 panel documentation
Date: Tue, 23 Apr 2019 13:09:05 +0200
Message-ID: <20190423110905.GC23448@ulmo>
References: <20190222175153.20567-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0564166117=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190222175153.20567-1-pawel.mikolaj.chmiel@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, Jonathan Bakker <xc-racer2@live.ca>, linux-kernel@vger.kernel.org, krzk@kernel.org, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org


--===============0564166117==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Content-Disposition: inline


--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 22, 2019 at 06:51:52PM +0100, Pawe=C5=82 Chmiel wrote:
> From: Jonathan Bakker <xc-racer2@live.ca>
>=20
> This commit adds documentation for Samsung s6e63m0 AMOLED LCD panel
> driver.
>=20
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes from v2:
>   - Added Reviewed-by
>=20
> Changes from v1:
>   - Add missing subject prefix
>   - Rename reset-gpio to reset-gpios
>   - Add link to spi properites documentation. They're required
>     for driver to work
>   - Removed delay properties, which are now hardcoded in driver
>   - Removed display timings, which are now hardcoded in driver
> ---
>  .../display/panel/samsung,s6e63m0.txt         | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsu=
ng,s6e63m0.txt

Applied both patches, thanks.

Thierry

--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly+8lEACgkQ3SOs138+
s6E22A/+NmgPdR2i/5NmTD2zUY3s/+jsr1LblOwQ+y2Yz1pZmdKfQNBscZgN3YpU
/rlWw0kfOk3rNXW0p50jVUbDpxWJfKd8dmZyElBroJ4/v6BED1U/yRojxE30Hgjt
ACw1i9awfm+vS3vSfdpQ6HYl/vtMjsCW9Y0puQNgQUk8jIrEFWDgOjLP4JlsKmRe
AKWVjE9X37X3M3i+HaygNA0SbZCMQ0RL2MWv58cbkbO3fgZdukPvvyvz32ivFb1t
tE4X3Ws94iJ/M8qY3ndScmE8t7hrG3TDBz+zyngZ8KotvqLkRtNmiV9FXiKM0+Oc
vSRcSyQrvSpjEaG9OO+HrGammzuOxLROR80dRGuG03G3lONQiZaFzbBkPy6EAeUh
jZw3HoPaE6uu/2TuY1esGxCiwu0ky6WLvBObWrLmnQDu15R3h6ugd0gyctCED8uN
/JH8T+bgMs6rAtoPANuPEr8doasGCf4rxHEYBmGJqGsqwD28BvLpj2q2ABgN4+07
eJQCQq9SoM1I0qynUkZejWoifFjcfA3JHDaB24YXUGBP5GdrShf7hZbXOU5q+Cof
PvfewrMOxuijjul8rtVwk0kaA7FZb3NLV4UmFnIThrPGHoO5RzSv6eOZxk6wkcFh
0UKggDY9C4lzlfaigZSXuRwYeqCygo+ukT0KONxxGWHgQljNBZE=
=UaPE
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--

--===============0564166117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0564166117==--
