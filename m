From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 07/39] ARM: dts: imx6qdl-sabrelite: remove erratum
 ERR006687 workaround
Date: Fri, 10 Mar 2017 22:57:32 +0100
Message-ID: <20170310215731.GB6540@amd>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <1489121599-23206-8-git-send-email-steve_longerbeam@mentor.com>
 <9f5d0ac4-0602-c729-5c00-1d9ef49247c1@boundarydevices.com>
 <CAOMZO5BNrSEyrbWbCBCbsy4yTrh4AHfk2Too0qHuffxqUCgADg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1022279382234541401=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAOMZO5BNrSEyrbWbCBCbsy4yTrh4AHfk2Too0qHuffxqUCgADg@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, Nick Dyer <nick@shmanahar.org>, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, Steve Longerbeam <steve_longerbeam@mentor.com>, Robert Jarzmik <robert.jarzmik@free.fr>, devel@driverdev.osuosl.org, markus.heiser@darmarit.de, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, shuah@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Steve Longerbeam <slongerbeam@gmail.com>, linux-media <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, mchehab@kernel.org, Troy Kisky <troy.kisky@boundarydevices.com>, bparrot@ti.com, "robh+dt@kernel.org" <robh+dt@kernel.org>, horms+ren
List-Id: devicetree@vger.kernel.org


--===============1022279382234541401==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2017-03-10 16:17:28, Fabio Estevam wrote:
> On Fri, Mar 10, 2017 at 3:59 PM, Troy Kisky
> <troy.kisky@boundarydevices.com> wrote:
> > On 3/9/2017 8:52 PM, Steve Longerbeam wrote:
> >> There is a pin conflict with GPIO_6. This pin functions as a power
> >> input pin to the OV5642 camera sensor, but ENET uses it as the h/w
> >> workaround for erratum ERR006687, to wake-up the ARM cores on normal
> >> RX and TX packet done events. So we need to remove the h/w workaround
> >> to support the OV5642. The result is that the CPUidle driver will no
> >> longer allow entering the deep idle states on the sabrelite.
> >>
> >> This is a partial revert of
> >>
> >> commit 6261c4c8f13e ("ARM: dts: imx6qdl-sabrelite: use GPIO_6 for FEC
> >>                       interrupt.")
> >> commit a28eeb43ee57 ("ARM: dts: imx6: tag boards that have the HW work=
around
> >>                       for ERR006687")
> >>
> >> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> >> ---
> >>  arch/arm/boot/dts/imx6qdl-sabrelite.dtsi | 4 ----
> >>  1 file changed, 4 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/=
dts/imx6qdl-sabrelite.dtsi
> >> index 8413179..89dce27 100644
> >> --- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> >> +++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> >> @@ -270,9 +270,6 @@
> >>       txd1-skew-ps =3D <0>;
> >>       txd2-skew-ps =3D <0>;
> >>       txd3-skew-ps =3D <0>;
> >
> > How about
> >
> > +#if !IS_ENABLED(CONFIG_VIDEO_OV5642)

dts is supposed to be hardware description.

> Or maybe just create a new device tree for using the camera, like
> imx6q-sabrelite-camera.dts.

And it should not depend on configuration. Hardware vendor should be
able to ship board with working device tree...

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljDIUsACgkQMOfwapXb+vK6eQCfalP+qOUXROn/DqpnUJ1m+F+K
gesAnjzHVrD23JJklCM2vSrD4uDreyPU
=Ttsd
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--

--===============1022279382234541401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============1022279382234541401==--
