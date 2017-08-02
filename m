From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 5/5] phy: rockchip-inno-usb2: add support of usb2-phy for rv1108 SoCs
Date: Wed,  2 Aug 2017 15:54:49 +0800
Message-ID: <1501660489-6030-1-git-send-email-frank.wang@rock-chips.com>
References: <1501660390-5956-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501660390-5956-1-git-send-email-frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wmc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds support usb2-phy for rv1108 SoCs and amend phy Documentation.

Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 .../bindings/phy/phy-rockchip-inno-usb2.txt        |  1 +
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      | 43 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
index d49572b..1479dda 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
@@ -6,6 +6,7 @@ Required properties (phy (parent) node):
 	* "rockchip,rk3328-usb2phy"
 	* "rockchip,rk3366-usb2phy"
 	* "rockchip,rk3399-usb2phy"
+	* "rockchip,rv1108-usb2phy"
  - reg : the address offset of grf for usb-phy configuration.
  - #clock-cells : should be 0.
  - clock-output-names : specify the 480m output clock name.
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index bebf23f..bd405f9 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -1405,11 +1405,54 @@ static const struct rockchip_usb2phy_cfg rk3399_phy_cfgs[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_usb2phy_cfg rv1108_phy_cfgs[] = {
+	{
+		.reg = 0x100,
+		.num_ports	= 2,
+		.clkout_ctl	= { 0x108, 4, 4, 1, 0 },
+		.port_cfgs	= {
+			[USB2PHY_PORT_OTG] = {
+				.phy_sus	= { 0x0100, 15, 0, 0, 0x1d1 },
+				.bvalid_det_en	= { 0x0680, 3, 3, 0, 1 },
+				.bvalid_det_st	= { 0x0690, 3, 3, 0, 1 },
+				.bvalid_det_clr = { 0x06a0, 3, 3, 0, 1 },
+				.ls_det_en	= { 0x0680, 2, 2, 0, 1 },
+				.ls_det_st	= { 0x0690, 2, 2, 0, 1 },
+				.ls_det_clr	= { 0x06a0, 2, 2, 0, 1 },
+				.utmi_bvalid	= { 0x0804, 10, 10, 0, 1 },
+				.utmi_ls	= { 0x0804, 13, 12, 0, 1 },
+			},
+			[USB2PHY_PORT_HOST] = {
+				.phy_sus	= { 0x0104, 15, 0, 0, 0x1d1 },
+				.ls_det_en	= { 0x0680, 4, 4, 0, 1 },
+				.ls_det_st	= { 0x0690, 4, 4, 0, 1 },
+				.ls_det_clr	= { 0x06a0, 4, 4, 0, 1 },
+				.utmi_ls	= { 0x0804, 9, 8, 0, 1 },
+				.utmi_hstdet	= { 0x0804, 7, 7, 0, 1 }
+			}
+		},
+		.chg_det = {
+			.opmode		= { 0x0100, 3, 0, 5, 1 },
+			.cp_det		= { 0x0804, 1, 1, 0, 1 },
+			.dcp_det	= { 0x0804, 0, 0, 0, 1 },
+			.dp_det		= { 0x0804, 2, 2, 0, 1 },
+			.idm_sink_en	= { 0x0108, 8, 8, 0, 1 },
+			.idp_sink_en	= { 0x0108, 7, 7, 0, 1 },
+			.idp_src_en	= { 0x0108, 9, 9, 0, 1 },
+			.rdm_pdwn_en	= { 0x0108, 10, 10, 0, 1 },
+			.vdm_src_en	= { 0x0108, 12, 12, 0, 1 },
+			.vdp_src_en	= { 0x0108, 11, 11, 0, 1 },
+		},
+	},
+	{ /* sentinel */ }
+};
+
 static const struct of_device_id rockchip_usb2phy_dt_match[] = {
 	{ .compatible = "rockchip,rk3228-usb2phy", .data = &rk3228_phy_cfgs },
 	{ .compatible = "rockchip,rk3328-usb2phy", .data = &rk3328_phy_cfgs },
 	{ .compatible = "rockchip,rk3366-usb2phy", .data = &rk3366_phy_cfgs },
 	{ .compatible = "rockchip,rk3399-usb2phy", .data = &rk3399_phy_cfgs },
+	{ .compatible = "rockchip,rv1108-usb2phy", .data = &rv1108_phy_cfgs },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_usb2phy_dt_match);
-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
