From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH 05/13] ARM: dts: armada-385-linksys: bm pools by label order
Date: Sun, 21 May 2017 14:48:54 +0200
Message-ID: <20170521124903.11050-6-ralph.sennhauser@gmail.com>
References: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Gregory Clement <gregory.clement@free-electrons.com>, Imre Kaloz <kaloz@openwrt.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ralph Sennhauser <ralph.sennhauser@gmail.com>
List-Id: devicetree@vger.kernel.org

Which pools we assing doesn't matter. Use the order which doesen't leave
a chance for questions for first time readers.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---
 arch/arm/boot/dts/armada-385-linksys.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
index b7f0a16..932fca4 100644
--- a/arch/arm/boot/dts/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
@@ -180,8 +180,8 @@
 	status = "okay";
 	phy-mode = "rgmii-id";
 	buffer-manager = <&bm>;
-	bm,pool-long = <2>;
-	bm,pool-short = <3>;
+	bm,pool-long = <0>;
+	bm,pool-short = <1>;
 	fixed-link {
 		speed = <1000>;
 		full-duplex;
@@ -192,8 +192,8 @@
 	status = "okay";
 	phy-mode = "sgmii";
 	buffer-manager = <&bm>;
-	bm,pool-long = <0>;
-	bm,pool-short = <1>;
+	bm,pool-long = <2>;
+	bm,pool-short = <3>;
 	fixed-link {
 		speed = <1000>;
 		full-duplex;
-- 
2.10.2
