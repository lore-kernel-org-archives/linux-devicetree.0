From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 3/5] Documentation: dt: iio: document stm32 exti trigger
Date: Mon, 30 Jan 2017 15:33:58 +0100
Message-ID: <1485786840-4557-4-git-send-email-fabrice.gasnier@st.com>
References: <1485786840-4557-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485786840-4557-1-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add dt documentation for st,stm32-exti-trigger.
EXTi gpio signal can be routed internally as trigger source for various
IPs (e.g. for ADC or DAC conversions).

Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
---
 .../bindings/iio/trigger/st,stm32-exti-trigger.txt      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt

diff --git a/Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt b/Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt
new file mode 100644
index 0000000..ebf2645
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt
@@ -0,0 +1,17 @@
+STMicroelectronics STM32 EXTI trigger bindings
+
+EXTi gpio signal can be routed internally as trigger source for various
+IPs (e.g. for ADC or DAC conversions).
+
+Contents of a stm32 exti trigger root node:
+-------------------------------------------
+Required properties:
+- compatible: Should be "st,stm32-exti-trigger"
+- extiN-gpio: optional gpio line that may be used as external trigger source
+  (e.g. N may be 0..15. For example, exti11-gpio can trig ADC on stm32f4).
+
+Example:
+	triggers {
+		compatible = "st,stm32-exti-trigger";
+		exti11-gpio=<&gpioa 11 0>;
+	};
-- 
1.9.1
