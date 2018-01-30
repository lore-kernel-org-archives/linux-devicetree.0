From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: fsi: Add optional property no-scan-on-init
Date: Tue, 30 Jan 2018 16:21:15 +1030
Message-ID: <20180130055116.17411-2-joel@jms.id.au>
References: <20180130055116.17411-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180130055116.17411-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Add an optional FSI master property 'no-scan-on-init.  This
can be specified to indicate that a master should not be
automatically scanned at init time.  This is required in cases
where a scan could interfere with another FSI master on the same
bus.

Signed-off-by: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Acked-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 Documentation/devicetree/bindings/fsi/fsi.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/fsi/fsi.txt b/Documentation/devicetree/bindings/fsi/fsi.txt
index 4eaf488d4015..ab516c673a4b 100644
--- a/Documentation/devicetree/bindings/fsi/fsi.txt
+++ b/Documentation/devicetree/bindings/fsi/fsi.txt
@@ -56,6 +56,13 @@ addresses (link index and slave ID), and no size:
     #address-cells = <2>;
     #size-cells = <0>;
 
+An optional boolean property can be added to indicate that a particular master
+should not scan for connected devices at initialization time.  This is
+necessary in cases where a scan could cause arbitration issues with other
+masters that may be present on the bus.
+
+    no-scan-on-init;
+
 FSI slaves
 ----------
 
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
