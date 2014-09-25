From: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: [RFC PATCH 2/4] arm/arm64:dt:numa: adding numa node mapping for memory nodes.
Date: Thu, 25 Sep 2014 14:33:57 +0530
Message-ID: <1411635840-24038-3-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
References: <1411635840-24038-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411635840-24038-1-git-send-email-ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adding Documentation for dt binding for memory to numa node mapping.

Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/numa.txt | 60 ++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/numa.txt

diff --git a/Documentation/devicetree/bindings/arm/numa.txt b/Documentation/devicetree/bindings/arm/numa.txt
new file mode 100644
index 0000000..1cdc6d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/numa.txt
@@ -0,0 +1,60 @@
+========================================================
+ARM numa id binding description
+========================================================
+
+========================================================
+1 - Introduction
+========================================================
+
+The device node  property nid (numa node id) can be added
+to memory device node to map the range of memory addresses
+as defined in property reg. The property nid maps the memory
+range to the numa node id, which is used to find the local
+and remote pages on numa aware systems.
+
+========================================================
+2 - nid property
+========================================================
+nid is required property of memory device node for
+numa enabled platforms.
+
+|------------------------------------------------------|
+|Property Type  | Usage | Value Type | Definition      |
+|------------------------------------------------------|
+|  nid          |  R    |    <u32>   | Numa Node id    |
+|               |       |            | for this memory |
+|------------------------------------------------------|
+
+========================================================
+4 - Example memory nodes with numa information
+========================================================
+
+Example 1 (2 memory nodes, each mapped to a numa node.):
+
+	memory@00000000 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>;
+		nid = <0x0>;
+	};
+
+	memory@10000000000 {
+		device_type = "memory";
+		reg = <0x100 0x00000000 0x0 0x80000000>;
+		nid = <0x1>;
+	};
+
+Example 2 (multiple memory ranges in each memory node and mapped to numa node):
+
+	memory@00000000 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>,
+		      <0x1 0x00000000 0x0 0x80000000>;
+		nid = <0x0>;
+	};
+
+	memory@10000000000 {
+		device_type = "memory";
+		reg = <0x100 0x00000000 0x0 0x80000000>;
+		reg = <0x100 0x80000000 0x0 0x80000000>;
+		nid = <0x1>;
+	};
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
