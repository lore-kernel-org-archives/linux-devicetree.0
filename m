From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] watchdog: Revert the AT91RM9200_WATCHDOG dependency
Date: Wed, 10 Apr 2013 14:36:22 +0200
Message-ID: <1365597382-15455-1-git-send-email-nicolas.ferre@atmel.com>
References: <20130409202711.GG7867@spo001.leaseweb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130409202711.GG7867-1F/o1hAF34+bEvaWgpTR7kEOCMrvLtNR@public.gmane.org>
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
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Compiling the at91rm9200_wdt.c driver without at91rm9200
support was leading to several errors:

drivers/built-in.o: In function `at91_wdt_close':
at91_adc.c:(.text+0xc9fe4): undefined reference to `at91_st_base'
drivers/built-in.o: In function `at91_wdt_write':
at91_adc.c:(.text+0xca004): undefined reference to `at91_st_base'
drivers/built-in.o: In function `at91wdt_shutdown':
at91_adc.c:(.text+0xca01c): undefined reference to `at91_st_base'
drivers/built-in.o: In function `at91wdt_suspend':
at91_adc.c:(.text+0xca038): undefined reference to `at91_st_base'
drivers/built-in.o: In function `at91_wdt_open':
at91_adc.c:(.text+0xca0cc): undefined reference to `at91_st_base'
drivers/built-in.o:at91_adc.c:(.text+0xca2c8): more undefined references to
`at91_st_base' follow

So, reverting the modification of the "depends" Kconfig line
introduced by patch a6a1bcd37 (watchdog: at91rm9200: add DT support)
seems to be the good solution.

Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 9fcc70c..e89fc31 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -117,7 +117,7 @@ config ARM_SP805_WATCHDOG
 
 config AT91RM9200_WATCHDOG
 	tristate "AT91RM9200 watchdog"
-	depends on ARCH_AT91
+	depends on ARCH_AT91RM9200
 	help
 	  Watchdog timer embedded into AT91RM9200 chips. This will reboot your
 	  system when the timeout is reached.
-- 
1.8.0
