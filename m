From: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: imx28: Provide regulators for the current sources of the LRADC
Date: Fri, 22 Apr 2016 13:52:27 +0000
Message-ID: <1461333147-11873-4-git-send-email-harald@ccbib.org>
References: <1461333147-11873-1-git-send-email-harald@ccbib.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461333147-11873-1-git-send-email-harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the devicetree nodes to make the mxs-lradc driver register
regulator devices for the integrated current sources.

Signed-off-by: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
---
I couln't test this patch on actual HW, but it is a straight forward
port from the imx23 case. With only a funny change in the node label,
to match the naming convention of the IMX28 Reference Manual.

 arch/arm/boot/dts/imx28.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index f637ec9..38f8675 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -1070,6 +1070,14 @@
 				status = "disabled";
 				clocks = <&clks 41>;
 				#io-channel-cells = <1>;
+
+				isrc_lradc0: ISRC0 {
+					regulator-max-microamp = <300>;
+				};
+
+				isrc_lradc6: ISRC1 {
+					regulator-max-microamp = <300>;
+				};
 			};
 
 			spdif: spdif@80054000 {
-- 
2.1.4
