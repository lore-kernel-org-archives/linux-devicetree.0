From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 4/6] drm/panel: simple: Add support for Samsung
 LSN122DL01-C01 2560x1600 panel
Date: Tue, 14 Jun 2016 10:57:49 +0200
Message-ID: <20160614085749.GB24442@ulmo.ba.sec>
References: <1465700010-13483-1-git-send-email-ykk@rock-chips.com>
 <1465700173-13671-1-git-send-email-ykk@rock-chips.com>
 <CAD=FV=VL0KgZnpjvAvYgK8rzgntKL2N0D6QbG6V0LO8vkaQkig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0979560527=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD=FV=VL0KgZnpjvAvYgK8rzgntKL2N0D6QbG6V0LO8vkaQkig@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Emil Velikov <emil.l.velikov@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============0979560527==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2016 at 10:00:45AM -0700, Doug Anderson wrote:
> Yakir,
>=20
> On Sat, Jun 11, 2016 at 7:56 PM, Yakir Yang <ykk@rock-chips.com> wrote:
> > The Samsung LSN122DL01-C01 is an 12.2" 2560x1600 (WQXGA) TFT-LCD panel
> > connected using eDP interfaces.
> >
> > Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> > ---
> > Changes in v3:
> > - Correct the size of panel_desc to active area 262mmx164mm (Emil, St=
=C3=A9phane)
> >
> > Changes in v2: None
> >
> >  drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
> > index 2d40a21..17cc973 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -1246,6 +1246,28 @@ static const struct panel_desc qd43003c0_40 =3D {
> >         .bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
> >  };
> >
> > +static const struct drm_display_mode samsung_lsn122dl01_c01_mode =3D {
> > +       .clock =3D 271560,
> > +       .hdisplay =3D 2560,
> > +       .hsync_start =3D 2560 + 48,
> > +       .hsync_end =3D 2560 + 48 + 32,
> > +       .htotal =3D 2560 + 48 + 32 + 80,
> > +       .vdisplay =3D 1600,
> > +       .vsync_start =3D 1600 + 2,
> > +       .vsync_end =3D 1600 + 2 + 5,
> > +       .vtotal =3D 1600 + 2 + 5 + 57,
> > +       .vrefresh =3D 60,
> > +};
> > +
> > +static const struct panel_desc samsung_lsn122dl01_c01 =3D {
> > +       .modes =3D &samsung_lsn122dl01_c01_mode,
> > +       .num_modes =3D 1,
> > +       .size =3D {
> > +               .width =3D 262,
> > +               .height =3D 164,
>=20
> Earlier you said that the active area of this panel was:
>=20
> > Display area     262.656(H) X 164.16(V)         (12.2=E2=80=9Ddiagonal)
>=20
> In other panels I looked at the EDID tended to round numbers, not
> truncate them.  For instance the Starry panel that I sent the patch
> for says in the manual "262.7712 (H) x 164.232 (V)" but then the EDID
> says "263 x 164".
>=20
> That would mean your width should be 263 mm, not 262 mm.

Yes, rounding is what I've also applied to all panels that I added.
While it isn't documented I hope that other panels did round, rather
than truncate, as well.

Thierry

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXX8cNAAoJEN0jrNd/PrOhba8P/0l7NNMwnlcZfJ9KRZrsJMu8
rkcZQJLg+cl95wtbPTHvsimOKN3JyhiDVvh4KhfhVPIrCjMQTS8UXzoWtC+Le/9B
G1kQIk1H/b9BJ3Y0YGkEAJZ4cQMHk7WlNewe+T8+uZhPhICQvyB0qLdqaHkFNsZb
Ae2tZKpy+eQx7vIUWr/iQ/5dzl7PzPqE4A+jre8AWJO3yARYeI4ZTJZuiNIwMEc6
xmQW6Y7gvRBYb/W+2ouD1tcXbTQxtSMZ6OC7L+sCJ0y832KK3Ztg7v9DRkDe12SN
fR3NeXfJnG0lDQbYUT1VfqQHGjZp8N9crmaGjCugmnWVmk07ILggyc+6RCmk3suN
zhfexT1XH413wvUIv7+pR7mZgh8ybuAUqewmO74neHq8+T3+wRVpQwu8z2PkWWtu
iPG05zoyvTlhlcIGO/WNTGVabO7ygbc55N1BIU9o6+US0QrO/luQfkiQMgG8DZ+f
JwuQ7d+8NXYvcjz1C2Erk/D8KtmQihcicqt4NROubyk6PeN41mBUewbsN8UB2YUa
QjZLWRnojXrcxjoLYayDUcabW1HcG57EQTU5WV+KNYPoOI74aUH6HT7wRy0RYH29
Rn1/KX26Y+FRXnqOTwr45P6K3VmjS279PPQVE3P643X8+rRMgCaXw7VM4mVHcpXH
HtoMQTpQOQBQHEo+0G9x
=sOHK
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--

--===============0979560527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0979560527==--
