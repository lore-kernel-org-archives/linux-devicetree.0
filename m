From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Subject: [PATCH 3/6] dt-bindings: bus: Add documentation for the Technologic
 Systems NBUS
Date: Wed, 14 Dec 2016 18:12:33 -0500
Message-ID: <20161214231237.17496-4-sebastien.bourdelin@savoirfairelinux.com>
References: <20161214231237.17496-1-sebastien.bourdelin@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161214231237.17496-1-sebastien.bourdelin@savoirfairelinux.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kernel@savoirfairelinux.com
Cc: mark.rutland@arm.com, linus.walleij@linaro.org, will.deacon@arm.com, kris@embeddedarm.com, yamada.masahiro@socionext.com, wim@iguana.be, f.fainelli@gmail.com, damien.riegel@savoirfairelinux.com, linux@armlinux.org.uk, jonathanh@nvidia.com, treding@nvidia.com, linux@roeck-us.net, arnd@arndb.de, suzuki.poulose@arm.com, lucile.quirion@savoirfairelinux.com, fabio.estevam@nxp.com, robh+dt@kernel.org, horms+renesas@verge.net.au, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, mark@embeddedarm.com, kernel@pengutronix.de, olof@lixom.net, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for the Technologic Systems NBUS that is used
to interface with peripherals in the FPGA of the TS-4600 SoM.

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
 Documentation/devicetree/bindings/bus/ts-nbus.txt | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/ts-nbus.txt

diff --git a/Documentation/devicetree/bindings/bus/ts-nbus.txt b/Documentation/devicetree/bindings/bus/ts-nbus.txt
new file mode 100644
index 0000000..2f777ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/ts-nbus.txt
@@ -0,0 +1,50 @@
+Technologic Systems NBUS
+
+The NBUS is a bus used to interface with peripherals in the Technologic
+Systems FPGA on the TS-4600 SoM.
+
+Required properties :
+ - compatible     : "technologic,ts-nbus", "simple-bus"
+ - #address-cells : must be 1
+ - #size-cells    : must be 0
+ - pws            : The PWM pin connected to the clock line on the FPGA
+ - data-gpios	  : The GPIO pin connected to the data line on the FPGA
+ - csn-gpios	  : The GPIO pin connected to the csn line on the FPGA
+ - txrx-gpios	  : The GPIO pin connected to the txrx line on the FPGA
+ - strobe-gpios	  : The GPIO pin connected to the stobe line on the FPGA
+ - ale-gpios	  : The GPIO pin connected to the ale line on the FPGA
+ - rdy-gpios	  : The GPIO pin connected to the rdy line on the FPGA
+
+Child nodes:
+
+The NBUS node can contain zero or more child nodes representing peripherals
+on the bus.
+
+Example:
+
+	nbus {
+		compatible = "technologic,ts-nbus", "simple-bus";
+		pinctrl-0 = <&nbus_pins>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pwms = <&pwm 2 83>;
+		data-gpios   = <&gpio0 0 GPIO_ACTIVE_HIGH
+				&gpio0 1 GPIO_ACTIVE_HIGH
+				&gpio0 2 GPIO_ACTIVE_HIGH
+				&gpio0 3 GPIO_ACTIVE_HIGH
+				&gpio0 4 GPIO_ACTIVE_HIGH
+				&gpio0 5 GPIO_ACTIVE_HIGH
+				&gpio0 6 GPIO_ACTIVE_HIGH
+				&gpio0 7 GPIO_ACTIVE_HIGH>;
+		csn-gpios    = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+		txrx-gpios   = <&gpio0 24 GPIO_ACTIVE_HIGH>;
+		strobe-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+		ale-gpios    = <&gpio0 26 GPIO_ACTIVE_HIGH>;
+		rdy-gpios    = <&gpio0 21 GPIO_ACTIVE_HIGH>;
+
+		wdt@2a {
+			compatible = "...";
+
+			/* ... */
+		};
+	};
-- 
2.10.2
