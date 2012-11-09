From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: [PATCH] of: Add vendor prefix for ON Semiconductor Corp.
Date: Fri,  9 Nov 2012 14:07:01 +0100
Message-ID: <1352466421-27480-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The used vendor prefix corresponds to the stock symbol (ONNN) for ON
Semiconductor Corp.

Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ac2c2c4..deba8d0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -34,6 +34,7 @@ national	National Semiconductor
 nintendo	Nintendo
 nvidia	NVIDIA
 nxp	NXP Semiconductors
+onnn	ON Semiconductor Corp.
 picochip	Picochip Ltd
 powervr	Imagination Technologies
 qcom	Qualcomm, Inc.
-- 
1.8.0
