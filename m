From: Hoan Tran <hotran@apm.com>
Subject: [PATCH v3 1/3] Documentation: dtb: xgene: Add PMD clock binding
Date: Mon, 12 Sep 2016 11:23:23 -0700
Message-ID: <1473704605-28126-2-git-send-email-hotran@apm.com>
References: <1473704605-28126-1-git-send-email-hotran@apm.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1473704605-28126-1-git-send-email-hotran@apm.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lho@apm.com, Duc Dang <dhdang@apm.com>, Hoan Tran <hotran@apm.com>
List-Id: devicetree@vger.kernel.org

Add APM X-Gene clock binding documentation for PMD clock.

Signed-off-by: Hoan Tran <hotran@apm.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/xgene.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/xgene.txt b/Documentation/devicetree/bindings/clock/xgene.txt
index 82f9638..8233e77 100644
--- a/Documentation/devicetree/bindings/clock/xgene.txt
+++ b/Documentation/devicetree/bindings/clock/xgene.txt
@@ -8,6 +8,7 @@ Required properties:
 - compatible : shall be one of the following:
 	"apm,xgene-socpll-clock" - for a X-Gene SoC PLL clock
 	"apm,xgene-pcppll-clock" - for a X-Gene PCP PLL clock
+	"apm,xgene-pmd-clock" - for a X-Gene PMD clock
 	"apm,xgene-device-clock" - for a X-Gene device clock
 	"apm,xgene-socpll-v2-clock" - for a X-Gene SoC PLL v2 clock
 	"apm,xgene-pcppll-v2-clock" - for a X-Gene PCP PLL v2 clock
@@ -22,6 +23,15 @@ Required properties for SoC or PCP PLL clocks:
 Optional properties for PLL clocks:
 - clock-names : shall be the name of the PLL. If missing, use the device name.
 
+Required properties for PMD clocks:
+- reg : shall be the physical register address for the pmd clock.
+- clocks : shall be the input parent clock phandle for the clock.
+- #clock-cells : shall be set to 1.
+- clock-output-names : shall be the name of the clock referenced by derive
+  clock.
+Optional properties for PLL clocks:
+- clock-names : shall be the name of the clock. If missing, use the device name.
+
 Required properties for device clocks:
 - reg : shall be a list of address and length pairs describing the CSR
          reset and/or the divider. Either may be omitted, but at least
@@ -59,6 +69,14 @@ For example:
 		type = <0>;
 	};
 
+	pmd0clk: pmd0clk@7e200200 {
+		compatible = "apm,xgene-pmd-clock";
+		#clock-cells = <1>;
+		clocks = <&pmdpll 0>;
+		reg = <0x0 0x7e200200 0x0 0x10>;
+		clock-output-names = "pmd0clk";
+	};
+
 	socpll: socpll@17000120 {
 		compatible = "apm,xgene-socpll-clock";
 		#clock-cells = <1>;
-- 
1.9.1

