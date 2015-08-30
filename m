From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 2/3] gpiolib: gpiod_hog remove separate name argument
Date: Sun, 30 Aug 2015 09:44:45 +0200
Message-ID: <1440920686-6892-3-git-send-email-mpa@pengutronix.de>
References: <1440920686-6892-1-git-send-email-mpa@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440920686-6892-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arun Bharadwaj <arun-EiDWdcs9+yZBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The gpio name is now stored in the gpio descriptor, so we can simply use
that instead of an argument to the function.

Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 drivers/gpio/gpiolib.c    | 8 ++++----
 drivers/gpio/gpiolib.h    | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 48a7579dd62d..f1fe5123da28 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -232,7 +232,7 @@ static void of_gpiochip_scan_gpios(struct gpio_chip *chip)
 				continue;
 			}
 
-			if (gpiod_hog(desc, name, lflags, dflags))
+			if (gpiod_hog(desc, lflags, dflags))
 				continue;
 		}
 	}
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 872fdd3617c1..f1559fa72c36 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2181,15 +2181,15 @@ EXPORT_SYMBOL_GPL(__gpiod_get_index_optional);
 /**
  * gpiod_hog - Hog the specified GPIO desc given the provided flags
  * @desc:	gpio whose value will be assigned
- * @name:	gpio line name
  * @lflags:	gpio_lookup_flags - returned from of_find_gpio() or
  *		of_get_gpio_hog()
  * @dflags:	gpiod_flags - optional GPIO initialization flags
  */
-int gpiod_hog(struct gpio_desc *desc, const char *name,
-	      unsigned long lflags, enum gpiod_flags dflags)
+int gpiod_hog(struct gpio_desc *desc, unsigned long lflags,
+	      enum gpiod_flags dflags)
 {
 	int status;
+	const char *name = desc->name;
 
 	status = __gpiod_request(desc, name);
 	if (status) {
@@ -2211,7 +2211,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	set_bit(FLAG_IS_HOGGED, &desc->flags);
 
 	pr_info("GPIO line %d (%s) hogged as %s%s\n",
-		desc_to_gpio(desc), name,
+		desc_to_gpio(desc), desc->name,
 		(dflags&GPIOD_FLAGS_BIT_DIR_OUT) ? "output" : "input",
 		(dflags&GPIOD_FLAGS_BIT_DIR_OUT) ?
 		  (dflags&GPIOD_FLAGS_BIT_DIR_VAL) ? "/high" : "/low":"");
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 78e634d1c719..6c2aeff59f86 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -97,8 +97,8 @@ struct gpio_desc {
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
 void gpiod_free(struct gpio_desc *desc);
-int gpiod_hog(struct gpio_desc *desc, const char *name,
-		unsigned long lflags, enum gpiod_flags dflags);
+int gpiod_hog(struct gpio_desc *desc, unsigned long lflags,
+	      enum gpiod_flags dflags);
 
 /*
  * Return the GPIO number of the passed descriptor relative to its chip
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
