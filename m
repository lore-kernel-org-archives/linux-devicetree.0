From: Keerthy <j-keerthy@ti.com>
Subject: [RFC PATCH v2 2/4] arm64: dts: ti: am6-wakeup: Add gpio node
Date: Wed, 5 Jun 2019 13:27:08 +0530
Message-ID: <20190605075710.1691-3-j-keerthy@ti.com>
References: <20190605075710.1691-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605075710.1691-1-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: t-kristo@ti.com, nm@ti.com, robh+dt@kernel.org
Cc: lokeshvutla@ti.com, linux-arm-kernel@lists.infradead.org, j-keerthy@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add gpio0 node under wakeup domain. This has 56 gpios
and all are capable of generating banked interrupts.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
index f1ca171abdf8..9cf2c0849a24 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
@@ -74,4 +74,19 @@
 		ti,sci-dst-id = <56>;
 		ti,sci-rm-range-girq = <0x4>;
 	};
+
+	wkup_gpio0: wkup_gpio0@42110000 {
+		compatible = "ti,am654-gpio", "ti,keystone-gpio";
+		reg = <0x42110000 0x100>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&intr_wkup_gpio>;
+		interrupts = <59 128>, <59 129>, <59 130>, <59 131>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		ti,ngpio = <56>;
+		ti,davinci-gpio-unbanked = <0>;
+		clocks = <&k3_clks 59 0>;
+		clock-names = "gpio";
+	};
 };
-- 
2.17.1
