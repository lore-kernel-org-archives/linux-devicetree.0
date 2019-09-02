From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Add DT bindings for Sony ACX424AKP
Date: Mon, 2 Sep 2019 16:40:06 +0200
Message-ID: <20190902144006.GB1445@ulmo>
References: <20190902090633.24239-1-linus.walleij@linaro.org>
 <20190902093517.GA12946@ulmo>
 <CACRpkdb_X+Eia=mhHrXBcBn0osMtw6bKU6uAS5AV8ASV63qBkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0520038326=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACRpkdb_X+Eia=mhHrXBcBn0osMtw6bKU6uAS5AV8ASV63qBkg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org


--===============0520038326==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 01:44:38PM +0200, Linus Walleij wrote:
> On Mon, Sep 2, 2019 at 11:35 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> > > +  dsi-command-mode:
> > > +     type: boolean
> > > +     description:
> > > +       If this is specified, the panel will be used in command
> > > +       mode instead of video mode.
> >
> > I'm not sure there's concensus on this one yet. I think so far the
> > driver decides which mode to use the panel in. Technically this falls
> > into the category of configuration, so it doesn't really belong in the
> > DT.
>=20
> The way we've used DT is for a bit of both hardware description
> and configuration I'd say, but I'm no authority on the subject.
>=20
> > I vaguely recall from discussions I've had on this subject that there's
> > usually no reason to do video mode if you can do command mode because
> > command mode is more power efficient. This was a long time ago, so I may
> > be misremembering. Perhaps you have different information on this?
>=20
> No idea. I was under the impression that video mode was preferred
> but I have no idea why.

Hm... my recollection is that command mode is only supported on "smart"
panels that have an internal framebuffer. So the commands actually
instruct the panel to update their internal framebuffer, which means you
can technically switch off the display engine when there are no updates.

Under those circumstances I think it'd make sense to default to command
mode if both the panel and the host support it and stick with video mode
if for example the host can't do command mode.

Or perhaps this is something that could be set from some userspace
policy maker via a connector property? A compositor for instance would
have a pretty good idea of what kind of activity is going on, so it
could at some point decide to switch between video mode and command mode
if one of them is more appropriate for the given workload.

Command mode can also be used to do partial updates, if I remember
correctly, which again would make it possible for a compositor to send
only a subset of a screen update.

Thierry

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1tKcYACgkQ3SOs138+
s6Getw//VlLa1RVzsDcvNquUxqbLt7fKys2ntFacTCSHS7dRHxODI3n4LQdqX4oD
RsVefgn7sFKYB4Q5/Gx+JWwcpnOlGgYhvry62RUGLLAeQdCgVdFDgFy9eVIB5lDh
yYFz4HNLOvqyjC5IZozy6n/qAYrAzDMJJ9mz5h4WJ8w+p5qyg0bT/k1PtG0iLsZW
5EzzjB7OXjqGrNUvZb0at+fK4tOz862ZXsXUY1VP+6/VKd5pWns56xLC3ZHdh1y6
yLgezbG8zHttMgxfF65EeSTVxaC1NvcNySb+aNxZFtpoyZbyLi/UHRZNjHkAdRVP
GNghtHXPZvjDaC/qrvVwyHsRiO+Pb+pMVezchyn1B2b5BeTtKzHr9bVAdX1ldlwN
w043kdBcA6lY981UYC397KsrLhbYecn25RoblZBJsevNgMBfcN7AE1/8xl3teYga
n9f3xsmExjuQsI+sDiq1phTrOU0iaZkg8zf+cYFMozThavk79l9SHc5mwkMuKjWd
jy3WapegGFnmGh/BEdwZKsVJaA2ebGCZMU+kLea1yvQKajU8fAudmDl9+XUuWmUO
3LPgVRR0SHTXcX5eWaeQVD9ckEn20nEBtWnr5ARNZbBbG7k539MF7kHAytuY+XNl
H4nc7fX6LEeAHNWFlmIZ9moJ9jslFKzIXid3RIdZqL4YtWZi2fM=
=JVKc
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--

--===============0520038326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0520038326==--
