From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v2 6/6] drm/rockchip: cdn-dp: remove the DP phy switch
Date: Wed, 14 Feb 2018 17:54:47 +0100
Message-ID: <20180214165447.12181-6-enric.balletbo@collabora.com>
References: <20180214165447.12181-1-enric.balletbo@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180214165447.12181-1-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

There are 2 Type-c PHYs in RK3399, but only one DP controller. Hence
only one PHY can connect to DP controller at one time, the other should
be disconnected. The GRF_SOC_CON26 register has a switch bit to do it,
set this bit means enable PHY 1, clear this bit means enable PHY 0.

If the board has 2 Type-C ports, the DP driver get the phy id from
devm_of_phy_get_by_index, and then control this switch according to
this id. But some others board only has one Type-C port, it may be PHY 0
or PHY 1. The dts node id can not tell us the correct PHY id. Hence move
this switch to PHY driver, the PHY driver can distinguish between PHY 0
and PHY 1, and then write the correct register bit.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
Changes since v1:
- This patch is new on these series and is related to [5/6] so I
  included to this series. Like [5/6] the patch was send some time ago [1]
  but got stuck, so it's also and attempt to revive it.

[1] https://lkml.org/lkml/2017/2/10/74

 drivers/gpu/drm/rockchip/cdn-dp-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index ec999d9f15f6..c6fbdcd87c16 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -43,8 +43,6 @@
 #define GRF_SOC_CON9		0x6224
 #define DP_SEL_VOP_LIT		BIT(12)
 #define GRF_SOC_CON26		0x6268
-#define UPHY_SEL_BIT		3
-#define UPHY_SEL_MASK		BIT(19)
 #define DPTX_HPD_SEL		(3 << 12)
 #define DPTX_HPD_DEL		(2 << 12)
 #define DPTX_HPD_SEL_MASK	(3 << 28)
@@ -394,11 +392,6 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
 	union extcon_property_value property;
 	int ret;
 
-	ret = cdn_dp_grf_write(dp, GRF_SOC_CON26,
-			       (port->id << UPHY_SEL_BIT) | UPHY_SEL_MASK);
-	if (ret)
-		return ret;
-
 	if (!port->phy_enabled) {
 		ret = phy_power_on(port->phy);
 		if (ret) {
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
