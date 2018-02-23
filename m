From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 03/19] dt-bindings: pinctrl: mediatek: add bindings for
 I2C2 and SPI2 on MT7623
Date: Fri, 23 Feb 2018 18:16:23 +0800
Message-ID: <607af13d88f733057df2ea057228e1cdbf77262a.1519378871.git.sean.wang@mediatek.com>
References: <cover.1519378871.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1519378871.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add missing pinctrl binding about I2C2 and SPI2 which would be used in
devicetree related files.

Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 include/dt-bindings/pinctrl/mt7623-pinfunc.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/dt-bindings/pinctrl/mt7623-pinfunc.h b/include/dt-bindings/pinctrl/mt7623-pinfunc.h
index 2d6a7b1..4878a67 100644
--- a/include/dt-bindings/pinctrl/mt7623-pinfunc.h
+++ b/include/dt-bindings/pinctrl/mt7623-pinfunc.h
@@ -251,6 +251,12 @@
 #define MT7623_PIN_76_SCL0_FUNC_GPIO76 (MTK_PIN_NO(76) | 0)
 #define MT7623_PIN_76_SCL0_FUNC_SCL0 (MTK_PIN_NO(76) | 1)
 
+#define MT7623_PIN_77_SDA2_FUNC_GPIO77 (MTK_PIN_NO(77) | 0)
+#define MT7623_PIN_77_SDA2_FUNC_SDA2 (MTK_PIN_NO(77) | 1)
+
+#define MT7623_PIN_78_SCL2_FUNC_GPIO78 (MTK_PIN_NO(78) | 0)
+#define MT7623_PIN_78_SCL2_FUNC_SCL2 (MTK_PIN_NO(78) | 1)
+
 #define MT7623_PIN_79_URXD0_FUNC_GPIO79 (MTK_PIN_NO(79) | 0)
 #define MT7623_PIN_79_URXD0_FUNC_URXD0 (MTK_PIN_NO(79) | 1)
 #define MT7623_PIN_79_URXD0_FUNC_UTXD0 (MTK_PIN_NO(79) | 2)
@@ -291,6 +297,24 @@
 #define MT7623_PIN_100_MIPI_TDP0_FUNC_GPIO100 (MTK_PIN_NO(100) | 0)
 #define MT7623_PIN_100_MIPI_TDP0_FUNC_TDP0 (MTK_PIN_NO(100) | 1)
 
+#define MT7623_PIN_101_SPI2_CSN_FUNC_GPIO101 (MTK_PIN_NO(101) | 0)
+#define MT7623_PIN_101_SPI2_CSN_FUNC_SPI2_CS (MTK_PIN_NO(101) | 1)
+#define MT7623_PIN_101_SPI2_CSN_FUNC_SCL3 (MTK_PIN_NO(101) | 3)
+
+#define MT7623_PIN_102_SPI2_MI_FUNC_GPIO102 (MTK_PIN_NO(102) | 0)
+#define MT7623_PIN_102_SPI2_MI_FUNC_SPI2_MI (MTK_PIN_NO(102) | 1)
+#define MT7623_PIN_102_SPI2_MI_FUNC_SPI2_MO (MTK_PIN_NO(102) | 2)
+#define MT7623_PIN_102_SPI2_MI_FUNC_SDA3 (MTK_PIN_NO(102) | 3)
+
+#define MT7623_PIN_103_SPI2_MO_FUNC_GPIO103 (MTK_PIN_NO(103) | 0)
+#define MT7623_PIN_103_SPI2_MO_FUNC_SPI2_MO (MTK_PIN_NO(103) | 1)
+#define MT7623_PIN_103_SPI2_MO_FUNC_SPI2_MI (MTK_PIN_NO(103) | 2)
+#define MT7623_PIN_103_SPI2_MO_FUNC_SCL3 (MTK_PIN_NO(103) | 3)
+
+#define MT7623_PIN_104_SPI2_CK_FUNC_GPIO104 (MTK_PIN_NO(104) | 0)
+#define MT7623_PIN_104_SPI2_CK_FUNC_SPI2_CK (MTK_PIN_NO(104) | 1)
+#define MT7623_PIN_104_SPI2_CK_FUNC_SDA3 (MTK_PIN_NO(104) | 3)
+
 #define MT7623_PIN_105_MSDC1_CMD_FUNC_GPIO105 (MTK_PIN_NO(105) | 0)
 #define MT7623_PIN_105_MSDC1_CMD_FUNC_MSDC1_CMD (MTK_PIN_NO(105) | 1)
 #define MT7623_PIN_105_MSDC1_CMD_FUNC_SDA1 (MTK_PIN_NO(105) | 3)
-- 
2.7.4
