From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: [PATCH 1/2] rtc: digicolor: document device tree binding
Date: Mon, 23 Mar 2015 15:28:53 +0200
Message-ID: <fa36a31a1d58d626ca0cb01ca0dece85aa2dfcb9.1427117334.git.baruch@tkos.co.il>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a device tree binding documentation to the Real Time Clock hardware block
on the Conexant CX92755 SoC. The CX92755 is from the Digicolor SoCs series.
Other SoCs in that series may share the same hardware block.

Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
---
 Documentation/devicetree/bindings/rtc/digicolor-rtc.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/digicolor-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/digicolor-rtc.txt b/Documentation/devicetree/bindings/rtc/digicolor-rtc.txt
new file mode 100644
index 000000000000..d464986012cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/digicolor-rtc.txt
@@ -0,0 +1,17 @@
+Conexant Digicolor Real Time Clock controller
+
+This binding currently supports the CX92755 SoC.
+
+Required properties:
+- compatible: should be "cnxt,cx92755-rtc"
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- interrupts: rtc alarm interrupt
+
+Example:
+
+	rtc@f0000c30 {
+		compatible = "cnxt,cx92755-rtc";
+		reg = <0xf0000c30 0x18>;
+		interrupts = <25>;
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
