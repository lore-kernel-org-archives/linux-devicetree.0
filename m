From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/2] drm/panel: Add support for the Sitronix ST7789V
Date: Mon, 20 Mar 2017 13:51:21 +0100
Message-ID: <20170320125121.3r7kl4a3wlhsz6nn@lukather>
References: <cover.cd1c315c8da35baa4eb6e5cb34b2c51650193257.1486646057.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ukm3cz3sf3ta2uw7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.cd1c315c8da35baa4eb6e5cb34b2c51650193257.1486646057.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ukm3cz3sf3ta2uw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On Thu, Feb 09, 2017 at 02:14:26PM +0100, Maxime Ripard wrote:
> Hi,
>=20
> Here is an attempt at supporting the ST7789V LCD controller from Sitronix.
>=20
> It is controlled through an SPI bus, with a twist, since each byte sent
> must be prefixed by a bit, which needs an 9-bits-per-word SPI controller,
> which is quite rare. Else, you would need to bitbang it.
>=20
> Let me know what you think,
> Maxime

Any news on this one?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ukm3cz3sf3ta2uw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYz9BJAAoJEBx+YmzsjxAgRG0P/3z4g9M+gtmGPUbxThp4YV7H
xFnutpTlIEdmPKrsmdhZOsLnItFa5bkXEy1RJi3xnySr73CHdzI7I3BFR9STCav6
TJn+iANX3mnOnZuYJVl4O5YLKCBSwtglUbgL7Dzdsup6NyIdgEnxVohgVoPg+953
VfnDY8pnlYNzbzEU0slbrFBmWcxeSLc8YxR/RJe8dpcLmBpFQYSluQH7zVxxWi5W
O1R62Wz2LAd2AEMoFGRFsWOyCwvoeqeO1L5KkhLqVsALXBeW2Cdcqhu5jjzjl5Fg
rSDeCZMf9fcgv4HLYn+V4JxPDJSvB8qeEno44RfhzQ2yLzadJ6bgyE370zK5/0LE
pNbd1Tuq+cj4Wp4K5UyvbIVoI2WKxNPjj4uvVSlRdE5T4Xqp3ZopEERMdLKzGwEi
nhob7/PdJ0XQ/derDexF3D/b7uffmghuffAB3mr/GpAb4G2zQdcGLJnuwQ52B1nO
Eanf2V3rVmqKjaBDoKZk3SR9F6K6nVhM/ckmNi8DizuUUx0BlfziHATiyv7Gx/Ch
zWsM2GGisWIh4LEyQL5Cchj24uzwWsLLHP1pL6tUE7kw7cbSnsz68Fz9A0iGV1zo
9/eYAHJuWRFrZWv5GIHH65f7e/zytCyWik6vmsV3j2cr+KtS+p0jR7V6viduHhbh
XudD5u8Bk0zB0T0/QdnX
=STDX
-----END PGP SIGNATURE-----

--ukm3cz3sf3ta2uw7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
