From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/4] mfd: bd9571mwv: Allow DDR Backup Power register access
Date: Wed, 14 Mar 2018 12:08:41 +0100
Message-ID: <1521025722-24205-4-git-send-email-geert+renesas@glider.be>
References: <1521025722-24205-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521025722-24205-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut+renesas@gmail.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Enable read/write access to the BD9571MWV_BKUP_MODE_CNT register, which
is amongst others used to configure DDR Backup Power.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

v2:
  - Expand "a.o.",
  - Add Acked-for-MFD-by (for Lee's own reference).
---
 drivers/mfd/bd9571mwv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index 64e088dfe7b05b5b..503979c81dae11bb 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -29,6 +29,7 @@ static const struct mfd_cell bd9571mwv_cells[] = {
 
 static const struct regmap_range bd9571mwv_readable_yes_ranges[] = {
 	regmap_reg_range(BD9571MWV_VENDOR_CODE, BD9571MWV_PRODUCT_REVISION),
+	regmap_reg_range(BD9571MWV_BKUP_MODE_CNT, BD9571MWV_BKUP_MODE_CNT),
 	regmap_reg_range(BD9571MWV_AVS_SET_MONI, BD9571MWV_AVS_DVFS_VID(3)),
 	regmap_reg_range(BD9571MWV_VD18_VID, BD9571MWV_VD33_VID),
 	regmap_reg_range(BD9571MWV_DVFS_VINIT, BD9571MWV_DVFS_VINIT),
@@ -44,6 +45,7 @@ static const struct regmap_access_table bd9571mwv_readable_table = {
 };
 
 static const struct regmap_range bd9571mwv_writable_yes_ranges[] = {
+	regmap_reg_range(BD9571MWV_BKUP_MODE_CNT, BD9571MWV_BKUP_MODE_CNT),
 	regmap_reg_range(BD9571MWV_AVS_VD09_VID(0), BD9571MWV_AVS_VD09_VID(3)),
 	regmap_reg_range(BD9571MWV_DVFS_SETVID, BD9571MWV_DVFS_SETVID),
 	regmap_reg_range(BD9571MWV_GPIO_DIR, BD9571MWV_GPIO_OUT),
-- 
2.7.4
