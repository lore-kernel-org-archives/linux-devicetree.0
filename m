From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v2 5/5] arm64: dts: Add SATA3 AHCI and SATA3 PHY DT nodes for
 NS2
Date: Mon, 28 Mar 2016 10:18:30 +0530
Message-ID: <1459140510-5317-6-git-send-email-anup.patel@broadcom.com>
References: <1459140510-5317-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459140510-5317-1-git-send-email-anup.patel@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Ray Jui <rjui@broadcom.com>, Jon Mason <jon.mason@broadcom.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Kumar Gala <galak@codeaurora.org>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

We have one dual-port SATA3 AHCI controller present in
NS2 SoC.

This patch enables SATA3 AHCI controller and SATA3 PHY
for NS2 SoC in NS2 DT.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 12 +++++++++
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 43 ++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
index ce0ab84..06cf9c5 100644
--- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
@@ -72,6 +72,18 @@
 	status = "ok";
 };
 
+&sata_phy0 {
+	status = "ok";
+};
+
+&sata_phy1 {
+	status = "ok";
+};
+
+&sata {
+	status = "ok";
+};
+
 &sdio0 {
 	status = "ok";
 };
diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index 6f81c9d..c8dccf8 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -413,6 +413,49 @@
 			reg = <0x66220000 0x28>;
 		};
 
+		sata_phy: sata_phy@663f0100 {
+			compatible = "brcm,iproc-ns2-sata-phy";
+			reg = <0x663f0100 0x1f00>,
+			      <0x663f004c 0x10>;
+			reg-names = "phy", "phy-ctrl";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			sata_phy0: sata-phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
+			sata_phy1: sata-phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		sata: ahci@663f2000 {
+			compatible = "brcm,iproc-ahci", "generic-ahci";
+			reg = <0x663f2000 0x1000>;
+			reg-names = "ahci";
+			interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			sata0: sata-port@0 {
+				reg = <0>;
+				phys = <&sata_phy0>;
+				phy-names = "sata-phy";
+			};
+
+			sata1: sata-port@1 {
+				reg = <1>;
+				phys = <&sata_phy1>;
+				phy-names = "sata-phy";
+			};
+		};
+
 		sdio0: sdhci@66420000 {
 			compatible = "brcm,sdhci-iproc-cygnus";
 			reg = <0x66420000 0x100>;
-- 
1.9.1
