From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v9 2/7] mailbox: qcom: Populate APCS child platform devices
Date: Thu, 21 Sep 2017 19:49:35 +0300
Message-ID: <20170921164940.20343-3-georgi.djakov@linaro.org>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170921164940.20343-1-georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Register the child platform devices to probe their drivers.

Signed-off-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index ab344bc6fa63..fd9055eacf42 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -98,6 +98,10 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, apcs);
 
+	ret = of_platform_populate(np, NULL, NULL, &pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "failed to populate children\n");
+
 	return 0;
 }
 
@@ -106,6 +110,7 @@ static int qcom_apcs_ipc_remove(struct platform_device *pdev)
 	struct qcom_apcs_ipc *apcs = platform_get_drvdata(pdev);
 
 	mbox_controller_unregister(&apcs->mbox);
+	of_platform_depopulate(&pdev->dev);
 
 	return 0;
 }
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
