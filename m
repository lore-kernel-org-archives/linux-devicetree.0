From: Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts: brcm: Fix SPI bus warnings
Date: Thu, 13 Sep 2018 13:12:30 -0500
Message-ID: <20180913181245.25484-6-robh@kernel.org>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Scott Branden <sbranden@broadcom.com>
List-Id: devicetree@vger.kernel.org

dtc has new checks for SPI buses. Fix the warnings in node names.

arch/arm/boot/dts/bcm53340-ubnt-unifi-switch8.dtb: Warning (spi_bus_bridge): /axi@18000000/qspi@27200: node name for SPI buses should be 'spi'
arch/arm/boot/dts/bcm958525er.dtb: Warning (spi_bus_bridge): /axi/qspi@27200: node name for SPI buses should be 'spi'
arch/arm/boot/dts/bcm958525xmc.dtb: Warning (spi_bus_bridge): /axi/qspi@27200: node name for SPI buses should be 'spi'
arch/arm/boot/dts/bcm958622hr.dtb: Warning (spi_bus_bridge): /axi/qspi@27200: node name for SPI buses should be 'spi'
arch/arm/boot/dts/bcm958625hr.dtb: Warning (spi_bus_bridge): /axi/qspi@27200: node name for SPI buses should be 'spi'
arch/arm/boot/dts/bcm988312hr.dtb: Warning (spi_bus_bridge): /axi/qspi@27200: node name for SPI buses should be 'spi'

Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Jon Mason <jonmason@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please apply to the sub-arch tree. The dtc changes haven't landed, but 
will for 4.20.

 arch/arm/boot/dts/bcm-hr2.dtsi | 2 +-
 arch/arm/boot/dts/bcm-nsp.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-hr2.dtsi b/arch/arm/boot/dts/bcm-hr2.dtsi
index 3084a7c95733..e4d49731287f 100644
--- a/arch/arm/boot/dts/bcm-hr2.dtsi
+++ b/arch/arm/boot/dts/bcm-hr2.dtsi
@@ -216,7 +216,7 @@
 			reg = <0x33000 0x14>;
 		};
 
-		qspi: qspi@27200 {
+		qspi: spi@27200 {
 			compatible = "brcm,spi-bcm-qspi", "brcm,spi-nsp-qspi";
 			reg = <0x027200 0x184>,
 			      <0x027000 0x124>,
diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index 09ba85046322..2b219addeb44 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -273,7 +273,7 @@
 			brcm,nand-has-wp;
 		};
 
-		qspi: qspi@27200 {
+		qspi: spi@27200 {
 			compatible = "brcm,spi-bcm-qspi", "brcm,spi-nsp-qspi";
 			reg = <0x027200 0x184>,
 			      <0x027000 0x124>,
-- 
2.17.1
