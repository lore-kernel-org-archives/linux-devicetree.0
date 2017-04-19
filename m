From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/8] [RFC] arm64: dts: renesas: Add R-Car H3 SiP (4 x 1 GiB) support
Date: Wed, 19 Apr 2017 11:15:45 +0200
Message-ID: <1492593351-13835-3-git-send-email-geert+renesas@glider.be>
References: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492593351-13835-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for the R-Car H3 System-in-Package (r8j7795), which contains:
  - an R-Car H3 SoC (r8a7795),
  - 4 channels of 1 GiB of RAM (4 GiB total),
  - HyperFlash (not yet described).

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
Questions:
  - Should this file be named r8j7795-4g.dtsi instead?
  - Do other versions (different memory configuration) of r8j7795 exist?
    If yes, how are they named?
---
 arch/arm64/boot/dts/renesas/r8j7795-4x1g.dtsi | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8j7795-4x1g.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8j7795-4x1g.dtsi b/arch/arm64/boot/dts/renesas/r8j7795-4x1g.dtsi
new file mode 100644
index 0000000000000000..02e0ff4a60c53704
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8j7795-4x1g.dtsi
@@ -0,0 +1,36 @@
+/*
+ * Device Tree Source for the r8j7795 SiP with 4 channels of 1 GiB RAM
+ *
+ * Copyright (C) 2015 Renesas Electronics Corp.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#include "r8a7795.dtsi"
+
+/ {
+	compatible = "renesas,r8j7795", "renesas,r8a7795";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+	};
+
+	memory@500000000 {
+		device_type = "memory";
+		reg = <0x5 0x00000000 0 0x40000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0 0x40000000>;
+	};
+
+	memory@700000000 {
+		device_type = "memory";
+		reg = <0x7 0x00000000 0 0x40000000>;
+	};
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
