From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 08/19] ARM: dts: armada-370-xp: Fixup bm-bppi DT warning
Date: Sun, 13 Nov 2016 22:23:51 +0100
Message-ID: <20161113212402.3060-9-gregory.clement@free-electrons.com>
References: <20161113212402.3060-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161113212402.3060-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

bm-bppi has a reg property so the unit name should contain an address.
Take the opportunity to use the node label instead of the full name.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-xp-db.dts               | 8 ++++----
 arch/arm/boot/dts/armada-xp-gp.dts               | 8 ++++----
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts | 8 ++++----
 arch/arm/boot/dts/armada-xp.dtsi                 | 2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-db.dts b/arch/arm/boot/dts/armada-xp-db.dts
index 9e3bb3d7b4dc..486caf887da4 100644
--- a/arch/arm/boot/dts/armada-xp-db.dts
+++ b/arch/arm/boot/dts/armada-xp-db.dts
@@ -213,10 +213,6 @@
 				};
 			};
 		};
-
-		bm-bppi {
-			status = "okay";
-		};
 	};
 };
 
@@ -248,6 +244,10 @@
 	};
 };
 
+&bm_bppi {
+	status = "okay";
+};
+
 &mdio {
 	phy0: ethernet-phy@0 {
 		reg = <0>;
diff --git a/arch/arm/boot/dts/armada-xp-gp.dts b/arch/arm/boot/dts/armada-xp-gp.dts
index 9918c7883a36..65d960defff3 100644
--- a/arch/arm/boot/dts/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/armada-xp-gp.dts
@@ -198,10 +198,6 @@
 				nand-on-flash-bbt;
 			};
 		};
-
-		bm-bppi {
-			status = "okay";
-		};
 	};
 };
 
@@ -233,6 +229,10 @@
 	};
 };
 
+&bm_bppi {
+	status = "okay";
+};
+
 &mdio {
 	phy0: ethernet-phy@0 {
 		reg = <16>;
diff --git a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
index c8dd5a3bccb6..7cd2d74e0161 100644
--- a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
+++ b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
@@ -187,10 +187,6 @@
 				status = "okay";
 			};
 		};
-
-		bm-bppi {
-			status = "okay";
-		};
 	};
 };
 
@@ -222,6 +218,10 @@
 	};
 };
 
+&bm_bppi {
+	status = "okay";
+};
+
 &mdio {
 	phy0: ethernet-phy@0 {
 		reg = <0>;
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index 5e596b64f48e..e4aa0018047c 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -248,7 +248,7 @@
 			ranges = <0 MBUS_ID(0x09, 0x05) 0 0x800>;
 		};
 
-		bm_bppi: bm-bppi {
+		bm_bppi: bm-bppi@0c_04_0 {
 			compatible = "mmio-sram";
 			reg = <MBUS_ID(0x0c, 0x04) 0 0x100000>;
 			ranges = <0 MBUS_ID(0x0c, 0x04) 0 0x100000>;
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
