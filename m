From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v4 2/7] gpio: pca953x: add more register definitions for pcal953x
Date: Thu, 26 Apr 2018 19:34:57 +0200
Message-ID: <a4d21a45bc8258ca4adc982e312cec01a69cfb69.1524764101.git.hns@goldelico.com>
References: <cover.1524764101.git.hns@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1524764101.git.hns@goldelico.com>
In-Reply-To: <cover.1524764101.git.hns@goldelico.com>
References: <cover.1524764101.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: galak@codeaurora.org, andy.shevchenko@gmail.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com, "H. Nikolaus Schaller" <hns@goldelico.com>
List-Id: devicetree@vger.kernel.org

PCAL chips ("L" seems to stand for "latched") have additional
registers starting at address 0x40 to control the latches,
interrupt mask, pull-up and pull down etc.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpio/gpio-pca953x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index bd0593afdae3..fecd0e0aba93 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -41,9 +41,13 @@
 #define PCA957X_MSK		0x06
 #define PCA957X_INTS		0x07
 
+#define PCAL953X_OUT_STRENGTH	0x20
 #define PCAL953X_IN_LATCH	0x22
 #define PCAL953X_PULL_EN	0x23
 #define PCAL953X_PULL_SEL	0x24
+#define PCAL953X_INT_MASK	0x25
+#define PCAL953X_INT_STAT	0x26
+#define PCAL953X_OUT_CONF	0x27
 
 #define PCA_GPIO_MASK		0x00FF
 #define PCA_INT			0x0100
-- 
2.12.2
