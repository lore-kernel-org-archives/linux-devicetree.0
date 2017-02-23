From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 2/5] dt-bindings: arm: Add Realtek RTD1295 bindings
Date: Thu, 23 Feb 2017 17:45:49 +0100
Message-ID: <20170223164553.3715-3-afaerber@suse.de>
References: <20170223164553.3715-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170223164553.3715-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Zidoo X9S and a few other recent TV boxes feature the Realtek RTD1295,
a quad-core ARM Cortex-A53 SoC.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Roc He <hepeng@zidoo.tv>
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v1 -> v2:
 * Changed subject
 * Extended commit message
 * Clarified wording
 
 Documentation/devicetree/bindings/arm/realtek.txt | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/realtek.txt

diff --git a/Documentation/devicetree/bindings/arm/realtek.txt b/Documentation/devicetree/bindings/arm/realtek.txt
new file mode 100644
index 0000000..13d7557
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/realtek.txt
@@ -0,0 +1,20 @@
+Realtek platforms device tree bindings
+--------------------------------------
+
+
+RTD1295 SoC
+===========
+
+Required root node properties:
+
+ - compatible :  must contain "realtek,rtd1295"
+
+
+Root node property compatible must contain, depending on board:
+
+ - Zidoo X9S: "zidoo,x9s"
+
+
+Example:
+
+    compatible = "zidoo,x9s", "realtek,rtd1295";
-- 
2.10.2
