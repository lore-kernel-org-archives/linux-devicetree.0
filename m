From: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 2/2] devicetree: document ARM bindings for QEMU's Firmware Config interface
Date: Wed, 17 Dec 2014 21:49:46 +0100
Message-ID: <1418849386-25857-3-git-send-email-lersek@redhat.com>
References: <1418849386-25857-1-git-send-email-lersek@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418849386-25857-1-git-send-email-lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, agraf-l3A5Bk7waGM@public.gmane.org
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
    v4:
    - selector and data registers are big endian
    - spell out that the data register must be accessed at its offset 0
    
    v3:
    - advertise the exact size of the region in the DTB [Peter Maydell, Arnd
      Bergmann]
    - update to 64-bit wide data register
    - describe corresponding new region layout
    - describe endianness
    - describe key 0x0000 (signature check) and 0x0001 (interface revision /
      feature bitmap)
    - matches <http://thread.gmane.org/gmane.comp.emulators.qemu/309641>:
      [PATCH v3 0/7] fw_cfg, bootorder, and UEFI+'-kernel' on arm/virt
    
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

 Documentation/devicetree/bindings/arm/fw-cfg.txt | 72 ++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/fw-cfg.txt

diff --git a/Documentation/devicetree/bindings/arm/fw-cfg.txt b/Documentation/devicetree/bindings/arm/fw-cfg.txt
new file mode 100644
index 0000000..9ea6322
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/fw-cfg.txt
@@ -0,0 +1,72 @@
+* QEMU Firmware Configuration bindings for ARM
+
+QEMU's arm-softmmu and aarch64-softmmu emulation / virtualization targets
+provide the following Firmware Configuration interface on the "virt" machine
+type:
+
+- A write-only, 16-bit wide selector (or control) register,
+- a read-write, 64-bit wide data register.
+
+QEMU exposes the control and data register to ARM guests as memory mapped
+registers; their location is communicated to the guest's UEFI firmware in the
+DTB that QEMU places at the bottom of the guest's DRAM.
+
+The guest writes a selector value (a key) to the selector register, and then
+can read the corresponding data (produced by QEMU) via the data register. If
+the selected entry is writable, the guest can rewrite it through the data
+register.
+
+The selector register takes keys in big endian byte order.
+
+The data register allows accesses with 8, 16, 32 and 64-bit width (only at
+offset 0 of the register). Accesses larger than a byte are interpreted as
+arrays, bundled together only for better performance. The bytes constituting
+such a word, in decreasing address order, correspond to the bytes that would
+have been transferred by byte-wide accesses in chronological order.
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
+The presence of the registers can be verified by selecting the "signature" blob
+with key 0x0000, and reading four bytes from the data register. The returned
+signature is "QEMU".
+
+The outermost protocol (involving the write / read sequences of the control and
+data registers) is expected to be versioned, and/or described by feature bits.
+The interface revision / feature bitmap can be retrieved with key 0x0001. The
+blob to be read from the data register has size 4, and it is to be interpreted
+as a uint32_t value in little endian byte order. The current value
+(corresponding to the above outer protocol) is zero.
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
+  * Bytes 0x0 to 0x7 cover the data register.
+  * Bytes 0x8 to 0x9 cover the selector register.
+  * Further registers may be appended to the region in case of future interface
+    revisions / feature bits.
+
+Example:
+
+/ {
+	#size-cells = <0x2>;
+	#address-cells = <0x2>;
+
+	fw-cfg@9020000 {
+		compatible = "qemu,fw-cfg-mmio";
+		reg = <0x0 0x9020000 0x0 0xa>;
+	};
+};
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
