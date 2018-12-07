From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am65-main: Add ECAP PWM node
Date: Fri, 7 Dec 2018 15:05:34 +0530
Message-ID: <20181207093535.5497-2-vigneshr@ti.com>
References: <20181207093535.5497-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207093535.5497-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

Add DT entry for ECAP0 PWM node present in main domain

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 916434839603..0a0a8fc5df64 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -129,4 +129,13 @@
 		clocks = <&k3_clks 113 1>;
 		power-domains = <&k3_pds 113>;
 	};
+
+	ecap0: pwm@3100000 {
+		compatible = "ti,am654-ecap", "ti,am3352-ecap";
+		#pwm-cells = <3>;
+		reg = <0x0 0x03100000 0x0 0x60>;
+		power-domains = <&k3_pds 39>;
+		clocks = <&k3_clks 39 0>;
+		clock-names = "fck";
+	};
 };
-- 
2.19.2
