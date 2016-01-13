From: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>
Subject: [PATCH v2 1/3] phy: Add Display port and SGMII type PHYs
Date: Wed, 13 Jan 2016 19:43:16 +0530
Message-ID: <1452694396-1200-1-git-send-email-sbhatta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh@kernel.org
Cc: balbi@ti.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
List-Id: devicetree@vger.kernel.org

This patch adds two new macros for specifying Display
Port and SGMII PHYs.

Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
---
 include/dt-bindings/phy/phy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 6c90193..4e1b5d7 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -15,5 +15,7 @@
 #define PHY_TYPE_PCIE		2
 #define PHY_TYPE_USB2		3
 #define PHY_TYPE_USB3		4
+#define PHY_TYPE_DP             5
+#define PHY_TYPE_SGMII          6
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.1.2
