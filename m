From: Tomas Novotny <tomas.novotny-MzfF5RY65ECbtNqbA8UwFdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 2/5] iio: dac: mcp4725: fix incorrect comment
Date: Tue, 18 Oct 2016 19:43:06 +0200
Message-ID: <1476812589-18333-3-git-send-email-tomas.novotny@tbs-biometrics.com>
References: <1476812589-18333-1-git-send-email-tomas.novotny@tbs-biometrics.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476812589-18333-1-git-send-email-tomas.novotny-MzfF5RY65ECbtNqbA8UwFdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yong Li <sdliyong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>

Number 2 is referencing to the settings with the largest available
resistor.

No functional change.

Signed-off-by: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
---
 drivers/iio/dac/mcp4725.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/mcp4725.c b/drivers/iio/dac/mcp4725.c
index 1f55d1b..e481f38 100644
--- a/drivers/iio/dac/mcp4725.c
+++ b/drivers/iio/dac/mcp4725.c
@@ -374,7 +374,7 @@ static int mcp4725_probe(struct i2c_client *client,
 	}
 	pd = (inbuf[0] >> 1) & 0x3;
 	data->powerdown = pd > 0 ? true : false;
-	data->powerdown_mode = pd ? pd - 1 : 2; /* largest register to gnd */
+	data->powerdown_mode = pd ? pd - 1 : 2; /* largest resistor to gnd */
 	data->dac_value = (inbuf[1] << 4) | (inbuf[2] >> 4);
 
 	err = iio_device_register(indio_dev);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
