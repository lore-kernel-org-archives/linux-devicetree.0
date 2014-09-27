From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v2 2/2] mtd: docg3: add device-tree documentation
Date: Sat, 27 Sep 2014 21:34:30 +0200
Message-ID: <1411846470-30041-2-git-send-email-robert.jarzmik@free.fr>
References: <1411846470-30041-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411846470-30041-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add documentation for the sandisk docg3 chip.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

---
Since v1: Mark's review : use m-systems,diskonchip-g3, add flash@0,
grammar
---
 Documentation/devicetree/bindings/mtd/diskonchip.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/diskonchip.txt

diff --git a/Documentation/devicetree/bindings/mtd/diskonchip.txt b/Documentation/devicetree/bindings/mtd/diskonchip.txt
new file mode 100644
index 0000000..3e13bfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/diskonchip.txt
@@ -0,0 +1,15 @@
+M-Systems and Sandisk DiskOnChip devices
+
+M-System DiskOnChip G3
+======================
+The Sandisk (formerly M-Systems) docg3 is a nand device of 64M to 256MB.
+
+Required properties:
+ - compatible: should be "m-systems,diskonchip-g3"
+ - reg: register base and size
+
+Example:
+	docg3: flash@0 {
+		compatible = "m-systems,diskonchip-g3";
+		reg = <0x0 0x2000>;
+	};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
