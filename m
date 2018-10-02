From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [linux-sunxi] Re: [PATCH 08/12] drm/sun4i: sun6i_mipi_dsi:
 Refactor vertical video start delay
Date: Tue, 2 Oct 2018 15:29:46 +0200
Message-ID: <20181002132946.edwzz2bu3n563624@flea>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-9-jagan@amarulasolutions.com>
 <20180927171451.7iqt2nt2log5qojf@flea>
 <CAMty3ZDxpLwVDsgVMjX+6+uz89sQ1aZaXHHZ+-5aogrA4MHmqw@mail.gmail.com>
 <20180929152758.g3goxwjud2ym5rft@flea>
 <c6933daf-c445-ade4-a31b-f311ddae7256@openedev.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1480552163=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <c6933daf-c445-ade4-a31b-f311ddae7256@openedev.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jagan Teki <jagan@openedev.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Will Deacon <will.deacon@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============1480552163==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nezefevfeqbrgb5f"
Content-Disposition: inline


--nezefevfeqbrgb5f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 01, 2018 at 01:25:59PM +0530, Jagan Teki wrote:
> On Saturday 29 September 2018 08:57 PM, Maxime Ripard wrote:
> > On Thu, Sep 27, 2018 at 11:03:19PM +0530, Jagan Teki wrote:
> > > On Thu, Sep 27, 2018 at 10:44 PM Maxime Ripard
> > > <maxime.ripard@bootlin.com> wrote:
> > > >=20
> > > > On Thu, Sep 27, 2018 at 05:18:46PM +0530, Jagan Teki wrote:
> > > > > Accordingly to BPI-M64-bsp DE DSI code Video start delay
> > > > > can be computed by subtracting total vertical timing with
> > > > > front porch timing and with adding 1 delay line for TCON.
> > > >=20
> > > > This is what the current code is doing as well.
> > >=20
> > > The current code
> > > return mode->vtotal - (mode->vsync_end - mode->vdisplay) + 1;
> > >=20
> > > (mode->vsync_end - mode->vdisplay) =3D front porch + sync
> > >=20
> > > but I'm updating here only front porch.
> > >=20
> > > >=20
> > > > > This patch simply add the start_delay logic from BPI-M64-bsp,
> > > > > w/o this new computation, the DSI on A64 encounter vblank time ou=
t.
> > > > >=20
> > > > > [CRTC:36:crtc-0] vblank wait timed out
> > > > >=20
> > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > ---
> > > > >   drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 12 +++++++++++-
> > > > >   1 file changed, 11 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu=
/drm/sun4i/sun6i_mipi_dsi.c
> > > > > index 9918fdb990ff..217db74c6dc3 100644
> > > > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > @@ -358,7 +358,17 @@ static void sun6i_dsi_inst_init(struct sun6i=
_dsi *dsi,
> > > > >   static u16 sun6i_dsi_get_video_start_delay(struct sun6i_dsi *ds=
i,
> > > > >                                           struct drm_display_mode=
 *mode)
> > > > >   {
> > > > > -     return mode->vtotal - (mode->vsync_end - mode->vdisplay) + =
1;
> > > > > +     u32 vfp =3D mode->vsync_start - mode->vdisplay;
> > >=20
> > > let me explain this.
> > >=20
> > > Actual code from Allwinner
> > > u32 vfp =3D panel->lcd_vt - panel->lcd_y - panel->lcd_vbp;
> > >=20
> > > So,
> > >=20
> > > =3D> (panel->lcd_vt - panel->lcd_y) - (panel->lcd_vbp)
> > > =3D> (front porch + sync + back porch) - (back porch + sync)
> >=20
> > Unless Allwinner is doing something fishy, in which case that should
> > be mentionned, the back porch doesn't contain the sync pulse.
>=20
> As per as I understand panel->lcd_vbp is not back porch timings value whi=
ch
> i used by drm. It is BSP DTS property value and actual back porch is
> calculated as "panel->lcd_vbp - panel->sync"
>=20
> timmings->ver_sync_time=3D panel_info->lcd_vspw;
> timmings->ver_back_porch=3D panel_info->lcd_vbp-panel_info->lcd_vspw;

Then this is what you should have started with in your commit
log. Where is that code coming from? Have you been able to confirm
that with an oscilloscope?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nezefevfeqbrgb5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluzcskACgkQ0rTAlCFN
r3RGKQ/+MKAFwlfjgJ/YvdWDI2luHGncQPgcpERl8m1sB3/n0rQCi9rChz+ivF/B
MLz0GhbNkbjuLnxmTU/Ts1QaFZUGFk9o3nB5yft80idlxEarsr9u690OhAfqVTcK
cY3KFzFKf2Qu+dAn8AmzRC6M79cS9ovl0jNMPTRCPzX7QEE8SLhDtQR84KBNINbX
2eb/iXNVhuPkmKGOK3oVyNQtiLqnkO+yqiNy89v70UQaK6BbVkmOI98nZjw3082g
J+lc/Rw8sY/iMKUinBQ3v1UWgAgqDBc/ImNfyCzTHZSwSQ62QG65aYPXZps2nefV
MGaKRrql6K23nCUIgBTsiTk6yVXDmwTsFPsYJcQdHK27WKvxFnHZLaKTstixTchc
h06rwYWkL17ZtHBWASreMEJnd1VNjMzQLRwEbZf5wFOGdMtQMo0fuNVw7uSRc0Uo
VOH2HHkw2gGNWH1+9m0T3JVpwrfR545Cve5LFIe3fVIfWrFPkQAjG+Ctn76a3R6x
YxYeqYX7GDORQti9KXwFOC8nt92zSnyILnfCVj6Uk/NT9TKkYHtxcCrx8OLg1bB7
oviZNgd/f4FcTL1jXkkA+5yPhGHRntAqoYOl4P47C0PiyFoDUc0TrwdWTwUIpeAR
tdoEGcv9eM0qz17x8LI3gKUxL3hzW8EL818xFitvVPTOS/wltl4=
=vYGs
-----END PGP SIGNATURE-----

--nezefevfeqbrgb5f--

--===============1480552163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1480552163==--
