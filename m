From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RESEND PATCH 1/1] phy: rockchip-inno-usb2: add COMMON_CLK dependency
Date: Tue, 16 Aug 2016 14:13:42 +0800
Message-ID: <1471328022-93048-2-git-send-email-frank.wang@rock-chips.com>
References: <1471328022-93048-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471328022-93048-1-git-send-email-frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On kernel builds without COMMON_CLK, the newly added rockchip-inno-usb2
driver fails to build:

drivers/phy/phy-rockchip-inno-usb2.c:124:16: error: field 'clk480m_hw'
has incomplete type
   struct clk_hw clk480m_hw;

In file included from include/linux/clk.h:16:0
                 from drivers/phy/phy-rockchip-inno-usb2.c:17:
include/linux/kernel.h:831:48: error: initialization from incompatible
pointer type [-Werror=incompatible-pointer-types]
   const typeof( ((type *)0)->member ) *__mptr = (ptr); \

  ... ...

Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 drivers/phy/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index f9bf981..c6d57e5 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -370,6 +370,7 @@ config PHY_ROCKCHIP_USB
 config PHY_ROCKCHIP_INNO_USB2
 	tristate "Rockchip INNO USB2PHY Driver"
 	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
+	depends on COMMON_CLK
 	select GENERIC_PHY
 	help
 	  Support for Rockchip USB2.0 PHY with Innosilicon IP block.
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
