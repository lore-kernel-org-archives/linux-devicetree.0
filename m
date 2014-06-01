From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] power: ab8500_fg.c:  Cleaning up uninitialized variables
Date: Sun,  1 Jun 2014 22:03:23 +0200
Message-ID: <1401653003-10670-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In this case the wrong variable is used, which has never been initialized.
This will lead to a serious error.

This was largely found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 drivers/power/ab8500_fg.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/ab8500_fg.c b/drivers/power/ab8500_fg.c
index 3cb4178..019e33f 100644
--- a/drivers/power/ab8500_fg.c
+++ b/drivers/power/ab8500_fg.c
@@ -2969,7 +2969,7 @@ static struct device_attribute ab8505_fg_sysfs_psy_attrs[] = {
 
 static int ab8500_fg_sysfs_psy_create_attrs(struct device *dev)
 {
-	unsigned int i, j;
+	unsigned int j;
 	struct power_supply *psy = dev_get_drvdata(dev);
 	struct ab8500_fg *di;
 
@@ -2986,7 +2986,7 @@ static int ab8500_fg_sysfs_psy_create_attrs(struct device *dev)
 sysfs_psy_create_attrs_failed_ab8505:
 	dev_err(dev, "Failed creating sysfs psy attrs for ab8505.\n");
 	while (j--)
-		device_remove_file(dev, &ab8505_fg_sysfs_psy_attrs[i]);
+		device_remove_file(dev, &ab8505_fg_sysfs_psy_attrs[j]);
 
 	return -EIO;
 }
-- 
1.7.10.4
