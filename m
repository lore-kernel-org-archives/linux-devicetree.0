From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH 05/11] iio/adc: (max1363) Provide OF node information to iio device
Date: Thu, 31 Jan 2013 13:43:02 -0800
Message-ID: <1359668588-13678-6-git-send-email-linux@roeck-us.net>
References: <1359668588-13678-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359668588-13678-1-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---
 drivers/iio/adc/max1363.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
index 03b25b3..ca8bbc1 100644
--- a/drivers/iio/adc/max1363.c
+++ b/drivers/iio/adc/max1363.c
@@ -1538,6 +1538,7 @@ static int max1363_probe(struct i2c_client *client,
 		goto error_out;
 	}
 
+	indio_dev->dev.of_node = client->dev.of_node;
 	ret = iio_map_array_register(indio_dev, client->dev.platform_data);
 	if (ret < 0)
 		goto error_free_device;
-- 
1.7.9.7
