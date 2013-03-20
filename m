From: Mugunthan V N <mugunthanvnm@ti.com>
Subject: [RESEND PATCH 1/1] ARM: dts: AM33XX: Add CPSW phy_id device tree data to am335x-evmsk
Date: Wed, 20 Mar 2013 12:06:19 +0530
Message-ID: <1363761379-4989-1-git-send-email-mugunthanvnm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, b-cousson@ti.com, benoit.cousson@linaro.org, tony@atomide.com, Mugunthan V N <mugunthanvnm@ti.com>
List-Id: devicetree@vger.kernel.org

Add phy_id device tree data to am335x-evmsk device to bring up CPSW
ethernet present on am335x starter kit.

Signed-off-by: Mugunthan V N <mugunthanvnm@ti.com>
---
 arch/arm/boot/dts/am335x-evmsk.dts |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
index f67c360..acbcac3 100644
--- a/arch/arm/boot/dts/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/am335x-evmsk.dts
@@ -248,3 +248,11 @@
 		};
 	};
 };
+
+&cpsw_emac0 {
+	phy_id = <&davinci_mdio>, <0>;
+};
+
+&cpsw_emac1 {
+	phy_id = <&davinci_mdio>, <1>;
+};
-- 
1.7.9.5

