From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v5 8/8] firmware: arm_scpi: add support for legacy SCPI compatible
Date: Wed,  2 Nov 2016 22:52:11 -0600
Message-ID: <1478148731-11712-9-git-send-email-sudeep.holla@arm.com>
References: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds new DT match table to setup the support for legacy SCPI
protocol. It aldo adds "arm,legacy-scpi" to the legacy match entry.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scpi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index 902233642bd3..a38e1537fb8e 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -871,6 +871,11 @@ static int scpi_alloc_xfer_list(struct device *dev, struct scpi_chan *ch)
 	return 0;
 }
 
+static const struct of_device_id legacy_scpi_of_match[] = {
+	{.compatible = "arm,legacy-scpi"},
+	{},
+};
+
 static int scpi_probe(struct platform_device *pdev)
 {
 	int count, idx, ret;
@@ -883,6 +888,9 @@ static int scpi_probe(struct platform_device *pdev)
 	if (!scpi_info)
 		return -ENOMEM;
 
+	if (of_match_device(legacy_scpi_of_match, &pdev->dev))
+		scpi_info->is_legacy = true;
+
 	count = of_count_phandle_with_args(np, "mboxes", "#mbox-cells");
 	if (count < 0) {
 		dev_err(dev, "no mboxes property in '%s'\n", np->full_name);
@@ -984,6 +992,7 @@ static int scpi_probe(struct platform_device *pdev)
 
 static const struct of_device_id scpi_of_match[] = {
 	{.compatible = "arm,scpi"},
+	{.compatible = "arm,legacy-scpi"},
 	{},
 };
 
-- 
1.9.1
