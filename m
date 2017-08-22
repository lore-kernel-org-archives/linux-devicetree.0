From: Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
Subject: [PATCH 1/2] rtc: v3020: Add documentation for DT bindings
Date: Tue, 22 Aug 2017 17:05:47 -0400
Message-ID: <660fa006-4f91-2fb5-ef98-ba0482e1ecff@mothictech.com>
References: <b832db93-9885-adfe-39b4-1950851b391d@mothictech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b832db93-9885-adfe-39b4-1950851b391d-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the DT bindings for the rtc-v3020 driver.  MMIO and GPIO
attachment modes are both supported via DT.

Signed-off-by: Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
---
 .../devicetree/bindings/rtc/rtc-v3020.txt          | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-v3020.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-v3020.txt b/Documentation/devicetree/bindings/rtc/rtc-v3020.txt
new file mode 100644
index 000000000000..8b32e6a79960
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-v3020.txt
@@ -0,0 +1,38 @@
+ EM Micro v3020 RTC
+~~~~~~~~~~~~~~~~~~~~
+
+Required properties:
+  - compatible : "emmicro,v3020"
+
+Required for MMIO connection:
+  - reg : should contain registers location and length.
+
+Required for GPIO connection:
+- emmicro,use-gpio
+- cs-gpios, wr-gpios, rd-gpios, io-gpios : specify gpios connected to
+  corresponding pins of the RTC
+
+Optional properties:
+- emmicro,mmio-left-shift : data bit to which IO line is connected for MMIO
+  connection (defaults to 0)
+
+MMIO Example:
+
+       rtc@70 {
+               ompatible = "emmicro,v3020";
+               reg = <1 0x70 1>;
+               emmicro,mmio-left-shift = <16>; /* IO connected to D16 */
+       };
+
+
+GPIO Example:
+
+       rtc {
+               compatible = "emmicro,v3020";
+
+               emmicro,use-gpio;
+               cs-gpios = <&gpio2 3 0>;
+               wr-gpios = <&gpio2 4 0>;
+               rd-gpios = <&gpio2 5 0>;
+               io-gpios = <&gpio2 6 0>;
+       };
-- 
2.11.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
