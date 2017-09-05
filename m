From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 2/2] MIPS: jz4780: DTS: Probe the jz4740-rtc driver from devicetree
Date: Tue,  5 Sep 2017 18:38:59 +0200
Message-ID: <20170905163901.10542-2-malat@debian.org>
References: <20170905163901.10542-1-malat@debian.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170905163901.10542-1-malat@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mathieu Malaterre <malat@debian.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Linus Walleij <linus.walleij@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The jz4740-rtc driver supports both jz4740 & jz4780, setup the compatible
string to jz4780.

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 02a752eb6a8e..c338c7d1cbca 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -48,6 +48,17 @@
 		};
 	};
 
+	rtc_dev: rtc@10003000 {
+		compatible = "ingenic,jz4780-rtc";
+		reg = <0x10003000 0x4c>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <32>;
+
+		clocks = <&cgu JZ4780_CLK_RTCLK>;
+		clock-names = "rtc";
+	};
+
 	pinctrl: pin-controller@10010000 {
 		compatible = "ingenic,jz4780-pinctrl";
 		reg = <0x10010000 0x600>;
-- 
2.11.0
