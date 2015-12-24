From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH 4/4] Documentation: fsl-quadspi: Add optional properties
Date: Thu, 24 Dec 2015 19:01:03 +0800
Message-ID: <1450954863-7540-4-git-send-email-yao.yuan@freescale.com>
References: <1450954863-7540-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450954863-7540-1-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yao.yuan@nxp.com
List-Id: devicetree@vger.kernel.org

Add optional properties for QSPI:
big-endian
if the register is big endian on this platform.

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 2bef0dc..1371612 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -19,6 +19,7 @@ Optional properties:
 			      But if there are two NOR flashes connected to the
 			      bus, you should enable this property.
 			      (Please check the board's schematic.)
+  - big-endian : That means the IP register is big endian
 
 Example:
 
-- 
2.1.0.27.g96db324
