From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] Documentation: mfd: Fix LDO index in s2mps11.txt
Date: Tue, 24 Dec 2013 14:53:25 +0530
Message-ID: <1387877005-19035-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org, robh+dt@kernel.org, rob@landley.net, lee.jones@linaro.org, sachin.kamat@linaro.org
List-Id: devicetree@vger.kernel.org

LDO indices start from 1. Fix the example appropriately.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 Documentation/devicetree/bindings/mfd/s2mps11.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
index 78a840d7510d..15ee89c3cc7b 100644
--- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
+++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
@@ -60,7 +60,7 @@ as per the datasheet of s2mps11.
 
 	- LDOn
 		  - valid values for n are 1 to 38
-		  - Example: LDO0, LD01, LDO28
+		  - Example: LDO1, LD02, LDO28
 	- BUCKn
 		  - valid values for n are 1 to 10.
 		  - Example: BUCK1, BUCK2, BUCK9
-- 
1.7.9.5

