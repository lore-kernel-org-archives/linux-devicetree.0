From: Haojian Zhuang <haojian.zhuang@marvell.com>
Subject: [PATCH v2 7/7] Document: devicetree: add OF documents for arch-mmp
Date: Mon,  5 Mar 2012 20:21:51 +0800
Message-ID: <1330950111-30797-8-git-send-email-haojian.zhuang@marvell.com>
References: <1330950111-30797-1-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1330950111-30797-1-git-send-email-haojian.zhuang@marvell.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux@arm.linux.org.uk, eric.y.miao@gmail.com
Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
List-Id: devicetree@vger.kernel.org

Add OF support in Document/devicetree directory.

Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 Documentation/devicetree/bindings/arm/mrvl.txt     |    6 +++
 .../devicetree/bindings/gpio/mrvl-gpio.txt         |   23 ++++++++++++
 Documentation/devicetree/bindings/i2c/mrvl-i2c.txt |   37 ++++++++++++++++++++
 .../devicetree/bindings/rtc/sa1100-rtc.txt         |   17 +++++++++
 .../devicetree/bindings/serial/mrvl-serial.txt     |    4 ++
 5 files changed, 87 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mrvl.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/mrvl-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/serial/mrvl-serial.txt

diff --git a/Documentation/devicetree/bindings/arm/mrvl.txt b/Documentation/devicetree/bindings/arm/mrvl.txt
new file mode 100644
index 0000000..d8de933
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mrvl.txt
@@ -0,0 +1,6 @@
+Marvell Platforms Device Tree Bindings
+----------------------------------------------------
+
+PXA168 Aspenite Board
+Required root node properties:
+	- compatible = "mrvl,pxa168-aspenite", "mrvl,pxa168";
diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt b/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
new file mode 100644
index 0000000..1e34cfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
@@ -0,0 +1,23 @@
+* Marvell PXA GPIO controller
+
+Required properties:
+- compatible : Should be "mrvl,pxa-gpio" or "mrvl,mmp-gpio"
+- reg : Address and length of the register set for the device
+- interrupts : Should be the port interrupt shared by all gpio pins, if
+- interrupt-name : Should be the name of irq resource.
+  one number.
+- gpio-controller : Marks the device node as a gpio controller.
+- #gpio-cells : Should be one.  It is the pin number.
+
+Example:
+
+	gpio: gpio@d4019000 {
+		compatible = "mrvl,mmp-gpio", "mrvl,pxa-gpio";
+		reg = <0xd4019000 0x1000>;
+		interrupts = <49>, <17>, <18>;
+		interrupt-name = "gpio_mux", "gpio0", "gpio1";
+		gpio-controller;
+		#gpio-cells = <1>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+      };
diff --git a/Documentation/devicetree/bindings/i2c/mrvl-i2c.txt b/Documentation/devicetree/bindings/i2c/mrvl-i2c.txt
new file mode 100644
index 0000000..071eb3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/mrvl-i2c.txt
@@ -0,0 +1,37 @@
+* I2C
+
+Required properties :
+
+ - reg : Offset and length of the register set for the device
+ - compatible : should be "mrvl,mmp-twsi" where CHIP is the name of a
+   compatible processor, e.g. pxa168, pxa910, mmp2, mmp3.
+   For the pxa2xx/pxa3xx, an additional node "mrvl,pxa-i2c" is required
+   as shown in the example below.
+
+Recommended properties :
+
+ - interrupts : <a b> where a is the interrupt number and b is a
+   field that represents an encoding of the sense and level
+   information for the interrupt.  This should be encoded based on
+   the information in section 2) depending on the type of interrupt
+   controller you have.
+ - interrupt-parent : the phandle for the interrupt controller that
+   services interrupts for this device.
+ - mrvl,i2c-polling : Disable interrupt of i2c controller. Polling
+   status register of i2c controller instead.
+ - mrvl,i2c-fast-mode : Enable fast mode of i2c controller.
+
+Examples:
+	twsi1: i2c@d4011000 {
+		compatible = "mrvl,mmp-twsi", "mrvl,pxa-i2c";
+		reg = <0xd4011000 0x1000>;
+		interrupts = <7>;
+		mrvl,i2c-fast-mode;
+	};
+	
+	twsi2: i2c@d4025000 {
+		compatible = "mrvl,mmp-twsi", "mrvl,pxa-i2c";
+		reg = <0xd4025000 0x1000>;
+		interrupts = <58>;
+	};
+
diff --git a/Documentation/devicetree/bindings/rtc/sa1100-rtc.txt b/Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
new file mode 100644
index 0000000..0cda19a
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
@@ -0,0 +1,17 @@
+* Marvell Real Time Clock controller
+
+Required properties:
+- compatible: should be "mrvl,sa1100-rtc"
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- interrupts: Should be two. The first interrupt number is the rtc alarm
+  interrupt and the second interrupt number is the rtc hz interrupt.
+- interrupt-names: Assign name of irq resource.
+
+Example:
+	rtc: rtc@d4010000 {
+		compatible = "mrvl,mmp-rtc";
+		reg = <0xd4010000 0x1000>;
+		interrupts = <5>, <6>;
+		interrupt-name = "rtc 1Hz", "rtc alarm";
+	};
diff --git a/Documentation/devicetree/bindings/serial/mrvl-serial.txt b/Documentation/devicetree/bindings/serial/mrvl-serial.txt
new file mode 100644
index 0000000..d744340
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/mrvl-serial.txt
@@ -0,0 +1,4 @@
+PXA UART controller
+
+Required properties:
+- compatible : should be "mrvl,mmp-uart" or "mrvl,pxa-uart".
-- 
1.7.0.4
