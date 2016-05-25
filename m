From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 08/20] drm/sun4i: rgb: panel is an error pointer
Date: Wed, 25 May 2016 14:06:37 +0200
Message-ID: <20160525120637.GB9232@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-9-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v6485nF_e9GeANLsy2Rq1XOn4nV5wD_eWskTmL2ME316+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v6485nF_e9GeANLsy2Rq1XOn4nV5wD_eWskTmL2ME316+w@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Boris Brezillon <boris.brezillon@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 11:51:36AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Mon, May 16, 2016 at 8:47 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > In case of an error, our pointer to the drm_panel structure attached to=
 our
> > encoder will hold an error pointer, not a NULL pointer.
> >
> > Make sure we check the right thing.
> >
> > Fixes: 29e57fab97fc ("drm: sun4i: Add RGB output")
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_rgb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/=
sun4i_rgb.c
> > index 923f55039cb1..b46d2c15dc95 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
> > @@ -217,7 +217,7 @@ int sun4i_rgb_init(struct drm_device *drm)
> >         int ret;
> >
> >         /* If we don't have a panel, there's no point in going on */
> > -       if (!tcon->panel)
> > +       if (IS_ERR(tcon->panel))
>=20
> Without the next patch, tcon->panel could be the result of of_drm_find_pa=
nel(),
> which could be NULL.
>=20
> Use IS_ERR_OR_NULL here, or reorder/squash the patches.

Switched the order, and applied both, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRZVNAAoJEBx+YmzsjxAgScYP/3VJwGalUxfROi5GEWnO5yrZ
d61hx/38lp+0nwFnLsdaTo/ZfueRFY5ctn6KgeHXD6lZ4bzj7H7b/K4k5re4ZZmR
oiobnhGeihI+yQwtP4A/1O5MhSeX+hwEgc65SgiCotVCyipaJVAW9eMDMzO8UtsY
bfSDgZBV7CahVLBulFEyPW7DtgapPtRyZGqkuYIGCcK+pPoYECTHzZpxmp+QU/OD
f7DwXi5+MN757JYnqLCAQwEff4xw9OyBG0HsHZ2nFEVguDk5sw/RwWSzZzEaovss
pjsuc8WZFTN2iXxb0Z+wIC1X99V2cXCYylSmOuT/h+7OTDvfvokiAT+WYU9EhQI3
BuELHmD1PuZBEXMftfY4FLk7SxqqiPMldUj7ZOGPj7xcTfUU6cKRqAxQeSWaPM7n
EXo1m6081kDV4HZP0+6o8RsafZTsCetJiziWal5yNuGqG56ySUfU5grPcnBa+AYn
zcbfMTOwWYzI2h0Ys3Wq/v9OXIk8CEYz0VcvzQr6zi5uDBrjnvvcctBjrVSCpa2p
HkQsv5aYD80bVMkGWExeXWoezHa7TwnHuFLomg3AISV1G48B2dgyqkUe45kihrvT
xA/FEIUuP9dyLS6OlHCjEYCRAWOLaVrb3wPosiEr81HwCsfgE3xp7Jg3Dniz9BuU
XfGZuugZyTYLF5Ajwif3
=4+m5
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
