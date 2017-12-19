From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 0/6] ARM: dts: Add PHYTEC phyCORE-i.MX 6 and phyBOARD-Mira
 carrier board support
Date: Tue, 19 Dec 2017 16:49:42 +0100
Message-ID: <1513698588-13325-1-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, Stefan Riedmueller <s.riedmueller@phytec.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the PHYTEC phyCORE-i.MX 6 and phyBOARD-Mira.

Following boards are included:
phyBOARD-Mira with phyCORE-i.MX 6 Quad/Dual with:
- i.MX 6Quad/Dual SOC
- NAND or eMMC
- HDMI interface
- LVDS display interface
- Gigabit Ethernet
- USB Host
- CAN
- RS232
- PCIe
This board also contains an LVDS camera interface and parallel display
interface which are not yet supported.

phyBAORD-Mira with phyCORE-i.MX 6 DualLight/Solo with:
- i.MX 6DualLight/Solo
- NAND
- HDMI interface
- 100 MBit/s Ethernet
- USB Host
- RS232

phyBOARD-Mira with phyCORE-i.MX 6 QuadPlus with:
- i.MX 6QuadPlus SOC
- NAND
- HDMI interface
- LVDS display interface
- Gigabit Ethernet
- USB Host
- CAN
- RS232
- PCIe
This board also contains an LVDS camera interface and parallel display
interface which are not yet supported.

The entire series is based on v4.15-rc4.

Christian Hemp (2):
  ARM: dts: imx6: Add support for phyBOARD-Mira i.MX 6Quad/Dual RDK
  ARM: dts: imx6: Add support for phxBOARD-Mira i.MX 6 DualLight/Solo
    RDK

Enrico Scholz (1):
  ARM: dts: imx6: Add support for phyBOARD-Mira with i.MX 6QuadPlus

Stefan Riedmueller (3):
  ARM: dts: imx6: Add initial support for phyCORE-i.MX 6 SOM
  ARM: dts: imx6: Add initial support for phyBOARD-Mira
  ARM: imx_v6_v7_defconfig: Enable Dialog Semicondocter DA9062 driver

 arch/arm/boot/dts/Makefile                        |   4 +
 arch/arm/boot/dts/imx6dl-phytec-mira-rdk-nand.dts |  64 ++++
 arch/arm/boot/dts/imx6q-phytec-mira-rdk-emmc.dts  |  76 +++++
 arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dts  |  76 +++++
 arch/arm/boot/dts/imx6qdl-phytec-mira.dtsi        | 390 ++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi | 282 ++++++++++++++++
 arch/arm/boot/dts/imx6qp-phytec-mira-rdk-nand.dts |  76 +++++
 arch/arm/configs/imx_v6_v7_defconfig              |   4 +
 8 files changed, 972 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-phytec-mira-rdk-nand.dts
 create mode 100644 arch/arm/boot/dts/imx6q-phytec-mira-rdk-emmc.dts
 create mode 100644 arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-phytec-mira.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qp-phytec-mira-rdk-nand.dts

-- 
2.7.4
