From: daniel.baluta@nxp.com
Subject: [PATCH 0/2] Add support for DSP IPC protocol driver
Date: Fri, 14 Jun 2019 16:16:48 +0800
Message-ID: <20190614081650.11880-1-daniel.baluta@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: s.hauer@pengutronix.de, shengjiu.wang@nxp.com, festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com, daniel.baluta@nxp.com, daniel.baluta@gmail.com, anson.huang@nxp.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, o.rempel@pengutronix.de
List-Id: devicetree@vger.kernel.org

From: Daniel Baluta <daniel.baluta@nxp.com>

Hifi4 DSP can be found on some i.MX8 platforms (e.g i.MX8QXP, i.MX8QM).
This patch series introduces the layer that allows Host CPU to
communicate with DSP.

This layer provides a doorbell and clients can used that to notify DSP
that a message is placed somewhere in the shared memory.

The protocol used is request - reply. Usually, Host/DSP write a message
in a shared memory area and notify the other side. The other side will
also write a reply in a designated shared memory area and then ring
the doorbell to let the counterpart that a message is ready.

Daniel Baluta (2):
  firmware: imx: Add DSP IPC protocol driver
  dt-bindings: arm: fsl: Add DSP IPC binding support

 .../bindings/arm/freescale/fsl,dsp.yaml       |  43 +++++
 drivers/firmware/imx/Kconfig                  |  11 ++
 drivers/firmware/imx/Makefile                 |   1 +
 drivers/firmware/imx/imx-dsp.c                | 167 ++++++++++++++++++
 include/linux/firmware/imx/dsp.h              |  61 +++++++
 5 files changed, 283 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml
 create mode 100644 drivers/firmware/imx/imx-dsp.c
 create mode 100644 include/linux/firmware/imx/dsp.h

-- 
2.17.1
