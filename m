From: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [kernel PATCH] devicetree: document ARM bindings for QEMU's Firmware Config interface
Date: Fri, 28 Nov 2014 13:26:44 +0100
Message-ID: <1417177604-21194-1-git-send-email-lersek@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Peter Maydell suggested that we describe new devices / DTB nodes in the
kernel Documentation tree that we expose to arm "virt" guests in QEMU.

Although the kernel is not required to access the fw_cfg interface,
"Documentation/devicetree/bindings/arm" is probably the best central spot
to keep the fw_cfg description in.

Suggested-by: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/fw-cfg.txt | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/fw-cfg.txt

diff --git a/Documentation/devicetree/bindings/arm/fw-cfg.txt b/Documentation/devicetree/bindings/arm/fw-cfg.txt
new file mode 100644
index 0000000..d131453
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/fw-cfg.txt
@@ -0,0 +1,47 @@
+* QEMU Firmware Configuration bindings for ARM
+
+QEMU's arm-softmmu and aarch64-softmmu emulation / virtualization targets
+provide the following Firmware Configuration interface on the "virt" machine
+type:
+
+- A write-only, 16-bit wide selector (or control) register,
+- a read-write, 8-bit wide data register.
+
+The guest writes a selector value (a key) to the selector register, and then
+can read the corresponding data (produced by QEMU) via the data port. If the
+selected entry is writable, the guest can rewrite it through the data port. The
+authoritative registry of the valid selector values and their meanings is the
+QEMU source code.
+
+QEMU exposes the control and data register to x86 guests at fixed IO ports. ARM
+guests can access them as memory mapped registers, and their location is
+communicated to the guest's UEFI firmware in the DTB that QEMU places at the
+bottom of the guest's DRAM.
+
+The guest kernel is not expected to use these registers (although it is
+certainly allowed to); the device tree bindings are documented here because
+this is where device tree bindings reside in general.
+
+The addresses and sizes of the Firmware Configuration registers are given by
+the /fw-cfg node. The "virt" board invariably uses <2> as #size-cells and
+#address-cells in the context of this node.
+
+The "reg" property is therefore an array of four uint64_t elements (eight
+uint32_t cells in total), the first uint64_t pair describing the address and
+size of the control register, the second uint64_t pair describing the address
+and size of the data register. (See
+<http://devicetree.org/Device_Tree_Usage#How_Addressing_Works>.)
+
+The first string in the "compatible" property is "fw-cfg,mmio".
+
+Example:
+
+/ {
+	#size-cells = <0x2>;
+	#address-cells = <0x2>;
+
+	fw-cfg@9020000 {
+		reg = <0x0 0x9020000 0x0 0x2 0x0 0x9020002 0x0 0x1>;
+		compatible = "fw-cfg,mmio";
+	};
+};
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
