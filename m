From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 03/12] irqchip: mtk-sysirq: prevent unnecessary visibility when set_type
Date: Sun, 19 Mar 2017 23:26:24 +0800
Message-ID: <1489937193-2953-4-git-send-email-mars.cheng@mediatek.com>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489937193-2953-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Chou <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This prevent unnecessary visibility when configuring trigger type

Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/irqchip/irq-mtk-sysirq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 9ba969c..eeac512 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -57,7 +57,7 @@ static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
 		value &= ~(1 << offset);
 	}
 
-	writel(value, base + reg_index * 4);
+	writel_relaxed(value, base + reg_index * 4);
 
 	data = data->parent_data;
 	ret = data->chip->irq_set_type(data, type);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
