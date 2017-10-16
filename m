From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 3/3] arm64: dts: realtek: Add MeLE V9
Date: Mon, 16 Oct 2017 05:01:53 +0200
Message-ID: <20171016030153.11078-4-afaerber@suse.de>
References: <20171016030153.11078-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171016030153.11078-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bizon <bizongod-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, meleservice-asvZZsi/7w8@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add an initial Device Tree for MeLE V9 Media Player.

Cc: meleservice-asvZZsi/7w8@public.gmane.org
Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 arch/arm64/boot/dts/realtek/Makefile            |  1 +
 arch/arm64/boot/dts/realtek/rtd1295-mele-v9.dts | 31 +++++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1295-mele-v9.dts

diff --git a/arch/arm64/boot/dts/realtek/Makefile b/arch/arm64/boot/dts/realtek/Makefile
index cf93f4db7a69..c0b36ba64a1e 100644
--- a/arch/arm64/boot/dts/realtek/Makefile
+++ b/arch/arm64/boot/dts/realtek/Makefile
@@ -1,5 +1,6 @@
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1293-ds418j.dtb
 
+dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-mele-v9.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-probox2-ava.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-zidoo-x9s.dtb
 
diff --git a/arch/arm64/boot/dts/realtek/rtd1295-mele-v9.dts b/arch/arm64/boot/dts/realtek/rtd1295-mele-v9.dts
new file mode 100644
index 000000000000..bd584e99fff9
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1295-mele-v9.dts
@@ -0,0 +1,31 @@
+/*
+ * Copyright (c) 2017 Andreas Färber
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+/dts-v1/;
+
+#include "rtd1295.dtsi"
+
+/ {
+	compatible = "mele,v9", "realtek,rtd1295";
+	model = "MeLE V9";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x80000000>;
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
