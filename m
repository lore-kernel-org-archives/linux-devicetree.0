From: Pavel Machek <pavel@ucw.cz>
Subject: exposure vs. exposure_absolute was Re: [PATCH v7 16/34] [media] add
 Omnivision OV5640 sensor driver
Date: Thu, 1 Jun 2017 10:43:20 +0200
Message-ID: <20170601084320.GA16038@amd>
References: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
 <1495672189-29164-17-git-send-email-steve_longerbeam@mentor.com>
 <20170531195821.GA16962@amd>
 <20170601082659.GJ1019@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5275355541614251345=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170601082659.GJ1019@valkosipuli.retiisi.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kerne
List-Id: devicetree@vger.kernel.org


--===============5275355541614251345==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +	/* Auto/manual exposure */
> > > +	ctrls->auto_exp =3D v4l2_ctrl_new_std_menu(hdl, ops,
> > > +						 V4L2_CID_EXPOSURE_AUTO,
> > > +						 V4L2_EXPOSURE_MANUAL, 0,
> > > +						 V4L2_EXPOSURE_AUTO);
> > > +	ctrls->exposure =3D v4l2_ctrl_new_std(hdl, ops,
> > > +					    V4L2_CID_EXPOSURE_ABSOLUTE,
> > > +					    0, 65535, 1, 0);
> >=20
> > Is exposure_absolute supposed to be in microseconds...?
>=20
> Yes. OTOH V4L2_CID_EXPOSURE has no defined unit, so it's a better fit IMO.
> Way more drivers appear to be using EXPOSURE than EXPOSURE_ABSOLUTE, too.
>=20
> Ideally we should have only one control for exposure.

No. N-o. No no no. NO! No. N-o. NONONO. No. NooooooooooOOO!!!!!!!!!!!!!

Sorry, no.

Userspace needs to know exposure times. It is not so important for a
webcam, but it is mandatory for digital camera. As it gets darker,
autogain wants to scale exposure to cca 1/100 sec, then it wants to
scale gain up to maximum, and only then it wants to continue scaling
exposure. (Threshold will be shorter in "sports" mode, perhaps
1/300sec?)

Plus, we want user to be able to manually set exposure parameters.

So... _this_ driver probably should use V4L2_CID_EXPOSURE. (If the
units are not known). But in general we'd prefer drivers using
V4L2_CID_EXPOSURE_ABSOLUTE. Your car has speedometer calibrated in
km/h or mph, not in "% of max", right?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkv06gACgkQMOfwapXb+vICfgCeMAkZtS+dSZiIkxkVr86gjRq8
YxQAn3ECZOtpiTRU+5/M9tAD4g0C5lLu
=qV/J
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

--===============5275355541614251345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============5275355541614251345==--
