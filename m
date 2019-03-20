Return-Path: <SRS0=p57L=RX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:46716 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbfCTToQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Mar 2019 15:44:16 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: rskrza1: Add remaining LEDs
Date: Wed, 20 Mar 2019 20:44:10 +0100
Message-Id: <20190320194410.14870-3-geert+renesas@glider.be>
In-Reply-To: <20190320194410.14870-1-geert+renesas@glider.be>
References: <20190320194410.14870-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

Describe the remaining 3 LEDs, which are driven by the first CAT9554
port expander.

Drop the superfluous status property from the leds node while at it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index 60e80ecbbf6826bc..ff24301dc1be54de 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -34,12 +34,23 @@
 	};
 
 	leds {
-		status = "okay";
 		compatible = "gpio-leds";
 
 		led0 {
 			gpios = <&port7 1 GPIO_ACTIVE_LOW>;
 		};
+
+		led1 {
+			gpios = <&io_expander1 0 GPIO_ACTIVE_LOW>;
+		};
+
+		led2 {
+			gpios = <&io_expander1 1 GPIO_ACTIVE_LOW>;
+		};
+
+		led3 {
+			gpios = <&io_expander1 2 GPIO_ACTIVE_LOW>;
+		};
 	};
 };
 
-- 
2.17.1
