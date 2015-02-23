From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v2 1/2] remoteproc: microblaze: Document device tree bindings
Date: Mon, 23 Feb 2015 12:37:25 +0100
Message-ID: <78fba33b1c38941a03996c8fe5bd3d3613314d56.1424688478.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add device tree binding documentation for the Microblaze remoteproc
on Xilinx Zynq.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Changes in v2:
- Applied changed reported by Mark Rutland here
  https://lkml.org/lkml/2015/1/19/198

 .../bindings/remoteproc/mb_remoteproc.txt          | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mb_remoteproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/mb_remoteproc.txt b/Documentation/devicetree/bindings/remoteproc/mb_remoteproc.txt
new file mode 100644
index 000000000000..3a454f01f5f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mb_remoteproc.txt
@@ -0,0 +1,45 @@
+Xilinx ARM-Microblaze remoteproc driver
+
+A Microblaze is added to the programmable logic on Xilinx Zynq.
+The Microblaze is connected with PS block via axi bus connected to PS HP port
+to ensure access to PS DDR.
+Communication channels are done via soft GPIO IP connected to PS block
+and to Microblaze. There are also 2 gpio control signals reset and debug
+which are used for resetting Microblaze.
+
+Required properties:
+- compatible : Should be "xlnx,mb-remoteproc"
+- reg : Address and length of the ddr address space
+- bram: Phandle to bram controller which can access Microblaze BRAM
+- bram-firmware : Microblaze BRAM bootloader name
+- firmware : Default firmware name which can be override by
+	     "firmware" module parameter
+- reset-gpio : Gpio phandle which reset Microblaze remoteproc
+- debug-gpio : Gpio phandle which setup Microblaze to debug state
+- ipino-gpio : Gpio phandle for Microblaze to ARM communication
+- vring0-gpio : Gpio phandle for ARM to Microblaze communication vring 0
+- vring1-gpio : Gpio phandle for ARM to Microblaze communication vring 1
+
+Microblaze SoC can be also connected to the PS block via an axi bus.
+That's why there is the option to allocate interrupts for Microblaze use only.
+The driver will allocate interrupts to itself and Microblaze sw has to ensure
+that interrupts are properly enabled and handled by Microblaze interrupt
+controller.
+
+Optional properties:
+ - interrupts : Interrupt mapping for remoteproc
+ - interrupt-parent : Phandle for the interrupt controller
+
+Example:
+mb_remoteproc@800000 {
+	compatible = "xlnx,mb-remoteproc";
+	reg = < 0x8000000 0x8000000 >;
+	bram = <&axi_bram_ctrl_0>;
+	bram-firmware = "mb.bin";
+	firmware = "image.elf";
+	reset-gpio = <&zynq_gpio_reset 1 0>;
+	debug-gpio = <&zynq_gpio_reset 0 0>;
+	ipino-gpio = <&zynq_gpio_vring 0 0>;
+	vring0-gpio = <&zynq_gpio_vring 1 0>;
+	vring1-gpio = <&zynq_gpio_vring 2 0>;
+};
-- 
1.8.2.3
