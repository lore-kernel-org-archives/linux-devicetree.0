From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v5 2/5] dt-bindings: gpio: add raspberry pi GPIO expander
 binding
Date: Tue, 20 Feb 2018 14:19:32 +0200
Message-ID: <f400b48cbcd8a138c39d4e8f63d6c1f569090dcc.1519128054.git.baruch@tkos.co.il>
References: <cover.1519128054.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1519128054.git.baruch@tkos.co.il>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Dave Stevenson <dave.stevenson@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, linux-gpio@vger.kernel.org, Michael Zoran <mzoran@crowfest.net>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware over
I2C. The firmware mailbox interface allows the ARM core to control the
GPIO lines.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v5:
  * Remove the 'firmware' property
  * Note that the gpio node is a child of the firmware node

v4:
  * Move the example gpio node under the firmware node
  * Rename gpio node name to plain 'gpio'

v3:
  * Rename node name.

v2:
  * Rename compatible string to raspberrypi,firmware-gpio
---
 .../bindings/gpio/raspberrypi,firmware-gpio.txt    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt b/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
new file mode 100644
index 000000000000..ce97265e23ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
@@ -0,0 +1,30 @@
+Raspberry Pi GPIO expander
+
+The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware. The
+firmware exposes a mailbox interface that allows the ARM core to control the
+GPIO lines on the expander.
+
+The Raspberry Pi GPIO expander node must be a child node of the Raspberry Pi
+firmware node.
+
+Required properties:
+
+- compatible : Should be "raspberrypi,firmware-gpio"
+- gpio-controller : Marks the device node as a gpio controller
+- #gpio-cells : Should be two.  The first cell is the pin number, and
+  the second cell is used to specify the gpio polarity:
+  0 = active high
+  1 = active low
+
+Example:
+
+firmware: firmware-rpi {
+	compatible = "raspberrypi,bcm2835-firmware";
+	mboxes = <&mailbox>;
+
+	expgpio: gpio {
+		 compatible = "raspberrypi,firmware-gpio";
+		 gpio-controller;
+		 #gpio-cells = <2>;
+	 };
+};
-- 
2.16.1
