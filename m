From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V4 1/3] dt: usb: jz4740: Add DT binding document for OHCI
Date: Tue, 3 Feb 2015 10:17:18 +0000
Message-ID: <1422958640-25723-2-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1422958640-25723-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422958640-25723-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

From: Paul Burton <paul.burton@imgtec.com>

Add the binding documentation for the JZ4740 OHCI controller.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
The jz4740 is platform only at the moment.

But DT support is being added

See http://patchwork.linux-mips.org/bundle/paulburton/ci20-v3.20/

V4 Changes
Removed clock binding because of pending work in clock tree. Will add
binding later. Rather than introduce a bad binding now and change later.

V3 Changes: named binding jz4740 instead of confusing it with jz47xx.
The driver name is jz4740. And will not be renamed

V2 Changes: Removed interrupt parent binding as that can be inherited.
Forgot a binding for clock-names
---
 .../devicetree/bindings/usb/ingenic,jz4740-ohci.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ingenic,jz4740-ohci.txt

diff --git a/Documentation/devicetree/bindings/usb/ingenic,jz4740-ohci.txt b/Documentation/devicetree/bindings/usb/ingenic,jz4740-ohci.txt
new file mode 100644
index 0000000..29c1934
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ingenic,jz4740-ohci.txt
@@ -0,0 +1,21 @@
+Ingenic JZ4740 SoC OHCI controller binding
+
+The Ingenic JZ4740 SoC includes an OHCI compliant USB host controller
+interface for use with USB 1.1 devices.
+
+Required properties:
+ - compatible: Should be "ingenic,jz4740-ohci"
+ - reg: Should contain the address & size of the OHCI controller registers.
+ - interrupts: Should specify the interrupt line number
+
+Example for jz4740:
+
+/ {
+	ohci: jz4780-ohci@0x134a0000 {
+		compatible = "ingenic,jz4740-ohci";
+		reg = <0x134a0000 0x10000>;
+
+		interrupts = <5>;
+	};
+};
+
-- 
1.9.1
