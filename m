From: Stuart Yoder <stuart.yoder@freescale.com>
Subject: [PATCH 1/3] Docs: dt: fsl-mc: update binding to include msi-parent
Date: Fri, 25 Sep 2015 16:08:04 -0500
Message-ID: <1443215286-3126-2-git-send-email-stuart.yoder@freescale.com>
References: <1443215286-3126-1-git-send-email-stuart.yoder@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443215286-3126-1-git-send-email-stuart.yoder@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, german.rivera@freescale.com, bhupesh.sharma@freescale.com, itai.katz@freescale.com, Stuart Yoder <stuart.yoder@freescale.com>
List-Id: devicetree@vger.kernel.org

The Freescale Management Complex and all associated objects
use message interrupts, and thus an msi-parent is required.

Signed-off-by: Stuart Yoder <stuart.yoder@freescale.com>
---
 Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
index c7a26ca..6aac955 100644
--- a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
+++ b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
@@ -30,11 +30,17 @@ Required properties:
                         region may not be present in some scenarios, such
                         as in the device tree presented to a virtual machine.
 
+    - msi-parent
+        Value type: <phandle>
+        Definition: Must be present and point to the MSI controller node
+                    handling message interrupts for the MC.
+
 Example:
 
         fsl_mc: fsl-mc@80c000000 {
                 compatible = "fsl,qoriq-mc";
                 reg = <0x00000008 0x0c000000 0 0x40>,    /* MC portal base */
                       <0x00000000 0x08340000 0 0x40000>; /* MC control reg */
+                msi-parent = <&its>;
         };
 
-- 
2.3.3
