Return-Path: <SRS0=+3ec=G7=goldelico.com=hns@kernel.org>
From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v3 3/4] DTS: Bindings: pca953x add an optional vcc-supply property
Date: Tue, 10 Apr 2018 18:07:03 +0200
Message-Id: <33bd9f06399356902480a9338319c9c3254c72f3.1523376423.git.hns@goldelico.com>
In-Reply-To: <cover.1523376423.git.hns@goldelico.com>
References: <cover.1523376423.git.hns@goldelico.com>
In-Reply-To: <cover.1523376423.git.hns@goldelico.com>
References: <cover.1523376423.git.hns@goldelico.com>
To: galak@codeaurora.org, andy.shevchenko@gmail.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com, "H. Nikolaus Schaller" <hns@goldelico.com>
List-ID: <devicetree@vger.kernel.org>

Hardware can have a switchable Vcc supply, so let's add it to
the bindings (the current Linux driver code already supports it).

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index d2a937682836..6a7cddb187c1 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -35,6 +35,7 @@ Required properties:
 Optional properties:
  - reset-gpios: GPIO specification for the RESET input. This is an
 		active low signal to the PCA953x.
+ - vcc-supply:	power supply regulator.
 
 Example:
 
-- 
2.12.2
