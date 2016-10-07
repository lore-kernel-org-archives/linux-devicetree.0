From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/7] mfd: dt-bindings: Add bindings for the Juniper PTX1K Boot FPGA
Date: Fri,  7 Oct 2016 18:21:59 +0300
Message-ID: <1475853724-22557-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853724-22557-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475853724-22557-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, JawaharBalaji Thirumalaisamy <jawaharb-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>

Add device tree bindings for the Juniper PTX1K Boot FPGA MFD driver.

Signed-off-by: Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/mfd/jnx-ptx1k-bootfpga.txt | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/jnx-ptx1k-bootfpga.txt

diff --git a/Documentation/devicetree/bindings/mfd/jnx-ptx1k-bootfpga.txt b/Documentation/devicetree/bindings/mfd/jnx-ptx1k-bootfpga.txt
new file mode 100644
index 0000000..596dec7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/jnx-ptx1k-bootfpga.txt
@@ -0,0 +1,34 @@
+* Device tree bindings for Juniper's PTX1K boot FPGA MFD driver
+
+The device supports a hardware watchdog, a flash MTD device and
+a hwmon sensor device. The bindings of those drivers are described
+in the jnx-ptx1kbf-wdt, jnx-ptx1kbf-mtd and jnx-ptx1kbf-hwmon documents.
+
+Required properties:
+
+- compatible:		"ptx1k-bootfpga"
+
+- reg:			contains offset/length value for device state control
+			registers space.
+
+Example:
+
+bootfpga@10000 {
+	compatible = "jnx,ptx1k-bootfpga";
+	reg = <0x10000 0x100>;
+
+	wdt {
+		compatible = "jnx,ptx1kbf-wdt";
+		/* no properties required */
+	};
+
+	mtd {
+		compatible = "jnx,ptx1kbf-mtd";
+		/* use the full device */
+	};
+
+	hwmon {
+		compatible = "jnx,ptx1kbf-hwmon";
+		/* no properties required */
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
