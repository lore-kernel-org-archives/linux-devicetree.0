From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v5 1/7] mfd: ac100: Add device tree bindings for
 X-Powers AC100 codec/RTC combo IC
Date: Fri,  8 Jul 2016 22:33:36 +0800
Message-ID: <1467988422-17934-2-git-send-email-wens@csie.org>
References: <1467988422-17934-1-git-send-email-wens@csie.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCMILY6JWQBBBUXT725QKGQE64XZZBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1467988422-17934-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The AC100 is a multifunction device with an audio codec subsystem and
an RTC subsystem. These two subsystems share a common register space
and host interface.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes since v4:

  - Style changes suggested by Lee.
  - Added commit message.
  - Added Rob's ack.

Changes since v3:

  - Fixed device node names and added labels.
  - Added clock output from codec and input to rtc.

Changes since v2:

  - Fix interrupt line for ac100_codec in provided example.

---
 Documentation/devicetree/bindings/mfd/ac100.txt | 54 +++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ac100.txt

diff --git a/Documentation/devicetree/bindings/mfd/ac100.txt b/Documentation/devicetree/bindings/mfd/ac100.txt
new file mode 100644
index 000000000000..b8ef00667599
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ac100.txt
@@ -0,0 +1,54 @@
+X-Powers AC100 Codec/RTC IC Device Tree bindings
+
+AC100 is a audio codec and RTC subsystem combo IC. The 2 parts are
+separated, including power supplies and interrupt lines, but share
+a common register address space and host interface.
+
+Required properties:
+- compatible: "x-powers,ac100"
+- reg: The I2C slave address or RSB hardware address for the chip
+- sub-nodes:
+  - codec
+    - compatible:		"x-powers,ac100-codec"
+    - interrupt-parent:		The parent interrupt controller
+    - interrupts:		SoC NMI / GPIO interrupt connected to the
+    				IRQ_AUDIO pin
+    - #clock-cells:		Shall be 0
+    - clock-output-names:	"4M_adda"
+
+    - see clock/clock-bindings.txt for common clock bindings
+
+  - rtc
+    - compatible:		"x-powers,ac100-rtc"
+    - interrupt-parent:		The parent interrupt controller
+    - interrupts:		SoC NMI / GPIO interrupt connected to the
+    				IRQ_RTC pin
+    - clocks:			A phandle to the codec's "4M_adda" clock
+    - #clock-cells:		Shall be 1
+    - clock-output-names:	"cko1_rtc", "cko2_rtc", "cko3_rtc"
+
+    - see clock/clock-bindings.txt for common clock bindings
+
+Example:
+
+ac100: codec@e89 {
+	compatible = "x-powers,ac100";
+	reg = <0xe89>;
+
+	ac100_codec: codec {
+		compatible = "x-powers,ac100-codec";
+		interrupt-parent = <&r_pio>;
+		interrupts = <0 9 IRQ_TYPE_LEVEL_LOW>; /* PL9 */
+		#clock-cells = <0>;
+		clock-output-names = "4M_adda";
+	};
+
+	ac100_rtc: rtc {
+		compatible = "x-powers,ac100-rtc";
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&ac100_codec>;
+		#clock-cells = <1>;
+		clock-output-names = "cko1_rtc", "cko2_rtc", "cko3_rtc";
+	};
+};
-- 
2.8.1

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
