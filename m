From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 19/39] media: Add i.MX media core driver
Date: Wed, 5 Apr 2017 13:32:56 +0200
Message-ID: <20170405113256.GB26831@amd>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-20-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1871377030588613475=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1490661656-10318-20-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org


--===============1871377030588613475==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!


> +https://boundarydevices.com/products/nit6x_5mp

I'd use /product/ in url, as it redirects there.

> +https://boundarydevices.com/product/nit6x_5mp_mipi

=2E.and for consistency.

> +The following example configures a direct conversion pipeline to capture
> +from the OV5640, transmitting on MIPI CSI-2 virtual channel 1. $sensorfmt
> +can be any format supported by the OV5640. $sensordim is the frame
> +dimension part of $sensorfmt (minus the mbus pixel code). $outputfmt can
> +be any format supported by the ipu1_ic_prpenc entity at its output pad:
> +
> +.. code-block:: none
> +
> +   # Setup links
> +   media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> +   media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> +   media-ctl -l "'ipu1_csi1':1 -> 'ipu1_ic_prp':0[1]"
> +   media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
> +   media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]"
> +   # Configure pads
> +   media-ctl -V "'ov5640 1-003c':0 [fmt:$sensorfmt field:none]"
> +   media-ctl -V "'imx6-mipi-csi2':2 [fmt:$sensorfmt field:none]"
> +   media-ctl -V "'ipu1_csi1':1 [fmt:AYUV32/$sensordim field:none]"
> +   media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/$sensordim field:none]"
> +   media-ctl -V "'ipu1_ic_prpenc':1 [fmt:$outputfmt field:none]"
> +
> +Streaming can then begin on "ipu1_ic_prpenc capture" node. The v4l2-ctl
> +tool can be used to select any supported YUV or RGB pixelformat on the
> +capture device node.

Nothing for you to fix here, but we should really create some
library-like interface for media-ctl.=20
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljk1egACgkQMOfwapXb+vJ5IgCggCvxfyD4R6Us7FPjxi32EFmg
D/AAnju+IxNVTY0XcTGrgbp0gHmNfQbv
=5k4J
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--

--===============1871377030588613475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============1871377030588613475==--
