From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 1/3] mfd: wm8998: Remove some unused registers
Date: Fri, 4 Oct 2019 16:37:51 +0100
Message-ID: <20191004153753.8369-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

Save a few bytes by removing some registers from the driver that are not
currently used and not intended to be used at any point in the future.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Add more commit message

 drivers/mfd/wm8998-tables.c           | 12 ------------
 include/linux/mfd/arizona/registers.h |  7 -------
 2 files changed, 19 deletions(-)

diff --git a/drivers/mfd/wm8998-tables.c b/drivers/mfd/wm8998-tables.c
index ebf0eadd2075c..9b34a6d760949 100644
--- a/drivers/mfd/wm8998-tables.c
+++ b/drivers/mfd/wm8998-tables.c
@@ -806,12 +806,6 @@ static const struct reg_default wm8998_reg_default[] = {
 	{ 0x00000EF3, 0x0000 },    /* R3827  - ISRC 2 CTRL 1 */
 	{ 0x00000EF4, 0x0001 },    /* R3828  - ISRC 2 CTRL 2 */
 	{ 0x00000EF5, 0x0000 },    /* R3829  - ISRC 2 CTRL 3 */
-	{ 0x00001700, 0x0000 },    /* R5888  - FRF_COEFF_1 */
-	{ 0x00001701, 0x0000 },    /* R5889  - FRF_COEFF_2 */
-	{ 0x00001702, 0x0000 },    /* R5890  - FRF_COEFF_3 */
-	{ 0x00001703, 0x0000 },    /* R5891  - FRF_COEFF_4 */
-	{ 0x00001704, 0x0000 },    /* R5892  - DAC_COMP_1 */
-	{ 0x00001705, 0x0000 },    /* R5893  - DAC_COMP_2 */
 };
 
 static bool wm8998_readable_register(struct device *dev, unsigned int reg)
@@ -1492,12 +1486,6 @@ static bool wm8998_readable_register(struct device *dev, unsigned int reg)
 	case ARIZONA_ISRC_2_CTRL_1:
 	case ARIZONA_ISRC_2_CTRL_2:
 	case ARIZONA_ISRC_2_CTRL_3:
-	case ARIZONA_FRF_COEFF_1:
-	case ARIZONA_FRF_COEFF_2:
-	case ARIZONA_FRF_COEFF_3:
-	case ARIZONA_FRF_COEFF_4:
-	case ARIZONA_V2_DAC_COMP_1:
-	case ARIZONA_V2_DAC_COMP_2:
 		return true;
 	default:
 		return false;
diff --git a/include/linux/mfd/arizona/registers.h b/include/linux/mfd/arizona/registers.h
index bb1a2530ae279..49e24d1de8d47 100644
--- a/include/linux/mfd/arizona/registers.h
+++ b/include/linux/mfd/arizona/registers.h
@@ -1186,13 +1186,6 @@
 #define ARIZONA_DSP4_SCRATCH_1                   0x1441
 #define ARIZONA_DSP4_SCRATCH_2                   0x1442
 #define ARIZONA_DSP4_SCRATCH_3                   0x1443
-#define ARIZONA_FRF_COEFF_1                      0x1700
-#define ARIZONA_FRF_COEFF_2                      0x1701
-#define ARIZONA_FRF_COEFF_3                      0x1702
-#define ARIZONA_FRF_COEFF_4                      0x1703
-#define ARIZONA_V2_DAC_COMP_1                    0x1704
-#define ARIZONA_V2_DAC_COMP_2                    0x1705
-
 
 /*
  * Field Definitions.
-- 
2.11.0
