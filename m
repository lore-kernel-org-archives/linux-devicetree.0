From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v2 6/8] clocksource: devicetree: document Conexant Digicolor timer binding
Date: Thu,  8 Jan 2015 21:40:02 +0200
Message-ID: <4d7960616d4cdf2ba43dd0e8d2962bd82cb0a358.1420744369.git.baruch@tkos.co.il>
References: <cover.1420744368.git.baruch@tkos.co.il>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1420744368.git.baruch@tkos.co.il>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Baruch Siach <baruch@tkos.co.il>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../devicetree/bindings/timer/digicolor-timer.txt      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/digicolor-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/digicolor-timer.txt b/Documentation/devicetree/bindings/timer/digicolor-timer.txt
new file mode 100644
index 000000000000..d1b659bbc29f
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/digicolor-timer.txt
@@ -0,0 +1,18 @@
+Conexant Digicolor SoCs Timer Controller
+
+Required properties:
+
+- compatible : should be "cnxt,cx92755-timer"
+- reg : Specifies base physical address and size of the "Agent Communication"
+  timer registers
+- interrupts : Contains 8 interrupts, one for each timer
+- clocks: phandle to the main clock
+
+Example:
+
+	timer@f0000fc0 {
+		compatible = "cnxt,cx92755-timer";
+		reg = <0xf0000fc0 0x40>;
+		interrupts = <19>, <31>, <34>, <35>, <52>, <53>, <54>, <55>;
+		clocks = <&main_clk>;
+	};
-- 
2.1.4
