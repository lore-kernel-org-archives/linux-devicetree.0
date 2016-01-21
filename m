From: Loc Ho <lho@apm.com>
Subject: [PATCH v4 2/2] acpi: apei: Enable APEI multiple GHES source to share an single external IRQ
Date: Wed, 20 Jan 2016 17:17:39 -0700
Message-ID: <1453335459-3617-3-git-send-email-lho@apm.com>
References: <1453335459-3617-1-git-send-email-lho@apm.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1453335459-3617-1-git-send-email-lho@apm.com>
Sender: linux-acpi-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, mchehab@osg.samsung.com, tomasz.nowicki@linaro.org, fu.wei@linaro.org, rjw@rjwysocki.net, lenb@kernel.org
Cc: linux-edac@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, patches@apm.com, Loc Ho <lho@apm.com>, Tuan Phan <tphan@apm.com>
List-Id: devicetree@vger.kernel.org

This patch allows APEI generic error source table with external
IRQ to share an single IRQ.

Signed-off-by: Tuan Phan <tphan@apm.com>
Signed-off-by: Loc Ho <lho@apm.com>
---
 drivers/acpi/apei/ghes.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 3dd9c46..76146c8 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -1011,7 +1011,8 @@ static int ghes_probe(struct platform_device *ghes_dev)
 			       generic->header.source_id);
 			goto err_edac_unreg;
 		}
-		rc = request_irq(ghes->irq, ghes_irq_func, 0, "GHES IRQ", ghes);
+		rc = request_irq(ghes->irq, ghes_irq_func, IRQF_SHARED,
+				 "GHES IRQ", ghes);
 		if (rc) {
 			pr_err(GHES_PFX "Failed to register IRQ for generic hardware error source: %d\n",
 			       generic->header.source_id);
-- 
1.7.1

