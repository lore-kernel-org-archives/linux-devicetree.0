From: nyushchenko@dev.rtsoft.ru
Subject: [PATCH 04/21] omap-sham: use devm_irq_of_parse_and_map()
Date: Wed,  4 Jun 2014 15:13:04 +0400
Message-ID: <1401880402-30091-5-git-send-email-nyushchenko@dev.rtsoft.ru>
References: <1401880402-30091-1-git-send-email-nyushchenko@dev.rtsoft.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401880402-30091-1-git-send-email-nyushchenko@dev.rtsoft.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, lugovskoy@dev.rtsoft.ru, Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>
List-Id: devicetree@vger.kernel.org

From: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>

This avoids leak of IRQ mapping on error paths, and makes it possible
to use devm_request_irq() without facing unmap-while-handler-installed
issues.

Signed-off-by: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>
---
 drivers/crypto/omap-sham.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 710d863..2975f61 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -1830,8 +1830,8 @@ static int omap_sham_get_res_of(struct omap_sham_dev *dd,
 		goto err;
 	}
 
-	dd->irq = irq_of_parse_and_map(node, 0);
-	if (!dd->irq) {
+	dd->irq = devm_irq_of_parse_and_map(dev, node, 0);
+	if (dd->irq <= 0) {
 		dev_err(dev, "can't translate OF irq value\n");
 		err = -EINVAL;
 		goto err;
-- 
1.7.10.4
