From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v5 6/7] DTS: Bindings: pca953x add an optional vcc-supply property
Date: Sat, 28 Apr 2018 18:31:36 +0200
Message-ID: <de4bade4236415f62088d68cd5fcd6fb7b67e020.1524933096.git.hns@goldelico.com>
References: <cover.1524933096.git.hns@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1524933096.git.hns@goldelico.com>
In-Reply-To: <cover.1524933096.git.hns@goldelico.com>
References: <cover.1524933096.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: galak@codeaurora.org, andy.shevchenko@gmail.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com, "H. Nikolaus Schaller" <hns@goldelico.com>
List-Id: devicetree@vger.kernel.org

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
