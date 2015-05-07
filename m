From: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
Subject: [PATCH 2/2] iio: adc: xilinx-xadc: Add xlnx,extend-name as an optional argument for aux channels
Date: Thu, 7 May 2015 17:44:04 -0500
Message-ID: <1431038644-41600-2-git-send-email-xander.huff@ni.com>
References: <1431038644-41600-1-git-send-email-xander.huff@ni.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431038644-41600-1-git-send-email-xander.huff-acOepvfBmUk@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben.shelton-acOepvfBmUk@public.gmane.org, joshc-acOepvfBmUk@public.gmane.org, joe.hershberger-acOepvfBmUk@public.gmane.org, Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

To better facilitate user-mode access to optional aux channels, allow
device trees to specify a custom extended name for defined channels.

Signed-off-by: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
Reviewed-by: Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>
Reviewed-by: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
--
Natinst-ReviewBoard-ID: 97119
---
 drivers/iio/adc/xilinx-xadc-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index a221f73..cf1d2f9 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -1118,6 +1118,9 @@ static int xadc_parse_dt(struct iio_dev *indio_dev, struct device_node *np,
 			if (ret || reg > 16)
 				continue;
 
+			of_property_read_string(child, "xlnx,extend-name",
+						&chan->extend_name);
+
 			if (of_property_read_bool(child, "xlnx,bipolar"))
 				chan->scan_type.sign = 's';
 
-- 
1.9.1
