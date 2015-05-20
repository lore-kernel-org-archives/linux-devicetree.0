From: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
Subject: [PATCH v2 1/2] devicetree: xilinx-xadc: Add optional label property
Date: Wed, 20 May 2015 10:22:31 -0500
Message-ID: <1432135352-29848-1-git-send-email-xander.huff@ni.com>
References: <555B78A3.2030202@metafoo.de>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555B78A3.2030202-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben.shelton-acOepvfBmUk@public.gmane.org, joshc-acOepvfBmUk@public.gmane.org, joe.hershberger-acOepvfBmUk@public.gmane.org, Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

To better facilitate user-mode access to optional aux channels, allow
device trees to specify a custom label for defined channels.

Signed-off-by: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
Reviewed-by: Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>
Reviewed-by: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
---
 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt b/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
index d71258e..19dcd96 100644
--- a/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
@@ -68,6 +68,7 @@ Optional properties:
 			  Note each channel number should only be used at most
 			  once.
 		Optional properties:
+			* label: Custom label for the channel.
 			* xlnx,bipolar: If set the channel is used in bipolar
 			  mode.
 
@@ -107,6 +108,7 @@ Examples:
 			#size-cells = <0>;
 			channel@0 {
 				reg = <0>;
+				label = "vin_v";
 				xlnx,bipolar;
 			};
 		};
-- 
1.9.1
