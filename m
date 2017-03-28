From: Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 1/2] Documentation: dt-bindings: Document bindings for Aspeed ADC
Date: Tue, 28 Mar 2017 14:52:58 -0700
Message-ID: <20170328215259.31622-1-raltherr@google.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- Consistently write hex contstants with lowercase letters
- Drop model numbers from description as same IP is used in every generation

Changes in v2:
- Rewritten as an IIO ADC device

 .../devicetree/bindings/iio/adc/aspeed_adc.txt       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
new file mode 100644
index 000000000000..674e133b7cd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
@@ -0,0 +1,20 @@
+Aspeed ADC
+
+This device is a 10-bit converter for 16 voltage channels.  All inputs are
+single ended.
+
+Required properties:
+- compatible: Should be "aspeed,ast2400-adc" or "aspeed,ast2500-adc"
+- reg: memory window mapping address and length
+- clocks: Input clock used to derive the sample clock. Expected to be the
+          SoC's APB clock.
+- #io-channel-cells: Must be set to <1> to indicate channels are selected
+                     by index.
+
+Example:
+	adc@1e6e9000 {
+		compatible = "aspeed,ast2400-adc";
+		reg = <0x1e6e9000 0xb0>;
+		clocks = <&clk_apb>;
+		#io-channel-cells = <1>;
+	};
-- 
2.12.2.564.g063fe858b8-goog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
