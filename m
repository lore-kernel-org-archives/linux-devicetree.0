From: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 0/3] soc: fsl: add DPAA2 log console support
Date: Fri, 21 Dec 2018 15:31:07 +0000
Message-ID: <1545406240-3061-1-git-send-email-ioana.ciornei@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Li <leoyang.li@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Roy Pledge <roy.pledge@nxp.com>, Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch set adds support for exporting DPAA2 firmware console
logs to userspace.

The first two patches add the needed device tree node and its documentation
while the third one adds the actual platform driver.

Ioana Ciornei (3):
  arm64: dts: add dpaa2-console node for DPAA2 platforms
  Documentation: DT: Add entry for DPAA2 console
  soc: fsl: add DPAA2 console support

 .../devicetree/bindings/misc/dpaa2-console.txt     |  11 +
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   5 +
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |   5 +
 drivers/soc/fsl/Kconfig                            |  10 +
 drivers/soc/fsl/Makefile                           |   1 +
 drivers/soc/fsl/dpaa2-console.c                    | 306 +++++++++++++++++=
++++
 7 files changed, 339 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/dpaa2-console.tx=
t
 create mode 100644 drivers/soc/fsl/dpaa2-console.c

--=20
1.9.1
