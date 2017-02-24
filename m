From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 02/17] dt-bindings: arm: Document Actions Semi S500
Date: Fri, 24 Feb 2017 04:40:40 +0100
Message-ID: <20170224034055.18807-3-afaerber@suse.de>
References: <20170224034055.18807-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170224034055.18807-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Actions Semi S500 is a quad-core ARM Cortex-A9 SoC.
The LeMaker Guitar is an SODIMM-format module with that SoC.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v1 -> v2:
 * Adopted "actions" vendor prefix
 * Extended text
 
 Documentation/devicetree/bindings/arm/actions.txt | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/actions.txt

diff --git a/Documentation/devicetree/bindings/arm/actions.txt b/Documentation/devicetree/bindings/arm/actions.txt
new file mode 100644
index 0000000..1d3782e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/actions.txt
@@ -0,0 +1,24 @@
+Actions Semi platforms device tree bindings
+-------------------------------------------
+
+
+S500 SoC
+========
+
+Required root node properties:
+
+ - compatible :  must contain "actions,s500"
+
+
+Modules:
+
+Root node property compatible must contain, depending on module:
+
+ - LeMaker Guitar: "lemaker,guitar"
+
+
+Boards:
+
+Root node property compatible must contain, depending on board:
+
+ - LeMaker Guitar Base Board rev. B: "lemaker,guitar-bb-rev-b", "lemaker,guitar"
-- 
2.10.2
