From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Subject: [PATCH 05/14] devicetree: Add bindings for the ATH79 MISC interrupt controllers
Date: Fri, 17 Apr 2015 16:24:20 +0200
Message-ID: <1429280669-2986-6-git-send-email-albeu@free.fr>
References: <1429280669-2986-1-git-send-email-albeu@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429280669-2986-1-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
---
 .../interrupt-controller/qca,ath79-misc-intc.txt   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
new file mode 100644
index 0000000..11b54dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
@@ -0,0 +1,30 @@
+Binding for Qualcomm Atheros AR7xxx/AR9XXX MISC interrupt controller
+
+The MISC interrupt controller is a secondary controller for lower priority
+interrupt.
+
+Required Properties:
+- compatible: has to be "qca,<soctype>-cpu-intc", "qca,ar7100-misc-intc"
+  as fallback
+- reg: Base address and size of the controllers memory area
+- interrupt-parent: phandle of the parent interrupt controller.
+- interrupts: Interrupt specifier for the controllers interrupt.
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode interrupt
+		     source, should be 1
+
+Please refer to interrupts.txt in this directory for details of the common
+Interrupt Controllers bindings used by client devices.
+
+Example:
+
+	miscintc@18060010 {
+		compatible = "qca,ar9132-misc-intc", qca,ar7100-misc-intc";
+		reg = <0x18060010 0x4>;
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <6>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
