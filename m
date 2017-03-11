From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Sat, 11 Mar 2017 22:52:56 +0100
Message-ID: <20170311215256.GB7319@amd>
References: <20170303230645.GR21222@n2100.armlinux.org.uk>
 <20170304131329.GV3220@valkosipuli.retiisi.org.uk>
 <a7b8e095-a95c-24bd-b1e9-e983f18061c4@xs4all.nl>
 <20170310130733.GU21222@n2100.armlinux.org.uk>
 <c679f755-52a6-3c6f-3d65-277db46676cc@xs4all.nl>
 <20170310140124.GV21222@n2100.armlinux.org.uk>
 <cc8900b0-c091-b14b-96f4-01f8fa72431c@xs4all.nl>
 <20170310125342.7f047acf@vento.lan>
 <20170310223714.GI3220@valkosipuli.retiisi.org.uk>
 <20170311082549.576531d0@vento.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4390350252364448376=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170311082549.576531d0@vento.lan>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Sakar
List-Id: devicetree@vger.kernel.org


--===============4390350252364448376==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > The rationale is that we should support the simplest use cases first.
> > >=20
> > > In the case of the first MC-based driver (and several subsequent
> > > ones), the simplest use case required MC, as it was meant to suport
> > > a custom-made sophisticated application that required fine control
> > > on each component of the pipeline and to allow their advanced
> > > proprietary AAA userspace-based algorithms to work. =20
> >=20
> > The first MC based driver (omap3isp) supports what the hardware can do,=
 it
> > does not support applications as such.
>=20
> All media drivers support a subset of what the hardware can do. The
> question is if such subset covers the use cases or not.
>=20
> The current MC-based drivers (except for uvc) took a patch to offer a
> more advanced API, to allow direct control to each IP module, as it was
> said, by the time we merged the OMAP3 driver, that, for the N9/N900 camera
> to work, it was mandatory to access the pipeline's individual components.
>=20
> Such approach require that some userspace software will have knowledge
> about some hardware details, in order to setup pipelines and send controls
> to the right components. That makes really hard to have a generic user
> friendly application to use such devices.

Well. Even if you propagate controls to the right components, there's
still a lot application needs to know about the camera
subsystem. Focus lengths, for example. Speed of the focus
coil. Whether or not aperture controls are available. If they are not,
what is the fixed aperture.

Dunno. Knowing what control to apply on what subdevice does not look
like the hardest part of camera driver. Yes, it would be a tiny bit
easier if I would have just one device to deal with, but.... fcam-dev
has cca 20000 lines of C++ code.=20

> In the case of V4L2 controls, when there's no subdev API, the main
> driver (e. g. the driver that creates the /dev/video nodes) sends a
> multicast message to all bound I2C drivers. The driver(s) that need=20
> them handle it. When the same control may be implemented on different
> drivers, the main driver sends a unicast message to just one
> driver[1].

Dunno. There's quite common to have two flashes. In that case, will
application control both at the same time?

> There's nothing wrong with this approach: it works, it is simpler,
> it is generic. So, if it covers most use cases, why not allowing it
> for usecases where a finer control is not a requirement?

Because the resulting interface is quite ugly?

> That's why I'm saying that I'm OK on merging any patch that would allow
> setting controls via the /dev/video interface on MC-based drivers when
> compiled without subdev API. I may also consider merging patches allowing

So.. userspace will now have to detect if subdev is available or not,
and access hardware in different ways?

> > The original plan was and continues to be sound, it's just that there h=
ave
> > always been too few hands to implement it. :-(
>=20
> If there are no people to implement a plan, it doesn't matter how good
> the plan is, it won't work.

If the plan is good, someone will do it.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljEcbgACgkQMOfwapXb+vLiuACaA4ug1ecxWltybd0Y5axUgnMM
n5oAoLSBjGXnr+dwuZjfxVniw0KD5o4N
=EXFm
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--

--===============4390350252364448376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============4390350252364448376==--
