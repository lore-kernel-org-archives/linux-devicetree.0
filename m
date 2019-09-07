From: marek.vasut@gmail.com
Subject: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
Date: Sat,  7 Sep 2019 18:16:34 +0200
Message-ID: <20190907161634.27378-1-marek.vasut@gmail.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Add dma-ranges property into /soc node to describe the DMA capabilities
of the bus. This is currently needed to translate PCI DMA ranges, which
are limited to 32bit addresses.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
NOTE: This is needed for the following patches to work correctly:
      https://patchwork.ozlabs.org/patch/1144870/
      https://patchwork.ozlabs.org/patch/1144871/
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 1 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 1 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 95deff66eeb6..2102140a6723 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -330,6 +330,7 @@
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+		dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
 
 		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 3dc9d73f589a..d115ff34d0db 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -300,6 +300,7 @@
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+		dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
 
 		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7796-wdt",
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 4ae163220f60..74d934cfe44e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -183,6 +183,7 @@
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+		dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
 
 		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a77965-wdt",
-- 
2.23.0.rc1
