From: Stu Hsieh <stu.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 07/15] [media] mtk-mipicsi: add mipicsi reg setting for
 mt2712
Date: Tue, 16 Apr 2019 17:27:35 +0800
Message-ID: <1555406863-18069-8-git-send-email-stu.hsieh@mediatek.com>
References: <1555406863-18069-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1555406863-18069-1-git-send-email-stu.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stu Hsieh <stu.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch add mipicsi register setting to HW for mt2712

Signed-off-by: Stu Hsieh <stu.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 189 ++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index ec05f3b38cc9..c92ffe6684ef 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -64,6 +64,51 @@
 #define MAX_BUFFER_NUM			32U
 #define VID_LIMIT_BYTES			(100U * 1024U * 1024U)
 
+#define MIPI_RX_ANA00_CSI				0x00
+#define MIPI_RX_ANA04_CSI				0x04
+#define MIPI_RX_ANA08_CSI				0x08
+#define MIPI_RX_ANA0C_CSI				0x0c
+#define MIPI_RX_ANA10_CSI				0x10
+#define MIPI_RX_ANA20_CSI				0x20
+#define MIPI_RX_ANA24_CSI				0x24
+#define MIPI_RX_ANA4C_CSI				0x4c
+#define MIPI_RX_ANA50_CSI				0x50
+
+#define SENINF_CTRL					0x00
+
+#define SENINF_NCSI2_CAL_24				0x24
+#define SENINF_NCSI2_CAL_38				0x38
+#define SENINF_NCSI2_CAL_3C				0x3C
+#define SENINF_NCSI2_CTL				0xA0
+#define SENINF_NCSI2_LNRD_TIMING			0xA8
+#define SENINF_NCSI2_INT_EN				0xB0
+#define SENINF_NCSI2_INT_STATUS				0xB4
+#define SENINF_NCSI2_DBG_SEL				0xB8
+#define SENINF_NCSI2_HSRX_DBG				0xD8
+#define SENINF_NCSI2_DI					0xDC
+#define SENINF_NCSI2_DI_CTRL				0xE4
+
+#define SENINF_TOP_CTRL					0x00
+#define SENINF_TOP_CMODEL_PAR				0x04
+#define SENINF_TOP_MUX					0x08
+
+#define SENINF_MUX_CTRL					0x00
+
+#define CAMSV_MODULE_EN					0x10
+#define CAMSV_FMT_SEL					0x14
+#define CAMSV_INT_EN					0x18
+#define CAMSV_CLK_EN					0x30
+
+#define CAMSV_TG_SEN_MODE				0x500
+#define CAMSV_TG_SEN_GRAB_PXL				0x508
+#define CAMSV_TG_SEN_GRAB_LIN				0x50C
+#define CAMSV_TG_PATH_CFG				0x510
+
+#define IMGO_XSIZE					0x230
+#define IMGO_YSIZE					0x234
+#define IMGO_STRIDE					0x238
+#define DMA_FRAME_HEADER_EN				0xE00
+
 #define SerDes_support 1
 
 /* buffer for one video frame */
@@ -587,6 +632,149 @@ static struct soc_camera_host_ops mtk_soc_camera_host_ops = {
 	.set_bus_param		= mtk_mipicsi_set_bus_param,
 };
 
+static void mtk_mipicsi_ana_init(void __iomem *base)
+{
+	writel(0xFEFBEFBEU & readl(base + MIPI_RX_ANA4C_CSI),
+		base + MIPI_RX_ANA4C_CSI);
+	writel(0xFEFBEFBEU & readl(base + MIPI_RX_ANA50_CSI),
+		base + MIPI_RX_ANA50_CSI);
+
+	/* clock lane and lane0-lane3 input select */
+	writel(8UL | readl(base + MIPI_RX_ANA00_CSI),
+		base + MIPI_RX_ANA00_CSI);
+	writel(8UL | readl(base + MIPI_RX_ANA04_CSI),
+		base + MIPI_RX_ANA04_CSI);
+	writel(8UL | readl(base + MIPI_RX_ANA08_CSI),
+		base + MIPI_RX_ANA08_CSI);
+	writel(8UL | readl(base + MIPI_RX_ANA0C_CSI),
+		base + MIPI_RX_ANA0C_CSI);
+	writel(8UL | readl(base + MIPI_RX_ANA10_CSI),
+		base + MIPI_RX_ANA10_CSI);
+
+	/* BG chopper clock and CSI BG enable */
+	writel(11UL | readl(base + MIPI_RX_ANA24_CSI),
+		base + MIPI_RX_ANA24_CSI);
+	mdelay(1);
+
+	/* LDO core bias enable */
+	writel(0xFF030003U | readl(base + MIPI_RX_ANA20_CSI),
+		base + MIPI_RX_ANA20_CSI);
+	mdelay(1);
+}
+
+static void mtk_mipicsi_seninf_ctrl_init(void __iomem *base)
+{
+	/*seninf enable. select NCSI2 as seninif input source */
+	writel(0x8001U, base + SENINF_CTRL);
+}
+
+static void mtk_mipicsi_seninf_init(void __iomem *base)
+{
+	writel(1U, base + SENINF_NCSI2_CAL_38);
+	writel(0x00051545U, base + SENINF_NCSI2_CAL_3C);
+	writel(5U, base + SENINF_NCSI2_CAL_38);
+	mdelay(1);
+	writel(4U, base + SENINF_NCSI2_CAL_38);
+	writel(0U, base + SENINF_NCSI2_CAL_3C);
+	writel(0x11U, base + SENINF_NCSI2_DBG_SEL);
+	writel(0x189617FU, base + SENINF_NCSI2_CTL);
+	writel(~(1UL << 27) & readl(base + SENINF_NCSI2_CTL),
+		base + SENINF_NCSI2_CTL);
+	writel((1UL << 27) | readl(base + SENINF_NCSI2_CTL),
+		base + SENINF_NCSI2_CTL);
+	writel(0x2800U, base + SENINF_NCSI2_LNRD_TIMING);
+	writel(0x7FFFU, base + SENINF_NCSI2_INT_STATUS);
+	writel(0x7FCFFFFEU, base + SENINF_NCSI2_INT_EN);
+	writel(0xE4000000U, base + SENINF_NCSI2_CAL_24);
+	writel(0xFFFFFF00U & readl(base + SENINF_NCSI2_DBG_SEL),
+		base + SENINF_NCSI2_DBG_SEL);
+	writel(0xFFFFFF45U | readl(base + SENINF_NCSI2_DBG_SEL),
+		base + SENINF_NCSI2_DBG_SEL);
+	writel(0xFFFFFFEFU & readl(base + SENINF_NCSI2_HSRX_DBG),
+		base + SENINF_NCSI2_HSRX_DBG);
+	writel(0x01010101U, base + SENINF_NCSI2_DI_CTRL);
+	writel(0x03020100U, base + SENINF_NCSI2_DI);
+	writel(0x10, base + SENINF_NCSI2_DBG_SEL);
+}
+
+static void mtk_mipicsi_seninf_top_init(struct regmap *regmap)
+{
+	(void)regmap_write(regmap, SENINF_TOP_CTRL, 0x00010C00U);
+	(void)regmap_write(regmap, SENINF_TOP_CMODEL_PAR, 0x00079871);
+	(void)regmap_write(regmap, SENINF_TOP_MUX, 0x11110000);
+}
+
+static void mtk_mipicsi_seninf_mux_init(void __iomem *base, unsigned int ch)
+{
+	unsigned int mux_ctrl_val = (((0x9EFF8U + ch) << 12U) | 0x180U);
+
+	/* select seninf_mux1-4 as input for NCSI2 VC0-3*/
+	writel(mux_ctrl_val, base + SENINF_MUX_CTRL);
+}
+
+static void mtk_mipicsi_camsv_csr_init(void __iomem *base)
+{
+	/* double buffer enable. IMGO enable. PAK sel. TG enable */
+	writel(0x40000019U, base + CAMSV_MODULE_EN);
+	/* IMGO DP, PAK DP and TG clk enable */
+	writel(0x00008005U, base + CAMSV_CLK_EN);
+	/* 0: raw8, 1:raw10, 2:raw12, 3:YUV422, 4:raw14, 7:JPEG */
+	writel(0x00000003U, base + CAMSV_FMT_SEL);
+	/* write clear enable. pass1 down interrupt enable */
+	writel(0x80000400U, base + CAMSV_INT_EN);
+}
+
+static void mtk_mipicsi_camsv_tg_init(void __iomem *base, u32 b, u32 h)
+{
+	/* bit[30:16] grab end pixel clock number.
+	 * bit[14:0] grab start pixel clock number
+	 */
+	writel(b << 16U, base + CAMSV_TG_SEN_GRAB_PXL);
+	/* bit[29:16] end line number. bit[13:0] start line number */
+	writel(h << 16U, base + CAMSV_TG_SEN_GRAB_LIN);
+	/* YUV sensor unsigned to signed enable */
+	writel(0x1000U, base + CAMSV_TG_PATH_CFG);
+	/* cmos enable YUV422 mode */
+	writel(3U, base + CAMSV_TG_SEN_MODE);
+}
+
+static void mtk_mipicsi_camsv_dma_init(void __iomem *base, u32 b, u32 h)
+{
+	/* enable SW format setting. YUV format. 16bit */
+	writel(0x01810000U | b, base + IMGO_STRIDE);
+	/* b -1 bytes per line to write */
+	writel(b - 1U, base + IMGO_XSIZE);
+	/* w - 1 lines to write */
+	writel(h - 1U, base + IMGO_YSIZE);
+	/* disable frame header function */
+	writel(0U, base + DMA_FRAME_HEADER_EN);
+}
+
+static void mtk_mipicsi_camsv_init(void __iomem *base, u32 b, u32 h)
+{
+	mtk_mipicsi_camsv_csr_init(base);
+	mtk_mipicsi_camsv_tg_init(base, b, h);
+	mtk_mipicsi_camsv_dma_init(base, b, h);
+}
+
+static void mtk_mipicsi_reg_init(struct mtk_mipicsi_dev *mipicsi)
+{
+	unsigned int i;
+
+	mtk_mipicsi_ana_init(mipicsi->ana);
+	mtk_mipicsi_seninf_ctrl_init(mipicsi->seninf_ctrl);
+	mtk_mipicsi_seninf_init(mipicsi->seninf);
+	mtk_mipicsi_seninf_top_init(mipicsi->seninf_top);
+
+	for (i = 0U; i < mipicsi->camsv_num; ++i) {
+		u32 b = mipicsi->bytesperline;
+		u32 h = mipicsi->height;
+
+		mtk_mipicsi_seninf_mux_init(mipicsi->seninf_mux[i], i);
+		mtk_mipicsi_camsv_init(mipicsi->camsv[i], b, h);
+	}
+}
+
 static int mtk_mipicsi_pm_suspend(struct device *dev)
 {
 	struct soc_camera_host *ici = to_soc_camera_host(dev);
@@ -649,6 +837,7 @@ static int mtk_mipicsi_pm_resume(struct device *dev)
 	for (i = 0; i < mipicsi->clk_num; ++i)
 		(void)clk_prepare_enable(mipicsi->clk[i]);
 
+	mtk_mipicsi_reg_init(mipicsi);
 	return ret;
 }
 
-- 
2.18.0
