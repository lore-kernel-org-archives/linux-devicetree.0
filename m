From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 04/11] clk: at91: add slow clk documentation
Date: Tue, 22 Apr 2014 15:12:33 +0200
Message-ID: <1398172360-7837-5-git-send-email-boris.brezillon@free-electrons.com>
References: <1398172360-7837-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1398172360-7837-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Mike Turquette <mturquette@linaro.org>
Cc: devicetree@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, linux-doc@vger.kernel.org, Boris BREZILLON <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add slow clk, and slow oscillators documentation.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 .../devicetree/bindings/clock/at91-clock.txt       | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/at91-clock.txt b/Documentation/devicetree/bindings/clock/at91-clock.txt
index 26d2c84..27f9a27 100644
--- a/Documentation/devicetree/bindings/clock/at91-clock.txt
+++ b/Documentation/devicetree/bindings/clock/at91-clock.txt
@@ -6,6 +6,16 @@ This binding uses the common clock binding[1].
 
 Required properties:
 - compatible : shall be one of the following:
+	"atmel,at91sam9x5-sckc":
+		at91 SCKC (Slow Clock Controller)
+		This node contains the slow clock definitions.
+
+	"atmel,at91sam9x5-clk-slow-osc":
+		at91 slow oscillator
+
+	"atmel,at91sam9x5-clk-slow-rc-osc":
+		at91 internal slow RC oscillator
+
 	"atmel,at91rm9200-pmc" or
 	"atmel,at91sam9g45-pmc" or
 	"atmel,at91sam9n12-pmc" or
@@ -15,6 +25,11 @@ Required properties:
 		All at91 specific clocks (clocks defined below) must be child
 		node of the PMC node.
 
+	"atmel,at91sam9x5-clk-slow" (under sckc node)
+	or
+	"atmel,at91sam9260-clk-slow" (under pmc node):
+		at91 slow clk
+
 	"atmel,at91rm9200-clk-main-osc"
 	"atmel,at91sam9x5-clk-main-rc-osc"
 		at91 main clk sources
@@ -59,6 +74,63 @@ Required properties:
 	"atmel,at91sam9x5-clk-utmi":
 		at91 utmi clock
 
+Required properties for SCKC node:
+- reg : defines the IO memory reserved for the SCKC.
+- #size-cells : shall be 0 (reg is used to encode clk id).
+- #address-cells : shall be 1 (reg is used to encode clk id).
+
+
+For example:
+	sckc: sckc@fffffe50 {
+		compatible = "atmel,sama5d3-pmc";
+		reg = <0xfffffe50 0x4>
+		#size-cells = <0>;
+		#address-cells = <1>;
+
+		/* put at91 slow clocks here */
+	};
+
+
+Required properties for internal slow RC oscillator:
+- #clock-cells : from common clock binding; shall be set to 0.
+- clock-frequency : define the internal RC oscillator frequency.
+
+Optional properties:
+- clock-accuracy : define the internal RC oscillator accuracy.
+
+For example:
+	slow_rc_osc: slow_rc_osc {
+		compatible = "atmel,at91sam9x5-clk-slow-rc-osc";
+		clock-frequency = <32768>;
+		clock-accuracy = <50000000>;
+	};
+
+Required properties for slow oscillator:
+- #clock-cells : from common clock binding; shall be set to 0.
+- clocks : shall encode the main osc source clk sources (see atmel datasheet).
+
+Optional properties:
+- atmel,osc-bypass : boolean property. Set this when a clock signal is directly
+  provided on XIN.
+
+For example:
+	slow_osc: slow_osc {
+		compatible = "atmel,at91rm9200-clk-slow-osc";
+		#clock-cells = <0>;
+		clocks = <&slow_xtal>;
+	};
+
+Required properties for slow clock:
+- #clock-cells : from common clock binding; shall be set to 0.
+- clocks : shall encode the slow clk sources (see atmel datasheet).
+
+For example:
+	clk32k: slck {
+		compatible = "atmel,at91sam9x5-clk-slow";
+		#clock-cells = <0>;
+		clocks = <&slow_rc_osc &slow_osc>;
+	};
+
 Required properties for PMC node:
 - reg : defines the IO memory reserved for the PMC.
 - #size-cells : shall be 0 (reg is used to encode clk id).
-- 
1.8.3.2
