From: Ziping Chen <techping.chan@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: input: Add R_LRADC support for A83T
Date: Sat, 24 Jun 2017 10:45:14 +0800
Message-ID: <20170624024515.4669-3-techping.chan@gmail.com>
References: <20170624024515.4669-1-techping.chan@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170624024515.4669-1-techping.chan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@free-electrons.com, wens@csie.org, robh@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Ziping Chen <techping.chan@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Ziping Chen <techping.chan@gmail.com>

Allwinner A83T SoC has a low res adc like the one
in Allwinner A10 SoC.

Add binding for it.

Signed-off-by: Ziping Chen <techping.chan@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
index 4357e498ef04..525d85e3043f 100644
--- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
+++ b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
@@ -2,12 +2,14 @@ Allwinner sun4i low res adc attached tablet keys
 ------------------------------------------------
 
 Required properties:
- - compatible: "allwinner,sun4i-a10-lradc-keys"
+ - compatible: should be one of the following string:
+		"allwinner,sun4i-a10-lradc-keys"
+		"allwinner,sun8i-a83t-r-lradc-keys"
  - reg: mmio address range of the chip
  - interrupts: interrupt to which the chip is connected
  - vref-supply: powersupply for the lradc reference voltage
 
-Each key is represented as a sub-node of "allwinner,sun4i-a10-lradc-keys":
+Each key is represented as a sub-node of the compatible mentioned above:
 
 Required subnode-properties:
 	- label: Descriptive name of the key.
-- 
2.11.0
