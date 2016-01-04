From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v4 1/2] Documentation: devicetree: add epson rx6110 binding
Date: Mon,  4 Jan 2016 18:04:34 +0100
Message-ID: <1451927075-8656-1-git-send-email-s.trumtrar@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the binding documentation for the Epson RX6110 RTC.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Reviewed-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---

 .../devicetree/bindings/rtc/epson,rx6110.txt       | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx6110.txt

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.txt b/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
new file mode 100644
index 000000000000..3dc313e01f77
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
@@ -0,0 +1,39 @@
+Epson RX6110 Real Time Clock
+============================
+
+The Epson RX6110 can be used with SPI or I2C busses. The kind of
+bus depends on the SPISEL pin and can not be configured via software.
+
+I2C mode
+--------
+
+Required properties:
+  - compatible: should be: "epson,rx6110"
+  - reg : the I2C address of the device for I2C
+
+Example:
+
+	rtc: rtc@32 {
+		compatible = "epson,rx6110"
+		reg = <0x32>;
+	};
+
+SPI mode
+--------
+
+Required properties:
+  - compatible: should be: "epson,rx6110"
+  - reg: chip select number
+  - spi-cs-high: RX6110 needs chipselect high
+  - spi-cpha: RX6110 works with SPI shifted clock phase
+  - spi-cpol: RX6110 works with SPI inverse clock polarity
+
+Example:
+
+	rtc: rtc@3 {
+		compatible = "epson,rx6110"
+		reg = <3>
+		spi-cs-high;
+		spi-cpha;
+		spi-cpol;
+	};
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
