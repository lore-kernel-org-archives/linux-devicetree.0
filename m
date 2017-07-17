From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 07/10] dt-bindings: iio: humidity: hts221: support active-low interrupts
Date: Mon, 17 Jul 2017 19:39:02 +0200
Message-ID: <20170717173905.8209-8-lorenzo.bianconi@st.com>
References: <20170717173905.8209-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170717173905.8209-1-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Update hts221 device binding with active-low interrupts support
(IRQ_TYPE_LEVEL_LOW and IRQ_TYPE_EDGE_FALLING).

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
---
 Documentation/devicetree/bindings/iio/humidity/hts221.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/humidity/hts221.txt b/Documentation/devicetree/bindings/iio/humidity/hts221.txt
index b20ab9c12080..fca263e13400 100644
--- a/Documentation/devicetree/bindings/iio/humidity/hts221.txt
+++ b/Documentation/devicetree/bindings/iio/humidity/hts221.txt
@@ -7,7 +7,8 @@ Required properties:
 Optional properties:
 - interrupt-parent: should be the phandle for the interrupt controller
 - interrupts: interrupt mapping for IRQ. It should be configured with
-  flags IRQ_TYPE_LEVEL_HIGH or IRQ_TYPE_EDGE_RISING.
+  flags IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_EDGE_RISING, IRQ_TYPE_LEVEL_LOW or
+  IRQ_TYPE_EDGE_FALLING.
 
   Refer to interrupt-controller/interrupts.txt for generic interrupt
   client node bindings.
-- 
2.13.2
