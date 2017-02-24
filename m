From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 12/17] dt-bindings: arm: Document Actions Semi S900
Date: Fri, 24 Feb 2017 04:40:50 +0100
Message-ID: <20170224034055.18807-13-afaerber@suse.de>
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

The Actions Semi S900 is a quad-core ARM Cortex-A53 SoC.
The Bubblegum-96 is a 96Boards Consumer Edition compliant board (4/96).

Cc: 96boards@ucrobotics.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v1 -> v2:
 * Adopted "actions" vendor prefix
 * Extended text
 
 Documentation/devicetree/bindings/arm/actions.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/actions.txt b/Documentation/devicetree/bindings/arm/actions.txt
index 1d3782e..3bc7ea5 100644
--- a/Documentation/devicetree/bindings/arm/actions.txt
+++ b/Documentation/devicetree/bindings/arm/actions.txt
@@ -22,3 +22,18 @@ Boards:
 Root node property compatible must contain, depending on board:
 
  - LeMaker Guitar Base Board rev. B: "lemaker,guitar-bb-rev-b", "lemaker,guitar"
+
+
+S900 SoC
+========
+
+Required root node properties:
+
+- compatible :  must contain "actions,s900"
+
+
+Boards:
+
+Root node property compatible must contain, depending on board:
+
+ - uCRobotics Bubblegum-96: "ucrobotics,bubblegum-96"
-- 
2.10.2
