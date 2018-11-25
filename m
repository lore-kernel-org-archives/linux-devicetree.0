From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 11/13] ARM: dts: rv1108: Add internal timer support
Date: Sun, 25 Nov 2018 19:19:05 -0200
Message-ID: <20181125211907.9895-11-otavio@ossystems.com.br>
References: <20181125211907.9895-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181125211907.9895-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add support for the internal timer peripheral on RV1108.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/rv1108.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 7ef6d965871c..42566adadc83 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -291,6 +291,14 @@
 		};
 	};
 
+	timer: timer@10350000 {
+		compatible = "rockchip,rv1108-timer", "rockchip,rk3288-timer";
+		reg = <0x10350000 0x20>;
+		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&xin24m>, <&cru PCLK_TIMER>;
+		clock-names = "timer", "pclk";
+	};
+
 	watchdog: wdt@10360000 {
 		compatible = "snps,dw-wdt";
 		reg = <0x10360000 0x100>;
-- 
2.19.1
