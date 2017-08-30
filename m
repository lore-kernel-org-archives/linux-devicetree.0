From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 1/3] dt-bindings: regulator: Add STM32 Voltage Reference Buffer
Date: Wed, 30 Aug 2017 17:55:27 +0200
Message-ID: <1504108529-31727-2-git-send-email-fabrice.gasnier@st.com>
References: <1504108529-31727-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504108529-31727-1-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document STM32 VREFBUF (voltage reference buffer) which can be used as
voltage reference for ADCs, DACs and external components.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/regulator/st,stm32-vrefbuf.txt          | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt

diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
new file mode 100644
index 0000000..3944ee3
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
@@ -0,0 +1,20 @@
+STM32 VREFBUF - Voltage reference buffer
+
+Some STM32 devices embed a voltage reference buffer which can be used as
+voltage reference for ADCs, DACs and also as voltage reference for external
+components through the dedicated VREF+ pin.
+
+Required properties:
+- compatible:		Must be "st,stm32-vrefbuf".
+- reg:			Offset and length of VREFBUF register set.
+- clocks:		Must contain an entry for peripheral clock.
+
+Example:
+	vrefbuf: regulator@58003C00 {
+		compatible = "st,stm32-vrefbuf";
+		reg = <0x58003C00 0x8>;
+		clocks = <&rcc VREF_CK>;
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <2500000>;
+		vdda-supply = <&vdda>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
