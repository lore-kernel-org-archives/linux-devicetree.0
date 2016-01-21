From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH v3 4/4] Documentation: fsl-quadspi: Add optional properties
Date: Thu, 21 Jan 2016 15:09:18 +0800
Message-ID: <1453360158-34236-4-git-send-email-yao.yuan@freescale.com>
References: <1453360158-34236-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453360158-34236-1-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yao.yuan@nxp.com
List-Id: devicetree@vger.kernel.org

Add optional properties for QSPI:
big-endian
if the register is big endian on this platform.

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
---
Changed in v3:
No changes.

Changed in v2:
Update my email to <yao.yuan@nxp.com>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 0df2f3a..0333ec8 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -21,6 +21,7 @@ Optional properties:
 			      But if there are two NOR flashes connected to the
 			      bus, you should enable this property.
 			      (Please check the board's schematic.)
+  - big-endian : That means the IP register is big endian
 
 Example:
 
-- 
2.1.0.27.g96db324
