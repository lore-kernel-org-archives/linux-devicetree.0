Return-Path: <mtk10466@mediatek.inc>
From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: Fix build error in Mediatek pinctrl driver.
Date: Wed, 11 Feb 2015 23:56:11 -0800
Message-ID: <1423727771-24112-1-git-send-email-hongzhou.yang@mediatek.com>
In-Reply-To: <yes>
References: <yes>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, Stefan Agner <stefan@agner.ch>, Stephen Warren <swarren@nvidia.com>, Fabio Estevam <fabio.estevam@freescale.com>, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Martin Fuzzey <mfuzzey@parkeon.com>, Kiran Padwal <kiran.padwal21@gmail.com>, Thierry Reding <treding@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, dandan.he@mediatek.com, yingjoe.chen@mediatek.com, alan.cheng@mediatek.com, eddie.huang@mediatek.com
List-ID: <devicetree@vger.kernel.org>

Since pinconf relate API changes in pinctrl devel branch, a build error happened.
Send this small patch to fix it.

---
Due to pinconf_generic_parse_dt_config() API changes in pinctrl devel branch,
add one parameter to fix build error.

Also fix warning:
drivers/pinctrl/mediatek/pinctrl-mtk-common.c:718:3: warning: too many arguments for format [-Wformat-extra-args]
      dev_err(&pdev->dev, "only support pins-are-numbered format\n", ret);
      ^

by removing extra parameter when calling dev_err in mtk_pctrl_init.

Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 5d680c8..63df62b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -391,7 +391,8 @@ static int mtk_pctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
-	err = pinconf_generic_parse_dt_config(node, &configs, &num_configs);
+	err = pinconf_generic_parse_dt_config(node, pctldev, &configs,
+		&num_configs);
 	if (num_configs)
 		has_config = 1;
 
@@ -715,7 +716,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 
 	prop = of_find_property(np, "pins-are-numbered", NULL);
 	if (!prop) {
-		dev_err(&pdev->dev, "only support pins-are-numbered format\n", ret);
+		dev_err(&pdev->dev, "only support pins-are-numbered format\n");
 		return -EINVAL;
 	}
 
-- 
1.7.9.5
