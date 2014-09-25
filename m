From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v1 2/2] mtd: docg3: add device-tree documentation
Date: Fri, 26 Sep 2014 00:33:16 +0200
Message-ID: <1411684396-12094-2-git-send-email-robert.jarzmik@free.fr>
References: <1411684396-12094-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411684396-12094-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add documentation for the sandisk docg3 chip.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 Documentation/devicetree/bindings/mtd/docg3.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/docg3.txt

diff --git a/Documentation/devicetree/bindings/mtd/docg3.txt b/Documentation/devicetree/bindings/mtd/docg3.txt
new file mode 100644
index 0000000..3fcc163
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/docg3.txt
@@ -0,0 +1,14 @@
+Sandisk docg3 device
+====================
+
+The Sandisk (former MSystems) docg3 is a nand device of 64M to 256MB.
+
+Required properties:
+ - compatible: Should be "sandisk,docg3"
+ - reg: register base and size
+
+Example:
+	docg3 {
+		compatible = "sandisk,docg3";
+		reg = <0x0 0x2000>;
+	};
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
