From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 3/4] clocksource: dw_apb_timer_of: select DW_APB_TIMER
Date: Tue, 4 Jun 2013 11:38:11 +0200
Message-ID: <201306041138.11447.heiko@sntech.de>
References: <201306041136.09566.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201306041136.09566.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
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
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

dw_apb_timer_of is the driver part facing devicetree platforms and
calls into dw_apb_timer with the data gathered from the dt.

Currently the two platforms using the dw_apb_timer_of select both
the options for the core timer and the dt addon.

As dw_apb_timer_of always depends on dw_apb_timer let it select
DW_APB_TIMER itself without the need for every platform to do it.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/mach-picoxcell/Kconfig |    1 -
 arch/arm/mach-socfpga/Kconfig   |    1 -
 drivers/clocksource/Kconfig     |    1 +
 3 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-picoxcell/Kconfig b/arch/arm/mach-picoxcell/Kconfig
index 13bae78..b1022f4 100644
--- a/arch/arm/mach-picoxcell/Kconfig
+++ b/arch/arm/mach-picoxcell/Kconfig
@@ -4,7 +4,6 @@ config ARCH_PICOXCELL
 	select ARM_PATCH_PHYS_VIRT
 	select ARM_VIC
 	select CPU_V6K
-	select DW_APB_TIMER
 	select DW_APB_TIMER_OF
 	select GENERIC_CLOCKEVENTS
 	select HAVE_TCM
diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
index 566e804..a279fb3 100644
--- a/arch/arm/mach-socfpga/Kconfig
+++ b/arch/arm/mach-socfpga/Kconfig
@@ -7,7 +7,6 @@ config ARCH_SOCFPGA
 	select CLKDEV_LOOKUP
 	select COMMON_CLK
 	select CPU_V7
-	select DW_APB_TIMER
 	select DW_APB_TIMER_OF
 	select GENERIC_CLOCKEVENTS
 	select GPIO_PL061 if GPIOLIB
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index f151c6c..48a0f2e 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -21,6 +21,7 @@ config DW_APB_TIMER
 
 config DW_APB_TIMER_OF
 	bool
+	select DW_APB_TIMER
 
 config ARMADA_370_XP_TIMER
 	bool
-- 
1.7.2.3
