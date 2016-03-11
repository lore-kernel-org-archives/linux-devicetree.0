From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 2/5] gpio: gpiolib: Print error number if gpio hog failed
Date: Fri, 11 Mar 2016 19:13:21 +0530
Message-ID: <1457703804-3016-3-git-send-email-ldewangan@nvidia.com>
References: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457703804-3016-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: bparrot-l0cyMroinI0@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Print the error number of GPIO hog failed during its configurations.
This helps in identifying the failure without instrumenting the code.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
Changes from V1:
- Keep originality of error message, just add the error number.
- It makes line to be >80 for string and understood that it is
  fine for string on some cases.
---
 drivers/gpio/gpiolib.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1741ef4..b682d73 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2680,15 +2680,16 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 
 	local_desc = gpiochip_request_own_desc(chip, hwnum, name);
 	if (IS_ERR(local_desc)) {
-		pr_err("requesting hog GPIO %s (chip %s, offset %d) failed\n",
-		       name, chip->label, hwnum);
-		return PTR_ERR(local_desc);
+		status = PTR_ERR(local_desc);
+		pr_err("requesting hog GPIO %s (chip %s, offset %d) failed, %d\n",
+		       name, chip->label, hwnum, status);
+		return status;
 	}
 
 	status = gpiod_configure_flags(desc, name, dflags);
 	if (status < 0) {
-		pr_err("setup of hog GPIO %s (chip %s, offset %d) failed\n",
-		       name, chip->label, hwnum);
+		pr_err("setup of hog GPIO %s (chip %s, offset %d) failed, %d\n",
+		       name, chip->label, hwnum, status);
 		gpiochip_free_own_desc(desc);
 		return status;
 	}
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
