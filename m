From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v1] pinctrl: mediatek: improve Kconfig dependencies
Date: Thu, 13 Dec 2018 10:27:50 +0800
Message-ID: <e4eb66dec2901016e01767932461c5d560762f66.1544666839.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Weijie Gao <weijie.gao@mediatek.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

Remove prompts to make all pinctrl cores to non-visible symbols and
make sure the target SoCs would be coupled with the corresponding
cores.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
Changes since v1:
- Revise commit message
- Change all pinctrl cores to non-visible symbols
- Drop EINT_MTK in PINCTRL_MTK_MOORE
---
 drivers/pinctrl/mediatek/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index d8cb584..1817786 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -17,7 +17,7 @@ config PINCTRL_MTK
 	select OF_GPIO
 
 config PINCTRL_MTK_MOORE
-	bool "MediaTek Moore Core that implements generic binding"
+	bool
 	depends on OF
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
@@ -26,7 +26,7 @@ config PINCTRL_MTK_MOORE
 	select OF_GPIO
 
 config PINCTRL_MTK_PARIS
-	bool "MediaTek Paris Core that implements vendor binding"
+	bool
 	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
@@ -45,14 +45,14 @@ config PINCTRL_MT2701
 config PINCTRL_MT7623
 	bool "Mediatek MT7623 pin control with generic binding"
 	depends on MACH_MT7623 || COMPILE_TEST
-	depends on PINCTRL_MTK_MOORE
-	default y
+	default MACH_MT7623
+	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT7629
 	bool "Mediatek MT7629 pin control"
 	depends on MACH_MT7629 || COMPILE_TEST
-	depends on PINCTRL_MTK_MOORE
-	default y
+	default MACH_MT7629
+	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT8135
 	bool "Mediatek MT8135 pin control"
@@ -93,8 +93,8 @@ config PINCTRL_MT6797
 config PINCTRL_MT7622
 	bool "MediaTek MT7622 pin control"
 	depends on ARM64 || COMPILE_TEST
-	depends on PINCTRL_MTK_MOORE
-	default y
+	default ARM64 && ARCH_MEDIATEK
+	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT8173
 	bool "Mediatek MT8173 pin control"
-- 
1.9.1
