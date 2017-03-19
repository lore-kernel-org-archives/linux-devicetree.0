From: Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Sun, 19 Mar 2017 10:45:15 -0400
Message-ID: <1489934715.3388.3.camel@ndufresne.ca>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <20170318192258.GL21222@n2100.armlinux.org.uk>
 <aef6c412-5464-726b-42f6-a24b7323aa9c@mentor.com>
 <20170318204324.GM21222@n2100.armlinux.org.uk>
 <1489884074.21659.7.camel@ndufresne.ca>
 <20170319095558.GP21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5297626668664957667=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170319095558.GP21222@n2100.armlinux.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, Steve Longerbeam <steve_longerbeam@mentor.com>, shuah@kernel.org, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sud
List-Id: devicetree@vger.kernel.org


--===============5297626668664957667==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-8suDICeG6cZZUITLgfbs"


--=-8suDICeG6cZZUITLgfbs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 19 mars 2017 =C3=A0 09:55 +0000, Russell King - ARM Linux a
=C3=A9crit=C2=A0:
> 2) would it also make sense to allow gstreamer's v4l2src to try
> setting
> =C2=A0=C2=A0 a these parameters, and only fail if it's unable to set it?=
=C2=A0 IOW,
> if
> =C2=A0=C2=A0 I use:
>=20
> gst-launch-1.0 v4l2src device=3D/dev/video10 ! \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0video/x-bayer,format=3DRG=
GB,framerate=3D20/1 ! ...
>=20
> =C2=A0=C2=A0 where G_PARM says its currently configured for 25fps, but a =
S_PARM
> =C2=A0=C2=A0 with 20fps would actually succeed.

In current design, v4l2src will "probe" all possible formats, cache
this, and use this information for negotiation. So after the caps has
been probed, there will be no TRY_FMT or anything like this happening
until it's too late. You have spotted a bug though, it should be
reading back the parm structure to validate (and probably produce a
not-negotiated error here).

Recently, specially for the IMX work done by Pengutronix, there was
contributions to enhance this probing to support probing capabilities
that are not enumerable (e.g. interlacing, colorimetry) using TRY_FMT.
There is no TRY_PARM in the API to implement similar fallback. Also,
those ended up creating a massive disaster for slow cameras. We now
have UVC cameras that takes 6s or more to start. I have no other choice
but to rewrite that now. We will negotiate the non-enumerable at the
last minute with TRY_FMT (when the subset is at it's smallest). This
will by accident add support for this camera interface, but that wasn't
the goal. It would still fail with application that enumerates the
possible resolutions and framerate and let you select them with a drop-
down (like cheese). In general, I can only conclude that making
everything that matter enumerable is the only working way to go for
generic userspace.=20

Nicolas
--=-8suDICeG6cZZUITLgfbs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAljOmXsACgkQcVMCLawGqBzywACfaIGyd8AYyF0WDYPjUiUxtedm
ZAQAnAw6U05Pq1IHpxA7QAE1FEee7TXL
=GsI+
-----END PGP SIGNATURE-----

--=-8suDICeG6cZZUITLgfbs--


--===============5297626668664957667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============5297626668664957667==--
