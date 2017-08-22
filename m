From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [PATCH v4 3/4] dt-bindings: PCI: rockchip: Add support for pcie wake irq
Date: Tue, 22 Aug 2017 11:19:33 +0800
Message-ID: <20170822031934.8675-4-jeffy.chen@rock-chips.com>
References: <20170822031934.8675-1-jeffy.chen@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170822031934.8675-1-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, bhelgaas@google.com
Cc: shawn.lin@rock-chips.com, briannorris@chromium.org, dianders@chromium.org, Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add an optional interrupt for PCIE_WAKE pin.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../devicetree/bindings/pci/rockchip-pcie.txt        | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
index 5678be82530d..9f6504129e80 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
@@ -20,10 +20,13 @@ Required properties:
 - msi-map: Maps a Requester ID to an MSI controller and associated
 	msi-specifier data. See ./pci-msi.txt
 - interrupts: Three interrupt entries must be specified.
-- interrupt-names: Must include the following names
-	- "sys"
-	- "legacy"
-	- "client"
+- interrupt-names: Include the following names
+	Required:
+		- "sys"
+		- "legacy"
+		- "client"
+	Optional:
+		- "wake"
 - resets: Must contain seven entries for each entry in reset-names.
 	   See ../reset/reset.txt for details.
 - reset-names: Must include the following names
@@ -87,10 +90,11 @@ pcie0: pcie@f8000000 {
 	clock-names = "aclk", "aclk-perf",
 		      "hclk", "pm";
 	bus-range = <0x0 0x1>;
-	interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
-		     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
-		     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>;
-	interrupt-names = "sys", "legacy", "client";
+	interrupts-extended = <&gic GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
+			      <&gic GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
+			      <&gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>,
+			      <&gpio0 8 IRQ_TYPE_LEVEL_LOW>;
+	interrupt-names = "sys", "legacy", "client", "wake";
 	assigned-clocks = <&cru SCLK_PCIEPHY_REF>;
 	assigned-clock-parents = <&cru SCLK_PCIEPHY_REF100M>;
 	assigned-clock-rates = <100000000>;
-- 
2.11.0
