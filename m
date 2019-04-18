From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 1/3] mfd: axp20x: add USB power supply mfd cell to AXP803
Date: Fri, 19 Apr 2019 00:18:02 +0800
Message-ID: <20190418161804.17723-2-wens@kernel.org>
References: <20190418161804.17723-1-wens@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418161804.17723-1-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The AXP803 has a VBUS power input. Its functionality is the same as the
one found in the AXP813. Now that the axp20x_usb_power driver supports
this variant, we can add an mfd cell for it to use it.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/mfd/axp20x.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 902f9f27e748..2215660dfa05 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -747,6 +747,11 @@ static const struct mfd_cell axp803_cells[] = {
 		.of_compatible	= "x-powers,axp813-ac-power-supply",
 		.num_resources	= ARRAY_SIZE(axp20x_ac_power_supply_resources),
 		.resources	= axp20x_ac_power_supply_resources,
+	}, {
+		.name		= "axp20x-usb-power-supply",
+		.num_resources	= ARRAY_SIZE(axp803_usb_power_supply_resources),
+		.resources	= axp803_usb_power_supply_resources,
+		.of_compatible	= "x-powers,axp813-usb-power-supply",
 	},
 	{	.name		= "axp20x-regulator" },
 };
-- 
2.20.1
