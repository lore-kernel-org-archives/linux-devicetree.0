Return-Path: <SRS0=Zn+R=UK=googlemail.com=yegorslists@kernel.org>
From: yegorslists@googlemail.com
Subject: [PATCH] ARM: dts: am335x-baltos: Fix PHY mode for ethernet
Date: Tue, 11 Jun 2019 11:30:45 +0200
Message-Id: <20190611093045.4810-1-yegorslists@googlemail.com>
To: linux-omap@vger.kernel.org
Cc: tony@atomide.com, robh+dt@kernel.org, devicetree@vger.kernel.org, Yegor Yefremov <yegorslists@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

The PHY must add both tx and rx delay and not only on the tx clock.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/am335x-baltos-ir2110.dts | 2 +-
 arch/arm/boot/dts/am335x-baltos-ir3220.dts | 2 +-
 arch/arm/boot/dts/am335x-baltos-ir5221.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-baltos-ir2110.dts b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
index 2f650a736b44..f127af2afd00 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir2110.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
@@ -68,7 +68,7 @@
 };
 
 &cpsw_emac1 {
-	phy-mode = "rgmii-txid";
+	phy-mode = "rgmii-id";
 	dual_emac_res_vlan = <2>;
 	phy-handle = <&phy1>;
 };
diff --git a/arch/arm/boot/dts/am335x-baltos-ir3220.dts b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
index 1ba66d5e21e8..058d9eb96cff 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir3220.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
@@ -110,7 +110,7 @@
 };
 
 &cpsw_emac1 {
-	phy-mode = "rgmii-txid";
+	phy-mode = "rgmii-id";
 	dual_emac_res_vlan = <2>;
 	phy-handle = <&phy1>;
 };
diff --git a/arch/arm/boot/dts/am335x-baltos-ir5221.dts b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
index eed65fc0e8e6..7b99c8ed3c3a 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir5221.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
@@ -128,7 +128,7 @@
 };
 
 &cpsw_emac1 {
-	phy-mode = "rgmii-txid";
+	phy-mode = "rgmii-id";
 	dual_emac_res_vlan = <2>;
 	phy-handle = <&phy1>;
 };
-- 
2.17.0
