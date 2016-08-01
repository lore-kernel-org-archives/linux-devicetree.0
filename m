From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 1/7] clk: rockchip: rk3399: export USBPHYx_480M_SRC clock
 IDs
Date: Mon,  1 Aug 2016 17:33:30 +0800
Message-ID: <1470044016-29764-2-git-send-email-zhengxing@rock-chips.com>
References: <1470044016-29764-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1470044016-29764-1-git-send-email-zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We export some clock IDs for the usb phy 480m source clocks.

Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v2: None

 include/dt-bindings/clock/rk3399-cru.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/rk3399-cru.h b/include/dt-bindings/clock/rk3399-cru.h
index 50a44cf..c4d8311 100644
--- a/include/dt-bindings/clock/rk3399-cru.h
+++ b/include/dt-bindings/clock/rk3399-cru.h
@@ -131,6 +131,8 @@
 #define SCLK_DPHY_RX0_CFG		165
 #define SCLK_RMII_SRC			166
 #define SCLK_PCIEPHY_REF100M		167
+#define SCLK_USBPHY0_480M_SRC		168
+#define SCLK_USBPHY1_480M_SRC		169
 
 #define DCLK_VOP0			180
 #define DCLK_VOP1			181
-- 
1.7.9.5
