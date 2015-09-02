From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 1/6] ARM: STi: Add DT defines for co-processor reset lines
Date: Wed,  2 Sep 2015 16:38:04 +0100
Message-ID: <1441208289-17330-2-git-send-email-lee.jones@linaro.org>
References: <1441208289-17330-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441208289-17330-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, ohad@wizery.com, devicetree@vger.kernel.org, Nathan_Lynch@mentor.com, f.fainelli@gmail.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 include/dt-bindings/reset-controller/stih407-resets.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset-controller/stih407-resets.h b/include/dt-bindings/reset-controller/stih407-resets.h
index 02d4328..4ab3a1c 100644
--- a/include/dt-bindings/reset-controller/stih407-resets.h
+++ b/include/dt-bindings/reset-controller/stih407-resets.h
@@ -52,6 +52,10 @@
 #define STIH407_KEYSCAN_SOFTRESET	26
 #define STIH407_USB2_PORT0_SOFTRESET	27
 #define STIH407_USB2_PORT1_SOFTRESET	28
+#define STIH407_ST231_AUD_SOFTRESET	29
+#define STIH407_ST231_DMU_SOFTRESET	30
+#define STIH407_ST231_GP0_SOFTRESET	31
+#define STIH407_ST231_GP1_SOFTRESET	32
 
 /* Picophy reset defines */
 #define STIH407_PICOPHY0_RESET		0
-- 
1.9.1
