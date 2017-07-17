From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 09/10] dt-bindings: iio: humidity: hts221: support open drain mode
Date: Mon, 17 Jul 2017 19:39:04 +0200
Message-ID: <20170717173905.8209-10-lorenzo.bianconi@st.com>
References: <20170717173905.8209-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170717173905.8209-1-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
---
 Documentation/devicetree/bindings/iio/humidity/hts221.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/humidity/hts221.txt b/Documentation/devicetree/bindings/iio/humidity/hts221.txt
index fca263e13400..10adeb0d703d 100644
--- a/Documentation/devicetree/bindings/iio/humidity/hts221.txt
+++ b/Documentation/devicetree/bindings/iio/humidity/hts221.txt
@@ -5,6 +5,14 @@ Required properties:
 - reg: i2c address of the sensor / spi cs line
 
 Optional properties:
+- drive-open-drain: the interrupt/data ready line will be configured
+  as open drain, which is useful if several sensors share the same
+  interrupt line. This is a boolean property.
+  If the requested interrupt is configured as IRQ_TYPE_LEVEL_HIGH or
+  IRQ_TYPE_EDGE_RISING a pull-down resistor is needed to drive the line
+  when it is not active, whereas a pull-up one is needed when interrupt
+  line is configured as IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_EDGE_FALLING.
+  Refer to pinctrl/pinctrl-bindings.txt for the property description.
 - interrupt-parent: should be the phandle for the interrupt controller
 - interrupts: interrupt mapping for IRQ. It should be configured with
   flags IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_EDGE_RISING, IRQ_TYPE_LEVEL_LOW or
-- 
2.13.2
