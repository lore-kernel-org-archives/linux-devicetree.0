Return-Path: <SRS0=UQXi=OK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr760087.outbound.protection.outlook.com ([40.107.76.87]:27323
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725867AbeLAL1G (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 1 Dec 2018 06:27:06 -0500
From: Jolly Shah <JOLLYS@xilinx.com>
Subject: FW: [PATCH 0/9] dt-bindings: Firmware node binding for ZynqMP core
Date: Sat, 1 Dec 2018 00:15:53 +0000
Message-ID: <SN4PR0201MB35369DC2171EC7744096EDA5B8AC0@SN4PR0201MB3536.namprd02.prod.outlook.com>
References: <1542412619-387-1-git-send-email-jollys@xilinx.com>
 <DM5PR0201MB35255E725459B3CE05A7402DB8D70@DM5PR0201MB3525.namprd02.prod.outlook.com>
In-Reply-To: <DM5PR0201MB35255E725459B3CE05A7402DB8D70@DM5PR0201MB3525.namprd02.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

Below patchset shows complete firmware binding as you suggested. It has all=
 firmware API users as child nodes to firmware node
In this case, firmware driver needs to take care of probing of dependent dr=
ivers. We have thought of MFD approach to probe dependent drivers. Firmware=
 driver would register
dependent drivers as MFD child devices from firmware probe.  Let me know if=
 that is fine.

Optionally other way is to keep separate node for each device outside (in p=
arallel to) zynqmp-firmware node.
In this case, each firmware driver consumer is independent driver/binding. =
Order of probe can be taken care by -EPROBE defer mechanism.

Please review and let us know your feedback.

Thanks,
Jolly Shah

-----Original Message-----
From: Jolly Shah=20
Sent: Monday, November 26, 2018 1:40 PM
To: 'Jolly Shah' <jolly.shah@xilinx.com>; robh+dt@kernel.org; mark.rutland@=
arm.com
Cc: Michal Simek <michals@xilinx.com>; Rajan Vaja <RAJANV@xilinx.com>; Nava=
 kishore Manne <navam@xilinx.com>; linux-arm-kernel@lists.infradead.org; li=
nux-kernel@vger.kernel.org; devicetree@vger.kernel.org
Subject: RE: [PATCH 0/9] dt-bindings: Firmware node binding for ZynqMP core

Ping for comments

> -----Original Message-----
> From: Jolly Shah [mailto:jolly.shah@xilinx.com]
> Sent: Friday, November 16, 2018 3:57 PM
> To: robh+dt@kernel.org; mark.rutland@arm.com
> Cc: Michal Simek <michals@xilinx.com>; Rajan Vaja <RAJANV@xilinx.com>;=20
> Nava kishore Manne <navam@xilinx.com>; linux-arm-=20
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org;=20
> devicetree@vger.kernel.org; Jolly Shah <JOLLYS@xilinx.com>
> Subject: [PATCH 0/9] dt-bindings: Firmware node binding for ZynqMP=20
> core
>=20
> Base firmware node and clock child node binding are part of mainline kern=
el.
> This patchset adds documentation to describe rest of the firmware=20
> child node bindings.
> Complete firmware DT node example is shown below for ease of understandin=
g:
>=20
> firmware {
> 	zynqmp_firmware: zynqmp-firmware {
> 		compatible =3D "xlnx,zynqmp-firmware";
> 		method =3D "smc";
> 		#power-domain-cells =3D <1>;
> 		#reset-cells =3D <1>;
>=20
> 		zynqmp_clk: clock-controller {
> 			#clock-cells =3D <1>;
> 			compatible =3D "xlnx,zynqmp-clk";
> 			clocks =3D <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>,=20
> <&aux_ref_clk>, <&gt_crx_ref_clk>;
> 			clock-names =3D "pss_ref_clk", "video_clk",=20
> "pss_alt_ref_clk","aux_ref_clk", "gt_crx_ref_clk";
> 		};
>=20
> 		zynqmp_power: zynqmp-power {
> 			compatible =3D "xlnx,zynqmp-power";
> 			interrupts =3D <0 35 4>;
> 		};
>=20
> 		nvmem_firmware {
> 			compatible =3D "xlnx,zynqmp-nvmem-fw";
> 			#address-cells =3D <1>;
> 			#size-cells =3D <1>;
>=20
> 			/* Data cells */
> 			soc_revision: soc_revision {
> 				reg =3D <0x0 0x4>;
> 			};
> 		};
>=20
> 		afi0: afi0 {
> 			compatible =3D "xlnx,afi-fpga";
> 			config-afi =3D <0 2>, <1 1>, <2 1>;
> 		};
>=20
> 		qspi: spi@ff0f0000 {
> 			compatible =3D "xlnx,zynqmp-qspi-1.0";
> 			clock-names =3D "ref_clk", "pclk";
> 			clocks =3D <&misc_clk &misc_clk>;
> 			interrupts =3D <0 15 4>;
> 			interrupt-parent =3D <&gic>;
> 			num-cs =3D <1>;
> 			reg =3D <0x0 0xff0f0000 0x1000>,<0x0 0xc0000000
> 0x8000000>;
> 		};
>=20
> 		serdes: zynqmp_phy@fd400000 {
> 			compatible =3D "xlnx,zynqmp-psgtr";
> 			status =3D "okay";
> 			reg =3D <0x0 0xfd400000 0x0 0x40000>, <0x0 0xfd3d0000
> 0x0 0x1000>,
> 				<0x0 0xff5e0000 0x0 0x1000>;
> 			reg-names =3D "serdes", "siou", "lpd";
>=20
> 			lane0: lane@0 {
> 				#phy-cells =3D <4>;
> 			};
> 			lane1: lane@1 {
> 				#phy-cells =3D <4>;
> 			};
> 			lane2: lane@2 {
> 				#phy-cells =3D <4>;
> 			};
> 			lane3: lane@3 {
> 				#phy-cells =3D <4>;
> 			};
> 		};
>=20
> 		pinctrl_uart1_default: uart1-default {
> 			mux {
> 				groups =3D "uart0_4_grp";
> 				function =3D "uart0";
> 			};
>=20
> 			conf {
> 				groups =3D "uart0_4_grp";
> 				slew-rate =3D <SLEW_RATE_SLOW>;
> 				io-standard =3D <IO_STANDARD_LVCMOS18>;
> 			};
>=20
> 			conf-rx {
> 				pins =3D "MIO18";
> 				bias-high-impedance;
> 			};
>=20
> 			conf-tx {
> 				pins =3D "MIO19";
> 				bias-disable;
> 				schmitt-cmos =3D <PIN_INPUT_TYPE_CMOS>;
> 			};
> 		};
> 		zynqmp-r5-remoteproc@0 {
> 			compatible =3D "xlnx,zynqmp-r5-remoteproc-1.0";
> 			reg =3D <0x0 0xFFE00000 0x0 0x10000>,
> 				<0x0 0xFFE20000 0x0 0x10000>,
> 				<0x0 0xff340000 0x0 0x100>;
> 			reg-names =3D "tcm_a", "tcm_b", "ipi";
> 			dma-ranges;
> 			core_conf =3D "split0";
> 			memory-region =3D <&rproc_0_fw_reserved>,
> 					<&rproc_0_dma_reserved>;
> 			tcm-pnode-id =3D <0xf>, <0x10>;
> 			rpu-pnode-id =3D <0x7>;
> 			interrupt-parent =3D <&gic>;
> 			interrupts =3D <0 29 4>;
> 		};
> 	};
> };
>=20
> Jolly Shah (2):
>   dt-bindings: phy: Add dt bindings for ZynqMP PHY
>   dt-bindings: fpga: Add binding doc for the afi config driver
>=20
> Nava kishore Manne (2):
>   dt-bindings: reset: Add bindings for ZynqMP reset driver
>   dt-bindings: nvmem: Add bindings for ZynqMP nvmem driver
>=20
> Rajan Vaja (4):
>   dt-bindings: power: Add ZynqMP power domain bindings
>   dt-bindings: soc: Add ZynqMP PM bindings
>   dt-bindings: pinctrl: Add ZynqMP pin controller bindings
>   dt-bindings: spi: zynqmp: Move SPI node under zynqmp firmware
>=20
> Wendy Liang (1):
>   dt-bindings: remoteproc: Add Xilinx R5 rproc binding
>=20
>  .../devicetree/bindings/fpga/xlnx,afi-fpga.txt     |  67 +++++
>  .../bindings/nvmem/xlnx,zynqmp-nvmem.txt           |  44 ++++
>  .../devicetree/bindings/phy/phy-zynqmp.txt         | 126 ++++++++++
>  .../bindings/pinctrl/xlnx,zynqmp-pinctrl.txt       | 272 +++++++++++++++=
++++++
>  .../bindings/power/reset/xlnx,zynqmp-power.txt     |  25 ++
>  .../bindings/power/xlnx,zynqmp-genpd.txt           |  34 +++
>  .../remoteproc/xlnx,zynqmp-r5-remoteproc.txt       |  81 ++++++
>  .../bindings/reset/xlnx,zynqmp-reset.txt           | 148 +++++++++++
>  .../devicetree/bindings/spi/spi-zynqmp-qspi.txt    |  22 +-
>  include/dt-bindings/power/xlnx-zynqmp-power.h      |  39 +++
>  10 files changed, 850 insertions(+), 8 deletions(-)  create mode=20
> 100644 Documentation/devicetree/bindings/fpga/xlnx,afi-fpga.txt
>  create mode 100644=20
> Documentation/devicetree/bindings/nvmem/xlnx,zynqmp-
> nvmem.txt
>  create mode 100644=20
> Documentation/devicetree/bindings/phy/phy-zynqmp.txt
>  create mode 100644=20
> Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-
> pinctrl.txt
>  create mode 100644
> Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.txt
>  create mode 100644=20
> Documentation/devicetree/bindings/power/xlnx,zynqmp-
> genpd.txt
>  create mode 100644
> Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5-
> remoteproc.txt
>  create mode 100644=20
> Documentation/devicetree/bindings/reset/xlnx,zynqmp-
> reset.txt
>  create mode 100644 include/dt-bindings/power/xlnx-zynqmp-power.h
>=20
> --
> 2.7.4
