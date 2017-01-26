From: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Subject: [PATCH 2/5] DT: mfd: axp20x: Add binding for the AXP808
Date: Thu, 26 Jan 2017 22:16:13 +0100 (CET)
Message-ID: <abb27901379a19a11608fd37254e1a8f7fa1b199.1485456006.git.rask@formelder.dk>
References: <cover.1485456003.git.rask@formelder.dk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1485456003.git.rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The AXP808 does not support address space extension, but is otherwise
identical to the AXP806, including the chip ID, so add a compatible
string for it to the binding.

Signed-off-by: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/axp20x.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
index 86ae540..8195b06 100644
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
@@ -7,12 +7,13 @@ axp209 (X-Powers)
 axp221 (X-Powers)
 axp223 (X-Powers)
 axp806 (X-Powers)
+axp808 (X-Powers)
 axp809 (X-Powers)
 
 Required properties:
 - compatible: "x-powers,axp152", "x-powers,axp202", "x-powers,axp209",
 	      "x-powers,axp221", "x-powers,axp223", "x-powers,axp806",
-	      "x-powers,axp809"
+	      "x-powers,axp808", "x-powers,axp809"
 - reg: The I2C slave address or RSB hardware address for the AXP chip
 - interrupt-parent: The parent interrupt controller
 - interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
@@ -87,7 +88,7 @@ LDO_IO1		: LDO		: ips-supply		: GPIO 1
 RTC_LDO		: LDO		: ips-supply		: always on
 DRIVEVBUS	: Enable output	: drivevbus-supply	: external regulator
 
-AXP806 regulators, type, and corresponding input supply names:
+AXP806/AXP808 regulators, type, and corresponding input supply names:
 
 Regulator	  Type		  Supply Name		  Notes
 ---------	  ----		  -----------		  -----
@@ -108,7 +109,7 @@ CLDO2		: LDO		: cldoin-supply		: shared supply
 CLDO3		: LDO		: cldoin-supply		: shared supply
 SW		: On/Off Switch : swin-supply
 
-Additionally, the AXP806 DC-DC regulators support poly-phase arrangements
+Additionally, the AXP806/AXP808 DC-DC regulators support poly-phase arrangements
 for higher output current. The possible groupings are: A+B, A+B+C, D+E.
 
 AXP809 regulators, type, and corresponding input supply names:
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
