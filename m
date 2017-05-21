From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH 07/13] ARM: dts: armada-385-linksys: drop leagcy DSA bindings
Date: Sun, 21 May 2017 14:48:56 +0200
Message-ID: <20170521124903.11050-8-ralph.sennhauser@gmail.com>
References: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Gregory Clement <gregory.clement@free-electrons.com>, Imre Kaloz <kaloz@openwrt.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ralph Sennhauser <ralph.sennhauser@gmail.com>
List-Id: devicetree@vger.kernel.org

The new ones work so there is little reason to keep the legacy bindings.
Use the rework as the oportunity to drop the legacy node.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>

---

Notes:

  There is little harm in keeping them but probably no value either, so
  use the cleanup series to get rid of them.
---
 arch/arm/boot/dts/armada-385-linksys.dtsi | 47 -------------------------------
 1 file changed, 47 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
index 6cc1ec7..f1d6b77 100644
--- a/arch/arm/boot/dts/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
@@ -115,53 +115,6 @@
 			linux,default-trigger = "disk-activity";
 		};
 	};
-
-	dsa@0 {
-		status = "disabled";
-
-		compatible = "marvell,dsa";
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		dsa,ethernet = <&eth2>;
-		dsa,mii-bus = <&mdio>;
-
-		switch@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0x0 0>;	/* MDIO address 0, switch 0 in tree */
-
-			port@0 {
-				reg = <0>;
-				label = "lan4";
-			};
-
-			port@1 {
-				reg = <1>;
-				label = "lan3";
-			};
-
-			port@2 {
-				reg = <2>;
-				label = "lan2";
-			};
-
-			port@3 {
-				reg = <3>;
-				label = "lan1";
-			};
-
-			port@4 {
-				reg = <4>;
-				label = "wan";
-			};
-
-			port@5 {
-				reg = <5>;
-				label = "cpu";
-			};
-		};
-	};
 };
 
 &ahci0 {
-- 
2.10.2
