From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 1/4] ARM: shmobile: r8a7740 dtsi: Add L2 cache-controller node
Date: Mon, 23 Nov 2015 14:55:59 +0100
Message-ID: <1448286962-16897-2-git-send-email-geert+renesas@glider.be>
References: <1448286962-16897-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1448286962-16897-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add the missing L2 cache-controller node, and link the CPU node to it.
This will allow migration to the generic l2c OF initialization.

The L2 cache is an ARM L2C-310 (r3p1-150rel0), of size 256 KiB (32 KiB x
8 ways).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - Drop optional cache-{size,sets,{block,line}-size} properties, as
    this information is auto-detected,
  - Integrate adding the link from CPU to L2 cache into this patch,

v4:
  - Commit eeedcea69e927857 ("ARM: 8395/1: l2c: Add support for the
    "arm,shared-override" property") is queued for 4.3 in arm/for-next,

v3:
  - Add "arm,shared-override",

v2:
  - Fix interrupt (should be 3 cells, not 1),
  - Describe cache better.
---
 arch/arm/boot/dts/r8a7740.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 387aef60c825bc24..ff3dedb63ef48ea7 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -26,6 +26,7 @@
 			reg = <0x0>;
 			clock-frequency = <800000000>;
 			power-domains = <&pd_a3sm>;
+			next-level-cache = <&L2>;
 		};
 	};
 
@@ -37,6 +38,18 @@
 		      <0xc2000000 0x1000>;
 	};
 
+	L2: cache-controller {
+		compatible = "arm,pl310-cache";
+		reg = <0xf0100000 0x1000>;
+		interrupts = <0 84 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&pd_a3sm>;
+		arm,data-latency = <3 3 3>;
+		arm,tag-latency = <2 2 2>;
+		arm,shared-override;
+		cache-unified;
+		cache-level = <2>;
+	};
+
 	dbsc3: memory-controller@fe400000 {
 		compatible = "renesas,dbsc3-r8a7740";
 		reg = <0xfe400000 0x400>;
-- 
1.9.1

