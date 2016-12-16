From: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Subject: [PATCHv2 2/8] dt-bindings: document the STM32 RTC bindings
Date: Fri, 16 Dec 2016 09:50:51 +0100
Message-ID: <1481878257-29163-3-git-send-email-amelie.delaunay@st.com>
References: <1481878257-29163-1-git-send-email-amelie.delaunay@st.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBAABBCWWZ3BAKGQEKGIUPQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1481878257-29163-1-git-send-email-amelie.delaunay-qxv4g6HH51o@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the STM32 RTC.

Signed-off-by: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/rtc/st,stm32-rtc.txt       | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
new file mode 100644
index 0000000..e2837b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
@@ -0,0 +1,27 @@
+STM32 Real Time Clock
+
+Required properties:
+- compatible: "st,stm32-rtc".
+- reg: address range of rtc register set.
+- clocks: reference to the clock entry ck_rtc.
+- interrupt-parent: phandle for the interrupt controller.
+- interrupts: rtc alarm interrupt.
+- st,syscfg: phandle for pwrcfg, mandatory to disable/enable backup domain
+  (RTC registers) write protection.
+
+Optional properties (to override default ck_rtc parent clock):
+- assigned-clocks: reference to the ck_rtc clock entry.
+- assigned-clock-parents: phandle of the new parent clock of ck_rtc.
+
+Example:
+
+	rtc: rtc@40002800 {
+		compatible = "st,stm32-rtc";
+		reg = <0x40002800 0x400>;
+		clocks = <&rcc 1 CLK_RTC>;
+		assigned-clocks = <&rcc 1 CLK_RTC>;
+		assigned-clock-parents = <&rcc 1 CLK_LSE>;
+		interrupt-parent = <&exti>;
+		interrupts = <17 1>;
+		st,syscfg = <&pwrcfg>;
+	};
-- 
1.9.1

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
