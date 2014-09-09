From: Jingchang Lu <jingchang.lu@freescale.com>
Subject: [PATCHv3 1/6] ARM: dts: Add SoC level device tree support for LS1021A
Date: Tue, 9 Sep 2014 16:39:12 +0800
Message-ID: <1410251958-3961-1-git-send-email-jingchang.lu@freescale.com>
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
To: shawn.guo@freescale.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series contain the support for Freescale LS1021A CPU and LS1021A-QDS
and LS1021A-TWR board.

The LS1021A SoC combines two ARM Cortex-A7 cores that have been optimized
for high reliability and pack the highest level of integration available
for sub-3W embedded communications processors and with a comprehensive
enablement model focused on ease of programmability.

The LS1021A SoC shares IPs with i.MX family, Vybrid family and Freescale
PowerPC platform. 

For the detail information about LS1021A SoC, please refer to the RM doc.

---
changes in v3:
rewrite scfg and dcfg binding doc description.
remove untested node and mtd partation info.

changes in v2:
remove unused nodes.
wakeup the secondary core by IPI call to u-boot standby procedure. 
add dt-bindings for LS1021A SoC and platform gerenal configuration nodes.

----------------------------------------------------------------
Jingchang Lu (6):
	ARM: dts: Add SoC level device tree support for LS1021A
	ARM: dts: Add initial LS1021A QDS board dts support
	ARM: dts: Add initial LS1021A TWR board dts support
	dt-bindings: arm: add Freescale LS1021A SoC device tree binding
	ARM: imx: Add initial support for Freescale LS1021A
	ARM: imx: Add Freescale LS1021A SMP support

 Documentation/devicetree/bindings/arm/fsl.txt |  38 +++
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/ls1021a-qds.dts             | 285 +++++++++++++++++++++
 arch/arm/boot/dts/ls1021a-twr.dts             | 117 +++++++++
 arch/arm/boot/dts/ls1021a.dtsi                | 670 ++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-imx/Kconfig                     |  14 ++
 arch/arm/mach-imx/Makefile                    |   4 +-
 arch/arm/mach-imx/common.h                    |   1 +
 arch/arm/mach-imx/mach-ls1021a.c              |  34 +++
 arch/arm/mach-imx/platsmp.c                   |  32 +++
 10 files changed, 1216 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/ls1021a-qds.dts
 create mode 100755 arch/arm/boot/dts/ls1021a-twr.dts
 create mode 100644 arch/arm/boot/dts/ls1021a.dtsi
 create mode 100644 arch/arm/mach-imx/mach-ls1021a.c
