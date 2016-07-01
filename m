From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH 1/2] iio: sun4i-lradc: Add binding documentation
Date: Fri,  1 Jul 2016 23:00:54 +0200
Message-ID: <1467406855-9677-1-git-send-email-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Document the bindings for the Allwinner LRADC.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org

 .../devicetree/bindings/iio/adc/sun4i-lradc.txt       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/sun4i-lradc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/sun4i-lradc.txt b/Documentation/devicetree/bindings/iio/adc/sun4i-lradc.txt
new file mode 100644
index 000000000000..c75a6067b8a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/sun4i-lradc.txt
@@ -0,0 +1,19 @@
+Allwinner sun4i Low Resolution ADC
+----------------------------------
+
+Required properties:
+ - compatible: "allwinner,sun4i-a10-lradc"
+ - reg: mmio address range of the chip
+ - interrupts: interrupt to which the chip is connected
+ - vref-supply: powersupply for the lradc reference voltage
+ - #io-channel-cells = <1>; As ADC has multiple outputs
+
+Example:
+
+	lradc: lradc@01c22800 {
+		compatible = "allwinner,sun4i-a10-lradc";
+		reg = <0x01c22800 0x100>;
+		interrupts = <31>;
+		vref-supply = <&reg_vcc3v0>;
+		#io-channel-cells = <1>;
+	};
-- 
2.8.1
