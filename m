From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] arm: dts: ls1021a: add "fsl,
 ls1021a-esdhc" compatible string to esdhc node
Date: Mon, 13 Nov 2017 15:39:35 +0100
Message-ID: <1510583976-6661-1-git-send-email-rasmus.villemoes@prevas.dk>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rasmus Villemoes <rasmus.villemoes@prevas.dk>
List-Id: devicetree@vger.kernel.org

Commit a22950c888e3 (mmc: sdhci-of-esdhc: add quirk
SDHCI_QUIRK_BROKEN_TIMEOUT_VAL for ls1021a) added logic to the driver to
enable the broken timeout val quirk for ls1021a, but did not add the
corresponding compatible string to the device tree, so it didn't really
have any effect. Fix that.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 arch/arm/boot/dts/ls1021a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 3ff2b8a9f01a..9cdec545decc 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -162,7 +162,7 @@
 		};
 
 		esdhc: esdhc@1560000 {
-			compatible = "fsl,esdhc";
+			compatible = "fsl,ls1021a-esdhc", "fsl,esdhc";
 			reg = <0x0 0x1560000 0x0 0x10000>;
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <0>;
-- 
2.7.4
