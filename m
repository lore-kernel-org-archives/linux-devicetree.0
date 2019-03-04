From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] dt-bindings: reset: meson-g12a: Add missing USB2 PHY resets
Date: Mon,  4 Mar 2019 11:49:16 +0100
Message-ID: <20190304104916.3937-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de
Cc: Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The G12A Documentation lacked these 2 reset lines, but they are present and
used for each USB 2 PHYs.

Add them to the dt-bindings for the upcoming USB support.

Fixes: dbfc54534dfc ("dt-bindings: reset: meson: add g12a bindings")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
index 8063e8314eef..6d487c5eba2c 100644
--- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
@@ -51,7 +51,10 @@
 #define RESET_SD_EMMC_A			44
 #define RESET_SD_EMMC_B			45
 #define RESET_SD_EMMC_C			46
-/*					47-60 */
+/*					47	*/
+#define RESET_USB_PHY20			48
+#define RESET_USB_PHY21			49
+/*					50-60	*/
 #define RESET_AUDIO_CODEC		61
 /*					62-63	*/
 /*	RESET2					*/
-- 
2.20.1
