From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: vf610twr: assign Ethernet clock explicitly
Date: Wed, 10 Feb 2016 16:02:25 -0800
Message-ID: <1455148946-26903-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Assign Ethernet clock parents explicitly. The VF610 Tower Board
uses the external Ethernet clock input which is connected to
a 50MHz clock.

The Vybrid SoC has two ethernet interfaces (fec0 and fec1) which
use the same clock source (VF610_CLK_ENET). Therefore this parent
configuration affects multiple consumer devices and need to be
specified in the clock provider node.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
So far we rely on the boot loader to configure this, however it
can be problematic e.g. for suspend/resume...

--
Stefan

 arch/arm/boot/dts/vf610-twr.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-twr.dts
index 5438ee4..8419c06 100644
--- a/arch/arm/boot/dts/vf610-twr.dts
+++ b/arch/arm/boot/dts/vf610-twr.dts
@@ -96,6 +96,10 @@
 &clks {
 	clocks = <&sxosc>, <&fxosc>, <&enet_ext>, <&audio_ext>;
 	clock-names = "sxosc", "fxosc", "enet_ext", "audio_ext";
+	assigned-clocks = <&clks VF610_CLK_ENET_SEL>,
+			  <&clks VF610_CLK_ENET_TS_SEL>;
+	assigned-clock-parents = <&clks VF610_CLK_ENET_EXT>,
+				 <&clks VF610_CLK_ENET_EXT>;
 };
 
 &dspi0 {
-- 
2.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
