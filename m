From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [PATCH 0/3] ARM: dts: imx: Update Boundary Devices boards
Date: Fri, 13 Jul 2018 14:49:01 +0200
Message-ID: <20180713124904.9285-1-gary.bisson@boundarydevices.com>
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
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: s.hauer@pengutronix.de, stefan@agner.ch, Gary Bisson <gary.bisson@boundarydevices.com>, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This series udpates the device tree files for all Boundary Devices
boards.

It consists of two main changes:
1. Switch to SPDX identifier
2. Update boards relying on MXSFB driver not to block the switch to DRM
driver instead of FBDEV [1].

Let me know if you have any question.

Regards,
Gary

[1] https://patchwork.kernel.org/patch/10467487/

Gary Bisson (3):
  ARM: dts: imx: Switch Boundary Devices boards to SPDX identifier
  ARM: dts: imx7d-nitrogen7: use OF graph to describe the display
  ARM: dts: imx6sx-nitrogen6sx: remove obsolete display configuration

 arch/arm/boot/dts/imx6dl-nit6xlite.dts        |  38 +-----
 arch/arm/boot/dts/imx6dl-nitrogen6x.dts       |  38 +-----
 arch/arm/boot/dts/imx6q-nitrogen6_max.dts     |  38 +-----
 arch/arm/boot/dts/imx6q-nitrogen6_som2.dts    |  38 +-----
 arch/arm/boot/dts/imx6q-nitrogen6x.dts        |  38 +-----
 arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi      |  38 +-----
 arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi  |  38 +-----
 arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi |  38 +-----
 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi     |  38 +-----
 arch/arm/boot/dts/imx6qp-nitrogen6_max.dts    |  39 +------
 arch/arm/boot/dts/imx6qp-nitrogen6_som2.dts   |  39 +------
 arch/arm/boot/dts/imx6sx-nitrogen6sx.dts      | 109 +-----------------
 arch/arm/boot/dts/imx7d-nitrogen7.dts         |  87 +++-----------
 13 files changed, 28 insertions(+), 588 deletions(-)

-- 
2.18.0
