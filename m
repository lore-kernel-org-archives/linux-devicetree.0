From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 17/39] platform: add video-multiplexer subdevice driver
Date: Tue, 18 Apr 2017 11:05:05 +0200
Message-ID: <20170418090505.GA25414@amd>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-18-git-send-email-steve_longerbeam@mentor.com>
 <20170404124732.GD3288@valkosipuli.retiisi.org.uk>
 <1492091578.2383.39.camel@pengutronix.de>
 <20170414203216.GA10920@amd>
 <1492502989.2432.23.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5137808126934820969=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1492502989.2432.23.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, jean-christophe.trotin@st.com, kernel@pe
List-Id: devicetree@vger.kernel.org


--===============5137808126934820969==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> That self-referencing mux-controls property looks a bit superfluous:
>=20
> 	mux: video-multiplexer {
> 		mux-controls =3D <&mux>;
> 	};
>=20
> Other than that, I'm completely fine with splitting the compatible into
> something like video-mux-gpio and video-mux-mmio and reusing the
> mux-gpios property for video-mux-gpio.

Agreed, I overseen that.

> > You should be able to use code in drivers/mux as a library...
>=20
> This is a good idea in principle, but this requires some rework of the
> mux subsystem, and that subsystem hasn't even landed yet. For now I'd
> like to focus on getting the DT bindings right.
>=20
> I'd honestly prefer to not add this rework as a requirement for the i.MX
> media drivers to get into staging.

Hmm. staging/ normally accepts code with bigger design problems than
that.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj11sEACgkQMOfwapXb+vJbDwCgopEMFgzPpbEIC0BHU9TwyS1c
NWYAnjd4KGUl40C8oLHre+PEbMM25sc+
=pmAS
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--

--===============5137808126934820969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============5137808126934820969==--
