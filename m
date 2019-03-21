Return-Path: <SRS0=YV71=RY=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] dt-bindings: gpio: pca953x: Document onnn,cat9554
Date: Thu, 21 Mar 2019 10:21:44 +0100
Message-Id: <20190321092145.14896-2-geert+renesas@glider.be>
In-Reply-To: <20190321092145.14896-1-geert+renesas@glider.be>
References: <20190321092145.14896-1-geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chris Brandt <chris.brandt@renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The ON Semiconductor CAT9554 is a variant of the PCA953x GPIO expander,
with 8 GPIOs and interrupt functionality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Split DT binding doc and driver update in separate patches.
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.17.1
