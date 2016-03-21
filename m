From: Emil Bartczak <emilbart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drivers/rtc/rtc-mcp795.c: add devicetree support
Date: Mon, 21 Mar 2016 01:06:10 +0100
Message-ID: <20160321000610.GA21979@emba-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device tree support to the rtc-mcp795 driver.

Signed-off-by: Emil Bartczak <emilbart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/rtc/maxim,mcp795.txt | 11 +++++++++++
 drivers/rtc/rtc-mcp795.c                               | 10 ++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/maxim,mcp795.txt

diff --git a/Documentation/devicetree/bindings/rtc/maxim,mcp795.txt b/Documentation/devicetree/bindings/rtc/maxim,mcp795.txt
new file mode 100644
index 0000000..a59fdd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/maxim,mcp795.txt
@@ -0,0 +1,11 @@
+* Maxim MCP795		SPI Serial Real-Time Clock
+
+Required properties:
+- compatible: Should contain "maxim,mcp795".
+- reg: SPI address for chip
+
+Example:
+	mcp795: rtc@0 {
+		compatible = "maxim,mcp795";
+		reg = <0>;
+	};
diff --git a/drivers/rtc/rtc-mcp795.c b/drivers/rtc/rtc-mcp795.c
index 1c91ce8..025bb33 100644
--- a/drivers/rtc/rtc-mcp795.c
+++ b/drivers/rtc/rtc-mcp795.c
@@ -20,6 +20,7 @@
 #include <linux/printk.h>
 #include <linux/spi/spi.h>
 #include <linux/rtc.h>
+#include <linux/of.h>
 
 /* MCP795 Instructions, see datasheet table 3-1 */
 #define MCP795_EEREAD	0x03
@@ -183,9 +184,18 @@ static int mcp795_probe(struct spi_device *spi)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id mcp795_of_match[] = {
+	{ .compatible = "maxim,mcp795" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mcp795_of_match);
+#endif
+
 static struct spi_driver mcp795_driver = {
 		.driver = {
 				.name = "rtc-mcp795",
+				.of_match_table = of_match_ptr(mcp795_of_match),
 		},
 		.probe = mcp795_probe,
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
