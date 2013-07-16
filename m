From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8] reset: Add driver for gpio-controlled reset pins
Date: Tue, 16 Jul 2013 09:50:42 +0800
Message-ID: <20130716015038.GD28375@S2101-09.ap.freescale.net>
References: <1369904940-716-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1369904940-716-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Thu, May 30, 2013 at 11:09:00AM +0200, Philipp Zabel wrote:
> This driver implements a reset controller device that toggle a gpio
> connected to a reset pin of a peripheral IC. The delay between assertion
> and de-assertion of the reset signal can be configured via device tree.
> 
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I see this patch is very useful, as GPIOs are widely used to reset
components/devices on board.  But I do not find the patch in v3.11-rc1.
What's your plan about it?

Also, I'm wondering if we should register the driver a little bit
early.  Please see the following patch.  If it makes sense to you,
I can send the patch to you, or you can just quash it into yours.

Shawn

---8<--------

>From 2f8ce9e5d6525b98f3828b707458e83fabb39d50 Mon Sep 17 00:00:00 2001
From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Sun, 14 Jul 2013 20:41:00 +0800
Subject: [PATCH] ENGR00269945: reset: register gpio-reset driver in
 arch_initcall

It's a little bit late to register gpio-reset driver at module_init
time, because gpio-reset provides reset control via gpio for other
devices which are mostly probed at module_init time too.  And it
becomes even worse, when the gpio comes from IO expander on I2C bus,
e.g. pca953x.  In that case, gpio-reset needs to be ready before I2C
bus driver which is generally ready at subsys_initcall time.  Let's
register gpio-reset driver in arch_initcall() to have it ready early
enough.

The defer probe mechanism is not used here, because a reset controller
driver should be reasonably registered early than other devices.  More
importantly, defer probe doe not help in some nasty cases, e.g. the
gpio-pca953x device itself needs a reset from gpio-reset driver to start
working.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/reset/gpio-reset.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/gpio-reset.c b/drivers/reset/gpio-reset.c
index 4f372f9..a7f214f 100644
--- a/drivers/reset/gpio-reset.c
+++ b/drivers/reset/gpio-reset.c
@@ -168,7 +168,17 @@ static struct platform_driver gpio_reset_driver = {
 	},
 };
 
-module_platform_driver(gpio_reset_driver);
+static int __init gpio_reset_init(void)
+{
+	return platform_driver_register(&gpio_reset_driver);
+}
+arch_initcall(gpio_reset_init);
+
+static void __exit gpio_reset_exit(void)
+{
+	platform_driver_unregister(&gpio_reset_driver);
+}
+module_exit(gpio_reset_exit);
 
 MODULE_AUTHOR("Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>");
 MODULE_DESCRIPTION("gpio reset controller");
-- 
1.7.9.5
