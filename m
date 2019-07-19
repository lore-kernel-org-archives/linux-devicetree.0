From: Andra Danciu <andradanciu1997@gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: fsl: pico-pi: Add a device tree for
 the PICO-PI-IMX8M
Date: Fri, 19 Jul 2019 14:49:54 +0300
Message-ID: <CAJNLGswXF8XtZKnFtzaK+7Xvs0Ygwwh4WP5PiO8Csc7pDG1vNA@mail.gmail.com>
References: <20190719104802.18070-1-andradanciu1997@gmail.com>
 <20190719104802.18070-2-andradanciu1997@gmail.com> <CAOMZO5Btu1Shou=dGRrG74e5UjHnh7NtR4+4ETK0t_1Zt48Crw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5Btu1Shou=dGRrG74e5UjHnh7NtR4+4ETK0t_1Zt48Crw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Ping Bai <ping.bai@nxp.com>, =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <Michal.Vokac@ysoft.com>, Li Yang <leoyang.li@nxp.com>, sriram.dash@nxp.com, Lucas Stach <l.stach@pengutronix.de>, Vabhav Sharma <vabhav.sharma@nxp.com>, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Pramod Kumar <pramod.kumar_1@nxp.com>, pankaj.bansal@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Richard Hu <richard.hu@technexion.com>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

I compiled with W=3D1 and you are right, they cause warning. I will remove =
them.

=C3=8En vin., 19 iul. 2019 la 14:19, Fabio Estevam <festevam@gmail.com> a s=
cris:
>
> Hi Andra,
>
> On Fri, Jul 19, 2019 at 7:48 AM andradanciu1997
> <andradanciu1997@gmail.com> wrote:
>
> > +       pmic: pmic@4b {
> > +               reg =3D <0x4b>;
> > +               compatible =3D "rohm,bd71837";
> > +               /* PMIC BD71837 PMIC_nINT GPIO1_IO12 */
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&pinctrl_pmic>;
> > +               clocks =3D <&pmic_osc>;
> > +               clock-names =3D "osc";
> > +               clock-output-names =3D "pmic_clk";
> > +               interrupt-parent =3D <&gpio1>;
> > +               interrupts =3D <3 GPIO_ACTIVE_LOW>;
> > +               interrupt-names =3D "irq";
> > +
> > +               regulators {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
>
> #address-cells and  #size-cells are not needed and they cause warnings wi=
th W=3D1:
>
>   DTC     arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb
> arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts:77.14-196.5: Warning
> (avoid_unnecessary_addr_size):
> /soc@0/bus@30800000/i2c@30a20000/pmic@4b/regulators: unnecessary
> #address-cells/#size-cells without "ranges" or child "reg" property
>
> Please remove them.
