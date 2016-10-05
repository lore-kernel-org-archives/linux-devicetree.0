From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RESEND PATCH v2 1/3] reset: oxnas: Add OX820 support
Date: Wed,  5 Oct 2016 17:27:08 +0200
Message-ID: <20161005152710.2898-2-narmstrong@baylibre.com>
References: <20161005152710.2898-1-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161005152710.2898-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-oxnas@lists.tuxfamily.org, Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In order to support the Oxford Semiconductor OX820 SoC, add a new
compatible string.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/reset/reset-oxnas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-oxnas.c b/drivers/reset/reset-oxnas.c
index 9449805..0d9036d 100644
--- a/drivers/reset/reset-oxnas.c
+++ b/drivers/reset/reset-oxnas.c
@@ -80,6 +80,7 @@ static const struct reset_control_ops oxnas_reset_ops = {
 
 static const struct of_device_id oxnas_reset_dt_ids[] = {
 	 { .compatible = "oxsemi,ox810se-reset", },
+	 { .compatible = "oxsemi,ox820-reset", },
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, oxnas_reset_dt_ids);
-- 
2.7.0
