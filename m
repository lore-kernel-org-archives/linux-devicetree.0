From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/3] ata: ahci_st: Provide DT bindings for ST's SATA implementation
Date: Tue, 25 Feb 2014 11:41:19 +0000
Message-ID: <1393328481-7251-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, DCG_UPD_stlinux_kernel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Acked-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/ata/ahci-st.txt | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ata/ahci-st.txt

diff --git a/Documentation/devicetree/bindings/ata/ahci-st.txt b/Documentation/devicetree/bindings/ata/ahci-st.txt
new file mode 100644
index 0000000..1b69fa9
--- /dev/null
+++ b/Documentation/devicetree/bindings/ata/ahci-st.txt
@@ -0,0 +1,31 @@
+STMicroelectronics STi SATA controller
+
+This binding describes a SATA device.
+
+Required properties:
+ - compatible	   : Must be "st,ahci"
+ - reg		   : Physical base addresses and length of register sets
+ - interrupts	   : Interrupt associated with the SATA device
+ - interrupt-names :   Associated name must be; "hostc"
+ - resets	   : The power-down and soft-reset lines of SATA IP
+ - reset-names	   :   Associated names must be; "pwr-dwn" and "sw-rst"
+ - clocks	   : The phandle for the clock
+ - clock-names	   :   Associated name must be; "ahci_clk"
+ - phys		   : The phandle for the PHY device
+ - phy-names	   :   Associated name must be; "ahci_phy"
+
+Example:
+
+	sata0: sata@fe380000 {
+		compatible      = "st,ahci";
+		reg             = <0xfe380000 0x1000>;
+		interrupts      = <GIC_SPI 157 IRQ_TYPE_NONE>;
+		interrupt-names = "hostc";
+		phys	        = <&miphy365x_phy MIPHY_PORT_0 MIPHY_TYPE_SATA>;
+		phy-names       = "ahci_phy";
+		resets	        = <&powerdown STIH416_SATA0_POWERDOWN>,
+				  <&softreset STIH416_SATA0_SOFTRESET>;
+		reset-names     = "pwr-dwn", "sw-rst";
+		clocks	        = <&CLK_S_ICN_REG_0>;
+		clock-names     = "ahci_clk";
+	};
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
