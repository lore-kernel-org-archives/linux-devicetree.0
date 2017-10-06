From: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Subject: [PATCH v8 1/3] media: dt: bindings: Add binding for tango HW IR
 decoder
Date: Fri, 6 Oct 2017 14:23:37 +0200
Message-ID: <3d911a4a-1945-08a7-ae19-0cd0dc6aaacd@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Young <sean-hENCXIMQXOg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-media <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>, Thibaud Cornic <thibaud_cornic-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT binding for the HW IR decoder embedded in SMP86xx/SMP87xx.

Signed-off-by: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
---
 .../devicetree/bindings/media/tango-ir.txt          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/tango-ir.txt

diff --git a/Documentation/devicetree/bindings/media/tango-ir.txt b/Documentation/devicetree/bindings/media/tango-ir.txt
new file mode 100644
index 000000000000..a9f00c2bf897
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/tango-ir.txt
@@ -0,0 +1,21 @@
+Sigma Designs Tango IR NEC/RC-5/RC-6 decoder (SMP86xx and SMP87xx)
+
+Required properties:
+
+- compatible: "sigma,smp8642-ir"
+- reg: address/size of NEC+RC5 area, address/size of RC6 area
+- interrupts: spec for IR IRQ
+- clocks: spec for IR clock (typically the crystal oscillator)
+
+Optional properties:
+
+- linux,rc-map-name: see Documentation/devicetree/bindings/media/rc.txt
+
+Example:
+
+	ir@10518 {
+		compatible = "sigma,smp8642-ir";
+		reg = <0x10518 0x18>, <0x105e0 0x1c>;
+		interrupts = <21 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&xtal>;
+	};
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
