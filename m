From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: sun9i: Initial support for the Sunchip
 CX-A99 board
Date: Wed, 24 Aug 2016 21:44:21 +0200
Message-ID: <20160824194421.GT8103@lukather>
References: <9f39145aa6a46a1e130c4b91bd120eabeb7c8929.1471637309.git.ccc94453@vip.cybercity.dk>
 <ce704da79c6263a4a5048af8f8e90f22e0849188.1471637309.git.ccc94453@vip.cybercity.dk>
 <20160822185745.GC7104@lukather>
 <20160822212959.yvr7abaclynxm5ta@vip.cybercity.dk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1188320221555606783=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160822212959.yvr7abaclynxm5ta@vip.cybercity.dk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1188320221555606783==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o6aug3O60clXg2rj"
Content-Disposition: inline


--o6aug3O60clXg2rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 11:29:59PM +0200, Rask Ingemann Lambertsen wrote:
> On Mon, Aug 22, 2016 at 08:57:45PM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Sat, Aug 13, 2016 at 12:03:57AM +0200, Rask Ingemann Lambertsen wrot=
e:
> > > The Suncip CX-A99 board is found in at least four brands of TV boxes.
> > > It features an Allwinner A80 SOC, with either 2 GiB DDR3 DRAM and
> > > 16 GB eMMC or 4 GiB DDR3 DRAM and 32 GB eMMC, as well as several supp=
ort
> > > chips for Ethernet, wireless networking, video output, SATA and power
> > > management. For details, see the linux-sunxi page about the board
> > > <URL:https://linux-sunxi.org/Sunchip_CX-A99>.
> > >=20
> > > This patch only adds support for the SD and eMMC storage, real-time c=
lock,
> > > USB 2.0 ports (and by extension the SATA port), the UART port and the=
 LEDs.
> > > All of this relies on the boot loader to leave those parts powered up=
, as
> > > I'm still working on a driver for the AXP808 PMIC.
> > >=20
> > > Signed-off-by: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
> >=20
> > It looks mostly good, but I have a couple of comments though, see below.
> >=20
> > > ---
> > >=20
> > > Although the vendor U-Boot lets you boot the kernel on one of the
> > > Cortex-A15 cores, the kernel gpio-regulator driver currently glitches
> > > the GPIO lines to the OZ80120 regulator such that the system crashes
> > > during startup. This part needs further work to be useful.
> >=20
> > So it doesn't power the CPU through one of the AXP regulators?
> > Interesting design.
>=20
> The Cortex-A7 cores are powered by the dcdca regulator on the AXP 808 PMI=
C.
> Right now, I'm using the AXP 806 driver that Chen-Yu Tsai posted to drive
> the AXP 808 and so far, it looks good.

Ok.

> > > +	leds {
> > > +		compatible =3D "gpio-leds";
> > > +		pinctrl-names =3D "default";
> > > +		pinctrl-0 =3D <&led_pins_cx_a99>;
> > > +
> > > +		blue {
> > > +			gpios =3D <&pio 6 10 GPIO_ACTIVE_HIGH>;	/* PG10 */
> > > +			label =3D "cx-a99:blue:normal";
> > > +			default-state =3D "on";
> > > +		};
> > > +
> > > +		red {
> > > +			gpios =3D <&pio 6 11 GPIO_ACTIVE_HIGH>;	/* PG11 */
> > > +			label =3D "cx-a99:red:standby";
> >=20
> > The last part of the label should be the function.
>=20
> I'm not sure what else to label them. They form a bi-colour LED emitting
> through the front of the device. The stock OS lights the blue LED when
> the device is powered on and lights the red LED when the device is
> suspended. There is no label on the front of the device telling what the
> colours mean. Documentation/devicetree/bindings/leds/common.txt and
> Documentation/devicetree/bindings/leds/leds-gpio.txt don't provide much in
> the way of examples. Suggestions are welcome.

Hmmmm. status for both then?

> [snip]
> > > +
> > > +/* Each GPIO controls VBUS for a port on the GL850G hub connected to=
 ehci0;
> > > + * PL7 for port 1, the USB connector closest to the 12 V power conne=
ctor, and
> > > + * PL8 for port 2, the USB connector next to the (micro)SD card slot.
> > > + * Note: The regulators are not chained like this in reality, but
> > > + * regulator-fixed doesn't support a gpio list, and allwinner,sun9i-=
a80-usb-phy
> > > + * doesn't support more than one supply, so this will have to do (fo=
r now).
> > > + */
> > > +&reg_usb1_vbus {
> > > +	pinctrl-0 =3D <&usb1_vbus_r_pin_cx_a99>;
> > > +	gpio =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>;	/* PL7 */
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&reg_usb2_vbus {
> > > +	pinctrl-0 =3D <&usb2_vbus_r_pin_cx_a99>;
> > > +	gpio =3D <&r_pio 0 8 GPIO_ACTIVE_HIGH>;	/* PL8 */
> >=20
> > I'd really prefer it to be modelled properly, and not attached to the
> > wrong device.
> >=20
> > I have some work pending to allow multiple regulators in the same
> > property, but that won't be ready soon.
> >=20
> > For the time being, I would suggest having two usb1 regulators
> > defined, each with their respective GPIOs, and one set to always on
> > (and keep that great comment).
>=20
> Will do if I don't come up with something better. I gave it a shot to
> describe the hub as a child of ehci0 with a child node for each of the
> two ports, but it didn't work.
>=20
> Also, using the phy-supply property for the vbus-supply is an ugly hack,
> in the first place, isn't it? Shouldn't it be more like this?
>=20
> &usbphy1 {
> 	phy-supply =3D <&reg_vcc33_usbh>;
> };
>=20
> &ehci0 {
> 	vcc-supply =3D <&reg_vdd09_usbh>;
> 	phy =3D <&usbphy1>;
>=20
> 	hub@1 {
> 		port@1 {
> 			vbus-supply =3D <&reg_usb1_vbus>;
> 		}
>=20
> 		port@2 {
> 			vbus-supply =3D <&reg_usb2_vbus>;
> 		}
> 	};
> };

It looks great to me. I'm not really sure how happy the DT maintainers
are going to be about it, and how easy it would be to support without
breaking the existing users.

> It would generally be great to be able to describe regulators that should
> be kept in sync, because the Wifi+BT module's Vbat pin is supplied by two
> regulators in parallel. IIRC, Hans de Goede ran into that as well on one
> of his boards.

Yes, we got the same issue on the CHIP. I'm the one with the hot
potato, but that would require a significant rework of the regulator
framework, that I haven't had the time to do yet.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--o6aug3O60clXg2rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvfkVAAoJEBx+YmzsjxAgYKAP/iXrLArWAlHNB1LMgaOjHStp
sSHjjIoiu7kte6fvvR0sRD82i+2ph/zhtq8jsKDViMISlsVm3OlfWg9wDi8POmw/
HZpd0IoSdy8AI5ltOmnhqO76BIIP0QdIbGLy2F57RmtUgH5blCBm6xLjEn9jTQY6
mdU8SnYgrz7TEBZG1MwGq0rrFGcCnc/Ia8Zoft2YronthjRufsrJ3uJmHzIz84Qz
jnqoZkDH6v4jNH2+YGdQ3ESqOQUg1HrrrXtF5b4FgSLjIB4KsDf1AX4CU+sISRUS
yqkeFfqpRbwbE2XFO/VHYrjnDRNzcQbvY0w79aB9DS8LtXPe/edn2Nud8VwHHPew
errc1KgfA7IZSF5nlq61MkkyXJXzVM6Z0Kj/1ep8Xq+LjcVJ3lhYT8rnep6LCpqZ
dOI4QpRSyza5jSJ/BY1rNByJz6mS9ArhFiBlYwrdjg6TGiCzWmtZosAa1zO2f8xD
SbaHT4r2ysbTJmA3LI3jA33xig6r3c0KskxoyBrQUtCktxC6cIFIlxmnvyhkLR4G
ClPODCeM43csv7DGWSRvbqC2RaMCh835AeA2r3BYRzsK7gi+vlERhzSRW6SnR+uk
67bh7borNl8VRBNebQPD+5D/HPy+9k4ZMg+c9FJuGtvtbNGbAL7IksoysVsiixSr
M8YPA20OTBfkXaxXhwB/
=Lt6/
-----END PGP SIGNATURE-----

--o6aug3O60clXg2rj--


--===============1188320221555606783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1188320221555606783==--
