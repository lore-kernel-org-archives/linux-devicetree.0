From: Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [v4 0/6] platform: dwc: Adding DesignWare MIPI CSI-2 Host and D-PHY
Date: Tue, 11 Jun 2019 21:20:49 +0200
Message-ID: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, robh@kernel.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joao.Pinto@synopsys.com, Luis Oliveira <Luis.Oliveira@synopsys.com>
List-Id: devicetree@vger.kernel.org

This adds support for Synopsys MIPI CSI-2 Host and MIPI D-PHY.
The patch series include support for initialization/configuration of the
DW MIPI CSI-2 controller and the DW MIPI D-PHY and both include a reference
platform driver and the option to use platform data. The optional sysfs
interface is used to re-configure the controller and the phy for
prototyping purposes.

This series also documents the dt-bindings needed for the platform drivers.
This will enable future SoCs to use this standard approach to Synopsys
DesignWare CSI-2 and D-PHY and hopefully create a more clean environment.

This series are following an old series submitted on v4.19.rc1 and are
result of all the feedback received, please check the changelog per patch.

This was applied in: https://git.linuxtv.org/media_tree.git

Luis Oliveira (6):
  dt-bindings: media: Document bindings for DW MIPI CSI-2 Host
  media: platform: dwc: Add MIPI CSI-2 controller driver
  media: platform: dwc: Add MIPI CSI-2 platform data
  dt-bindings: phy: Document the Synopsys MIPI DPHY Rx bindings
  media: platform: dwc: Add DW MIPI DPHY Rx driver
  media: platform: dwc: Add platform data support to D-Phy

 .../devicetree/bindings/media/snps,dw-csi.txt      |  41 ++
 .../devicetree/bindings/phy/snps,dw-dphy-rx.txt    |  29 +
 MAINTAINERS                                        |  11 +
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   2 +
 drivers/media/platform/dwc/Kconfig                 |  41 ++
 drivers/media/platform/dwc/Makefile                |  15 +
 drivers/media/platform/dwc/dw-csi-plat.c           | 516 +++++++++++++++++
 drivers/media/platform/dwc/dw-csi-plat.h           |  97 ++++
 drivers/media/platform/dwc/dw-csi-sysfs.c          | 624 +++++++++++++++++++++
 drivers/media/platform/dwc/dw-dphy-plat.c          | 224 ++++++++
 drivers/media/platform/dwc/dw-dphy-rx.c            | 611 ++++++++++++++++++++
 drivers/media/platform/dwc/dw-dphy-rx.h            | 212 +++++++
 drivers/media/platform/dwc/dw-dphy-sysfs.c         | 232 ++++++++
 drivers/media/platform/dwc/dw-mipi-csi.c           | 569 +++++++++++++++++++
 drivers/media/platform/dwc/dw-mipi-csi.h           | 287 ++++++++++
 include/media/dwc/dw-csi-data.h                    |  26 +
 include/media/dwc/dw-dphy-data.h                   |  32 ++
 include/media/dwc/dw-mipi-csi-pltfrm.h             | 104 ++++
 19 files changed, 3674 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-csi.txt
 create mode 100644 Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
 create mode 100644 drivers/media/platform/dwc/Kconfig
 create mode 100644 drivers/media/platform/dwc/Makefile
 create mode 100644 drivers/media/platform/dwc/dw-csi-plat.c
 create mode 100644 drivers/media/platform/dwc/dw-csi-plat.h
 create mode 100644 drivers/media/platform/dwc/dw-csi-sysfs.c
 create mode 100644 drivers/media/platform/dwc/dw-dphy-plat.c
 create mode 100644 drivers/media/platform/dwc/dw-dphy-rx.c
 create mode 100644 drivers/media/platform/dwc/dw-dphy-rx.h
 create mode 100644 drivers/media/platform/dwc/dw-dphy-sysfs.c
 create mode 100644 drivers/media/platform/dwc/dw-mipi-csi.c
 create mode 100644 drivers/media/platform/dwc/dw-mipi-csi.h
 create mode 100644 include/media/dwc/dw-csi-data.h
 create mode 100644 include/media/dwc/dw-dphy-data.h
 create mode 100644 include/media/dwc/dw-mipi-csi-pltfrm.h

-- 
2.7.4
