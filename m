From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [PATCH 2/2] dts: ARM: Aspeed: Enable USB ports on ast2500 eval board
Date: Fri, 12 Jan 2018 17:21:11 +1100
Message-ID: <1515738071.31850.101.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joel Stanley <joel.stanley-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This enables both USB ports as host with EHCI and UHCI
attached to them.

Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---

v2: Unchanged (except subject)

 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 6946c8610c4c..0c3f14d05046 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -80,3 +80,21 @@
 		reg = <0x4d>;
 	};
 };
+
+&ehci0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb2ah_default>;
+};
+
+&ehci1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb2bh_default>;
+};
+
+&uhci {
+	status = "okay";
+
+	/* No pinctrl, this follows the above EHCI settings */
+};


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
