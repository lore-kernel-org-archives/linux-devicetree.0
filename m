From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 4/6] ARM: rockchip: enable support for RK3288 SoCs
Date: Wed, 16 Jul 2014 01:01:55 +0200
Message-ID: <4355781.cnmcVo5AVu@diego>
References: <1471578.ILeMmG2DL6@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471578.ILeMmG2DL6@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable HAVE_ARM_ARCH_TIMER and add a rockchip,rk3288 compatible.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/mach-rockchip/Kconfig    | 1 +
 arch/arm/mach-rockchip/rockchip.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/mach-rockchip/Kconfig b/arch/arm/mach-rockchip/Kconfig
index e4564c2..d168669 100644
--- a/arch/arm/mach-rockchip/Kconfig
+++ b/arch/arm/mach-rockchip/Kconfig
@@ -6,6 +6,7 @@ config ARCH_ROCKCHIP
 	select ARCH_REQUIRE_GPIOLIB
 	select ARM_GIC
 	select CACHE_L2X0
+	select HAVE_ARM_ARCH_TIMER
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
 	select DW_APB_TIMER_OF
diff --git a/arch/arm/mach-rockchip/rockchip.c b/arch/arm/mach-rockchip/rockchip.c
index 968cc34..8ab9e0e 100644
--- a/arch/arm/mach-rockchip/rockchip.c
+++ b/arch/arm/mach-rockchip/rockchip.c
@@ -29,6 +29,7 @@ static const char * const rockchip_board_dt_compat[] = {
 	"rockchip,rk3066a",
 	"rockchip,rk3066b",
 	"rockchip,rk3188",
+	"rockchip,rk3288",
 	NULL,
 };
 
-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
