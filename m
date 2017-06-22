From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH 3/3] iio: adc: mt7622: Add compatible node for mt7622.
Date: Thu, 22 Jun 2017 13:44:34 +0800
Message-ID: <1498110274-18678-4-git-send-email-zhiyong.tao@mediatek.com>
References: <1498110274-18678-1-git-send-email-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498110274-18678-1-git-send-email-zhiyong.tao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: srv_heupstream@mediatek.com, liguo.zhang@mediatek.com, yingjoe.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org, Zhiyong Tao <zhiyong.tao@mediatek.com>
List-Id: devicetree@vger.kernel.org

This commit adds mt7622 compatible node.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/iio/adc/mt6577_auxadc.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
index 2dd7c74..4a2cd9e 100644
--- a/drivers/iio/adc/mt6577_auxadc.c
+++ b/drivers/iio/adc/mt6577_auxadc.c
@@ -308,6 +308,7 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
 static const struct of_device_id mt6577_auxadc_of_match[] = {
 	{ .compatible = "mediatek,mt2701-auxadc", },
 	{ .compatible = "mediatek,mt8173-auxadc", },
+	{ .compatible = "mediatek,mt7622-auxadc", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mt6577_auxadc_of_match);
-- 
1.7.9.5
