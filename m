From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 2/8] ARM: rockchip: clarify usability of DEBUG_RK3X_UART debug_ll options
Date: Fri, 25 Jul 2014 23:49:34 +0200
Message-ID: <1406324980-2450-3-git-send-email-heiko@sntech.de>
References: <1406324980-2450-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406324980-2450-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The debug uart settings from the DEBUG_RK3X_UART options are usable on
all Rockchip SoCs from the rk30xx and rk31xx series but not on the
new rk3288 SoCs. Thus clarify their use to prevent confusion.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm/Kconfig.debug | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 8f90595..a8dbf5e 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -582,7 +582,7 @@ choice
 		  on Rockchip based platforms.
 
 	config DEBUG_RK3X_UART0
-		bool "Kernel low-level debugging messages via Rockchip RK3X UART0"
+		bool "Kernel low-level debugging messages via Rockchip RK30/RK31 UART0"
 		depends on ARCH_ROCKCHIP
 		select DEBUG_UART_8250
 		help
@@ -590,7 +590,7 @@ choice
 		  on Rockchip based platforms.
 
 	config DEBUG_RK3X_UART1
-		bool "Kernel low-level debugging messages via Rockchip RK3X UART1"
+		bool "Kernel low-level debugging messages via Rockchip RK30/RK31 UART1"
 		depends on ARCH_ROCKCHIP
 		select DEBUG_UART_8250
 		help
@@ -598,7 +598,7 @@ choice
 		  on Rockchip based platforms.
 
 	config DEBUG_RK3X_UART2
-		bool "Kernel low-level debugging messages via Rockchip RK3X UART2"
+		bool "Kernel low-level debugging messages via Rockchip RK30/RK31 UART2"
 		depends on ARCH_ROCKCHIP
 		select DEBUG_UART_8250
 		help
@@ -606,7 +606,7 @@ choice
 		  on Rockchip based platforms.
 
 	config DEBUG_RK3X_UART3
-		bool "Kernel low-level debugging messages via Rockchip RK3X UART3"
+		bool "Kernel low-level debugging messages via Rockchip RK30/RK31 UART3"
 		depends on ARCH_ROCKCHIP
 		select DEBUG_UART_8250
 		help
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
