From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 03/15] clk: imx7d: fix mipi dphy div parent
Date: Mon, 23 Apr 2018 14:47:38 +0100
Message-ID: <20180423134750.30403-4-rui.silva@linaro.org>
References: <20180423134750.30403-1-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180423134750.30403-1-rui.silva@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rui Miguel Silva <rui.silva@linaro.org>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Fix the mipi dphy root divider to mipi_dphy_pre_div, this would remove a orphan
clock and set the correct parent.

before:
cat clk_orphan_summary
                                 enable  prepare  protect
   clock                          count    count    count        rate   accuracy   phase
----------------------------------------------------------------------------------------
 mipi_dphy_post_div                   1        1        0           0          0 0
    mipi_dphy_root_clk                1        1        0           0          0 0

cat clk_dump | grep mipi_dphy
mipi_dphy_post_div                    1        1        0           0          0 0
    mipi_dphy_root_clk                1        1        0           0          0 0

after:
cat clk_dump | grep mipi_dphy
   mipi_dphy_src                     1        1        0    24000000          0 0
       mipi_dphy_cg                  1        1        0    24000000          0 0
          mipi_dphy_pre_div          1        1        0    24000000          0 0
             mipi_dphy_post_div      1        1        0    24000000          0 0
                mipi_dphy_root_clk   1        1        0    24000000          0 0

Cc: linux-clk@vger.kernel.org
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/clk/imx/clk-imx7d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 975a20d3cc94..f7f4db2e6fa6 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -729,7 +729,7 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	clks[IMX7D_LCDIF_PIXEL_ROOT_DIV] = imx_clk_divider2("lcdif_pixel_post_div", "lcdif_pixel_pre_div", base + 0xa300, 0, 6);
 	clks[IMX7D_MIPI_DSI_ROOT_DIV] = imx_clk_divider2("mipi_dsi_post_div", "mipi_dsi_pre_div", base + 0xa380, 0, 6);
 	clks[IMX7D_MIPI_CSI_ROOT_DIV] = imx_clk_divider2("mipi_csi_post_div", "mipi_csi_pre_div", base + 0xa400, 0, 6);
-	clks[IMX7D_MIPI_DPHY_ROOT_DIV] = imx_clk_divider2("mipi_dphy_post_div", "mipi_csi_dphy_div", base + 0xa480, 0, 6);
+	clks[IMX7D_MIPI_DPHY_ROOT_DIV] = imx_clk_divider2("mipi_dphy_post_div", "mipi_dphy_pre_div", base + 0xa480, 0, 6);
 	clks[IMX7D_SAI1_ROOT_DIV] = imx_clk_divider2("sai1_post_div", "sai1_pre_div", base + 0xa500, 0, 6);
 	clks[IMX7D_SAI2_ROOT_DIV] = imx_clk_divider2("sai2_post_div", "sai2_pre_div", base + 0xa580, 0, 6);
 	clks[IMX7D_SAI3_ROOT_DIV] = imx_clk_divider2("sai3_post_div", "sai3_pre_div", base + 0xa600, 0, 6);
-- 
2.17.0
