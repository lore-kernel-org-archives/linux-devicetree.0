From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARM: mediatek: dts: Add UART dts for MT8127 and MT8135 boards
Date: Mon, 5 Jan 2015 20:28:38 +0800
Message-ID: <1420460918-24380-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch enable UART for MT8127 moose board and MT8135 evalution board.
Adding the dts, these two boards can show log and shell prompts.
This patch base on my previous MT8135/MT8127 SoC UART dtsi patch [1] and
Matthias's modification to disable SoC UART by default.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/312311.html

Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt8127-moose.dts | 4 ++++
 arch/arm/boot/dts/mt8135-evbp1.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/mt8127-moose.dts b/arch/arm/boot/dts/mt8127-moose.dts
index 13cba0e..073e295 100644
--- a/arch/arm/boot/dts/mt8127-moose.dts
+++ b/arch/arm/boot/dts/mt8127-moose.dts
@@ -23,3 +23,7 @@
 		reg = <0 0x80000000 0 0x40000000>;
 	};
 };
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/mt8135-evbp1.dts b/arch/arm/boot/dts/mt8135-evbp1.dts
index a5adf97..3667738 100644
--- a/arch/arm/boot/dts/mt8135-evbp1.dts
+++ b/arch/arm/boot/dts/mt8135-evbp1.dts
@@ -23,3 +23,7 @@
 		reg = <0 0x80000000 0 0x40000000>;
 	};
 };
+
+&uart3 {
+	status = "okay";
+};
-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
