From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 10/10] gpio: tegra: Use module_platform_driver()
Date: Wed, 18 Sep 2013 15:24:52 +0200
Message-ID: <1379510692-32435-11-git-send-email-treding@nvidia.com>
References: <1379510692-32435-1-git-send-email-treding@nvidia.com>
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <1379510692-32435-1-git-send-email-treding@nvidia.com>
Sender: sparclinux-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ralf Baechle <ralf@linux-mips.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

With the driver core now resolving interrupt references at probe time,
it is no longer necessary to force explicit probe ordering using
initcalls.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Note that there are potentially many more drivers that can be switched
to the generic module_*_driver() interfaces now that interrupts can be
resolved later and deferred probe should be able to handle all the
ordering issues.

 drivers/gpio/gpio-tegra.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 9a62672..766e6ef 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -513,12 +513,7 @@ static struct platform_driver tegra_gpio_driver = {
 	},
 	.probe		= tegra_gpio_probe,
 };
-
-static int __init tegra_gpio_init(void)
-{
-	return platform_driver_register(&tegra_gpio_driver);
-}
-postcore_initcall(tegra_gpio_init);
+module_platform_driver(tegra_gpio_driver);
 
 #ifdef	CONFIG_DEBUG_FS
 
-- 
1.8.4

