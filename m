From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH net-next 05/10] ARM: dts: keystone-clocks: add input fixed clocks
Date: Sat, 1 Jun 2019 13:45:29 +0300
Message-ID: <20190601104534.25790-6-grygorii.strashko@ti.com>
References: <20190601104534.25790-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190601104534.25790-1-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Santosh Shilimkar <ssantosh@kernel.org>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, Wingman Kwok <w-kwok2@ti.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

Add set of fixed, external input clocks definitions for TIMI0, TIMI1,
TSREFCLK clocks. Such clocks can be used as reference clocks for some HW
modules (as cpts, for example) by configuring corresponding clock muxes.
For these clocks real frequencies have to be defined in board files.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/keystone-clocks.dtsi | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-clocks.dtsi b/arch/arm/boot/dts/keystone-clocks.dtsi
index 457515b0736a..0397c3423d2d 100644
--- a/arch/arm/boot/dts/keystone-clocks.dtsi
+++ b/arch/arm/boot/dts/keystone-clocks.dtsi
@@ -408,4 +408,31 @@ clocks {
 		reg-names = "control", "domain";
 		domain-id = <0>;
 	};
+
+	/*
+	 * Below are set of fixed, input clocks definitions,
+	 * for which real frequencies have to be defined in board files.
+	 * Those clocks can be used as reference clocks for some HW modules
+	 * (as cpts, for example) by configuring corresponding clock muxes.
+	 */
+	timi0: timi0 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+		clock-output-names = "timi0";
+	};
+
+	timi1: timi1 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+		clock-output-names = "timi1";
+	};
+
+	tsrefclk: tsrefclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+		clock-output-names = "tsrefclk";
+	};
 };
-- 
2.17.1
