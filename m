From: Nuno Goncalves <nunojpg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: sunxi: add H3/H5 uart2 rts/cts bindings
Date: Thu,  7 Dec 2017 19:13:35 +0100
Message-ID: <20171207181335.31755-1-nunojpg@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nuno Goncalves <nunojpg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently there are already bindings for uart1 and uart3 but uart2 was
lacking.

Signed-off-by: Nuno Goncalves <nunojpg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 8d40c00d64bb..e0e0551b3f05 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -377,6 +377,11 @@
 				function = "uart2";
 			};
 
+			uart2_rts_cts_pins: uart2_rts_cts {
+				pins = "PA2", "PA3";
+				function = "uart2";
+			};
+
 			uart3_pins: uart3 {
 				pins = "PA13", "PA14";
 				function = "uart3";
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
