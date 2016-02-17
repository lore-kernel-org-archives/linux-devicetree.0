From: "jianqun.xu" <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 2/6] spi: rockchip: add bindings for rk3399 spi
Date: Wed, 17 Feb 2016 09:53:08 +0800
Message-ID: <1455673992-16469-3-git-send-email-jay.xu@rock-chips.com>
References: <1455673992-16469-1-git-send-email-jay.xu@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455673992-16469-1-git-send-email-jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Add devicetree bindings for Rockchip rk3399 spi which found on
Rockchip rk3399 SoCs.

Signed-off-by: Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 Documentation/devicetree/bindings/spi/spi-rockchip.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.txt b/Documentation/devicetree/bindings/spi/spi-rockchip.txt
index 0c491bd..1b14d69 100644
--- a/Documentation/devicetree/bindings/spi/spi-rockchip.txt
+++ b/Documentation/devicetree/bindings/spi/spi-rockchip.txt
@@ -9,6 +9,7 @@ Required Properties:
     "rockchip,rk3066-spi" for rk3066.
     "rockchip,rk3188-spi", "rockchip,rk3066-spi" for rk3188.
     "rockchip,rk3288-spi", "rockchip,rk3066-spi" for rk3288.
+    "rockchip,rk3399-spi", "rockchip,rk3066-spi" for rk3399.
 - reg: physical base address of the controller and length of memory mapped
        region.
 - interrupts: The interrupt number to the cpu. The interrupt specifier format
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
