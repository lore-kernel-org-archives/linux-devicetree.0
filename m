From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH V2 1/4] misc: ti-st: use GPIO_LOW for initial value of nshutdown
Date: Mon, 27 Apr 2015 12:27:25 -0700
Message-ID: <1430162849-8804-1-git-send-email-eric.nelson@boundarydevices.com>
References: <20150427085242.GM16501@mwanda>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150427085242.GM16501@mwanda>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, der.herr-kA1LtwSENNE@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, gigi.joseph-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eyalr-l0cyMroinI0@public.gmane.org, robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

All other uses of the nshutdown gpio use macros GPIO_LOW and
GPIO_HIGH to allow changing the pin polarity.

Do this in gpio_direction_output as well.

Signed-off-by: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
No changes in V2
 drivers/misc/ti-st/st_kim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ti-st/st_kim.c b/drivers/misc/ti-st/st_kim.c
index 18e7a03..aaa17b0 100644
--- a/drivers/misc/ti-st/st_kim.c
+++ b/drivers/misc/ti-st/st_kim.c
@@ -817,7 +817,7 @@ static int kim_probe(struct platform_device *pdev)
 	}
 
 	/* Configure nShutdown GPIO as output=0 */
-	err = gpio_direction_output(kim_gdata->nshutdown, 0);
+	err = gpio_direction_output(kim_gdata->nshutdown, GPIO_LOW);
 	if (unlikely(err)) {
 		pr_err(" unable to configure gpio %d", kim_gdata->nshutdown);
 		return err;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
