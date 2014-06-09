From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH] dt-binding: mfd: as3722: correct macro name
Date: Mon, 9 Jun 2014 14:01:59 +0530
Message-ID: <1402302719-9766-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: swarren@nvidia.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dwillemsen@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

The macro name for enable3 pin is named as AS3722_EXT_CONTROL_PIN_ENABLE2
which is conflict with the enable2 pin.

Correct this macro name to correctly reflect the enable pin i.e.
AS3722_EXT_CONTROL_PIN_ENABLE3.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Reported-by: Dan Willemsen <dwillemsen@nvidia.com>
---
 include/dt-bindings/mfd/as3722.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/mfd/as3722.h b/include/dt-bindings/mfd/as3722.h
index 0e69256..e66c089 100644
--- a/include/dt-bindings/mfd/as3722.h
+++ b/include/dt-bindings/mfd/as3722.h
@@ -13,7 +13,7 @@
 /* External control pins */
 #define AS3722_EXT_CONTROL_PIN_ENABLE1 1
 #define AS3722_EXT_CONTROL_PIN_ENABLE2 2
-#define AS3722_EXT_CONTROL_PIN_ENABLE2 3
+#define AS3722_EXT_CONTROL_PIN_ENABLE3 3
 
 /* Interrupt numbers for AS3722 */
 #define AS3722_IRQ_LID			0
-- 
1.8.1.5
