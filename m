From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 3/3] ARM: dts: r7s72100: add l2 cache
Date: Tue,  7 Feb 2017 12:09:29 -0500
Message-ID: <20170207170929.29525-4-chris.brandt@renesas.com>
References: <20170207170929.29525-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170207170929.29525-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Brad Mouring <brad.mouring@ni.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Cochran <rcochran@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Note that arm,pl301-no-sideband is required because the sideband signals
between the CPU and L2C were not connected in this SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
* added "arm,pl310-no-sideband"
---
 arch/arm/boot/dts/r7s72100.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 74e684f..00b9972 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -177,6 +177,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <0>;
 			clock-frequency = <400000000>;
+			next-level-cache = <&L2>;
 		};
 	};
 
@@ -368,6 +369,15 @@
 			<0xe8202000 0x1000>;
 	};
 
+	L2: cache-controller@3ffff000 {
+		compatible = "arm,pl310-cache";
+		reg = <0x3ffff000 0x1000>;
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+		arm,pl310-no-sideband;
+		cache-unified;
+		cache-level = <2>;
+	};
+
 	i2c0: i2c@fcfee000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.10.1
