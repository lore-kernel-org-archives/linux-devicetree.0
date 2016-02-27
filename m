From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 1/4] mmc: meson: Document Amlogic Meson MMC DT bindings
Date: Sat, 27 Feb 2016 19:01:45 +0100
Message-ID: <1456596108-1406-2-git-send-email-carlo@caione.org>
References: <1456596108-1406-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456596108-1406-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/mmc/meson-mmc.txt          | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/meson-mmc.txt

diff --git a/Documentation/devicetree/bindings/mmc/meson-mmc.txt b/Documentation/devicetree/bindings/mmc/meson-mmc.txt
new file mode 100644
index 0000000..328157e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/meson-mmc.txt
@@ -0,0 +1,30 @@
+* Amlogic Meson MMC controller
+
+The highspeed MMC host controller on Amlogic SoCs provides an interface
+for MMC, SD, SDIO and SDHC types of memory cards.
+
+Supported maximum speeds are the ones of the eMMC standard 4.41 as well
+as the speed of SD standard 2.0.
+
+Required properties:
+ - compatible : "amlogic,meson-mmc"
+ - reg : mmc controller base registers
+ - interrupts : mmc controller interrupt
+ - clocks : phandle to clock provider
+ - pinctrl-names : should contain "sdio_a" or "sdio_b"
+ - pinctrl-0: Should specify pin control groups used for this controller
+
+Optional properties:
+ - meson,sd-port : 0 for port A, 1 for port B
+ - for cd, bus-width and additional generic mmc parameters
+   please refer to mmc.txt within this directory
+
+Examples:
+	mmc0: mmc@c1108c20 {
+		pinctrl-names = "sdio_b";
+		pinctrl-0 = <&mmc0_sd_b_pins>;
+		compatible = "amlogic,meson-mmc";
+		reg = <0xc1108c20 0x20>;
+		interrupts = <0 28 1>;
+		clocks = <&clkc CLKID_CLK81>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
