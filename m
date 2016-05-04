From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: dts: salvator-x: SCIF1 supports RTS/CTS hardware flow control
Date: Wed,  4 May 2016 10:57:58 +0200
Message-ID: <1462352278-30327-4-git-send-email-geert+renesas@glider.be>
References: <1462352278-30327-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1462352278-30327-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

On the Salvator-X development board, the RTS and CTS pins of debug
serial-1 port SCIF1 are wired to the CP2102 Serial-USB bridge.  Reflect
this in the DTS by adding the "uart-has-rtscts" property to the scif1
device node.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 5232aad07062198b..c09ead3a29fb72cf 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -369,6 +369,7 @@
 	pinctrl-0 = <&scif1_pins>;
 	pinctrl-names = "default";
 
+	uart-has-rtscts;
 	status = "okay";
 };
 
-- 
1.9.1
