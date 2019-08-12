From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCH 3/4] ARM: dts: ls1021a: Remove num-lanes property from PCIe
 nodes
Date: Mon, 12 Aug 2019 04:22:27 +0000
Message-ID: <20190812042435.25102-4-Zhiqiang.Hou@nxp.com>
References: <20190812042435.25102-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812042435.25102-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>
Cc: "M.h. Lian" <minghuan.lian@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

On FSL Layerscape SoCs, the number of lanes assigned to PCIe
controller is not fixed, it is determined by the selected
SerDes protocol in the RCW (Reset Configuration Word), and
the PCIe link training is completed automatically base on
the selected SerDes protocol, and the link width set-up is
updated by hardware. So the num-lanes is not needed to
specify the link width.

The current num-lanes indicates the max lanes PCIe controller
can support up to, instead of the lanes assigned to the PCIe
controller. This can result in PCIe link training fail after
hot-reset. So remove the num-lanes to avoid set-up to incorrect
link width.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 arch/arm/boot/dts/ls1021a.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dts=
i
index 464df4290ffc..2f6977ada447 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -874,7 +874,6 @@
 			#address-cells =3D <3>;
 			#size-cells =3D <2>;
 			device_type =3D "pci";
-			num-lanes =3D <4>;
 			num-viewport =3D <6>;
 			bus-range =3D <0x0 0xff>;
 			ranges =3D <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   =
/* downstream I/O */
@@ -899,7 +898,6 @@
 			#address-cells =3D <3>;
 			#size-cells =3D <2>;
 			device_type =3D "pci";
-			num-lanes =3D <4>;
 			num-viewport =3D <6>;
 			bus-range =3D <0x0 0xff>;
 			ranges =3D <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000   =
/* downstream I/O */
--=20
2.17.1
