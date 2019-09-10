From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: uniphier: Add Pro5 USB3 VBUS support" to the
 regulator tree
Date: Tue, 10 Sep 2019 11:06:59 +0100 (BST)
Message-ID: <20190910100659.E825CD02D5A@fitzroy.sirena.org.uk>
References: <1568080304-1572-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568080304-1572-1-git-send-email-hayashi.kunihiko@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jassi Brar <jaswinder.singh@linaro.org>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: uniphier: Add Pro5 USB3 VBUS support

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 3ba5368dc4e5947cb70287754960776c471eb23d Mon Sep 17 00:00:00 2001
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Date: Tue, 10 Sep 2019 10:51:44 +0900
Subject: [PATCH] regulator: uniphier: Add Pro5 USB3 VBUS support

Pro5 SoC has same scheme of USB3 VBUS as Pro4, so the data for Pro5 is
equivalent to Pro4.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Link: https://lore.kernel.org/r/1568080304-1572-1-git-send-email-hayashi.kunihiko@socionext.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/regulator/uniphier-regulator.txt     | 5 +++--
 drivers/regulator/uniphier-regulator.c                       | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/uniphier-regulator.txt b/Documentation/devicetree/bindings/regulator/uniphier-regulator.txt
index c9919f4b92d2..94fd38b0d163 100644
--- a/Documentation/devicetree/bindings/regulator/uniphier-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/uniphier-regulator.txt
@@ -13,6 +13,7 @@ this layer. These clocks and resets should be described in each property.
 Required properties:
 - compatible: Should be
     "socionext,uniphier-pro4-usb3-regulator" - for Pro4 SoC
+    "socionext,uniphier-pro5-usb3-regulator" - for Pro5 SoC
     "socionext,uniphier-pxs2-usb3-regulator" - for PXs2 SoC
     "socionext,uniphier-ld20-usb3-regulator" - for LD20 SoC
     "socionext,uniphier-pxs3-usb3-regulator" - for PXs3 SoC
@@ -20,12 +21,12 @@ Required properties:
 - clocks: A list of phandles to the clock gate for USB3 glue layer.
 	According to the clock-names, appropriate clocks are required.
 - clock-names: Should contain
-    "gio", "link" - for Pro4 SoC
+    "gio", "link" - for Pro4 and Pro5 SoCs
     "link"        - for others
 - resets: A list of phandles to the reset control for USB3 glue layer.
 	According to the reset-names, appropriate resets are required.
 - reset-names: Should contain
-    "gio", "link" - for Pro4 SoC
+    "gio", "link" - for Pro4 and Pro5 SoCs
     "link"        - for others
 
 See Documentation/devicetree/bindings/regulator/regulator.txt
diff --git a/drivers/regulator/uniphier-regulator.c b/drivers/regulator/uniphier-regulator.c
index 9026d5a3e964..2311924c3103 100644
--- a/drivers/regulator/uniphier-regulator.c
+++ b/drivers/regulator/uniphier-regulator.c
@@ -185,6 +185,10 @@ static const struct of_device_id uniphier_regulator_match[] = {
 		.compatible = "socionext,uniphier-pro4-usb3-regulator",
 		.data = &uniphier_pro4_usb3_data,
 	},
+	{
+		.compatible = "socionext,uniphier-pro5-usb3-regulator",
+		.data = &uniphier_pro4_usb3_data,
+	},
 	{
 		.compatible = "socionext,uniphier-pxs2-usb3-regulator",
 		.data = &uniphier_pxs2_usb3_data,
-- 
2.20.1
