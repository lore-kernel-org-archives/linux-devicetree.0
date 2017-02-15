From: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: [PATCH 3/4] fpga dt: bindings for Altera Partial Reconfiguraion IP.
Date: Wed, 15 Feb 2017 13:10:37 -0800
Message-ID: <1487193038-3490-4-git-send-email-matthew.gerlach@linux.intel.com>
References: <1487193038-3490-1-git-send-email-matthew.gerlach@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487193038-3490-1-git-send-email-matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Device Tree bindings for Altera Partial Reconfiguraion IP?

Signed-off-by: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 Documentation/devicetree/bindings/fpga/altera-pr-ip.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-pr-ip.txt

diff --git a/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt b/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
new file mode 100644
index 0000000..ada821f
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
@@ -0,0 +1,12 @@
+Altera Partial Reconfiguration IP
+
+Required properties:
+- compatible : should contain "altr,pr-ip"
+- reg        : base address and size for memory mapped io.
+
+Example:
+
+	fpga_mgr: fpga-mgr@ff20c000 {
+		compatible = "altr,pr-ip";
+		reg = <0xff20c000 0x10>;
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
