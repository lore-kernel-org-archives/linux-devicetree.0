From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH 07/11] iio/adc: (max1363) Fix data conversion problems
Date: Thu, 31 Jan 2013 13:43:04 -0800
Message-ID: <1359668588-13678-8-git-send-email-linux@roeck-us.net>
References: <1359668588-13678-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359668588-13678-1-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For chips with more than 8 bit ADC resolution, received data was always
masked against 0xfff, ie with a 12 bit mask. This can result in bad data
for chips with 10 bit resolution if those chips have higher bits set
(seen with MAX1139).

The receive buffer was defined as char array. This could result in
unintentional sign extensions if the upper bit in a received byte
was set. Since the chip is configured for unipolar mode, we never
have to handle negative values, and sign extensions are never needed.

Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---
 drivers/iio/adc/max1363.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
index 2c773b4..fdc8be9 100644
--- a/drivers/iio/adc/max1363.c
+++ b/drivers/iio/adc/max1363.c
@@ -334,7 +334,7 @@ static int max1363_read_single_chan(struct iio_dev *indio_dev,
 {
 	int ret = 0;
 	s32 data;
-	char rxbuf[2];
+	u8 rxbuf[2];
 	struct max1363_state *st = iio_priv(indio_dev);
 	struct i2c_client *client = st->client;
 
@@ -366,7 +366,8 @@ static int max1363_read_single_chan(struct iio_dev *indio_dev,
 			ret = data;
 			goto error_ret;
 		}
-		data = (s32)(rxbuf[1]) | ((s32)(rxbuf[0] & 0x0F)) << 8;
+		data = (rxbuf[1] | rxbuf[0] << 8) &
+		  ((1 << st->chip_info->bits) - 1);
 	} else {
 		/* Get reading */
 		data = i2c_master_recv(client, rxbuf, 1);
-- 
1.7.9.7
