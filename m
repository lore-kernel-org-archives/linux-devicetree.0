From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v6 08/13] drm/sun4i: add support for Allwinner DE2 mixers
Date: Fri, 5 May 2017 14:36:18 +0200
Message-ID: <20170505123618.5vztqx2vdwsgnrxt@lukather>
References: <20170504114858.9008-1-icenowy@aosc.io>
 <20170504114858.9008-9-icenowy@aosc.io>
 <20170504130535.6nokhni5a3uxwy66@lukather>
 <522ab8cb2939f0017917c5e9b4065089@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rdd474nc5zdn4qvo"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <522ab8cb2939f0017917c5e9b4065089@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
To: icenowy@aosc.io
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--rdd474nc5zdn4qvo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2017 at 12:50:51AM +0800, icenowy@aosc.io wrote:
> > > +void sun8i_mixer_layer_enable(struct sun8i_mixer *mixer,
> > > +				int layer, bool enable)
> > > +{
> > > +	u32 val;
> > > +	/* Currently the first UI channel is used */
> > > +	int chan =3D mixer->cfg->vi_num;
> > > +
> > > +	DRM_DEBUG_DRIVER("Enabling layer %d in channel %d\n", layer, chan);
> > > +
> > > +	if (enable)
> > > +		val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
> > > +	else
> > > +		val =3D 0;
> > > +
> > > +	regmap_update_bits(mixer->engine.regs,
> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
> > > +
> > > +	/* Set the alpha configuration */
> > > +	regmap_update_bits(mixer->engine.regs,
> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK,
> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_DEF);
> > > +	regmap_update_bits(mixer->engine.regs,
> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK,
> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_DEF);
> > > +}
> >=20
> > This one too.
>=20
> It's called from sun8i_layer.c, so it cannot be static.

Fair enough.

> > > +	/* Set base coordinates */
> > > +	DRM_DEBUG_DRIVER("Layer coordinates X: %d Y: %d\n",
> > > +			 state->crtc_x, state->crtc_y);
> > > +	regmap_write(mixer->engine.regs,
> > > +		     SUN8I_MIXER_CHAN_UI_LAYER_COORD(chan, layer),
> > > +		     SUN8I_MIXER_COORD(state->crtc_x, state->crtc_y));
> >=20
> > X and Y are fixed point numbers. You want to keep only the higher 16
> > bits there.
>=20
> Do you mean "lower 16 bits"? Thus should I (x & 0xffff) or ((u16)x) ?

Nevermind, I got confused with src_x and src_y.

> P.S. The negative coordinates are broken, how should I deal with it? or
> is the coordinates promised to be not negative?

Adjust the buffer base address, and use a shorter line. You have such
an example in the sun4i code.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rdd474nc5zdn4qvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZDHG+AAoJEBx+YmzsjxAgO9cQAK9kXxS/kNWO3WHz2hX95Z/m
BgKVkA7y+zogtPpoSvpznOeg5QbadtTXRiu3cB1kDAyyChrCzKYkVTqlp/vyxNKE
tuuAXbn/nkhqZoJQk+WyIUiQMlTNMHV39oVA/xoyayo/DaWPRgVuiosvdtJ12FtN
Y5h5Kw88+76/eLgoQzfDKYWecPlzit6aw+N1bNGKbdB7N1dWW9fWo9GwEJp6gIqf
BC8nrkvuJkP90b5nnwEO7OZFApHC+DyOnGfi0sSTrK7kmFrDy/rt5PKfxDzmYp3p
nGpKNUa7iOyyGZIGsxoAQ+uLeeXA0e6UUfZir3zpEyN78C0yDEImUsvALKG1vLMH
SotRtrNtx+NdXmdbQPhSDROKCF/bU9Gdz4z+yJHSBOSbRYdHfwYxcPztS+J/MBEL
KeWJmmrjk6XInNkTuAbUFf2szn0SvMLRWYm/Ga+DtoNnWa3UBlIb04cqNJu9uVJt
6vS/VI3JQZYktSl4Lqn49kA7XC1eZwDQWvl6cCFhDPvYTyIWWpMreckV6g01S8c4
tXYvVSZ6ZORd3dZzVNfSUt53zoPfbwaZueD6KIny1XMdwmBIw/icnG5FqhulMfEE
GuwBIAX3mclJe2+mAnG6/GupUK2NhWUJPcPCRBGVFwh/Pqdyx7pzKcDYtOzIXg6v
vp8YJdflTaurqmhAS4wr
=9oMy
-----END PGP SIGNATURE-----

--rdd474nc5zdn4qvo--
