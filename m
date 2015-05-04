From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 2/6] ARM: shmobile: r8a7740 dtsi: Add L2 cache-controller node
Date: Mon,  4 May 2015 17:24:28 +0200
Message-ID: <1430753072-17145-3-git-send-email-geert+renesas@glider.be>
References: <1430753072-17145-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1430753072-17145-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Tushar Behera <tushar.behera@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add the missing L2 cache-controller node. This will allow migration to
the generic l2c OF initialization.

The L2 cache is an ARM L2C-310 (r3p1-150rel0), of size 256 KiB (32 KiB x
8 ways).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Add "arm,shared-override",

v2:
  - Fix interrupt (should be 3 cells, not 1),
  - Describe cache better.
---
 arch/arm/boot/dts/r8a7740.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index d84714468cce18df..ddef5b1c68fa06b3 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -37,6 +37,22 @@
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
+		cache-size = <0x40000>;
+		cache-sets = <1024>;
+		cache-block-size = <32>;
+		cache-line-size = <32>;
+	};
+
 	dbsc3: memory-controller@fe400000 {
 		compatible = "renesas,dbsc3-r8a7740";
 		reg = <0xfe400000 0x400>;
-- 
1.9.1

