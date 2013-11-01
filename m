From: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 2/2] PWM: atmel-pwm: add device tree binding document
Date: Fri,  1 Nov 2013 16:00:11 +0800
Message-ID: <1383292811-11343-1-git-send-email-voice.shen@atmel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add atmel pwm driver device tree binding document

Signed-off-by: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

---
Changes in v6:
  - New, split binding document as a separate patch

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../devicetree/bindings/pwm/atmel-pwm.txt          |   41 ++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/atmel-pwm.txt

diff --git a/Documentation/devicetree/bindings/pwm/atmel-pwm.txt b/Documentation/devicetree/bindings/pwm/atmel-pwm.txt
new file mode 100644
index 0000000..1c1a5fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/atmel-pwm.txt
@@ -0,0 +1,41 @@
+Atmel PWM controller
+
+Required properties:
+  - compatible: should be one of:
+    - "atmel,at91sam9rl-pwm"
+    - "atmel,sama5d3-pwm"
+  - reg: physical base address and length of the controller's registers
+  - #pwm-cells: Should be 3. See pwm.txt in this directory for a
+    description of the cells format
+
+Example:
+
+	pwm0: pwm@f8034000 {
+		compatible = "atmel,at91sam9rl-pwm";
+		reg = <0xf8034000 0x400>;
+		#pwm-cells = <3>;
+	};
+
+The following the pwm led based example:
+
+	pwm0: pwm@f8034000 {
+		compatible = "atmel,at91sam9rl-pwm";
+		reg = <0xf8034000 0x400>;
+		#pwm-cells = <3>;
+	};
+
+	pwdleds {
+		compatible = "pwm-leds";
+
+		d1 {
+			label = "d1";
+			pwms = <&pwm0 3 5000 0>
+			max-brightness = <255>;
+		};
+
+		d2 {
+			label = "d2";
+			pwms = <&pwm0 1 5000 1>
+			max-brightness = <255>;
+		};
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
