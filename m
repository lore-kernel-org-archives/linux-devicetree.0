From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 2/4] mfd: axp20x: Add AXP209 GPIO driver to the mfd
Date: Wed, 20 Jul 2016 16:11:37 +0200
Message-ID: <20160720141139.25098-3-maxime.ripard@free-electrons.com>
References: <20160720141139.25098-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160720141139.25098-1-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Now that we have a GPIO driver for the AXP209, we can add it to our MFD.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mfd/axp20x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index fd80b0981f0f..4b3e073c47b7 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -508,6 +508,9 @@ static const struct regmap_irq_chip axp809_regmap_irq_chip = {
 
 static struct mfd_cell axp20x_cells[] = {
 	{
+		.name		= "axp20x-gpio",
+		.of_compatible	= "x-powers,axp209-gpio",
+	}, {
 		.name		= "axp20x-pek",
 		.num_resources	= ARRAY_SIZE(axp20x_pek_resources),
 		.resources	= axp20x_pek_resources,
-- 
2.9.0
