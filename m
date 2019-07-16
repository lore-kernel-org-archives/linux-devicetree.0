From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v2 00/15] arm64: dts: imx8: architecture improvement and
 adding imx8qm support
Date: Tue, 16 Jul 2019 23:14:34 +0800
Message-ID: <1563290089-11085-1-git-send-email-aisheng.dong@nxp.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, dongas86@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

IMX SCU based platforms (e.g. MX8QM/MX8QXP) are comprised of a number of SS
(Subsystems), those SS may be shared between different SoCs while most of them
can be reused like Devices Resources, Clocks, Power domains and etc.

This patch series aims to improve the MX8 architecture to comply with the HW
design to save a lot of duplicated codes and benefits us a better
maintainability and scalability in the future.

This patch series depends on another clk new binding series:
[v3,00/11] clk: imx8: add new clock binding for better pm support
https://patchwork.kernel.org/cover/11046287/

NOTE: for the missing undocumented compatible strings for the new SoC IMX8QM
in this patch series. It will be sent in another patch series later.

ChangeLog:
v1->v2:
 * change to the new two cells scu clock binding, so original adding scu clocks
   patches were removed.
 * Move scu pd node above clk node

Dong Aisheng (15):
  arm64: dts: imx8qxp: add fallback compatible string for scu pd
  arm64: dts: imx8qxp: move scu pd node before scu clock node
  arm64: dts: imx8qxp: orginize dts in subsystems
  arm64: dts: imx8: add lsio lpcg clocks
  arm64: dts: imx8: add conn lpcg clocks
  arm64: dts: imx8: add adma lpcg clocks
  arm64: dts: imx8: switch to two cell scu clock binding
  arm64: dts: imx8: switch to new lpcg clock binding
  arm64: dts: imx8qm: add lsio ss support
  arm64: dts: imx8qm: add conn ss support
  arm64: dts: imx8: split adma ss into dma and audio ss
  arm64: dts: imx8qm: add dma ss support
  arm64: dts: imx: add imx8qm common dts file
  arm64: dts: imx: add imx8qm mek support
  arm64: defconfig: add imx8qm mek support

 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi    |   7 +
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    | 185 ++++++++++
 arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi     |  19 +
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     | 205 +++++++++++
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi    | 294 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 144 ++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  |  21 ++
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |  50 +++
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi  |  61 ++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          | 179 +++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   6 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi |  37 ++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi |  21 ++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi |  61 ++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         | 401 ++-------------------
 arch/arm64/configs/defconfig                       |   1 +
 17 files changed, 1311 insertions(+), 382 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-mek.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi

-- 
2.7.4
