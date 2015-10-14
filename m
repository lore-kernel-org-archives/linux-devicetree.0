From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/5] dt-bindings: MIPS: Document xilfpga bindings and boot style
Date: Wed, 14 Oct 2015 13:51:53 +0100
Message-ID: <1444827117-10939-2-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444827117-10939-1-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Xilfpga boots only with device-tree. Document the required properties
and the unique boot style

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/mips/img/xilfpga.txt       | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/img/xilfpga.txt

diff --git a/Documentation/devicetree/bindings/mips/img/xilfpga.txt b/Documentation/devicetree/bindings/mips/img/xilfpga.txt
new file mode 100644
index 0000000..1e7084c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/img/xilfpga.txt
@@ -0,0 +1,76 @@
+Imagination University Program MIPSFpga
+=======================================
+
+Under the Imagination University Program, a microAptiv UP core has been released for academic usage.
+
+As we are dealing with a mips core instantiated on an FPGA, specifications are fluid and can be varied in RTL.
+
+This binding document is provided as baseline guidance for the example project provided by IMG.
+
+The example project runs on the Nexys4DDR board by Digilent powered by the ARTIX-7 FPGA by Xilinx.
+
+Relevant details about the example project and the Nexys4DDR board:
+
+- microAptiv UP core m14Kc
+- 50MHz clock speed
+- 128Mbyte DDR RAM	at 0x0000_0000
+- 8Kbyte RAM		at 0x1000_0000
+- axi_intc		at 0x1020_0000
+- axi_uart16550		at 0x1040_0000
+- axi_gpio		at 0x1060_0000
+- axi_i2c		at 0x10A0_0000
+- custom_gpio		at 0x10C0_0000
+- axi_ethernetlite	at 0x10E0_0000
+- 8Kbyte BootRAM	at 0x1FC0_0000
+
+Required properties:
+--------------------
+ - compatible: Must include "img,xilfpga".
+
+CPU nodes:
+----------
+A "cpus" node is required.  Required properties:
+ - #address-cells: Must be 1.
+ - #size-cells: Must be 0.
+A CPU sub-node is also required for at least CPU 0. Required properties:
+ - device_type: Must be "cpu".
+ - compatible: Must be "mips,m14Kc".
+ - reg: Must be <0>.
+ - clocks: Must include the CPU clock.  See ../../clock/clock-bindings.txt for
+   details on clock bindings.
+ - ext clock handle for fixed-clock received by MIPS core.
+Example:
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "mips,m14Kc";
+			reg = <0>;
+			clocks	= <&ext>;
+		};
+	};
+
+	ext: ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+	};
+
+Boot protocol:
+--------------
+
+The BootRAM is a writeable "RAM" in FPGA at 0x1FC0_0000. This is for easy reprogrammibility via JTAG.
+
+The BootRAM inializes the cache and the axi_uart peripheral.
+
+DDR initialiation is already handled by a HW IP block.
+
+When the example project bitstream is loaded, the cpu_reset button needs to be pressed.
+
+The bootram initializes the cache and axi_uart. Then outputs MIPSFPGA\n\r on the serial port
+on the Nexys4DDR board.
+
+At this point, the board is ready to load the Linux kernel vmlinux file via JTAG.
+
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
