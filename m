From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/1] regulator: s5m8767: Update LDO index in s5m8767-regulator.txt
Date: Tue, 24 Dec 2013 15:04:01 +0530
Message-ID: <1387877641-6527-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

LDO indices start from 1. Update the example accordingly.

Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/regulator/s5m8767-regulator.txt       |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt b/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
index d1660a90fc06..fc6b38f035bd 100644
--- a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
@@ -83,7 +83,7 @@ as per the datasheet of s5m8767.
 
 	- LDOn
 		  - valid values for n are 1 to 28
-		  - Example: LDO0, LD01, LDO28
+		  - Example: LDO1, LD02, LDO28
 	- BUCKn
 		  - valid values for n are 1 to 9.
 		  - Example: BUCK1, BUCK2, BUCK9
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
