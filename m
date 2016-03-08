From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 2/2] MIPS: OCTEON: add DTS for EdgeRouter Lite
Date: Tue,  8 Mar 2016 23:32:27 +0200
Message-ID: <1457472747-9339-2-git-send-email-aaro.koskinen@iki.fi>
References: <1457472747-9339-1-git-send-email-aaro.koskinen@iki.fi>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457472747-9339-1-git-send-email-aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DTS for EdgeRouter Lite that is usable as is without any "pruning"
with APPENDED_DTB.

Compared to builtin generic DTB, we can avoid errors and delays from
probing non-existent I2C devices.

Signed-off-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
---
 arch/mips/boot/dts/cavium-octeon/ubnt_e100.dts | 59 ++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/mips/boot/dts/cavium-octeon/ubnt_e100.dts

diff --git a/arch/mips/boot/dts/cavium-octeon/ubnt_e100.dts b/arch/mips/boot/dts/cavium-octeon/ubnt_e100.dts
new file mode 100644
index 0000000..243e5dc
--- /dev/null
+++ b/arch/mips/boot/dts/cavium-octeon/ubnt_e100.dts
@@ -0,0 +1,59 @@
+/*
+ * Device tree source for EdgeRouter Lite.
+ *
+ * Written by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/include/ "octeon_3xxx.dtsi"
+
+/ {
+	model = "ubnt,e100";
+
+	soc@0 {
+		smi0: mdio@1180000001800 {
+			phy5: ethernet-phy@5 {
+				reg = <5>;
+				compatible = "ethernet-phy-ieee802.3-c22";
+			};
+			phy6: ethernet-phy@6 {
+				reg = <6>;
+				compatible = "ethernet-phy-ieee802.3-c22";
+			};
+			phy7: ethernet-phy@7 {
+				reg = <7>;
+				compatible = "ethernet-phy-ieee802.3-c22";
+			};
+		};
+
+		pip: pip@11800a0000000 {
+			interface@0 {
+				ethernet@0 {
+					phy-handle = <&phy7>;
+				};
+				ethernet@1 {
+					phy-handle = <&phy6>;
+				};
+				ethernet@2 {
+					phy-handle = <&phy5>;
+				};
+			};
+		};
+
+		uart0: serial@1180000000800 {
+			clock-frequency = <500000000>;
+		};
+
+		usbn: usbn@1180068000000 {
+			refclk-frequency = <12000000>;
+			refclk-type = "crystal";
+		};
+	};
+
+	aliases {
+		pip = &pip;
+	};
+};
-- 
2.4.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
