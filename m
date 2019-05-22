From: Justin Swartz <justin.swartz@risingedge.co.za>
Subject: [PATCH] drm/rockchip: dw_hdmi: add basic rk3228 support
Date: Wed, 22 May 2019 22:46:29 +0000
Message-ID: <20190522224631.25164-1-justin.swartz@risingedge.co.za>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Justin Swartz <justin.swartz@risingedge.co.za>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Like the RK3328, RK322x SoCs offer a Synopsis DesignWare HDMI transmitter
and an Innosilicon HDMI PHY.

Add a new dw_hdmi_plat_data struct, rk3228_hdmi_drv_data.
Assign a set of mostly generic rk3228_hdmi_phy_ops functions.
Add dw_hdmi_rk3228_setup_hpd() to enable the HDMI HPD and DDC lines.

Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
---
 .../bindings/display/rockchip/dw_hdmi-rockchip.txt |  1 +
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
index 39143424a..703503103 100644
--- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
@@ -12,6 +12,7 @@ following device-specific properties.
 Required properties:
 
 - compatible: should be one of the following:
+		"rockchip,rk3228-dw-hdmi"
 		"rockchip,rk3288-dw-hdmi"
 		"rockchip,rk3328-dw-hdmi"
 		"rockchip,rk3399-dw-hdmi"
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 4cdc9f86c..182a852af 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -23,6 +23,14 @@
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
 
+#define RK3228_GRF_SOC_CON2		0x0408
+#define RK3228_HDMI_SDAIN_MSK		BIT(14)
+#define RK3228_HDMI_SCLIN_MSK		BIT(13)
+#define RK3228_GRF_SOC_CON6		0x0418
+#define RK3228_HDMI_HPD_VSEL		BIT(6)
+#define RK3228_HDMI_SDA_VSEL		BIT(5)
+#define RK3228_HDMI_SCL_VSEL		BIT(4)
+
 #define RK3288_GRF_SOC_CON6		0x025C
 #define RK3288_HDMI_LCDC_SEL		BIT(4)
 #define RK3328_GRF_SOC_CON2		0x0408
@@ -325,6 +333,25 @@ static void dw_hdmi_rockchip_genphy_disable(struct dw_hdmi *dw_hdmi, void *data)
 	phy_power_off(hdmi->phy);
 }
 
+static void dw_hdmi_rk3228_setup_hpd(struct dw_hdmi *dw_hdmi, void *data)
+{
+	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
+
+	dw_hdmi_phy_setup_hpd(dw_hdmi, data);
+
+	regmap_write(hdmi->regmap,
+		RK3228_GRF_SOC_CON6,
+		HIWORD_UPDATE(RK3228_HDMI_HPD_VSEL | RK3228_HDMI_SDA_VSEL |
+			      RK3228_HDMI_SCL_VSEL,
+			      RK3228_HDMI_HPD_VSEL | RK3228_HDMI_SDA_VSEL |
+			      RK3228_HDMI_SCL_VSEL));
+
+	regmap_write(hdmi->regmap,
+		RK3228_GRF_SOC_CON2,
+		HIWORD_UPDATE(RK3228_HDMI_SDAIN_MSK | RK3228_HDMI_SCLIN_MSK,
+			      RK3228_HDMI_SDAIN_MSK | RK3228_HDMI_SCLIN_MSK));
+}
+
 static enum drm_connector_status
 dw_hdmi_rk3328_read_hpd(struct dw_hdmi *dw_hdmi, void *data)
 {
@@ -370,6 +397,29 @@ static void dw_hdmi_rk3328_setup_hpd(struct dw_hdmi *dw_hdmi, void *data)
 			      RK3328_HDMI_HPD_IOE));
 }
 
+static const struct dw_hdmi_phy_ops rk3228_hdmi_phy_ops = {
+	.init		= dw_hdmi_rockchip_genphy_init,
+	.disable	= dw_hdmi_rockchip_genphy_disable,
+	.read_hpd	= dw_hdmi_phy_read_hpd,
+	.update_hpd	= dw_hdmi_phy_update_hpd,
+	.setup_hpd	= dw_hdmi_rk3228_setup_hpd,
+};
+
+static struct rockchip_hdmi_chip_data rk3228_chip_data = {
+	.lcdsel_grf_reg = -1,
+};
+
+static const struct dw_hdmi_plat_data rk3228_hdmi_drv_data = {
+	.mode_valid = dw_hdmi_rockchip_mode_valid,
+	.mpll_cfg = rockchip_mpll_cfg,
+	.cur_ctr = rockchip_cur_ctr,
+	.phy_config = rockchip_phy_config,
+	.phy_data = &rk3228_chip_data,
+	.phy_ops = &rk3228_hdmi_phy_ops,
+	.phy_name = "inno_dw_hdmi_phy2",
+	.phy_force_vendor = true,
+};
+
 static struct rockchip_hdmi_chip_data rk3288_chip_data = {
 	.lcdsel_grf_reg = RK3288_GRF_SOC_CON6,
 	.lcdsel_big = HIWORD_UPDATE(0, RK3288_HDMI_LCDC_SEL),
@@ -422,6 +472,9 @@ static const struct dw_hdmi_plat_data rk3399_hdmi_drv_data = {
 };
 
 static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
+	{ .compatible = "rockchip,rk3228-dw-hdmi",
+	  .data = &rk3228_hdmi_drv_data
+	},
 	{ .compatible = "rockchip,rk3288-dw-hdmi",
 	  .data = &rk3288_hdmi_drv_data
 	},
-- 
2.11.0
