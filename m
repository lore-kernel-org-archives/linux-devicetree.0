From: Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 5/6] dt-binding: document the binding for mxc rtc
Date: Sat, 20 Jun 2015 16:15:31 +0200
Message-ID: <1434809732-8996-6-git-send-email-tremyfr@gmail.com>
References: <1434809732-8996-1-git-send-email-tremyfr@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434809732-8996-1-git-send-email-tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds documentation of device tree bindings for the
mxc rtc.

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/rtc/rtc-mxc.txt |   27 +++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mxc.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-mxc.txt b/Documentation/devicetree/bindings/rtc/rtc-mxc.txt
new file mode 100644
index 0000000..5505493
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-mxc.txt
@@ -0,0 +1,27 @@
+* Real Time Clock of the i.MX SoCs
+
+RTC controller for the i.MX SoCs
+
+Required properties:
+- compatible: Should be "fsl,imx1-rtc" or "fsl,imx21-rtc".
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- interrupts: IRQ line for the RTC.
+- clocks: should contain two entries:
+  * one for the input reference
+  * one for the the SoC RTC
+- clock-names: should contain:
+  * "rtc" for the input reference clock
+  * "ipg" for the SoC RTC clock
+
+Example:
+
+rtc@10007000 {
+	compatible = "fsl,imx21-rtc";
+	reg = <0x10007000 0x1000>;
+	interrupts = <22>;
+	clocks = <&clks IMX27_CLK_CKIL>,
+	       	 <&clks IMX27_CLK_RTC_IPG_GATE>;
+	clock-names = "rtc, "ipg";
+	status = "disabled";
+};
-- 
1.7.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
