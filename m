From: Argus Lin <argus.lin@mediatek.com>
Subject: [PATCH 3/3] soc: mediatek: pwrap: add mt6357 driver for mt6765 SoCs
Date: Tue, 4 Sep 2018 20:31:54 +0800
Message-ID: <1536064314-31967-4-git-send-email-argus.lin@mediatek.com>
References: <1536064314-31967-1-git-send-email-argus.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1536064314-31967-1-git-send-email-argus.lin@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, argus.lin@mediatek.com, wsd_upstream@mediatek.com, Chenglin Xu <chenglin.xu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com, flora.fu@mediatek.com, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Chen Zhong <chen.zhong@mediatek.com>, "shailendra.v" <shailendra.v@samsung.com>
List-Id: devicetree@vger.kernel.org

MT6357 is a new power management IC and it is used for mt6765 SoCs.
To define mt6357_regs for pmic register mapping and pmic_mt6357
for accessing register.

Signed-off-by: Argus Lin <argus.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index ddaeace..2b2cee1 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -161,6 +161,21 @@ enum dew_regs {
 	[PWRAP_DEW_RDDMY_NO] =		0x030C,
 };
 
+static const u32 mt6357_regs[] = {
+	[PWRAP_DEW_DIO_EN] =		0x040A,
+	[PWRAP_DEW_READ_TEST] =		0x040C,
+	[PWRAP_DEW_WRITE_TEST] =	0x040E,
+	[PWRAP_DEW_CRC_EN] =		0x0412,
+	[PWRAP_DEW_CRC_VAL] =		0x0414,
+	[PWRAP_DEW_CIPHER_KEY_SEL] =	0x0418,
+	[PWRAP_DEW_CIPHER_IV_SEL] =	0x041A,
+	[PWRAP_DEW_CIPHER_EN] =		0x041C,
+	[PWRAP_DEW_CIPHER_RDY] =	0x041E,
+	[PWRAP_DEW_CIPHER_MODE] =	0x0420,
+	[PWRAP_DEW_CIPHER_SWRST] =	0x0422,
+	[PWRAP_DEW_RDDMY_NO] =		0x0424,
+};
+
 enum pwrap_regs {
 	PWRAP_MUX_SEL,
 	PWRAP_WRAP_EN,
@@ -716,6 +731,7 @@ enum pwrap_regs {
 enum pmic_type {
 	PMIC_MT6323,
 	PMIC_MT6351,
+	PMIC_MT6357,
 	PMIC_MT6380,
 	PMIC_MT6397,
 };
@@ -1175,6 +1191,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 		break;
 	case PMIC_MT6323:
 	case PMIC_MT6351:
+	case PMIC_MT6357:
 		pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_EN],
 			    0x1);
 		break;
@@ -1460,11 +1477,26 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 	.pwrap_write = pwrap_write16,
 };
 
+static const struct pwrap_slv_type pmic_mt6357 = {
+	.dew_regs = mt6357_regs,
+	.type = PMIC_MT6357,
+	.regmap = &pwrap_regmap_config16,
+	.caps = 0,
+	.pwrap_read = pwrap_read16,
+	.pwrap_write = pwrap_write16,
+};
+
 static const struct of_device_id of_slave_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6323",
 		.data = &pmic_mt6323,
 	}, {
+		.compatible = "mediatek,mt6351",
+		.data = &pmic_mt6351,
+	}, {
+		.compatible = "mediatek,mt6357",
+		.data = &pmic_mt6357,
+	}, {
 		/* The MT6380 PMIC only implements a regulator, so we bind it
 		 * directly instead of using a MFD.
 		 */
@@ -1474,9 +1506,6 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 		.compatible = "mediatek,mt6397",
 		.data = &pmic_mt6397,
 	}, {
-		.compatible = "mediatek,mt6351",
-		.data = &pmic_mt6351,
-	}, {
 		/* sentinel */
 	}
 };
-- 
1.8.1.1.dirty
