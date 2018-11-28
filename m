Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38449 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbeK1Uzk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 28 Nov 2018 15:55:40 -0500
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 07/12] mailbox: tegra-hsp: Use device-managed registration API
Date: Wed, 28 Nov 2018 10:54:16 +0100
Message-Id: <20181128095421.20573-8-thierry.reding@gmail.com>
In-Reply-To: <20181128095421.20573-1-thierry.reding@gmail.com>
References: <20181128095421.20573-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, Pekka Pessi <ppessi@nvidia.com>, Mika Liljeberg <mliljeberg@nvidia.com>, linux-tegra@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

In order to get rid of a lot of cleanup boilerplate code, use the
device-managed registration API.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/mailbox/tegra-hsp.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 9628e52e2371..e443f6a2ec4b 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -721,7 +721,7 @@ static int tegra_hsp_probe(struct platform_device *pdev)
 		}
 	}
 
-	err = mbox_controller_register(&hsp->mbox_db);
+	err = devm_mbox_controller_register(&pdev->dev, &hsp->mbox_db);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register doorbell mailbox: %d\n",
 			err);
@@ -745,15 +745,15 @@ static int tegra_hsp_probe(struct platform_device *pdev)
 		if (err < 0) {
 			dev_err(&pdev->dev, "failed to add mailboxes: %d\n",
 			        err);
-			goto unregister_mbox_db;
+			return err;
 		}
 	}
 
-	err = mbox_controller_register(&hsp->mbox_sm);
+	err = devm_mbox_controller_register(&pdev->dev, &hsp->mbox_sm);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register shared mailbox: %d\n",
 			err);
-		goto unregister_mbox_db;
+		return err;
 	}
 
 	platform_set_drvdata(pdev, hsp);
@@ -766,33 +766,16 @@ static int tegra_hsp_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 			        "failed to request doorbell IRQ#%u: %d\n",
 				hsp->doorbell_irq, err);
-			goto unregister_mbox_sm;
+			return err;
 		}
 	}
 
 	if (hsp->shared_irqs) {
 		err = tegra_hsp_request_shared_irq(hsp);
 		if (err < 0)
-			goto unregister_mbox_sm;
+			return err;
 	}
 
-	return 0;
-
-unregister_mbox_sm:
-	mbox_controller_unregister(&hsp->mbox_sm);
-unregister_mbox_db:
-	mbox_controller_unregister(&hsp->mbox_db);
-
-	return err;
-}
-
-static int tegra_hsp_remove(struct platform_device *pdev)
-{
-	struct tegra_hsp *hsp = platform_get_drvdata(pdev);
-
-	mbox_controller_unregister(&hsp->mbox_sm);
-	mbox_controller_unregister(&hsp->mbox_db);
-
 	return 0;
 }
 
@@ -842,7 +825,6 @@ static struct platform_driver tegra_hsp_driver = {
 		.pm = &tegra_hsp_pm_ops,
 	},
 	.probe = tegra_hsp_probe,
-	.remove = tegra_hsp_remove,
 };
 
 static int __init tegra_hsp_init(void)
-- 
2.19.1
