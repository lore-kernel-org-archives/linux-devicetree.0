From: <shh.xie@gmail.com>
Subject: [PATCH 00/10] [v3] arm64: dts: add QorIQ LS1046A SoC and boards
 support
Date: Tue, 13 Sep 2016 16:09:53 +0800
Message-ID: <1473754203-22970-1-git-send-email-shh.xie@gmail.com>
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
To: devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com, shawnguo@kernel.org, linux-kernel@vger.kernel.org
Cc: Shaohui Xie <Shaohui.Xie@nxp.com>, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

From: Shaohui Xie <Shaohui.Xie@nxp.com>

This patchest adds support for QorIQ LS1046A SoC which is based on ARMv8
architecture, also adds LS1046A-RDB and LS1046A-QDS board support.

Also, updates bindings for SoC-specific devices SCFG and DCFG,
I2C devices, qoriq-clock and ahci-fsl-qoriq.

Mingkai Hu (2):
  arm64: dts: add QorIQ LS1046A SoC support
  arm64: dts: add LS1046A-RDB board support

Shaohui Xie (8):
  dt-bindings: fsl: update for more SoCs
  dt-bindings: fsl: updates bindings for some SoC-specific devices
  dt-bindings: i2c: adds two more nxp devices
  dt-bindings: qoriq-clock: update for more SoCs
  dt-bindings: ahci-fsl-qoriq: updated for SoC ls1046a
  Documentation: DT: Add entry for QorIQ LS1046A-RDB board
  Documentation: DT: Add entry for QorIQ LS1046A-QDS board
  arm64: dts: add LS1046A-QDS board support

 Documentation/devicetree/bindings/arm/fsl.txt      |  34 +-
 .../devicetree/bindings/ata/ahci-fsl-qoriq.txt     |   2 +-
 .../devicetree/bindings/clock/qoriq-clock.txt      |   3 +
 .../devicetree/bindings/i2c/trivial-devices.txt    |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts  | 212 +++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  | 150 ++++++
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     | 515 +++++++++++++++++++++
 8 files changed, 916 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi

-- 
2.1.0.27.g96db324
