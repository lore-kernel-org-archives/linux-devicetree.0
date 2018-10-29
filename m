From: Rajan Vaja <RAJANV@xilinx.com>
Subject: RE: [PATCH v3 0/4] drivers: soc: xilinx: Add support for ZynqMP power
 domain driver
Date: Mon, 29 Oct 2018 14:27:18 +0000
Message-ID: <BYAPR02MB40556D3EDE9892943073662DB7F30@BYAPR02MB4055.namprd02.prod.outlook.com>
References: <1538688221-9823-1-git-send-email-jollys@xilinx.com>
 <BL2PR02MB2130719D4A82F429745DDBEEB8E00@BL2PR02MB2130.namprd02.prod.outlook.com>
 <20181012145251.GA6489@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012145251.GA6489@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, Michal Simek <michals@xilinx.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jolly Shah <JOLLYS@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: 12 October 2018 08:23 PM
> To: Jolly Shah <JOLLYS@xilinx.com>
> Cc: matthias.bgg@gmail.com; andy.gross@linaro.org; shawnguo@kernel.org;
> geert+renesas@glider.be; bjorn.andersson@linaro.org; sean.wang@mediatek.c=
om;
> m.szyprowski@samsung.com; Michal Simek <michals@xilinx.com>;
> mark.rutland@arm.com; devicetree@vger.kernel.org; Rajan Vaja
> <RAJANV@xilinx.com>; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v3 0/4] drivers: soc: xilinx: Add support for ZynqMP =
power
> domain driver
>=20
> On Wed, Oct 10, 2018 at 06:41:44PM +0000, Jolly Shah wrote:
> > Ping for comments
>=20
> Please see my comments on other ZynqMP firmware patches. In summary, I
> need to see a complete binding, not piecemeal additions.
[Rajan] Based on your suggestion to have complete zynqmp firmware binding, =
we can
have two options:

1. Use firmware node instead of having separate subnodes for dependent
drivers(genpd, reset, nvmem, etc). In this case, firmware driver
needs to take care of probing of depedent drivers. We have thought of
MFD approach to probe depedent drivers. Firmware driver would register
depedent drivers as MFD child devices from firmware probe.=20

	firmware {
		zynqmp_firmware: zynqmp-firmware {
			compatible =3D "xlnx,zynqmp-firmware";
			method =3D "smc";
			#power-domain-cells =3D <1>;
		};
	};

	sata {
		...
		power-domains =3D <&zynqmp_firmware 2>;
		...
	};

drivers/firmware/xilinx/zynqmp.c: zynqmp_firmware_probe(struct platform_dev=
ice *pdev)
	static const struct mfd_cell firmware_devs[] =3D {
		{
			.name =3D "zynqmp_power_controller",
		},
	};

	ret =3D mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE, firmware_devs,
				ARRAY_SIZE(firmware_devs), NULL, 0, NULL);

2. Keep separate node for each device outside (in parralel to) zynqmp-firmw=
are node.
In this case, each firmware driver consumer is independet driver/binding.
Order of probe can be taken care by -EPROBE defer mechanism.

Example:
	firmware {
		zynqmp_firmware: zynqmp-firmware {
			compatible =3D "xlnx,zynqmp-firmware";
			method =3D "smc";
		};
	};
	=09
	zynqmp_power_domains: zynqmp-power-domains {
		...
		compatible =3D "xlnx,zynqmp-genpd";
		#power-domain-cells =3D <1>;
		...
	};

	sata {
		...
		power-domains =3D <&zynqmp_power_domains 2>;
		...
	};

Please let us know your inputs and suggest better approach so we can submit
changes accordingly.

Thanks,
Rajan
>=20
> Rob
>=20
> >
> > Thanks,
> > Jolly Shah
> >
> > > -----Original Message-----
> > > From: Jolly Shah [mailto:jolly.shah@xilinx.com]
> > > Sent: Thursday, October 04, 2018 2:24 PM
> > > To: matthias.bgg@gmail.com; andy.gross@linaro.org; shawnguo@kernel.or=
g;
> > > geert+renesas@glider.be; bjorn.andersson@linaro.org;
> > > sean.wang@mediatek.com; m.szyprowski@samsung.com; Michal Simek
> > > <michals@xilinx.com>; robh+dt@kernel.org; mark.rutland@arm.com
> > > Cc: Rajan Vaja <RAJANV@xilinx.com>; devicetree@vger.kernel.org; linux=
-arm-
> > > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Jolly Shah
> > > <JOLLYS@xilinx.com>
> > > Subject: [PATCH v3 0/4] drivers: soc: xilinx: Add support for ZynqMP =
power
> > > domain driver
> > >
> > > The zynqmp power domain driver communicates the usage requirements fo=
r
> > > logical power domains / devices to the platform FW.
> > > FW is responsible for choosing appropriate power states, taking Linux=
' usage
> > > information into account.
> > >
> > > This patch series is based on top of Xilinx firmware patch set:
> > > https://patchwork.kernel.org/cover/10555405/
> > >
> > > v3:
> > >  - Changed binding to have FW node as a power controller as suggested=
 by Rob
> > >  - Updated FW driver to register it as mfd child devices from firmwar=
e probe
> > >  - Move bindings location as suggested
> > >
> > > v2:
> > >  - Rebased on top of latest firmware driver patch series
> > >  - Updated driver name from zynqmp-genpd to zynqmp-power-controller
> > >  - Updated device tree bindings to move power controller node under f=
irmware
> > > node
> > >
> > > Jolly Shah (1):
> > >   drivers: soc: xilinx: Add ZynqMP power domain driver
> > >
> > > Rajan Vaja (3):
> > >   dt-bindings: power: Add ZynqMP power domain bindings
> > >   firmware: xilinx: Add APIs to control node status/power
> > >   firmware: xilinx: Add node IDs for zynqmp firmware
> > >
> > >  .../bindings/power/xlnx,zynqmp-genpd.txt           |  34 ++
> > >  drivers/firmware/xilinx/Kconfig                    |   1 +
> > >  drivers/firmware/xilinx/zynqmp.c                   |  73 ++++
> > >  drivers/soc/xilinx/Kconfig                         |   9 +
> > >  drivers/soc/xilinx/Makefile                        |   2 +
> > >  drivers/soc/xilinx/zynqmp_pm_domains.c             | 403
> > > +++++++++++++++++++++
> > >  include/dt-bindings/power/xlnx-zynqmp-power.h      |  39 ++
> > >  include/linux/firmware/xlnx-zynqmp.h               |  98 +++++
> > >  8 files changed, 659 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/power/xlnx,zynq=
mp-
> > > genpd.txt
> > >  create mode 100644 drivers/soc/xilinx/zynqmp_pm_domains.c
> > >  create mode 100644 include/dt-bindings/power/xlnx-zynqmp-power.h
> > >
> > > --
> > > 2.7.4
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
