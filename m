From: Andra Danciu <andradanciu1997@gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: fsl: pico-pi: Add a device tree for
 the PICO-PI-IMX8M
Date: Fri, 19 Jul 2019 13:20:40 +0300
Message-ID: <CAJNLGsxvTmoBjfj82i3Fc5v7WUiw7XYtXg8nQNHZ_xdtuB711Q@mail.gmail.com>
References: <20190718121628.23991-1-andradanciu1997@gmail.com>
 <20190718121628.23991-2-andradanciu1997@gmail.com> <CAOMZO5B-9+JnbfrTWP8GTuc0VcnDDPEZq-iXGbYVx9a6O9gwRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5B-9+JnbfrTWP8GTuc0VcnDDPEZq-iXGbYVx9a6O9gwRg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, Li Yang <leoyang.li@nxp.com>, sriram.dash@nxp.com, Lucas Stach <l.stach@pengutronix.de>, pankaj.bansal@nxp.com, Ping Bai <ping.bai@nxp.com>, Pramod Kumar <pramod.kumar_1@nxp.com>, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Richard Hu <richard.hu@technexion.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

Please find my answers inline:

=C3=8En vin., 19 iul. 2019 la 02:05, Fabio Estevam <festevam@gmail.com> a s=
cris:
>
> Hi Andra,
>
> On Thu, Jul 18, 2019 at 9:16 AM Andra Danciu <andradanciu1997@gmail.com> =
wrote:
> >
> > From: Richard Hu <richard.hu@technexion.com>
>
> Please put a few words about the board and a link to its webpage, if avai=
lable.
OK
>
> > The current level of support yields a working console and is able to bo=
ot
> > userspace from NFS or init ramdisk.
> >
> > Additional subsystems that are active :
> >         - Ethernet
> >         - USB
> >
> > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > Signed-off-by: Richard Hu <richard.hu@technexion.com>
> > Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile       |   1 +
> >  arch/arm64/boot/dts/freescale/pico-pi-8m.dts | 417 +++++++++++++++++++=
++++++++
> >  2 files changed, 418 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/pico-pi-8m.dts
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/d=
ts/freescale/Makefile
> > index c043aca66572..538422903e8a 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -26,3 +26,4 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-librem5-devkit.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-zii-ultra-rmb3.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-zii-ultra-zest.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8qxp-mek.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D pico-pi-8m.dtb
>
> The convention we use with imx dtbs is to put the SoC name first, so
> that would become:
>
> imx8mq-pico-pi.dtb
Will do.
>
>
> > +&iomuxc {
>
> Please place iomuxc node as the last one.
Will do.
>
> > +&fec1 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_fec1 &pinctrl_enet_3v3>;
> > +       phy-mode =3D "rgmii-id";
> > +       pinctrl-assert-gpios =3D <&gpio1 0 GPIO_ACTIVE_HIGH>;
>
> This property does not exist.
OK, I will remove it.
>
> > +       phy-handle =3D <&ethphy0>;
> > +       fsl,magic-packet;
> > +       status =3D "okay";
> > +
> > +       mdio {
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +
> > +               ethphy0: ethernet-phy@1 {
> > +                       compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                       reg =3D <1>;
> > +                       at803x,led-act-blind-workaround;
> > +                       at803x,eee-disabled;
>
> These two properties do not exist.
OK, I will remove them.
>
> > +&i2c1 {
> > +       clock-frequency =3D <100000>;
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_i2c1>;
> > +       status =3D "okay";
> > +
> > +       pmic: pmic@4b {
> > +               reg =3D <0x4b>;
> > +               compatible =3D "rohm,bd71837";
> > +               /* PMIC BD71837 PMIC_nINT GPIO1_IO12 */
> > +               pinctrl-0 =3D <&pinctrl_pmic>;
>
> pinctrl-names =3D "default" is missing
OK, will add.
>
> > +               gpio_intr =3D <&gpio1 3 GPIO_ACTIVE_LOW>;
>
> This is not documented.
>
> Please look at Documentation/devicetree/bindings/regulator/rohm,bd71837-r=
egulator.txt
> for the valid bindings and also at
> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts for a
> reference for adding the BD71837 support.
OK, will do.
>
> > +&A53_0 {
> > +       operating-points =3D <
> > +               /* kHz    uV */
> > +               1500000 1000000
> > +               1300000 1000000
> > +               1000000 900000
> > +               800000  900000
>
> This is not needed as these operating points are already specified at
> imx8mq.dtsi.
OK, I will remove it.
