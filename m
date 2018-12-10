From: Priit Laes <plaes@plaes.org>
Subject: [PATCH 8/8] mfd: axp20x: use explicit bit defines
Date: Mon, 10 Dec 2018 20:42:19 +0200
Message-ID: <2098c0aece09761bf975e72eaa75cba92a4e463d.1544466940.git-series.plaes@plaes.org>
References: <cover.4110554ae84987dedb8b58888a8a63d6b7f98c72.1544466940.git-series.plaes@plaes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.4110554ae84987dedb8b58888a8a63d6b7f98c72.1544466940.git-series.plaes@plaes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Olliver Schinagl <oliver@schinagl.nl>, linux-sunxi <linux-sunxi@googlegroups.com>
Cc: Priit Laes <plaes@plaes.org>
List-Id: devicetree@vger.kernel.org

From: Olliver Schinagl <oliver@schinagl.nl>

The AXP20X_OFF define is an actual specific bit, define it as such.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
Signed-off-by: Priit Laes <plaes@plaes.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/axp20x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index c3f3dbd..d183ed8 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -30,7 +30,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
-#define AXP20X_OFF	0x80
+#define AXP20X_OFF	BIT(7)
 
 #define AXP806_REG_ADDR_EXT_ADDR_MASTER_MODE	0
 #define AXP806_REG_ADDR_EXT_ADDR_SLAVE_MODE	BIT(4)
-- 
git-series 0.9.1
