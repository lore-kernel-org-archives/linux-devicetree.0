From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: [PATCH v2 08/11] mfd: mediatek: Add GPIO sub module support into mfd.
Date: Mon, 18 May 2015 23:11:19 -0700
Message-ID: <1432015882-8646-9-git-send-email-hongzhou.yang@mediatek.com>
References: <1432015882-8646-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432015882-8646-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, dandan.he@mediatek.com, eddie.huang@mediatek.com
List-Id: devicetree@vger.kernel.org

Register pinctrl subnode into 6397 mfd cell.

Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 drivers/mfd/mt6397-core.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 09bc780..012c620 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -34,6 +34,9 @@ static const struct mfd_cell mt6397_devs[] = {
 	}, {
 		.name = "mt6397-clk",
 		.of_compatible = "mediatek,mt6397-clk",
+	}, {
+		.name = "mediatek-mt6397-pinctrl",
+		.of_compatible = "mediatek,mt6397-pinctrl",
 	},
 };
 
-- 
1.7.9.5
