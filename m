From: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RESEND PATCH 2/2] phy: rockchip-inno-usb2: add support of u2phy for
 rk3328
Date: Wed,  1 Mar 2017 18:34:23 +0800
Message-ID: <1488364463-27075-3-git-send-email-daniel.meng@rock-chips.com>
References: <1488364463-27075-1-git-send-email-daniel.meng@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488364463-27075-1-git-send-email-daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add u2phy config information in the data of match table for
rk3328.

Signed-off-by: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 drivers/phy/phy-rockchip-inno-usb2.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/phy/phy-rockchip-inno-usb2.c b/drivers/phy/phy-rockchip-inno-usb2.c
index 4ea95c2..cf2729c 100644
--- a/drivers/phy/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/phy-rockchip-inno-usb2.c
@@ -1141,6 +1141,26 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static const struct rockchip_usb2phy_cfg rk3328_phy_cfgs[] = {
+	{
+		.reg = 0x100,
+		.num_ports	= 2,
+		.phy_tuning	= rk3328_usb2phy_tuning,
+		.clkout_ctl	= { 0x108, 4, 4, 1, 0 },
+		.port_cfgs	= {
+			[USB2PHY_PORT_HOST] = {
+				.phy_sus	= { 0x104, 15, 0, 0, 0x1d1 },
+				.ls_det_en	= { 0x110, 1, 1, 0, 1 },
+				.ls_det_st	= { 0x114, 1, 1, 0, 1 },
+				.ls_det_clr	= { 0x118, 1, 1, 0, 1 },
+				.utmi_ls	= { 0x120, 17, 16, 0, 1 },
+				.utmi_hstdet	= { 0x120, 19, 19, 0, 1 }
+			}
+		},
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_usb2phy_cfg rk3366_phy_cfgs[] = {
 	{
 		.reg = 0x700,
@@ -1223,6 +1243,7 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 };
 
 static const struct of_device_id rockchip_usb2phy_dt_match[] = {
+	{ .compatible = "rockchip,rk3328-usb2phy", .data = &rk3328_phy_cfgs },
 	{ .compatible = "rockchip,rk3366-usb2phy", .data = &rk3366_phy_cfgs },
 	{ .compatible = "rockchip,rk3399-usb2phy", .data = &rk3399_phy_cfgs },
 	{}
-- 
1.9.1
