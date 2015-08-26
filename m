From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] of/irq: export of_get_irq_byname()
Date: Wed, 26 Aug 2015 09:40:17 +0200
Message-ID: <20150826074017.GA9479@katana>
References: <20150826000402.GA5042@dtor-ws>
 <20150826102425.2dab3a6f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150826102425.2dab3a6f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jeremy Linton <lintonrjeremy@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Vignesh R <vigneshr@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 10:24:25AM +1000, Stephen Rothwell wrote:
> Hi Dmitry,
>=20
> On Tue, 25 Aug 2015 17:04:02 -0700 Dmitry Torokhov <dmitry.torokhov@gmail=
=2Ecom> wrote:
> >
> > Similarly to of_get_irq(), let's export of_irq_get_byname(), so if a bu=
s core
> > can be compiled as a module (such as I2C) it can have access to the sym=
bol.
> >=20
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Reported-by: kbuild test robot <fengguang.wu@intel.com>
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>=20
> I applied that to linux-next today.  Pelase get it applied to the i2c
> tree (with appropriate acks).

Waiting for Rob's Ack, then I'll pick it up...


--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV3W1hAAoJEBQN5MwUoCm21WUP/R/lKf9msm2GtWfRWqmPF2DF
W9Jb4qMY2hmz2OruyTAzzPYrNryrcHtFjjoFN+KFRHsd/Wxbnk+XF1yCQGO2Xbnk
XlOctuiFk2gP9gzcvYtzNGzeBLq5S97oCQBgsTe/ilgdh4mKp6+VuB7LvLV1R+/T
J5P6A8cUNI3tGbQLupnkXsOAY6tVyABneGvxa+VJiTzu3eZdM9nyvJPJP2D0dNRl
nZ3kxneyJNvfTbbSn4OYIWOeA0Qfde/Ka5BBUgeXf0oIyxjjMXUYzJt+fhDw600q
XloC4OIOQDYmoj90UMUWoqYPlM0ZdDlmRwbYaQeiU1N9X4xGJ3nEG99DXGqEyidH
GCwkZgzt5UjHsYsq2vroc6m1XYjBJ9S89Whaxy27y30EO1Kliuzl7Fbg59/IL2h4
2bQD+h/7mfxsXDcspO2oEZTD5H86Pxh9lWcSbcwFGRyZo251gMKd7HmHtNu8PeXv
ZHhToqcCalTPFSwkU5KLhSO6JldVIBAaDBwmJzmIDrVoH+dWpmKZl3vxn/mdK2ij
tt/rOTO7NPVwK22hA2n+AKj/yfxqSSLPbmc4JzEdIzU8UHmdHT5XnrK8Xz5y4ZS5
9Covy+qpoc1V3L2nfsR4E3WkDNOhMN0Ap2BGU5FcRs4CLJTKOZXpJt3RndY9GWwi
6C+WgDaRSdquu16rkEWv
=dquJ
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
