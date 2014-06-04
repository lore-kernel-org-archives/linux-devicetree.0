From: nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org
Subject: [PATCH 11/21] mfd: use devm_irq_of_parse_and_map() where appropriate
Date: Wed,  4 Jun 2014 15:13:11 +0400
Message-ID: <1401880402-30091-12-git-send-email-nyushchenko@dev.rtsoft.ru>
References: <1401880402-30091-1-git-send-email-nyushchenko@dev.rtsoft.ru>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401880402-30091-1-git-send-email-nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lugovskoy-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org, Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>

This avoids leak of IRQ mapping on error paths, and makes it possible
to use devm_request_irq() without facing unmap-while-handler-installed
issues.

Signed-off-by: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
---
 drivers/mfd/max8997.c |    4 +++-
 drivers/mfd/max8998.c |    4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 8cf7a01..6ae0786 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -153,7 +153,9 @@ static struct max8997_platform_data *max8997_i2c_parse_dt_pdata(
 		return ERR_PTR(-ENOMEM);
 	}
 
-	pd->ono = irq_of_parse_and_map(dev->of_node, 1);
+	pd->ono = devm_irq_of_parse_and_map(dev, dev->of_node, 1);
+	if (pd->ono < 0)
+		return ERR_PTR(pd->ono);
 
 	/*
 	 * ToDo: the 'wakeup' member in the platform data is more of a linux
diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index 592db06..6b62dd7 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -159,7 +159,9 @@ static struct max8998_platform_data *max8998_i2c_parse_dt_pdata(
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
 
-	pd->ono = irq_of_parse_and_map(dev->of_node, 1);
+	pd->ono = devm_irq_of_parse_and_map(dev, dev->of_node, 1);
+	if (pd->ono < 0)
+		return ERR_PTR(pd->ono);
 
 	/*
 	 * ToDo: the 'wakeup' member in the platform data is more of a linux
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
