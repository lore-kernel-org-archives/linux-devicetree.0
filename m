From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v9 3/5] regulators: axp20x: Use "clock-frequency" property for
 dcdc work frequency
Date: Thu, 22 Jan 2015 23:39:05 +0800
Message-ID: <1421941147-9682-4-git-send-email-wens@csie.org>
References: <1421941147-9682-1-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1421941147-9682-1-git-send-email-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Since the dcdc regulator work frequency is a property of the regulators
DT sub-tree, there is no issue of naming collisions, so we can use the
standard "clock-frequency" binding for this.

The driver sets a reasonable default value (same as the datasheet), and
only 1 dts has the old binding, with the default value.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/regulator/axp20x-regulator.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index e4331f5e5d7d..990ac453abc8 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -186,8 +186,10 @@ static int axp20x_regulator_parse_dt(struct platform_device *pdev)
 	if (!regulators) {
 		dev_warn(&pdev->dev, "regulators node not found\n");
 	} else {
-		dcdcfreq = 1500;
-		of_property_read_u32(regulators, "x-powers,dcdc-freq", &dcdcfreq);
+		dcdcfreq = 1500000;
+		of_property_read_u32(regulators, "clock-frequency", &dcdcfreq);
+		/* axp20x_set_dcdc_freq() takes kHZ */
+		dcdcfreq /= 1000;
 		ret = axp20x_set_dcdc_freq(pdev, dcdcfreq);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "Error setting dcdc frequency: %d\n", ret);
-- 
2.1.4
