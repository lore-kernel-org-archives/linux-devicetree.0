From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: [PATCH v3 1/2] irqchip: devicetree: document Conexant Digicolor irq binding
Date: Thu, 15 Jan 2015 12:33:59 +0200
Message-ID: <505a65c8861e5210d94227bc0eec89cab0593fca.1421317616.git.baruch@tkos.co.il>
References: <cover.1421317616.git.baruch@tkos.co.il>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1421317616.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
---
 .../bindings/interrupt-controller/digicolor-ic.txt | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
new file mode 100644
index 000000000000..c25c9a4de615
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
@@ -0,0 +1,22 @@
+Conexant Digicolor Interrupt Controller
+
+Required properties:
+
+- compatible : should be "cnxt,cx92755-ic"
+- reg : Specifies base physical address and size of the interrupt controller
+  registers (IC) area
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 1.
+- syscon: A phandle to the syscon node describing UC registers
+
+Example:
+
+	intc: interrupt-controller@f0000040 {
+		compatible = "cnxt,cx92755-ic";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		reg = <0xf0000040 0x40>;
+		syscon = <&uc_regs>;
+	};
+
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
