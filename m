From: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Subject: [PATCH v2 2/7] Documentation: dt: Add binding info for
 jz4740-rtc driver
Date: Mon, 31 Oct 2016 00:02:42 +0100
Message-ID: <20161030230247.20538-3-paul@crapouillou.net>
References: <20161030230247.20538-1-paul@crapouillou.net>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBC433LF43MBBBJXY3HAAKGQEEUOCH3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161030230247.20538-1-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds documentation for the device-tree bindings of the
jz4740-rtc driver, which supports the RTC unit present in the JZ4740 and
JZ4780 SoCs from Ingenic.

Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Acked-by: Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>
---
 .../devicetree/bindings/rtc/ingenic,jz4740-rtc.txt | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt

v2:
- Remove 'interrupt-parent' of the list of required properties
- Add the -msec suffix for the DT entries that represent time

diff --git a/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt b/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
new file mode 100644
index 0000000..df97594
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
@@ -0,0 +1,37 @@
+JZ4740 and similar SoCs real-time clock driver
+
+Required properties:
+
+- compatible: One of:
+  - "ingenic,jz4740-rtc" - for use with the JZ4740 SoC
+  - "ingenic,jz4780-rtc" - for use with the JZ4780 SoC
+- reg: Address range of rtc register set
+- interrupts: IRQ number for the alarm interrupt
+- clocks: phandle to the "rtc" clock
+- clock-names: must be "rtc"
+
+Optional properties:
+- system-power-controller: To use this component as the
+  system power controller
+- reset-pin-assert-time-msec: Reset pin low-level assertion
+  time after wakeup (default 60ms; range 0-125ms if RTC clock
+  at 32 kHz)
+- min-wakeup-pin-assert-time-msec: Minimum wakeup pin assertion
+  time (default 100ms; range 0-2s if RTC clock at 32 kHz)
+
+Example:
+
+rtc@10003000 {
+	compatible = "ingenic,jz4740-rtc";
+	reg = <0x10003000 0x3F>;
+
+	interrupt-parent = <&intc>;
+	interrupts = <32>;
+
+	clocks = <&rtc_clock>;
+	clock-names = "rtc";
+
+	system-power-controller;
+	reset-pin-assert-time-msec = <60>;
+	min-wakeup-pin-assert-time-msec = <100>;
+};
-- 
2.9.3

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
