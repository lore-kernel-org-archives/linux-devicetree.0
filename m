From: =?UTF-8?q?Marc=20Mar=C3=AD?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4] QEMU fw_cfg DMA interface documentation
Date: Thu,  1 Oct 2015 14:15:32 +0200
Message-ID: <1443701732-13696-1-git-send-email-markmb@redhat.com>
References: <1443701677-13629-1-git-send-email-markmb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443701677-13629-1-git-send-email-markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Drew <drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin O'Connor <kevin-BG7uPxbsK//k1uMJSBkQmQ@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Laszlo <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Marc=20Mar=C3=AD?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add fw_cfg DMA interface specfication in the fw_cfg documentation.

Signed-off-by: Marc Mar=C3=AD <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/fw-cfg.txt | 52 ++++++++++++++++=
+++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fw-cfg.txt b/Documen=
tation/devicetree/bindings/arm/fw-cfg.txt
index 953fb64..10cd81c 100644
--- a/Documentation/devicetree/bindings/arm/fw-cfg.txt
+++ b/Documentation/devicetree/bindings/arm/fw-cfg.txt
@@ -38,6 +38,9 @@ The presence of the registers can be verified by sele=
cting the "signature" blob
 with key 0x0000, and reading four bytes from the data register. The re=
turned
 signature is "QEMU".
=20
+Additionaly, if the DMA interface is available then a read to the DMA =
Address
+will return 0x51454d5520434647 ("QEMU CFG" in big-endian format).
+
 The outermost protocol (involving the write / read sequences of the co=
ntrol and
 data registers) is expected to be versioned, and/or described by featu=
re bits.
 The interface revision / feature bitmap can be retrieved with key 0x00=
01. The
@@ -45,6 +48,51 @@ blob to be read from the data register has size 4, a=
nd it is to be interpreted
 as a uint32_t value in little endian byte order. The current value
 (corresponding to the above outer protocol) is zero.
=20
+If bit 1 of the feature bitmap is set, the DMA interface is present. T=
his
+can be used through the 64-bit wide address register.
+
+The address register is in big-endian format. The value for the regist=
er is 0
+at startup and after an operation. A write to the lower half triggers =
an
+operation. This means, that operations with 32-bit addresses can be tr=
iggered
+with just one write, whereas operations with 64-bit addresses can be t=
riggered
+with one 64-bit write or two 32-bit writes, starting with the higher p=
art.
+
+In this register, the physical address of a FWCfgDmaAccess structure i=
n RAM
+should be written. This is the format of the FWCfgDmaAccess structure:
+
+typedef struct FWCfgDmaAccess {
+    uint32_t control;
+    uint32_t length;
+    uint64_t address;
+} FWCfgDmaAccess;
+
+The fields of the structure are in big endian mode, and the field at t=
he lowest
+address is the "control" field.
+
+The "control" field has the following bits:
+ - Bit 0: Error
+ - Bit 1: Read
+ - Bit 2: Skip
+ - Bit 3: Select. The upper 16 bits are the selected index.
+
+When an operation is triggered, if the "control" field has bit 3 set, =
the
+upper 16 bits are interpreted as an index of a firmware configuration =
item.
+This has the same effect as writing the selector register.
+
+If the "control" field has bit 1 set, a read operation will be perform=
ed.
+"length" bytes for the current selector and offset will be copied into=
 the
+physical RAM address specified by the "address" field.
+
+If the "control" field has bit 2 set (and not bit 1), a skip operation=
 will be
+performed. The offset for the current selector will be advanced "lengt=
h" bytes.
+
+To check the result, read the "control" field:
+   error bit set        ->  something went wrong.
+   all bits cleared     ->  transfer finished successfully.
+   otherwise            ->  transfer still in progress (doesn't happen
+                            today due to implementation not being asyn=
c,
+                            but may in the future).
+
 The guest kernel is not expected to use these registers (although it i=
s
 certainly allowed to); the device tree bindings are documented here be=
cause
 this is where device tree bindings reside in general.
@@ -56,6 +104,8 @@ Required properties:
 - reg: the MMIO region used by the device.
   * Bytes 0x0 to 0x7 cover the data register.
   * Bytes 0x8 to 0x9 cover the selector register.
+  * With DMA interface enabled: Bytes 0x10 to 0x17 cover the DMA addre=
ss
+    register.
   * Further registers may be appended to the region in case of future =
interface
     revisions / feature bits.
=20
@@ -66,7 +116,7 @@ Example:
 	#address-cells =3D <0x2>;
=20
 	fw-cfg@9020000 {
+		reg =3D <0x0 0x9020000 0x0 0x18>;
 		compatible =3D "qemu,fw-cfg-mmio";
-		reg =3D <0x0 0x9020000 0x0 0xa>;
 	};
 };
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
