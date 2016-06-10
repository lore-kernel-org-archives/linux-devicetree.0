From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: BCM5310x: Enable switch ports on SmartRG SR400AC
Date: Fri, 10 Jun 2016 11:35:56 -0700
Message-ID: <1465583756-26740-4-git-send-email-f.fainelli@gmail.com>
References: <1465583756-26740-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465583756-26740-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Define the port mapping for the SmartRG SR400ACE device.

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
index 8b0c440b2e71..c219d33496cc 100644
--- a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
@@ -126,3 +126,43 @@
 &spi_nor {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		switch0port0: port@0 {
+			reg = <0>;
+			label = "lan4";
+		};
+
+		switch0port1: port@1 {
+			reg = <1>;
+			label = "lan3";
+		};
+
+		switch0port2: port@2 {
+			reg = <2>;
+			label = "lan2";
+		};
+
+		switch0port3: port@3 {
+			reg = <3>;
+			label = "lan1";
+		};
+
+		switch0port4: port@4 {
+			reg = <4>;
+			label = "wan";
+		};
+
+		switch0port5: port@5 {
+			reg = <5>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+		};
+	};
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
