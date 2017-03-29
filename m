From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 2/7] dt-bindings: rtc: document the rtc-sh bindings
Date: Wed, 29 Mar 2017 10:30:30 -0700
Message-ID: <20170329173035.67477-3-chris.brandt@renesas.com>
References: <20170329173035.67477-1-chris.brandt@renesas.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDXOFUXT2UGBBYO657DAKGQEAYYK2NI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170329173035.67477-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the binding documentation for rtc-sh which is an RTC for
SuperH and RZ/A SoCs.

Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
v3:
* remove 'power-domains' from example
* update commit message subject and body
v2:
* added interrupt-names and clock-names
* clocks now include counting sources
* changed 'is a RTC' to 'is an RTC' in commit message
---
 Documentation/devicetree/bindings/rtc/rtc-sh.txt | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-sh.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-sh.txt b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
new file mode 100644
index 000000000000..7676c7d28874
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
@@ -0,0 +1,28 @@
+* Real Time Clock for Renesas SH and ARM SoCs
+
+Required properties:
+- compatible: Should be "renesas,r7s72100-rtc" and "renesas,sh-rtc" as a
+  fallback.
+- reg: physical base address and length of memory mapped region.
+- interrupts: 3 interrupts for alarm, period, and carry.
+- interrupt-names: The interrupts should be labeled as "alarm", "period", and
+  "carry".
+- clocks: The functional clock source for the RTC controller must be listed
+  first (if exists). Additionally, potential clock counting sources are to be
+  listed.
+- clock-names: The functional clock must be labeled as "fck". Other clocks
+  may be named in accordance to the SoC hardware manuals.
+
+
+Example:
+rtc: rtc@fcff1000 {
+	compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
+	reg = <0xfcff1000 0x2e>;
+	interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
+		      GIC_SPI 277 IRQ_TYPE_EDGE_RISING
+		      GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
+	interrupt-names = "alarm", "period", "carry";
+	clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
+		 <&rtc_x3_clk>, <&extal_clk>;
+	clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
+};
-- 
2.11.0


-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
