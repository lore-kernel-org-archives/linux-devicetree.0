From: William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 2/2] phy: rockchip-inno-usb2: correct 480MHz output clock stable time
Date: Mon, 14 Nov 2016 15:01:51 +0800
Message-ID: <1479106911-16049-3-git-send-email-wulf@rock-chips.com>
References: <1479106911-16049-1-git-send-email-wulf@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479106911-16049-1-git-send-email-wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
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

Signed-off-by: William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Changes in v2:
- use usleep_range() function instead of mdelay()

 drivers/phy/phy-rockchip-inno-usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-rockchip-inno-usb2.c b/drivers/phy/phy-rockchip-inno-usb2.c
index 365e077..578290b 100644
--- a/drivers/phy/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/phy-rockchip-inno-usb2.c
@@ -166,7 +166,7 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 			return ret;
 
 		/* waitting for the clk become stable */
-		mdelay(1);
+		usleep_range(1200);
 	}
 
 	return 0;
-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
