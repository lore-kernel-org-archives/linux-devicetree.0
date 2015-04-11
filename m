From: Andrew Andrianov <andrew@ncrmnt.org>
Subject: [PATCH 1/2] pinctrl: mvebu: Fix mapping of pin 63 (gpo -> gpio)
Date: Sat, 11 Apr 2015 23:29:19 +0300
Message-ID: <1428784160-19431-2-git-send-email-andrew@ncrmnt.org>
References: <1428784160-19431-1-git-send-email-andrew@ncrmnt.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428784160-19431-1-git-send-email-andrew@ncrmnt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org
Cc: Andrew Andrianov <andrew@ncrmnt.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Andrianov <andrew@ncrmnt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-370.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-370.c b/drivers/pinctrl/mvebu/pinctrl-armada-370.c
index c4f51d0..78c332d 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-370.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-370.c
@@ -364,7 +364,7 @@ static struct mvebu_mpp_mode mv88f6710_mpp_modes[] = {
 	   MPP_FUNCTION(0x5, "audio", "mclk"),
 	   MPP_FUNCTION(0x6, "uart0", "cts")),
 	MPP_MODE(63,
-	   MPP_FUNCTION(0x0, "gpo", NULL),
+	   MPP_FUNCTION(0x0, "gpio", NULL),
 	   MPP_FUNCTION(0x1, "spi0", "sck"),
 	   MPP_FUNCTION(0x2, "tclk", NULL)),
 	MPP_MODE(64,
-- 
1.7.10.4
