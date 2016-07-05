From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/3] ARM: dts: imx6sx: Add UDOO Neo support
Date: Tue, 5 Jul 2016 20:33:53 +0200
Message-ID: <20160705183353.GQ16643@pengutronix.de>
References: <1467691450-22975-1-git-send-email-afaerber@suse.de>
 <1467691450-22975-3-git-send-email-afaerber@suse.de>
 <CAOMZO5CQWz++TVKBKEMSQuyks3C+7Tx5=Frh6R+Qubcab=EbjA@mail.gmail.com>
 <577BBC4B.5040903@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <577BBC4B.5040903@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Fabio Estevam <festevam@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Ettore Chimenti <ettore.chimenti@udoo.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 05, 2016 at 03:55:23PM +0200, Andreas F=E4rber wrote:
> Hi Fabio,
>=20
> Am 05.07.2016 um 14:04 schrieb Fabio Estevam:
> > On Tue, Jul 5, 2016 at 1:04 AM, Andreas F=E4rber <afaerber@suse.de>=
 wrote:
> >=20
> >> +/dts-v1/;
> >> +
> >> +#include "imx6sx-udoo-neo.dtsi"
> >> +
> >> +/ {
> >> +       model =3D "UDOO Neo Basic";
> >=20
> > This should be something like:
> >=20
> > model =3D "Udoo i.MX6 SoloX UDOO Neo Basic";
>=20
> Why should anyone use such a weird concatenation of names? If you wan=
ted
> "UDOO Neo Basic (based on i.MX 6SoloX)" that would be more
> understandable, but there is no UDOO Neo Basic board with another SoC=
:
>=20
> http://www.udoo.org/udoo-neo/
>=20
> imx6dl-udoo.dts uses "Udoo i.MX6 Dual-lite Board" and
> imx6q-udoo.dts  uses "Udoo i.MX6 Quad Board".

Ack, I'm OK with "UDOO Neo Basic" et al, too.

> > [ discussion about what to use for compatible ]
> However, "udoo,neo-basic", "udoo,neo", "fsl,imx6sx" should be suffici=
ent
> since unlike the Quad/Dual situation there is no SoC variation here. =
Or
> "seco,udoo-neo"? "udoo,udoo-neo" looks duplicate.

I'd use

	"udoo,neo-basic", "fsl,imx6sx";

> >> +&fec1 {
> >> +       pinctrl-names =3D "default";
> >> +       pinctrl-0 =3D <&pinctrl_enet1>;
> >> +       phy-mode =3D "rmii";
> >> +       phy-reset-gpios =3D <&gpio5 4 GPIO_ACTIVE_HIGH>;
> >=20
> > Shouldn't this be GPIO_ACTIVE_LOW instead?
>=20
> Hm, network worked okay for me like this, how do we verify?
>=20
> Schematics are here: http://www.udoo.org/other-resources/

The phy's RST# pin is connected to a signal that routes to ENET1_CRS /
C7. That corresponds to GPIO2_IO01.

Also that's what is used in "my" device tree that was created by a
colleague who probably took udoo's dts as reference.

Regarding the question how to verify that:

	barebox@Freescale i.MX6 SoloX UDOO NEO Board:/ ifup eth0
	eth0: 100Mbps full duplex link detected
	T DHCP client bound to address 192.168.24.110

	barebox@Freescale i.MX6 SoloX UDOO NEO Board:/ ping 192.168.23.4
	host 192.168.23.4 is alive

	barebox@Freescale i.MX6 SoloX UDOO NEO Board:/ gpio_direction_output 3=
3 0

	barebox@Freescale i.MX6 SoloX UDOO NEO Board:/ ping 192.168.23.4
	eth0: transmission timeout
	T eth0: transmission timeout
	T eth0: transmission timeout
	T eth0: transmission timeout
	T eth0: transmission timeout
	T eth0: transmission timeout
	ping failed: Connection timed out

	barebox@Freescale i.MX6 SoloX UDOO NEO Board:/ gpio_direction_output 3=
3 1

	barebox@Freescale i.MX6 SoloX UDOO NEO Board:/ ping 192.168.23.4
	host 192.168.23.4 is alive

So I'd say the right thing to do is:

	phy-reset-gpios =3D <&gpio2 1 GPIO_ACTIVE_LOW>;

And as the fec driver ignores the flag (for historic reasons), the only
other correct possibility is:

	phy-reset-gpios =3D <&gpio2 1 GPIO_ACTIVE_HIGH>;
	phy-reset-active-high;

which is wrong here though.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
