From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 10/15] drm/sun4i: tcon: Switch mux on only for composite
Date: Thu, 9 Mar 2017 11:58:00 +0100
Message-ID: <20170309105800.mnzhvnky6na7d5vn@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <3f70bcfe2ec03188c06d54a262d49ad91963a510.1488876832.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67iTOV-=u5rReu6_wi6NFoCoJkbJKshTpmFYUmJ=ggKUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0308952126=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v67iTOV-=u5rReu6_wi6NFoCoJkbJKshTpmFYUmJ=ggKUw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============0308952126==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tjnporxfnr2vegbc"
Content-Disposition: inline


--tjnporxfnr2vegbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 11:51:39AM +0800, Chen-Yu Tsai wrote:
> On Tue, Mar 7, 2017 at 4:56 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Even though that mux is undocumented, it seems like it needs to be set =
to 1
> > when using composite, and 0 when using HDMI.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
> > index d2335f109601..93249c5ab1e4 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -268,11 +268,16 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon=
, struct drm_encoder *encoder,
> >                            SUN4I_TCON_GCTL_IOMAP_MASK,
> >                            SUN4I_TCON_GCTL_IOMAP_TCON1);
> >
> > +       if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_TVDAC)
> > +               val =3D 1;
> > +       else
> > +               val =3D 0;
> > +
> >         /*
> >          * FIXME: Undocumented bits
> >          */
> >         if (tcon->quirks->has_unknown_mux)
> > -               regmap_write(tcon->regs, SUN4I_TCON_MUX_CTRL_REG, 1);
> > +               regmap_write(tcon->regs, SUN4I_TCON_MUX_CTRL_REG, val);
>=20
> We might want to do this the other way around, i.e. exporting
>=20
>     int sun4i_tcon_mux_set(struct drm_device *drm, int encoder_type,
>                            int pipeline)
>=20
> and have downstream encoders call it. For the A31, the mux is not exclusi=
vely
> used for channel 1; there is a mux setting for MIPI DSI as well, but AFAIK
> DSI is connected to channel 0.

We could make it part of sun4i_tcon_channel_enable too, though. What
do you think?

> Additionally, the mux registers are only valid in the first TCON, meaning
> it must available be active in 2 pipeline chips. It's also why we'd pass
> "struct drm_device *" instead of "struct sun4i_tcon *".

Hmmmm. That's going to be tricky to support. Has this been confirmed
somehow? Is the register used for something else on TCON1?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tjnporxfnr2vegbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYwTU4AAoJEBx+YmzsjxAgs/EP/j9uIG7h7/zm9pyYdUNemM+D
P/nBXGzhtsigHxcaDQlGpQ8+yerxSnJLso8d/NXrC4Qf4qvsXl0av1G7daWPL7zU
0s4y9xJo8D0DJ7u//GVA+hpY7BNoabTzRDlOKdzLV0Uqjrlgac8uyxcd1ZHldvr6
hA9/61Oai7Bd4m22gz4+90PERa3NcmkJPUHIOnVFfsGQYq3YbY2bHEq6w3Fkklzt
AuMuBS2tzYy0ArX06fmn4ruoAFzxmYXMXkAd7b9cJSaU8vPDsx4q+iZCYduDGiHV
Kfg2Jn+H5WX9wQdLbdgS8+TAkARbJw4DvBAjWifcxdJoacgvM3OV3Q6OiQB8G41t
WIldQocPpVdFkO4beulKadbGVUhanRGC+IktyR46YRUAe8wpA61FzBMRtcA0gMJ+
jvt+dVJWfIGx3rg2R64gh96+QA+tuvajaBv29IseyMNoaaZNalw0tLfVZMSYYFP7
/em8DvbbbbN6yGDH0dFa0n6e/pK/bItjjReO6SsD0MlxAljU4Odf47YuZIXRbiXT
n/ZKU3CQjUfOghXVyFO2aZ5QLETPtp2NeYJsa0wrrpl8KUw7/YcJOreshwjsZiUQ
glAI/x6qC9OILYFGUDnajzk+eCU78Jff/i5ce6QdTHNl0mcwFiuIVkBBnOie/jm7
C20ZNe11q2tvUooKed/g
=9cmZ
-----END PGP SIGNATURE-----

--tjnporxfnr2vegbc--

--===============0308952126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0308952126==--
