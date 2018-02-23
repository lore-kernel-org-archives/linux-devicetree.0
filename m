Return-Path: <SRS0=C+Y8=FR=jmondi.org=jacopo+renesas@kernel.org>
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 5/7] arm64: dts: renesas: r8a77965: Add #pwm-cells property
Date: Fri, 23 Feb 2018 14:40:57 +0100
Message-Id: <1519393259-26108-6-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1519393259-26108-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1519393259-26108-1-git-send-email-jacopo+renesas@jmondi.org>
To: arnd@arndb.de, geert@linux-m68k.org, horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add "#pwm-cells" property to "pwm@e6e31000" device node.

This silences the following DTC compiler warning:
Warning (pwms_property): Missing property '#pwm-cells' in node
/soc/pwm@e6e31000 or bad phandle (referred from /backlight:pwms[0])

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 1a21967..5dff176 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -668,6 +668,7 @@
 
 		pwm1: pwm@e6e31000 {
 			reg = <0 0xe6e31000 0 8>;
+			#pwm-cells = <2>;
 			/* placeholder */
 		};
 
-- 
2.7.4
