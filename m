From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: [PATCH net-next 0/3] enetc: Add mdio bus driver for the PCIe MDIO endpoint
Date: Tue, 23 Jul 2019 18:15:52 +0300
Message-ID: <1563894955-545-1-git-send-email-claudiu.manoil@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, alexandru.marginean@nxp.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

First patch just registers the PCIe endpoint device containing
the MDIO registers as a standalone MDIO bus driver, to allow
an alternative way to control the MDIO bus.  The same code used
by the ENETC ports (eth controllers) to manage MDIO via local
registers applies and is reused.

Bindings are provided for the new MDIO node, similarly to ENETC
port nodes bindings.

Last patch enables the ENETC port 1 and its RGMII PHY on the
LS1028A QDS board, where the MDIO muxing configuration relies
on the MDIO support provided in the first patch.


Claudiu Manoil (3):
  enetc: Add mdio bus driver for the PCIe MDIO endpoint
  dt-bindings: net: fsl: enetc: Add bindings for the central MDIO PCIe
    endpoint
  arm64: dts: ls1028a: Enable eth port1 on the ls1028a QDS board

 .../devicetree/bindings/net/fsl-enetc.txt     | 42 ++++++++-
 .../boot/dts/freescale/fsl-ls1028a-qds.dts    | 40 +++++++++
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  6 ++
 .../net/ethernet/freescale/enetc/enetc_mdio.c | 90 +++++++++++++++++++
 .../net/ethernet/freescale/enetc/enetc_pf.c   |  5 +-
 5 files changed, 179 insertions(+), 4 deletions(-)

-- 
2.17.1
