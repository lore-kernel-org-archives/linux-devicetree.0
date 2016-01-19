From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] [PATCH v2 16/26] drm: Add Allwinner A10 Display
 Engine support
Date: Tue, 19 Jan 2016 16:38:16 +0100
Message-ID: <20160119153816.GV4581@lukather>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-17-git-send-email-maxime.ripard@free-electrons.com>
 <1452957104.12419.12.camel@plaes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Er97KPJOrxRt+yKZ"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452957104.12419.12.camel@plaes.org>
Sender: linux-clk-owner@vger.kernel.org
To: Priit Laes <plaes@plaes.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>, Wynter Woods <wynter@nextthing.co>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org


--Er97KPJOrxRt+yKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jan 16, 2016 at 05:11:44PM +0200, Priit Laes wrote:
> > +struct drm_fbdev_cma *sun4i_framebuffer_init(struct drm_device *drm)
> > +{
> > +	drm_mode_config_reset(drm);
> > +
> > +	drm->mode_config.max_width =3D 8192;
> > +	drm->mode_config.max_height =3D 8192;
>=20
> Shouldn't these be 1920 x 1080 as per A10 User manual?

1080p is what the SoC can output. However, to create its output, it
uses a combination of planes of 8192x8192, that you'll obviously have
to crop. This is the size of the plane that we are exposing here, not
what we can output (which is listed in the various connectors).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Er97KPJOrxRt+yKZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWnlhoAAoJEBx+YmzsjxAgrk0P+wXi5H3SxRcAc3DzhtpqS5+Z
YHj0TjDAmwoTdzv9gu3evZwYGMvzSSp9yG2HfLnfErweLZdBhK6mGCKuNQblxTGi
tXXSjHl2VDdziiMdhUKAu4H+MC86YfPrDgI6QPiBZoxZzhOv/Cfws3j2CyiHZnTv
AK0yvsmgpXzRTje3lfLYiEyMtApjPeeMBBznmiKpgQwDHNydsOjKGKIUlJK4Syno
i10EEvrav8ExjkYyDKcBDxvJYbjkxsKaD6vBvQTTMLFYaEj2TFrWevZ6l1ZhO9Af
+GWL26iHFXIOYJAE8l0OcrEYHmsjy2PJnp12QLEVG+agE3/+GiC9qPfDFf6zlMpm
fdWVHOieLy4zZ4sWmxyTbd7XWvXt3jSQGcQvhXLfYEzhAk1lzPC1kCGwcYzD04oL
nnyjr9XEteColNclIbVodXWVKH/ZfSG3ENoOa5aYDnH8xbKiUBF/regMQCeO6Dxf
ZmTagx4MBsZb0+vp2s2Q90wNtVQbM0/rHqS5q4/QRvIJlZ4+jUx11ITEswJB1qQu
AljdpKQEz4n/a5GmxuA8ZjG7lXt+29+Aq9aIxDeXsXuiBr14SikPk23WtNc7OATQ
Khe0N4PkTzMfcydlDGIMcbtDKGRuF8WG/ZJG8tMqeDVBv7dfATb4VFoNW3rOP3Sh
d5ekLS84y1QOJZraW3lF
=34EX
-----END PGP SIGNATURE-----

--Er97KPJOrxRt+yKZ--
