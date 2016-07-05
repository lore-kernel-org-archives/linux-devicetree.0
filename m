From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [PATCH v3 2/4] meson-rtc: add device-tree binding
Date: Tue,  5 Jul 2016 20:48:42 +0100
Message-ID: <1467748122-14833-4-git-send-email-ben.dooks@codethink.co.uk>
References: <1467748122-14833-1-git-send-email-ben.dooks@codethink.co.uk>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCEPJZEDQIBBBH466C5QKGQE7PPAEKY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1467748122-14833-1-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add documentation for the AMLogic Meson RTC.

Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/rtc/rtc-amlogic.txt         | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-amlogic.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-amlogic.txt b/Documentation/devicetree/bindings/rtc/rtc-amlogic.txt
new file mode 100644
index 0000000..efc7672
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-amlogic.txt
@@ -0,0 +1,21 @@
+* AMlogic Meson RTC
+
+Required properties:
+- compatible: should be one of the following describing the hardware:
+	* "amlogic,meson6-rtc"
+	* "amlogic,meson8-rtc"
+	* "amlogic,meson8b-rtc"
+
+- reg: physical register space for the controller's memory mapped registers.
+
+Optional properties:
+- resets: reset controller reference to allow reset of the controller
+- interrupts: single interrupt reference if interrupt support needed
+
+Example:
+
+	rtc: rtc@c8100740 {
+		compatible = "amlogic,meson6-rtc";
+		reg = <0xc8100740 0x14>;
+		status = "disabled";
+	};
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
