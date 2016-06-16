From: Hoan Tran <hotran@apm.com>
Subject: [PATCH 1/2] Documentation: dt: clock: Add fractional scale binding
Date: Thu, 16 Jun 2016 16:40:32 -0700
Message-ID: <1466120433-30648-2-git-send-email-hotran@apm.com>
References: <1466120433-30648-1-git-send-email-hotran@apm.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1466120433-30648-1-git-send-email-hotran@apm.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, lho@apm.com, Duc Dang <dhdang@apm.com>, Hoan Tran <hotran@apm.com>
List-Id: devicetree@vger.kernel.org

Add fractional scale clock DTS binding.

Signed-off-by: Hoan Tran <hotran@apm.com>
Signed-off-by: Loc Ho <lho@apm.com>
---
 .../bindings/clock/fractional-scale-clock.txt      | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fractional-scale-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/fractional-scale-clock.txt b/Documentation/devicetree/bindings/clock/fractional-scale-clock.txt
new file mode 100644
index 0000000..864a77ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fractional-scale-clock.txt
@@ -0,0 +1,31 @@
+Binding for fractional scale clock source.
+
+This binding uses the common clock binding[1].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible : shall be "fractional-scale-clock".
+- clocks : shall be the input parent clock phandle for the clock.
+- #clock-cells : shall be set to 1.
+- reg : shall be the physical register address for the clock.
+- clock-output-names : shall be the name of the clock referenced by derive clock.
+- clock-shift: Bit shift of the clock register. Default is 0.
+- clock-width: Width of the clock register. Default is 32.
+- clock-denom: shall be the denominator value. Default is 2^32.
+
+Optional properties:
+- clock-inverted: shall be 1 if the numerator is inverted.
+- clock-names : shall be the name of the clock. If missing, use the device name.
+
+Example:
+	clock {
+		compatible = "fractional-scale-clock";
+		clocks = <&parentclk>;
+		#clock-cells = <1>;
+		reg = <0x0 0xFFFF0000 0x0 0x10>
+		clock-shift = <8>;
+		clock-width = <3>;
+		clock-denom = <8>;
+		clock-inverted = <1>;
+	};
-- 
1.9.1

