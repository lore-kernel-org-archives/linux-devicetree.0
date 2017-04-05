From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 17/39] platform: add video-multiplexer subdevice driver
Date: Wed, 5 Apr 2017 20:05:00 +0200
Message-ID: <20170405180500.GA30408@amd>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-18-git-send-email-steve_longerbeam@mentor.com>
 <20170405111857.GA26831@amd>
 <1491393519.2904.40.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0079288279166808232=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1491393519.2904.40.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, shuah@kernel.org, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, linux@armlinux.org.uk, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, p.zabel@pengutronix.de, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, arnd@arndb.de, Sascha Hauer <s.hauer@pengutronix.de>, tiffany.lin@mediatek.com, bparrot@ti.com, laurent.pinchart+renesas@ideasonboard.com, horms+renesas@verge.net.au, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, jean-christophe.trotin@st.com, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org


--===============0079288279166808232==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-04-05 13:58:39, Lucas Stach wrote:
> Am Mittwoch, den 05.04.2017, 13:18 +0200 schrieb Pavel Machek:
> > Hi!
> >=20
> > > + * video stream multiplexer controlled via gpio or syscon
> > > + *
> > > + * Copyright (C) 2013 Pengutronix, Sascha Hauer <kernel@pengutronix.=
de>
> > > + * Copyright (C) 2016 Pengutronix, Philipp Zabel <kernel@pengutronix=
=2Ede>
> >=20
> > This is actually quite interesting. Same email address for two
> > people...
> >=20
> > Plus, I believe this wants to say that copyright is with Pengutronix,
> > not Sascha and Philipp. In that case you probably want to list
> > copyright and authors separately?
> >=20
> Nope, copyright doesn't get transferred to the employer within the rules
> of the German "Urheberrecht", but stays at the original author of the
> code.

Ok, then I guess it should be

Copyright (C) 2013 Sascha Hauer
Work sponsored by Pengutronix, use <kernel@pengutronix.de> as contact addre=
ss

or something? I know license change is not on the table, but I guess
it is good to get legal stuff right.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljlMcwACgkQMOfwapXb+vKkWACbBnPa3cgyEKxN1tS7o3P6D/1Y
QHsAmwYhI79b2BZk9g22pr1jAsIF4UDo
=Cfym
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

--===============0079288279166808232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============0079288279166808232==--
