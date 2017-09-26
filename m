From: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 03/12] staging: typec: tcpci: add documentation for tcpci
Date: Tue, 26 Sep 2017 08:45:18 +0800
Message-ID: <1506386727-16370-4-git-send-email-jun.li@nxp.com>
References: <1506386727-16370-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506386727-16370-1-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, jun.li-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

TCPCI stands for typec port controller interface, its implementation
has full typec port control with power delivery support, it's a
standard i2c slave with GPIO input as irq interface, detail see spec
"Universal Serial Bus Type-C Port Controller Interface Specification
Revision 1.0, Version 1.1"

Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
---
 .../devicetree/bindings/usb/typec-tcpci.txt        | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/typec-tcpci.txt b/Documentation/devicetree/bindings/usb/typec-tcpci.txt
new file mode 100644
index 0000000..9268440
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typec-tcpci.txt
@@ -0,0 +1,36 @@
+TCPCI(Typec port cotroller interface) binding
+---------------------------------------------
+
+Required properties:
+- compatible:       should be "usb,tcpci".
+- reg:              the i2c slave address of typec port controller device.
+- interrupt-parent: the phandle to the interrupt controller which provides
+                    the interrupt.
+- interrupts:       interrupt specification for tcpci alert.
+- port-type:        typec port type.
+- default-role:     preferred power role if port type is "dual".
+
+Required properties only for power source or drp:
+- src-pdos
+
+Required properties only for power sink or drp:
+- snk-pdos
+- max-snk-mv
+- max-snk-ma
+- op-snk-mw
+
+Example:
+
+ptn5110@50 {
+	compatible = "usb,tcpci";
+	reg = <0x50>;
+	interrupt-parent = <&gpio3>;
+	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+	port-type = "dual";
+	default-role = "sink";
+	src-pdos = <0x380190c8>;
+	snk-pdos = <0x380190c8 0x3802d0c8>;
+	max-snk-mv = <9000>;
+	max-snk-ma = <1000>;
+	op-snk-mw = <9000>;
+};
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
