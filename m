From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 1/2] nvmem: rockchip-efuse: parse 'rockchip,efuse-size'
Date: Wed, 13 Dec 2017 07:51:54 +0100
Message-ID: <20171213065155.32020-2-heiko@sntech.de>
References: <20171213065155.32020-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171213065155.32020-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

The eFuse size is defined in property <reg> before, but the length
of registers is not equal to the size on some platforms, so we
add a new property to redefine it.

Signed-off-by: Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt | 4 ++++
 drivers/nvmem/rockchip-efuse.c                             | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
index 60bec4782806..a6ef46dd1283 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
@@ -12,6 +12,10 @@ Required properties:
 - clocks: Should be the clock id of eFuse
 - clock-names: Should be "pclk_efuse"
 
+Optional properties:
+- rockchip,efuse-size: Should be exact eFuse size in byte, the eFuse
+  size in property <reg> will be invalid if define this property.
+
 Deprecated properties:
 - compatible: "rockchip,rockchip-efuse"
   Old efuse compatible value compatible to rk3066a, rk3188 and rk3288
diff --git a/drivers/nvmem/rockchip-efuse.c b/drivers/nvmem/rockchip-efuse.c
index 123de77ca5d6..a91372816c0a 100644
--- a/drivers/nvmem/rockchip-efuse.c
+++ b/drivers/nvmem/rockchip-efuse.c
@@ -217,7 +217,9 @@ static int rockchip_efuse_probe(struct platform_device *pdev)
 		return PTR_ERR(efuse->clk);
 
 	efuse->dev = &pdev->dev;
-	econfig.size = resource_size(res);
+	if (of_property_read_u32(dev->of_node, "rockchip,efuse-size",
+				 &econfig.size))
+		econfig.size = resource_size(res);
 	econfig.reg_read = match->data;
 	econfig.priv = efuse;
 	econfig.dev = efuse->dev;
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
