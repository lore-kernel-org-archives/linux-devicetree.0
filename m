From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
Date: Wed, 21 Feb 2018 08:16:00 -0800
Message-ID: <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net, benh@kernel.crashing.org, andrew@lunn.ch
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This commit adds a dt-bindings document of PECI adapter driver for Aspeed
AST24xx/25xx SoCs.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 .../devicetree/bindings/peci/peci-aspeed.txt       | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.txt

diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.txt b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
new file mode 100644
index 000000000000..8a86f346d550
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
@@ -0,0 +1,73 @@
+Device tree configuration for PECI buses on the AST24XX and AST25XX SoCs.
+
+Required properties:
+- compatible
+	"aspeed,ast2400-peci" or "aspeed,ast2500-peci"
+	- aspeed,ast2400-peci: Aspeed AST2400 family PECI controller
+	- aspeed,ast2500-peci: Aspeed AST2500 family PECI controller
+
+- reg
+	Should contain PECI registers location and length.
+
+- #address-cells
+	Should be <1>.
+
+- #size-cells
+	Should be <0>.
+
+- interrupts
+	Should contain PECI interrupt.
+
+- clocks
+	Should contain clock source for PECI hardware module. Should reference
+	clkin clock.
+
+- clock_frequency
+	Should contain the operation frequency of PECI hardware module.
+	187500 ~ 24000000
+
+Optional properties:
+- msg-timing-nego
+	Message timing negotiation period. This value will determine the period
+	of message timing negotiation to be issued by PECI controller. The unit
+	of the programmed value is four times of PECI clock period.
+	0 ~ 255 (default: 1)
+
+- addr-timing-nego
+	Address timing negotiation period. This value will determine the period
+	of address timing negotiation to be issued by PECI controller. The unit
+	of the programmed value is four times of PECI clock period.
+	0 ~ 255 (default: 1)
+
+- rd-sampling-point
+	Read sampling point selection. The whole period of a bit time will be
+	divided into 16 time frames. This value will determine which time frame
+	this controller will sample PECI signal for data read back. Usually in
+	the middle of a bit time is the best.
+	0 ~ 15 (default: 8)
+
+- cmd_timeout_ms
+	Command timeout in units of ms.
+	1 ~ 60000 (default: 1000)
+
+Example:
+	peci: peci@1e78b000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x1e78b000 0x60>;
+
+		peci0: peci-bus@0 {
+			compatible = "aspeed,ast2500-peci";
+			reg = <0x0 0x60>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <15>;
+			clocks = <&clk_clkin>;
+			clock-frequency = <24000000>;
+			msg-timing-nego = <1>;
+			addr-timing-nego = <1>;
+			rd-sampling-point = <8>;
+			cmd-timeout-ms = <1000>;
+		};
+	};
\ No newline at end of file
-- 
2.16.1
