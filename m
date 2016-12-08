From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH 0/5] arm64: dts: ls1012a: add the DTS node for QSPI/DSPI
 support
Date: Thu, 8 Dec 2016 17:22:59 +0800
Message-ID: <1481188984-43683-1-git-send-email-yao.yuan@freescale.com>
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
To: shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, computersforpeace@gmail.com, dwmw2@infradead.org
Cc: devicetree@vger.kernel.org, yao.yuan@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Yuan Yao <yao.yuan@nxp.com>

LS1012A also support QSPI and DSPI.
This patch set is used to add the QSPI/DSPI node for LS1012A.

This patch set is depend on the patch for add LS1012A platform dts support:
arm64: Add DTS support for FSL's LS1012A SoC

The patchwork link:
https://patchwork.kernel.org/patch/9462399/

Yuan Yao (5):
  arm64: dts: ls1012a: add the DTS node for DSPI support
  Documentation: fsl: dspi: Add fsl,ls1012a-dspi compatible string
  Documentation: dt: mtd: add chip support for "jedec, spi-nor"
  arm64: dts: ls1012a: add the DTS node for QSPI support
  Documentation: fsl-quadspi: Add fsl,ls1012a-qspi compatible string

 .../devicetree/bindings/mtd/fsl-quadspi.txt        |  1 +
 .../devicetree/bindings/mtd/jedec,spi-nor.txt      |  2 +
 .../devicetree/bindings/spi/spi-fsl-dspi.txt       |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts | 14 +++++++
 arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts  | 48 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts  | 15 +++++++
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     | 28 +++++++++++++
 7 files changed, 109 insertions(+)

-- 
2.1.0.27.g96db324
