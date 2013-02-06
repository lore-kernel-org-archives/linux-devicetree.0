From: "Kumar, Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>
Subject: [PATCH V2 2/2] ARM: davinci: restart: fix wdt to machine restart with
	DT
Date: Wed, 6 Feb 2013 09:30:04 +0530
Message-ID: <1360123204-9978-3-git-send-email-anilkumar.v@ti.com>
References: <1360123204-9978-1-git-send-email-anilkumar.v@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1360123204-9978-1-git-send-email-anilkumar.v-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: mporter-l0cyMroinI0@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, b-cousson-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

In non DT case da8xx_register_watchdog() is called to register platform device
"da8xx_wdt_device" by board file. But in DT case it is not called and wdt
device get registered via wdt DT node.

Currently code is passing platform device "da8xx_wdt_device" in
"davinci_watchdog_reset" function in both DT and non DT case and that
leads to crash in DT boot.

Update restart function to make it generic DaVinci machine restart
in case of DT and non DT boot.

Signed-off-by: Kumar, Anil <anilkumar.v-l0cyMroinI0@public.gmane.org>
---
:100644 100644 2d5502d... 1df68fd... M	arch/arm/mach-davinci/devices-da8xx.c
:100644 100644 700d311... ef9f70e... M	arch/arm/mach-davinci/include/mach/da8xx.h
 arch/arm/mach-davinci/devices-da8xx.c      |   14 ++++++++++++--
 arch/arm/mach-davinci/include/mach/da8xx.h |    1 -
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-davinci/devices-da8xx.c b/arch/arm/mach-davinci/devices-da8xx.c
index 2d5502d..1df68fd 100644
--- a/arch/arm/mach-davinci/devices-da8xx.c
+++ b/arch/arm/mach-davinci/devices-da8xx.c
@@ -359,7 +359,7 @@ static struct resource da8xx_watchdog_resources[] = {
 	},
 };
 
-struct platform_device da8xx_wdt_device = {
+static struct platform_device da8xx_wdt_device = {
 	.name		= "watchdog",
 	.id		= -1,
 	.num_resources	= ARRAY_SIZE(da8xx_watchdog_resources),
@@ -368,7 +368,17 @@ struct platform_device da8xx_wdt_device = {
 
 void da8xx_restart(char mode, const char *cmd)
 {
-	davinci_watchdog_reset(&da8xx_wdt_device);
+	struct device *dev = NULL;
+	struct platform_device *wdt_device = NULL;
+
+	dev = bus_find_device_by_name(&platform_bus_type, NULL, "watchdog");
+	if (!dev) {
+		pr_err("wdt device not found to machine reboot\n");
+		return;
+	}
+
+	wdt_device = to_platform_device(dev);
+	davinci_watchdog_reset(wdt_device);
 }
 
 int __init da8xx_register_watchdog(void)
diff --git a/arch/arm/mach-davinci/include/mach/da8xx.h b/arch/arm/mach-davinci/include/mach/da8xx.h
index 700d311..ef9f70e 100644
--- a/arch/arm/mach-davinci/include/mach/da8xx.h
+++ b/arch/arm/mach-davinci/include/mach/da8xx.h
@@ -112,7 +112,6 @@ extern struct da8xx_lcdc_platform_data sharp_lcd035q3dg01_pdata;
 extern struct da8xx_lcdc_platform_data sharp_lk043t1dg01_pdata;
 extern struct davinci_spi_platform_data da8xx_spi_pdata[];
 
-extern struct platform_device da8xx_wdt_device;
 
 extern const short da830_emif25_pins[];
 extern const short da830_spi0_pins[];
-- 
1.7.4.1
