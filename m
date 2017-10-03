From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v4 3/6] mtd: spi-nor: cadence-quadspi: Add new binding to enable loop-back circuit
Date: Tue, 3 Oct 2017 10:49:22 +0530
Message-ID: <20171003051925.8821-4-vigneshr@ti.com>
References: <20171003051925.8821-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171003051925.8821-1-vigneshr-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cadence QSPI IP has a adapted loop-back circuit which can be enabled by
setting BYPASS field to 0 in READCAPTURE register. It enables use of
QSPI return clock to latch the data rather than the internal QSPI
reference clock. For high speed operations, adapted loop-back circuit
using QSPI return clock helps to increase data valid window.

Add DT parameter cdns,rclk-en to help enable adapted loop-back circuit
for boards which do have QSPI return clock provided. Update binding
documentation for the same.

Signed-off-by: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
index 7dbe3bd9ac56..bb2075df9b38 100644
--- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
@@ -16,6 +16,9 @@ Required properties:
 
 Optional properties:
 - cdns,is-decoded-cs : Flag to indicate whether decoder is used or not.
+- cdns,rclk-en : Flag to indicate that QSPI return clock is used to latch
+  the read data rather than the QSPI clock. Make sure that QSPI return
+  clock is populated on the board before using this property.
 
 Optional subnodes:
 Subnodes of the Cadence Quad SPI controller are spi slave nodes with additional
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
