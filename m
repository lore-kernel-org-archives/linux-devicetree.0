From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH RESEND v2 06/12] drm/sun4i: rgb: Add 1%
 tolerance to dclk frequency check when bridge is connected
Date: Wed, 6 Feb 2019 12:42:33 +0100
Message-ID: <20190206114233.GB21676@ulmo>
References: <20190203185501.8958-1-anarsoul@gmail.com>
 <20190203185501.8958-7-anarsoul@gmail.com>
 <20190204142036.vd42nvyjnjr5yeoi@flea>
 <CA+E=qVfTfJ9E29gz83tdVGx5_KGWSQVJOAxKTzC+-n7=gdj0cA@mail.gmail.com>
 <0F6CBEA4-6DB6-40F1-A2FD-65101AF64F1F@aosc.io>
 <CA+E=qVd7yh=JNZSvrfY4Diu+VJWFK6yLUJ5MavBcZ8Cftn6f-Q@mail.gmail.com>
 <20190205154156.o3aa4cy6uxenkwol@flea>
 <CA+E=qVePKnQLwObfu=ya7-GcUiUkjyFg2p-rmg=FiJJUhQBvxw@mail.gmail.com>
 <20190206091608.yvws7iyjuhw3xsdk@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0711405051=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190206091608.yvws7iyjuhw3xsdk@flea>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, dri-devel <dri-devel@lists.freedesktop.org>, Vasily Khoruzhick <anarsoul@gmail.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, arm-linux <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============0711405051==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2019 at 10:16:08AM +0100, Maxime Ripard wrote:
> On Tue, Feb 05, 2019 at 09:49:17AM -0800, Vasily Khoruzhick wrote:
> > On Tue, Feb 5, 2019 at 7:42 AM Maxime Ripard <maxime.ripard@bootlin.com=
> wrote:
> > >
> > > On Mon, Feb 04, 2019 at 10:50:17AM -0800, Vasily Khoruzhick wrote:
> > > > On Mon, Feb 4, 2019 at 8:29 AM Icenowy Zheng <icenowy@aosc.io> wrot=
e:
> > > > > >> IIRC, from the previous discussion, HDMI had a tolerancy requi=
rement
> > > > > >> in the standard. Do you know if there's such a thing for eDP? =
That
> > > > > >> would solve the issue for all the eDP displays at once.
> > > > > >
> > > > > >I don't have access to eDP standard - vesa.org says it's availab=
le to
> > > > > >members only.
> > > > >
> > > > > Try out to grab an old version?
> > > > >
> > > > > I remember 1.0 is open.
> > > >
> > > > I can't find anything regarding dot clock tolerance in DisplayPort
> > > > specification.
> > >
> > > I guess since the DP is a VESA spec, it's probably .5%, just like on
> > > the EDID (well, CVT).
> >=20
> > Unfortunately that's not enough for Pinebook. It needs 1% for 768p
> > panel.
>=20
> And that mode is stored in the EDID as a standard (or established)
> timing, or a detailed timing?
>=20
> If the latter, then it should also provide the tolerancies as part of
> the panel timing description.

The simple-panel driver can, in addition to a struct drm_display_mode
take a struct display_timings to specify the modes. These allow to
define <minimum, typical, maximum> triplets for each parameter, which
are usually found in panel datasheets.

Of course that's not going to help you much if all you have is EDID and
if that doesn't provide tolerances.

Thierry

> If the former, then what would be the advertised pixel clock and the
> one we can compute? Maybe we have a bug somewhere.
>=20
> Maxime
>=20
> --=20
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxayCkACgkQ3SOs138+
s6HaLw//cfnUhXCcsJJCytAwQVS04XgtDkElB83/mJ1JxxfMFsF/xXptZzWomwXC
BKiEFLRkGbqb2HUYHSfGsUk+rns+gB7T7sSO4QU+wCfyDamtVxdXQRLqHpE9kVN+
GGtj+ou15wVzi9whZ3v8HyKJA2lRw4A1ye/sHQvuUH/0JVoDv+31IQfrwcYad8AS
ShaIMqYEp78hQVZSB4mvbHZIZFSbk88nmzJ0wXcV+fOE67K2tz0ORqCJ8zeLJYsf
bufoG2Ooyamv0+9o3cOg+VNVZMKAiJGeT9qFlHvAxd1K7HzeAJ8jlFoy/hjSHRcC
bD38epk5CiDN+IvMTwPG0t3WgI0u7KMmSRkVbiIJ5jN2PqeBJ+sAOyqaa7WsmAWl
KT+49pjJi4cjBlkjswquf7J4OXJGhh8p96/jLxJyIqXk+93wamz7jyyYUzQx4FkK
QYgf5CNBk9Idg43ITX59trEj7VECbP3/U7EVi/UWNuFBov+CCkTwN1wDIIJl2Fjn
qbn6OP76njMZTzO4YYkEo/fgXoRBU4xNgK167wNDP1MTvrDbYYmYyae5NuKwu7zi
KAkN1ImZBq/IgA4xkR0dTSQZvWXRO8mf0XNPWrADcmg6FRWeBGuSwvlkRjgQqWI8
FOfDzT5y36v7pa9AAFC18VFUPUCHjK1L5loWyt9KzzuavD5j7+4=
=sYYT
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--

--===============0711405051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0711405051==--
