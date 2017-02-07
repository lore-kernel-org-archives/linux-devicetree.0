From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/7] drm: Add DRM support for tiny LCD displays
Date: Tue, 7 Feb 2017 12:48:18 +0100
Message-ID: <20170207114818.GH29507@ulmo.ba.sec>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-2-noralf@tronnes.org>
 <20170206091743.GE27607@ulmo.ba.sec>
 <aad2920e-1492-3862-d977-96c40ced493d@tronnes.org>
 <20170207065852.2gxdtye74jg4ydws@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0504272574=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170207065852.2gxdtye74jg4ydws@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============0504272574==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4LFBTxd4L5NLO6ly"
Content-Disposition: inline


--4LFBTxd4L5NLO6ly
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2017 at 07:58:52AM +0100, Daniel Vetter wrote:
> On Mon, Feb 06, 2017 at 08:23:36PM +0100, Noralf Tr=C3=B8nnes wrote:
> >=20
> > Den 06.02.2017 10.17, skrev Thierry Reding:
> > > On Tue, Jan 31, 2017 at 05:03:13PM +0100, Noralf Tr=C3=B8nnes wrote:
> > > > tinydrm provides helpers for very simple displays that can use
> > > > CMA backed framebuffers and need flushing on changes.
> > > >=20
> > > > Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> > > > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > ---
> > > >=20
> > > > Changes since version 2:
> > > > - Remove fbdev after drm unregister, not before.
> > > >=20
> > > > Changes since version 1:
> > > > - Add tinydrm.rst
> > > > - Set tdev->fbdev_cma=3DNULL on unregister (lastclose is called aft=
er that).
> > > > - Remove some DRM_DEBUG*()
> > > >=20
> > > >   Documentation/gpu/index.rst                 |   1 +
> > > >   Documentation/gpu/tinydrm.rst               |  21 ++
> > > >   drivers/gpu/drm/Kconfig                     |   2 +
> > > >   drivers/gpu/drm/Makefile                    |   1 +
> > > >   drivers/gpu/drm/tinydrm/Kconfig             |   8 +
> > > >   drivers/gpu/drm/tinydrm/Makefile            |   1 +
> > > >   drivers/gpu/drm/tinydrm/core/Makefile       |   3 +
> > > >   drivers/gpu/drm/tinydrm/core/tinydrm-core.c | 377 +++++++++++++++=
+++++++++++++
> > > >   drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c | 234 +++++++++++++++=
++
> > > >   include/drm/tinydrm/tinydrm.h               | 115 +++++++++
> > > >   10 files changed, 763 insertions(+)
> > > >   create mode 100644 Documentation/gpu/tinydrm.rst
> > > >   create mode 100644 drivers/gpu/drm/tinydrm/Kconfig
> > > >   create mode 100644 drivers/gpu/drm/tinydrm/Makefile
> > > >   create mode 100644 drivers/gpu/drm/tinydrm/core/Makefile
> > > >   create mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-core.c
> > > >   create mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c
> > > >   create mode 100644 include/drm/tinydrm/tinydrm.h
> > > I realize this is totally subjective, but this feels somewhat too much
> > > of a separation. Given the helper nature of TinyDRM, I think it would=
 be
> > > more appropriate to move the helpers themselves into drm_tiny.[ch] and
> > > then maybe add a subdirectory drivers/gpu/drm/tiny that contains all =
the
> > > drivers that use the helpers.
> > >=20
> > > The separation above further shows in subsequent patches where helpers
> > > are added to tinydrm that aren't specific to TinyDRM. So this make the
> > > new helpers appear as more of a subsystem in DRM rather than a helper
> > > library. It also makes things somewhat inconsistent with existing
> > > infrastructure.
> >=20
> > What I have done with tinydrm is to do as little as possible in the
> > core helper. The minimum required to pull together
> > drm_simple_display_pipe, cma helper + fbdev and framebuffer flushing.
> >=20
> > Then I have added a set of functions that ease the writing of drivers
> > for RGB565 displays with optional backlight and regulator.
> >=20
> > Added to that is a controller library that handles register access (will
> > use regmap for non-mipi) and framebuffer flushing (set the windowing
> > registers and write the buffer to the pixel register).
> >=20
> > And at last there's the display driver that initializes the controller
> > to match a particular panel.
> >=20
> > Maybe I should narrow tinydrm to _just_ support "RGB565 displays with
> > optional backlight and regulator". It looks like I split it up to much,
> > unless someone sees a need for the core of tinydrm elsewhere.
> >=20
> > I think it's hard to avoid the subsystem smell here. These displays are
> > really simple, fbdev is more than enough to cover their needs.
> > But fbdev is closed.
> >=20
> > I'm glad you pick on this, as getting the architecture right will save
> > me maintenance down the line. I did paint me into a corner with
> > staging/fbtft and I'm not keen on repeating that (to my defence it was
> > my first C code since university and I had 2 displays that had some
> > similarities which ended up as fbtft).
>=20
> tbh I'm not sure either whether the tinydrm midlayer is good or not. But
> then it is what it says on the tin, i.e. tiny, so not much work to
> demidlayer if we notice a clear need for that change. I wouldn't worry
> about this for now, but good to keep in mind. In the end, good design is
> design that can be changed, because you'll only get it right until the
> next unforseen thing happens :-)

Agreed, there's nothing in this that couldn't easily be tweaked later
on. It's clearly drm-misc material, too, so even cross-tree dependencies
wouldn't be an issue.

Thierry

--4LFBTxd4L5NLO6ly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliZtAIACgkQ3SOs138+
s6E78g//ZkzHtE/JWhW6DfQmEo7D/4XnGO6tPp7xC9o6iMqfZTUhdf112AAKolNk
oM4a68UENLa1kY9Kr9XtmMff8xfha7XT/VdPYqG9lmM6/IFKcxyhgqWTi34n2ttR
qTEcdnXDiq2fugNs9LETano2AZRRdXfKP7osbLanj5H6yg5xkYkJ/CHJL0yv9sp3
q/VRJLVdo9h/orYeO+SWVF13hKgvI2jZnUL09Gmh1a0e+danhgThXj+OhS0ZvrjA
hhSEUOcLKar3avhxInkEwTeZRgdE5YcwTtXcbKHgLSXFFJrDzjnCVzN1RzUFYxYA
2zg0ujwiQGaiRGS7Un0AG2WsKiPn4KaB4Oq3vh+EuN9JL44Ylk3U79m9LFF60uwO
QhOebp2SNXL5zRlhFy0qCaPDy02vVnwi3enG3+MbkvlMAW6zs5ZuVAQLZe/zmGXu
OjzENd/8uBk13Vx5y2mVzB1jXUnXR5QQbOAyCa6z6l53xZYNAgeivy55lbSdU97A
+urkbSdx6vqs1Ec4ykMQ8Lngo/SFdp09LYcV29MNKFMqkusfkMGTwHrmXm6FyyMO
3eimaKHFH1n76D/5s+jxuJm3S+VatHbr+cEQFhTbdX2MiJ3+U1Et+ge5SC8GfJgF
/r9OBnsnm/DzXFaK8uD9Y64PaD7ZquyFBEUytYCv3myO1Y10qgc=
=lc+A
-----END PGP SIGNATURE-----

--4LFBTxd4L5NLO6ly--

--===============0504272574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0504272574==--
