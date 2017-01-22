From: Rask Ingemann Lambertsen <rask@formelder.dk>
Subject: [PATCH v2 4/5] regulator: axp20x: Add support for the AXP808 PMIC
Date: Sun, 22 Jan 2017 18:33:10 +0100
Message-ID: <81de3f2f2d5d9552092d1a8f59dfb0be944d4446.1486592471.git.rask@formelder.dk>
References: <cover.1486592470.git.rask@formelder.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1486592470.git.rask@formelder.dk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The regulators are the same as on the AXP806.

Signed-off-by: Rask Ingemann Lambertsen <rask@formelder.dk>
Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Chen-Yu Tsai <wens@csie.org>
---

No changes in v2.

 drivers/regulator/axp20x-regulator.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index a3ade9e..034dce8 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -370,6 +370,7 @@ static int axp20x_set_dcdc_freq(struct platform_device *pdev, u32 dcdcfreq)
 		step = 75;
 		break;
 	case AXP806_ID:
+	case AXP808_ID:
 		/*
 		 * AXP806 DCDC work frequency setting has the same range and
 		 * step as AXP22X, but at a different register.
@@ -459,6 +460,7 @@ static int axp20x_set_dcdc_workmode(struct regulator_dev *rdev, int id, u32 work
 		break;
 
 	case AXP806_ID:
+	case AXP808_ID:
 		reg = AXP806_DCDC_MODE_CTRL2;
 		/*
 		 * AXP806 DCDC regulator IDs have the same range as AXP22X.
@@ -492,8 +494,8 @@ static bool axp20x_is_polyphase_slave(struct axp20x_dev *axp20x, int id)
 {
 	u32 reg = 0;
 
-	/* Only AXP806 has poly-phase outputs */
-	if (axp20x->variant != AXP806_ID)
+	/* Only AXP806 and AXP808 have poly-phase outputs */
+	if (axp20x->variant != AXP806_ID && axp20x->variant != AXP808_ID)
 		return false;
 
 	regmap_read(axp20x->regmap, AXP806_DCDC_MODE_CTRL2, &reg);
@@ -541,6 +543,7 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 						  "x-powers,drive-vbus-en");
 		break;
 	case AXP806_ID:
+	case AXP808_ID:
 		regulators = axp806_regulators;
 		nregulators = AXP806_REG_ID_MAX;
 		break;
-- 
2.10.2
