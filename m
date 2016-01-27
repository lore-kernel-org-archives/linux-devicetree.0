From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] clk: Move vendor's Kconfig into CCF menu section
Date: Wed, 27 Jan 2016 10:27:34 +0100
Message-ID: <4711589.Ig064LES4c@wuerfel>
References: <201601271708.gQUxXACW%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <201601271708.gQUxXACW%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 27 January 2016 17:18:03 kbuild test robot wrote:
> Hi James,
> 
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on v4.5-rc1 next-20160127]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
> 
> url:    https://github.com/0day-ci/linux/commits/James-Liao/clk-Move-vendor-s-Kconfig-into-CCF-menu-section/20160127-152850
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: arm-samsung (attached as .config)
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> All error/warnings (new ones prefixed by >>):
> 
> warning: (ARCH_BAST && MACH_VR1000 && MACH_ANUBIS && MACH_OSIRIS && MACH_RX1950) selects S3C2410_COMMON_DCLK which has unmet direct dependencies (COMMON_CLK)
> warning: (CPU_S3C2410 && CPU_S3C2440 && CPU_S3C2442) selects S3C2410_COMMON_CLK which has unmet direct dependencies (COMMON_CLK)
> warning: (CPU_S3C2412) selects S3C2412_COMMON_CLK which has unmet direct dependencies (COMMON_CLK)
> warning: (CPU_S3C2416 && CPU_S3C2443) selects S3C2443_COMMON_CLK which has unmet direct dependencies (COMMON_CLK)
>    drivers/built-in.o: In function `pwm_samsung_remove':
> >> :(.text+0xba68): undefined reference to `clk_disable'
>    drivers/built-in.o: In function `pwm_samsung_config':
> >> :(.text+0xbc18): undefined reference to `clk_get_rate'
>    :(.text+0xbc30): undefined reference to `clk_get_rate'

I think you should include this change in your patch, or as a preparation.
All other samsung platforms already select COMMON_CLK through ARCH_MULTIPLATFORM,
and all SoCs that are part of ARCH_S3C24XX individually select a symbol that
selects COMMON_CLK.

	Arnd

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index bf66c8334822..85e051d1c2d6 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -15,6 +15,7 @@ config PLAT_S3C24XX
 	select NO_IOPORT_MAP
 	select S3C_DEV_NAND
 	select IRQ_DOMAIN
+	select COMMON_CLK
 	help
 	  Base platform code for any Samsung S3C24XX device
 
diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 84196ecdaa12..b3fe5cb01afe 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -1,6 +1,5 @@
 config COMMON_CLK_SAMSUNG
 	bool
-	select COMMON_CLK
 
 config S3C2410_COMMON_CLK
 	bool
