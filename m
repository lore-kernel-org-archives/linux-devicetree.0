From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: keystone: k2l: Fix chip selects for SPI devices
Date: Thu, 18 Sep 2014 20:15:24 +0300
Message-ID: <1411060524-25077-4-git-send-email-grygorii.strashko@ti.com>
References: <1411060524-25077-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411060524-25077-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>

There are 5 chip selects per SPI0 and SPI2 and 3 per SPI1. SPI2 needs
to be pinned out to use and by default they are disabled. So keep the
state disabled to reflect default.

Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/k2l.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/k2l.dtsi b/arch/arm/boot/dts/k2l.dtsi
index e3bb142..291db43 100644
--- a/arch/arm/boot/dts/k2l.dtsi
+++ b/arch/arm/boot/dts/k2l.dtsi
@@ -81,3 +81,17 @@
 		};
 	};
 };
+
+&spi0 {
+       ti,davinci-spi-num-cs = <5>;
+};
+
+&spi1 {
+       ti,davinci-spi-num-cs = <3>;
+};
+
+&spi2 {
+       ti,davinci-spi-num-cs = <5>;
+       /* Pin muxed. Enabled and configured by Bootloader */
+       status = "disabled";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
