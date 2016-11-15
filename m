From: William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 2/2] phy: rockchip-inno-usb2: correct 480MHz output clock stable time
Date: Tue, 15 Nov 2016 11:54:07 +0800
Message-ID: <1479182047-3399-3-git-send-email-wulf@rock-chips.com>
References: <1479182047-3399-1-git-send-email-wulf@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479182047-3399-1-git-send-email-wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

We found that the system crashed due to 480MHz output clock of
USB2 PHY was unstable after clock had been enabled by gpu module.

Theoretically, 1 millisecond is a critical value for 480MHz
output clock stable time, so we try to change the delay time
to 1.2 millisecond to avoid this issue.

And the commit ed907fb1d7c3 ("phy: rockchip-inno-usb2: correct
clk_ops callback") used prepare callbacks instead of enable
callbacks to support gate a clk if the operation may sleep. So
we can switch from delay to sleep functions.

Also fix a spelling error from "waitting" to "waiting".

Signed-off-by: William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Reviewed-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v4:
- add Reviewed-by and fix a spelling error

Changes in v3:
- None

Changes in v2:
- None

 drivers/phy/phy-rockchip-inno-usb2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-rockchip-inno-usb2.c b/drivers/phy/phy-rockchip-inno-usb2.c
index 365e077..5d922fc 100644
--- a/drivers/phy/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/phy-rockchip-inno-usb2.c
@@ -165,8 +165,8 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 		if (ret)
 			return ret;
 
-		/* waitting for the clk become stable */
-		mdelay(1);
+		/* waiting for the clk become stable */
+		usleep_range(1200, 1300);
 	}
 
 	return 0;
-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
