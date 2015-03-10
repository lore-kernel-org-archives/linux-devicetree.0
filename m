From: =?ISO-8859-1?Q?S=F8ren?= Andersen <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>
Subject: [patch v2 3/4] dt-bindings Help for pcf85063
Date: Tue, 10 Mar 2015 21:34:35 +0100
Message-ID: <1426019675.5476.21.camel@sanws1.rosetechnology.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Soeren Andersen <san at rosetechnology.dk>
---
 Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
index 0000000..dcda544
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
@@ -0,0 +1,16 @@
+* NXP PCF85063		Tiny Real-Time Clock
+
+Required properties:
+- compatible: Should contain "nxp,pcf85063".
+- reg: I2C address for chip
+
+Optional properties:
+- quartz_load : Internal oscillator capacity for quartz crystals
+	Values usable for pcf85063 load capacitance are 7pF, 12.5pF
+
+Example:
+	pcf85063: rtc@51 {
+		compatible = "nxp,pcf85063";
+		quartz_load = "12.5pF";
+		reg = <0x51>;
+	};


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
