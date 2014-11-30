From: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [kernel PATCH v2 2/2] devicetree: document ARM bindings for QEMU's Firmware Config interface
Date: Sun, 30 Nov 2014 17:51:22 +0100
Message-ID: <1417366282-13527-3-git-send-email-lersek@redhat.com>
References: <1417366282-13527-1-git-send-email-lersek@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417366282-13527-1-git-send-email-lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Peter Maydell suggested that we describe new devices / DTB nodes in the
kernel Documentation tree that we expose to arm "virt" guests in QEMU.

Although the kernel is not required to access the fw_cfg interface,
"Documentation/devicetree/bindings/arm" is probably the best central spot
to keep the fw_cfg description in.

Suggested-by: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---

Notes:
    v2:
    - more info on what the fw_cfg device is used for, versioning, blobs etc
      [Mark Rutland]
    - drop generic statements about DTB [Mark Rutland]
    - drop uint64_t language [Mark Rutland]
    - cover both registers with one contiguous region, of size 0x1000 [Mark
      Rutland, Arnd Bergmann]
    - specify "qemu,fw-cfg-mmio" for the "compatible" property [Mark
      Rutland, Arnd Bergmann]
    - reorder DTS snippet so that "compatible" come first [Mark Rutland]

 Documentation/devicetree/bindings/arm/fw-cfg.txt | 57 ++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/fw-cfg.txt

diff --git a/Documentation/devicetree/bindings/arm/fw-cfg.txt b/Documentation/devicetree/bindings/arm/fw-cfg.txt
new file mode 100644
index 0000000..15e2ae3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/fw-cfg.txt
@@ -0,0 +1,57 @@
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
+can read the corresponding data (produced by QEMU) via the data register. If
+the selected entry is writable, the guest can rewrite it through the data
+register.
+
+The interface allows guest firmware to download various parameters and blobs
+that affect how the firmware works and what tables it installs for the guest
+OS. For example, boot order of devices, ACPI tables, SMBIOS tables, kernel and
+initrd images for direct kernel booting, virtual machine UUID, SMP information,
+virtual NUMA topology, and so on.
+
+The authoritative registry of the valid selector values and their meanings is
+the QEMU source code; the structure of the data blobs corresponding to the
+individual key values is also defined in the QEMU source code.
+
+The outermost protocol (involving the write / read sequences of the control and
+data registers) is unversioned and considered stable. Versioning of individual
+blobs is theoretically possible, but it is not specified on this level (and is
+not done in practice as yet).
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
+Required properties:
+
+- compatible: "qemu,fw-cfg-mmio".
+
+- reg: the MMIO region used by the device.
+  * The first two bytes in the region cover the control register.
+  * The third byte covers the data register.
+
+Example:
+
+/ {
+	#size-cells = <0x2>;
+	#address-cells = <0x2>;
+
+	fw-cfg@9020000 {
+		compatible = "qemu,fw-cfg-mmio";
+		reg = <0x0 0x9020000 0x0 0x1000>;
+	};
+};
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
