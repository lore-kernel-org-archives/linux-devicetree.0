From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] drm/panel: simple: Add ability to override typical
 timing
Date: Wed, 7 Feb 2018 10:51:16 +0100
Message-ID: <20180207095116.GB2130@ulmo>
References: <20180206165626.37692-1-seanpaul@chromium.org>
 <20180206165626.37692-2-seanpaul@chromium.org>
 <CAL_JsqJer8ZrLyPHz=hBo9smSv7aXhtP3hOJzQojt7ofUiHo=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2127276256=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_JsqJer8ZrLyPHz=hBo9smSv7aXhtP3hOJzQojt7ofUiHo=w@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jeffy Chen <jeffy.chen@rock-chips.com>, Doug Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-Id: devicetree@vger.kernel.org


--===============2127276256==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2018 at 02:19:34PM -0600, Rob Herring wrote:
> On Tue, Feb 6, 2018 at 10:56 AM, Sean Paul <seanpaul@chromium.org> wrote:
> > This patch adds the ability to override the typical display timing for a
> > given panel. This is useful for devices which have timing constraints
> > that do not apply across the entire display driver (eg: to avoid
> > crosstalk between panel and digitizer on certain laptops). The rules are
> > as follows:
> >
> > - panel must not specify fixed mode (since the override mode will
> >   either be the same as the fixed mode, or we'll be unable to
> >   check the bounds of the overried)
> > - panel must specify at least one display_timing range which will be
> >   used to ensure the override mode fits within its bounds
> >
> > Cc: Doug Anderson <dianders@chromium.org>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: St=C3=A9phane Marchesin <marcheu@chromium.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-rockchip@lists.infradead.org
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > ---
> >  .../bindings/display/panel/simple-panel.txt        | 20 +++++++
>=20
> The binding should be a separate patch.
>=20
> >  drivers/gpu/drm/panel/panel-simple.c               | 69 ++++++++++++++=
+++++++-
> >  2 files changed, 88 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/simple-pan=
el.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> > index 16d8ff088b7d..590bbff6fc90 100644
> > --- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> > +++ b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> > @@ -7,6 +7,14 @@ Optional properties:
> >  - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
> >  - enable-gpios: GPIO pin to enable or disable the panel
> >  - backlight: phandle of the backlight device attached to the panel
> > +- override-mode: For devices which require a mode which differs from t=
he
>=20
> This is not a property, but a node so it needs its own section.
>=20
> Also, it's not real clear from display-timing.txt, but the modes
> should be grouped under a display-timings node. Looks like we haven't
> been good at enforcing that as "panel-timing" is also common when
> there's a single mode. I'd rather not have another way. With a
> standard node name, we can validate the node more easily.
>=20
> We'd lose the fact that this is explicitly an override, but I'd doubt
> Thierry is going to start letting in panels with no timings.

I was actually going to suggest the same change. I don't mind if the
name isn't explicit about this being an override. The important thing is
that we document this as being an override.

> Finally, since this is an override, is it valid to only override the
> parameters that need overriding? I don't really have an opinion either
> way. It just needs to be explicitly documented.

I've thought about that, but I think that'd be putting too much of a
burden on the panel drivers and/or display drivers. In the simplest case
it may be sufficient to restrict the pixel clock, in which case it would
be fairly easy for the driver to adjust the other parameters.

But what if you also need to restrict the porches. At some point it'll
become very difficult for the driver to automatically determine which of
the other parameters to adjust and how. Chances are that whoever needs
to deal with the restrictions already knows how to adjust the parameters
to fixup the mode.

I think this gives us a nice balance of simplicity when people don't
care (they'd just use the typical timings) and flexibility when they do
(adjust the mode to take into account display driver restrictions and
completely specify the mode if the restrictions are too complicated for
code to realistically apply them).

Thierry

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlp6zBQACgkQ3SOs138+
s6GDzw/+IN2Y3B9a4B4B3+RXHCHbO00/NWcncgFNij7PUP0YB73Yu/uS7sFMVtDz
UPcXHahdfeOI40bUTmcS8ON5XNFxuSHtz9TQz7xfUXRrFDdt3G/2bK3jK6khXjYM
E1WShZJWj6lj1KzoVgyjTy7Jmg/XSn7SF3+TstJ/4oYbyQPCQW3KvPnXZVZrrHFk
mAnD22+77LwB6uQ/Rc1cIxtA0Fq80XzMHQLEiyGglFJGINe+k7N0ehaxxq9upr4D
+SBRqowDQLVK3IgGHJE4zbuAqBRQjLWt3ZasgSm1rQ/ZaBTQbN+dnAz439adDVGh
tTEvAknl6KKfUdC3aip0MIUwhai0/DNqayFwiAeTnc/fmVKYKzrgo8+F8S3gzMJY
26h6OUiRw1oOGeHDV5nJ32BDYVks1i0eDBEaSpGZS1qCucTRuHjSJYxqRdxy/4Fk
SuL/6JoPG2L7pULhaX4yiiV1nemIvT8wzu+cRa58X4ZsjeyKGQcdVVFGHysJOIm8
vU7sFCg7BaiwYJOgDoi4+sprcMgfIQG9335+GMUoAZq3rHxO7H8hY6U+mDosVsVX
jtSa/4CQpAcPimemjkSjwW9sHt6M2wFCa5d89lV9IzQ7N3ldbQo9MJzRCVFzoU+a
MUEpS2Z8VCRjxzCn1AnDKPuTAb7Y6ZQbPoSc5EyJyFDTJSsUxaE=
=5rRd
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--

--===============2127276256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2127276256==--
