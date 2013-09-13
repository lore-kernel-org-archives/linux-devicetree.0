From: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 2/3] ARM: imx6q: Add PCIe bits to GPR syscon definition
Date: Fri, 13 Sep 2013 09:40:21 +0000
Message-ID: <1379065222-7275-3-git-send-email-xobs@kosagi.com>
References: <1379065222-7275-1-git-send-email-xobs@kosagi.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379065222-7275-1-git-send-email-xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Zhu Richard-R65037 <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

PCIe requires additional bits be defined for GPR8 and GPR12.

Signed-off-by: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
---
 include/linux/mfd/syscon/imx6q-iomuxc-gpr.h |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h b/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h
index b6bdcd6..1bf1fe9 100644
--- a/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h
+++ b/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h
@@ -241,6 +241,12 @@
 
 #define IMX6Q_GPR5_L2_CLK_STOP			BIT(8)
 
+#define IMX6Q_GPR8_TX_DEEMPH_GEN1		(0x3F << 0)
+#define IMX6Q_GPR8_TX_DEEMPH_GEN2_3P5DB		(0x3F << 6)
+#define IMX6Q_GPR8_TX_DEEMPH_GEN2_6DB		(0x3F << 12)
+#define IMX6Q_GPR8_TX_SWING_FULL		(0x7F << 18)
+#define IMX6Q_GPR8_TX_SWING_LOW			(0x7F << 25)
+
 #define IMX6Q_GPR9_TZASC2_BYP			BIT(1)
 #define IMX6Q_GPR9_TZASC1_BYP			BIT(0)
 
@@ -273,7 +279,9 @@
 #define IMX6Q_GPR12_ARMP_AHB_CLK_EN		BIT(26)
 #define IMX6Q_GPR12_ARMP_ATB_CLK_EN		BIT(25)
 #define IMX6Q_GPR12_ARMP_APB_CLK_EN		BIT(24)
+#define IMX6Q_GPR12_DEVICE_TYPE			(0xF << 12)
 #define IMX6Q_GPR12_PCIE_CTL_2			BIT(10)
+#define IMX6Q_GPR12_LOS_LEVEL			(0x1F << 4)
 
 #define IMX6Q_GPR13_SDMA_STOP_REQ		BIT(30)
 #define IMX6Q_GPR13_CAN2_STOP_REQ		BIT(29)
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
