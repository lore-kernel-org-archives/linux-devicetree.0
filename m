From: Markus Mayer <code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>
Subject: [PATCH v3 1/2] dt/bindings: Add bindings for Broadcom STB DRAM Sensors
Date: Thu, 24 Aug 2017 16:36:25 -0700
Message-ID: <20170824233626.1343-2-code@mmayer.net>
References: <20170824233626.1343-1-code@mmayer.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170824233626.1343-1-code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Broadcom Kernel List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Provide bindings for the Broadcom STB DDR PHY Front End (DPFE).

Signed-off-by: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/memory-controllers/brcm,dpfe-cpu.txt  | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/brcm,dpfe-cpu.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,dpfe-cpu.txt b/Documentation/devicetree/bindings/memory-controllers/brcm,dpfe-cpu.txt
new file mode 100644
index 0000000..82d923e
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/brcm,dpfe-cpu.txt
@@ -0,0 +1,27 @@
+DDR PHY Front End (DPFE) for Broadcom STB
+=========================================
+
+DPFE and the DPFE firmware provide an interface for the host CPU to
+communicate with the DCPU, which resides inside the DDR PHY.
+
+There are three memory regions for interacting with the DCPU. These are
+specified in a single reg property.
+
+Required properties:
+  - compatible: must be "brcm,bcm7271-dpfe-cpu", "brcm,bcm7268-dpfe-cpu"
+    or "brcm,dpfe-cpu"
+  - reg: must reference three register ranges
+      - start address and length of the DCPU register space
+      - start address and length of the DCPU data memory space
+      - start address and length of the DCPU instruction memory space
+  - reg-names: must contain "dpfe-cpu", "dpfe-dmem", and "dpfe-imem";
+        they must be in the same order as the register declarations
+
+Example:
+	dpfe_cpu0: dpfe-cpu@f1132000 {
+		compatible = "brcm,bcm7271-dpfe-cpu", "brcm,dpfe-cpu";
+		reg =  <0xf1132000 0x180
+			0xf1134000 0x1000
+			0xf1138000 0x4000>;
+		reg-names = "dpfe-cpu", "dpfe-dmem", "dpfe-imem";
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
