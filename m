From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH  1/2] ARM: dts: iwg22m: Add iWave RZG1E SODIMM SOM
Date: Tue, 15 Aug 2017 11:54:19 +0100
Message-ID: <1502794460-30213-2-git-send-email-biju.das@bp.renesas.com>
References: <1502794460-30213-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502794460-30213-1-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for iWave RZG1E SODIMM System On Module.
http://www.iwavesystems.com/rz-g1e-sodimm-module.html

Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
---
 arch/arm/boot/dts/r8a7745-iwg22m.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7745-iwg22m.dtsi

diff --git a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
new file mode 100644
index 0000000..9dbd854
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
@@ -0,0 +1,24 @@
+/*
+ * Device Tree Source for the iWave-RZG1E-G22M SODIMM SOM
+ *
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#include "r8a7745.dtsi"
+
+/ {
+	compatible = "iwave,g22m", "renesas,r8a7745";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x20000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <20000000>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
