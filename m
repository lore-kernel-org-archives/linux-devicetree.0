From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [RFC PATCH 2/3] dt-bindings: PCI: rockchip: Add support for pcie wake irq
Date: Wed, 16 Aug 2017 15:52:23 +0800
Message-ID: <20170816075224.31734-3-jeffy.chen@rock-chips.com>
References: <20170816075224.31734-1-jeffy.chen@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170816075224.31734-1-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, bhelgaas@google.com
Cc: shawn.lin@rock-chips.com, briannorris@chromium.org, dianders@chromium.org, Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add an optional interrupt for PCIE_WAKE pin.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

 Documentation/devicetree/bindings/pci/rockchip-pcie.txt | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
index 1453a734c2f5..6ef9903567db 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
@@ -22,10 +22,13 @@ Required properties:
 - phys: From PHY bindings: Phandle for the Generic PHY for PCIe.
 - phy-names:  MUST be "pcie-phy".
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
-- 
2.11.0
