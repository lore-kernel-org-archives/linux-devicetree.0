From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH v2 1/5] Documentation: DT: Renamed of-serial.txt to 8250.txt
Date: Fri, 17 Oct 2014 17:54:21 +0800
Message-ID: <1413539665-11484-2-git-send-email-chunyan.zhang@spreadtrum.com>
References: <sprd-1017-v2>
 <1413539665-11484-1-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1413539665-11484-1-git-send-email-chunyan.zhang@spreadtrum.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: catalin.marinas@arm.com, gregkh@linuxfoundation.org, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, galak@codeaurora.org, broonie@linaro.org, mark.rutland@arm.com, m-karicheri2@ti.com, pawel.moll@arm.com, artagnon@gmail.com, rrichter@cavium.com, robh+dt@kernel.org, will.deacon@arm.com, orsonzhai@gmail.com, geng.ren@spreadtrum.com, zhizhou.zhang@spreadtrum.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sprdlinux@freelists.org
List-Id: devicetree@vger.kernel.org

The file of-serial.txt was only for 8250 compatible UART implementations,
so renamed it to 8250.txt to avoid confusing other persons.

Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
---
 Documentation/devicetree/bindings/serial/8250.txt  |   50 ++++++++++++++++++++
 .../devicetree/bindings/serial/of-serial.txt       |   50 --------------------
 2 files changed, 50 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/8250.txt
 delete mode 100644 Documentation/devicetree/bindings/serial/of-serial.txt

diff --git a/Documentation/devicetree/bindings/serial/8250.txt b/Documentation/devicetree/bindings/serial/8250.txt
new file mode 100644
index 0000000..7705477
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/8250.txt
@@ -0,0 +1,50 @@
+* UART (Universal Asynchronous Receiver/Transmitter)
+
+Required properties:
+- compatible : one of:
+	- "ns8250"
+	- "ns16450"
+	- "ns16550a"
+	- "ns16550"
+	- "ns16750"
+	- "ns16850"
+	- "nvidia,tegra20-uart"
+	- "nxp,lpc3220-uart"
+	- "ibm,qpace-nwp-serial"
+	- "altr,16550-FIFO32"
+	- "altr,16550-FIFO64"
+	- "altr,16550-FIFO128"
+	- "serial" if the port type is unknown.
+- reg : offset and length of the register set for the device.
+- interrupts : should contain uart interrupt.
+- clock-frequency : the input clock frequency for the UART
+	 or
+  clocks phandle to refer to the clk used as per Documentation/devicetree
+  /bindings/clock/clock-bindings.txt
+
+Optional properties:
+- current-speed : the current active speed of the UART.
+- reg-offset : offset to apply to the mapbase from the start of the registers.
+- reg-shift : quantity to shift the register offsets by.
+- reg-io-width : the size (in bytes) of the IO accesses that should be
+  performed on the device.  There are some systems that require 32-bit
+  accesses to the UART (e.g. TI davinci).
+- used-by-rtas : set to indicate that the port is in use by the OpenFirmware
+  RTAS and should not be registered.
+- no-loopback-test: set to indicate that the port does not implements loopback
+  test mode
+- fifo-size: the fifo size of the UART.
+- auto-flow-control: one way to enable automatic flow control support. The
+  driver is allowed to detect support for the capability even without this
+  property.
+- has-hw-flow-control: the hardware has flow control capability.
+
+Example:
+
+	uart@80230000 {
+		compatible = "ns8250";
+		reg = <0x80230000 0x100>;
+		clock-frequency = <3686400>;
+		interrupts = <10>;
+		reg-shift = <2>;
+	};
diff --git a/Documentation/devicetree/bindings/serial/of-serial.txt b/Documentation/devicetree/bindings/serial/of-serial.txt
deleted file mode 100644
index 7705477..0000000
--- a/Documentation/devicetree/bindings/serial/of-serial.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-* UART (Universal Asynchronous Receiver/Transmitter)
-
-Required properties:
-- compatible : one of:
-	- "ns8250"
-	- "ns16450"
-	- "ns16550a"
-	- "ns16550"
-	- "ns16750"
-	- "ns16850"
-	- "nvidia,tegra20-uart"
-	- "nxp,lpc3220-uart"
-	- "ibm,qpace-nwp-serial"
-	- "altr,16550-FIFO32"
-	- "altr,16550-FIFO64"
-	- "altr,16550-FIFO128"
-	- "serial" if the port type is unknown.
-- reg : offset and length of the register set for the device.
-- interrupts : should contain uart interrupt.
-- clock-frequency : the input clock frequency for the UART
-	 or
-  clocks phandle to refer to the clk used as per Documentation/devicetree
-  /bindings/clock/clock-bindings.txt
-
-Optional properties:
-- current-speed : the current active speed of the UART.
-- reg-offset : offset to apply to the mapbase from the start of the registers.
-- reg-shift : quantity to shift the register offsets by.
-- reg-io-width : the size (in bytes) of the IO accesses that should be
-  performed on the device.  There are some systems that require 32-bit
-  accesses to the UART (e.g. TI davinci).
-- used-by-rtas : set to indicate that the port is in use by the OpenFirmware
-  RTAS and should not be registered.
-- no-loopback-test: set to indicate that the port does not implements loopback
-  test mode
-- fifo-size: the fifo size of the UART.
-- auto-flow-control: one way to enable automatic flow control support. The
-  driver is allowed to detect support for the capability even without this
-  property.
-- has-hw-flow-control: the hardware has flow control capability.
-
-Example:
-
-	uart@80230000 {
-		compatible = "ns8250";
-		reg = <0x80230000 0x100>;
-		clock-frequency = <3686400>;
-		interrupts = <10>;
-		reg-shift = <2>;
-	};
-- 
1.7.9.5
