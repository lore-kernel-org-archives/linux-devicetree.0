Return-Path: <SRS0=p57L=RX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:56696 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbfCTKgE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Mar 2019 06:36:04 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: pca953x: Add support for CAT9554
Date: Wed, 20 Mar 2019 11:36:00 +0100
Message-Id: <20190320103600.20875-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The ON Semiconductor CAT9554 is a variant of the PCA953x GPIO expander,
with 8 GPIOs and interrupt functionality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 drivers/gpio/gpio-pca953x.c                             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index fb144e2b65226601..8678df2a5713a9af 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -30,6 +30,7 @@ Required properties:
 	ti,tca6424
 	ti,tca9539
 	ti,tca9554
+	onnn,cat9554
 	onnn,pca9654
 	exar,xra1202
  - gpio-controller: if used as gpio expander.
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 7e76830b33682aa3..88c94d155e218535 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1167,6 +1167,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "ti,tca6416", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "ti,tca6424", .data = OF_953X(24, PCA_INT), },
 
+	{ .compatible = "onnn,cat9554", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "onnn,pca9654", .data = OF_953X( 8, PCA_INT), },
 
 	{ .compatible = "exar,xra1202", .data = OF_953X( 8, 0), },
-- 
2.17.1
