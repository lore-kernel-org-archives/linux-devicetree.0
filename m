From: Manivannan Sadhasivam <manivannanece23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Documentation: dt-bindings: tmp007: Add optional interrupt
 support
Date: Mon, 23 Jan 2017 21:58:09 +0530
Message-ID: <20170123162809.GA16800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds optional interrupt binding support for TI TMP007 - IR thermopiler sensor

Signed-off-by: Manivannan Sadhasivam <manivannanece23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Created separate patch for devicetree and driver.

 Documentation/devicetree/bindings/iio/temperature/tmp007.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/temperature/tmp007.txt b/Documentation/devicetree/bindings/iio/temperature/tmp007.txt
index 3b8f41f..b63aba9 100644
--- a/Documentation/devicetree/bindings/iio/temperature/tmp007.txt
+++ b/Documentation/devicetree/bindings/iio/temperature/tmp007.txt
@@ -18,10 +18,18 @@ Required properties:
 		   1	 SDA	   0x46
 		   1     SCL       0x47
 
+Optional properties:
+
+  - interrupt-parent: should be the phandle for the interrupt controller
+
+  - interrupts: interrupt mapping for GPIO IRQ (level active low)
+
 Example:
 
 tmp007@40 {
         compatible = "ti,tmp007";
         reg = <0x40>;
+	interrupt-parent = <&gpio0>;
+	interrupts = <5 0x08>;
 };
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
