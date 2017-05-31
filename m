From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 4/7] dt-bindings: ap806: introduce a new binding
Date: Wed, 31 May 2017 16:07:25 +0200
Message-ID: <32e35c1d5919bdf9dc7d58678f0c0b462886d03e.1496239589.git-series.gregory.clement@free-electrons.com>
References: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
References: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@marvell.com>
List-Id: devicetree@vger.kernel.org

This patch updates the documentation according to the changes made in the
patch "clk: mvebu: ap806: introduce a new binding"

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
index 3faab71dff9f..888c50e0d64f 100644
--- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
@@ -7,6 +7,14 @@ registers giving access to numerous features: clocks, pin-muxing and
 many other SoC configuration items. This DT binding allows to describe
 this system controller.
 
+For the top level node:
+ - compatible: must be: "syscon", "simple-mfd";
+  - reg: register area of the AP806 system controller
+
+Clocks:
+-------
+
+
 The Device Tree node representing the AP806 system controller provides
 a number of clocks:
 
@@ -17,15 +25,17 @@ a number of clocks:
 
 Required properties:
 
- - compatible: must be:
-     "marvell,ap806-system-controller", "syscon"
- - reg: register area of the AP806 system controller
+ - compatible: must be: "marvell,ap806-clock"
  - #clock-cells: must be set to 1
 
 Example:
 
 	syscon: system-controller@6f4000 {
-		compatible = "marvell,ap806-system-controller", "syscon";
-		#clock-cells = <1>;
+		compatible = "syscon", "simple-mfd";
 		reg = <0x6f4000 0x1000>;
+
+		ap_clk: clock {
+			compatible = "marvell,ap806-clock";
+			#clock-cells = <1>;
+		};
 	};
-- 
git-series 0.9.1
