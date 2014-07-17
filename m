From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: keystone: add mdio devices entries
Date: Thu, 17 Jul 2014 17:58:07 +0300
Message-ID: <1405609087-9128-1-git-send-email-grygorii.strashko@ti.com>
References: <1404911660-10047-2-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404911660-10047-2-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ivan.khoronzhuk-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Keystone 2 has MDIO HW block which are compatible
to Davinci SoCs:
See "Gigabit Ethernet (GbE) Switch Subsystem"
  See http://www.ti.com/lit/ug/sprugv9d/sprugv9d.pdf

Hence, add corresponding DT entry for Keystone 2.

Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index c1414cb..9e31fe7 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -266,5 +266,16 @@
 			ranges = <0 0 0x30000000 0x10000000
 				  1 0 0x21000A00 0x00000100>;
 		};
+
+		mdio: mdio@02090300 {
+			compatible	= "ti,keystone_mdio", "ti,davinci_mdio";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg		= <0x02090300 0x100>;
+			status = "disabled";
+			clocks = <&clkpa>;
+			clock-names = "fck";
+			bus_freq	= <2500000>;
+		};
 	};
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
