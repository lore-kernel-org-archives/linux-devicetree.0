From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/5] soc: amlogic: canvas: add support for Meson8, Meson8b and Meson8m2
Date: Mon, 20 May 2019 21:43:50 +0200
Message-ID: <20190520194353.24445-3-martin.blumenstingl@googlemail.com>
References: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, mjourdan@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The canvas IP on Meson8, Meson8b and Meson8m2 is mostly identical to the
one on GXBB and newer. The only known difference so far is that that the
"endianness" bits are not supported on Meson8m2 and earlier.

Add new compatible strings and a check in meson_canvas_config() to
validate that the endianness bits cannot be configured on the 32-bit
SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/soc/amlogic/meson-canvas.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index be95a37c3fec..c655f5f92b12 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -35,6 +35,7 @@ struct meson_canvas {
 	void __iomem *reg_base;
 	spinlock_t lock; /* canvas device lock */
 	u8 used[NUM_CANVAS];
+	bool supports_endianness;
 };
 
 static void canvas_write(struct meson_canvas *canvas, u32 reg, u32 val)
@@ -86,6 +87,12 @@ int meson_canvas_config(struct meson_canvas *canvas, u8 canvas_index,
 {
 	unsigned long flags;
 
+	if (endian && !canvas->supports_endianness) {
+		dev_err(canvas->dev,
+			"Endianness is not supported on this SoC\n");
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&canvas->lock, flags);
 	if (!canvas->used[canvas_index]) {
 		dev_err(canvas->dev,
@@ -172,6 +179,8 @@ static int meson_canvas_probe(struct platform_device *pdev)
 	if (IS_ERR(canvas->reg_base))
 		return PTR_ERR(canvas->reg_base);
 
+	canvas->supports_endianness = of_device_get_match_data(dev);
+
 	canvas->dev = dev;
 	spin_lock_init(&canvas->lock);
 	dev_set_drvdata(dev, canvas);
@@ -180,7 +189,10 @@ static int meson_canvas_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id canvas_dt_match[] = {
-	{ .compatible = "amlogic,canvas" },
+	{ .compatible = "amlogic,meson8-canvas", .data = (void *)false, },
+	{ .compatible = "amlogic,meson8b-canvas", .data = (void *)false, },
+	{ .compatible = "amlogic,meson8m2-canvas", .data = (void *)false, },
+	{ .compatible = "amlogic,canvas", .data = (void *)true, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, canvas_dt_match);
-- 
2.21.0
