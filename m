From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v6 2/3] gpio: pca953x: define masks for addressing common and extended registers
Date: Wed, 16 May 2018 19:01:25 +0200
Message-ID: <314df7f911fda8f5584cc4384a26074848a2673b.1526490085.git.hns@goldelico.com>
References: <cover.1526490085.git.hns@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1526490085.git.hns@goldelico.com>
In-Reply-To: <cover.1526490085.git.hns@goldelico.com>
References: <cover.1526490085.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: galak@codeaurora.org, andy.shevchenko@gmail.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com, "H. Nikolaus Schaller" <hns@goldelico.com>
List-Id: devicetree@vger.kernel.org

These mask bits are to be used to map the extended register
addreseses (which are defined for an unsupported 8-bit pcal chip)
to 16 and 24 bit chips (pcal6524).

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpio/gpio-pca953x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 2b667166e855..c0eb679e60d4 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -56,6 +56,10 @@
 #define PCAL6524_DEBOUNCE	0x2d
 
 #define PCA_GPIO_MASK		0x00FF
+
+#define PCAL_GPIO_MASK		GENMASK(4, 0)
+#define PCAL_PINCTRL_MASK	(~PCAL_GPIO_MASK)
+
 #define PCA_INT			0x0100
 #define PCA_PCAL		0x0200
 #define PCA_LATCH_INT (PCA_PCAL | PCA_INT)
-- 
2.12.2
