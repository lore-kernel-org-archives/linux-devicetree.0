From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 3/3] drm: bridge: anx78xx: Add anx78xx driver support.
Date: Wed, 20 Apr 2016 14:56:56 +0200
Message-ID: <20160420125655.GC20346@ulmo.ba.sec>
References: <1460119972-8658-1-git-send-email-enric.balletbo@collabora.com>
 <1460119972-8658-4-git-send-email-enric.balletbo@collabora.com>
 <20160414131013.GA32237@ulmo.ba.sec>
 <5714C3CA.5020102@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1741523285=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5714C3CA.5020102@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, dan.carpenter@oracle.com
List-Id: devicetree@vger.kernel.org

--===============1741523285==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline

--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 01:23:54PM +0200, Enric Balletbo i Serra wrote:
> On 14/04/16 15:10, Thierry Reding wrote:
> > On Fri, Apr 08, 2016 at 02:52:52PM +0200, Enric Balletbo i Serra wrote:
[...]
> > > +	/* Map slave addresses of ANX7814 */
> > > +	for (i =3D 0; i < I2C_NUM_ADDRESSES; i++) {
> > > +		anx78xx->i2c_dummy[i] =3D i2c_new_dummy(client->adapter,
> > > +						anx78xx_i2c_addresses[i] >> 1);
> > > +		if (!anx78xx->i2c_dummy[i]) {
> > > +			err =3D -ENOMEM;
> > > +			DRM_ERROR("Failed to reserve i2c bus %02x.\n",
> > > +				  anx78xx_i2c_addresses[i]);
> > > +			goto err_unregister_i2c;
> > > +		}
> > > +
> > > +		anx78xx->map[i] =3D devm_regmap_init_i2c(anx78xx->i2c_dummy[i],
> > > +						       &anx78xx_regmap_config);
> > > +		if (IS_ERR(anx78xx->map[i])) {
> > > +			err =3D PTR_ERR(anx78xx->map[i]);
> > > +			DRM_ERROR("Failed regmap initialization %02x.\n",
> > > +				  anx78xx_i2c_addresses[i]);
> > > +			goto err_unregister_i2c;
> > > +		}
> > > +	}
> >=20
> > That's quite some overhead merely to use regmap... Perhaps there's room
> > to enhance regmap-i2c to support multiple addresses for the same device?
> >=20
>=20
> Yes it is, guess this is also used on other drivers, so will make sense
> enhance regmap-i2c, but let me do this on a future regmap-i2c patch series
> ;)

Yes, improving this in a follow-up patch seems fine, especially since
this already seems to be a common pattern.

I'll try to take a look at v4 hopefully within the week.

Thierry

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXF3yXAAoJEN0jrNd/PrOhVPQP/2WFN9J4Copm4Bv6+rhj31AW
sjZ/bdPJtFi9GGEzAz4VJCNkOKwY9tLxk3P3eetneELrZvJIQPeaLjSBiFLuWE0E
qAKAuJrq9PZ0ZHXG8b6fGYBfAdRl4ezixLPBylGaEax/Tm/4RqOqYG0Nh+adabEy
cpujc8UKuISPmchbfo0j4ESPFfk5q/cev2SmyST7P64BZgs1SRYgX2dlBtp1sZWQ
fn4ku0LGqLf59q+2jmVlGwEXJxyvmuQ+yLVX1SQT2mUBt/QC9XeEHKSnzty1Q3vE
9B+kHbGev0/CuQzT8PnTJApsubL7DwnY2jUH6SYl6vvy9l+V2wKTwDONiOMXbr5F
LmylZzCB6tAJAVDkZht1b2sp7vrC1KtoTHkkLjW9hhLKIR4VbhinkfIVs9Qqqsue
RkNjzSXOsCBvSJ5uSETPOBagMcJ2t7+df1M/zVJHqJFkdFfVvjTSx35x8w2286dQ
oO1giMoMhyuIadqdEkTXa9NVnis8rku0U9WMLdxue+cP5CIxvDLyubNpe5omYxYK
9tdHhY9k/iy1M8VETjAPofPAlHZKzAw/FUe9/4WOzzXchYS66qw4XjZ5UiLyXr46
1RMNb6WWqdnpbknowt0fUIS/g7aKQ2j7LG4iK7InA0qt9WlHYRD/WE4Ei8awEb2K
kRkIXwwPOXpiQh8jigKl
=jdPj
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--

--===============1741523285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1741523285==--
