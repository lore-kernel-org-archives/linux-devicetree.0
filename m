From: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH resend 02/12] usb: typec: add basic typec properties
Date: Tue, 26 Sep 2017 12:05:13 +0800
Message-ID: <1506398723-19359-3-git-send-email-jun.li@nxp.com>
References: <1506398723-19359-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506398723-19359-1-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, jun.li-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

port-type is required for any typec port; default-role is only required
for drp; power source capable needs src-pdos; power sink capable needs
snk-pdos, max-snk-mv, max-snk-ma, op-snk-mw.

Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/typec.txt | 46 +++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/typec.txt b/Documentation/devicetree/bindings/usb/typec.txt
new file mode 100644
index 0000000..36d4467
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typec.txt
@@ -0,0 +1,46 @@
+Generic typec and power delivery properties
+-------------------------------------------
+
+Required properties:
+- port-type:    should be one of "source", "sink" or "dual".
+- default-role: preferred power role if drp, should be "sink" or "source".
+- src-pdos:     An array of u32 with each entry providing supported power
+                source data object(PDO), the detailed bit definitions of
+                PDO can be found in "Universal Serial Bus Power Delivery
+                Specification" chapter 6.4.1.2 Source_Capabilities Message,
+                the order of each entry(PDO) should follow the PD spec chapter
+                6.4.1. Required only for power source and power dual role with
+                power delivery support.
+- snk-pdos:     An array of u32 with each entry providing supported power
+                sink data object(PDO), the detailed bit definitions of PDO
+                can be found in "Universal Serial Bus Power Delivery
+                Specification" chapter 6.4.1.3 Sink Capabilities Message,
+                the order of each entry(PDO) should follow the PD spec chapter
+                6.4.1. Required only for power sink and power dual role with
+                power delivery support.
+- max-snk-mv:   The max voltage the sink can support in millivoltage, required
+                only for power sink and power dual role with power delivery
+                support.
+- max-snk-ma:   The max current the sink can support in milliampere, required
+                only for power sink and power dual role with power delivery
+                support.
+- op-snk-mw:    Sink required operating power in milliwatts, if source offered
+                power is less then it, Capability Mismatch is set, required
+                only for power sink and power dual role with power delivery
+                support.
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
