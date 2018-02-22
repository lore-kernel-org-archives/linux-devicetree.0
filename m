Return-Path: <SRS0=mxgJ=FQ=jmondi.org=jacopo+renesas@kernel.org>
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 5/6] arm64: dts: renesas: r8a77965: Add #pwm-cells property
Date: Thu, 22 Feb 2018 20:06:09 +0100
Message-Id: <1519326370-15805-6-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1519326370-15805-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1519326370-15805-1-git-send-email-jacopo+renesas@jmondi.org>
To: arnd@arndb.de, geert@linux-m68k.org, horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add "#pwm-cells" property to "pwm@e6e31000" device node.

This silences the following DTC compiler warning:
Warning (pwms_property): Missing property '#pwm-cells' in node
/soc/pwm@e6e31000 or bad phandle (referred from /backlight:pwms[0])

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index cd12176..cdd4868 100644
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
