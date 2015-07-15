From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4] media: am437x-vpfe: Fix a race condition during release
Date: Wed, 15 Jul 2015 16:00:06 -0500
Message-ID: <1436994006-10120-1-git-send-email-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There was a race condition where during cleanup/release operation
on-going streaming would cause a kernel panic because the hardware
module was disabled prematurely with IRQ still pending.

Fixes: 417d2e507edc ("[media] media: platform: add VPFE capture driver support for AM437X")
Cc: <stable@vger.kernel.org> # v4.0+
Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
Changes since v3:
- fix review comment to protect v4l2_fh_is_singular_file()

 drivers/media/platform/am437x/am437x-vpfe.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index a30cc2f7e4f1..5ab50c6babe2 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -1185,14 +1185,24 @@ static int vpfe_initialize_device(struct vpfe_device *vpfe)
 static int vpfe_release(struct file *file)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
+	bool fh_singular;
 	int ret;
 
 	mutex_lock(&vpfe->lock);
 
-	if (v4l2_fh_is_singular_file(file))
-		vpfe_ccdc_close(&vpfe->ccdc, vpfe->pdev);
+	/* Save the singular status before we call the clean-up helper */
+	fh_singular = v4l2_fh_is_singular_file(file);
+
+	/* the release helper will cleanup any on-going streaming */
 	ret = _vb2_fop_release(file, NULL);
 
+	/*
+	 * If this was the last open file.
+	 * Then de-initialize hw module.
+	 */
+	if (fh_singular)
+		vpfe_ccdc_close(&vpfe->ccdc, vpfe->pdev);
+
 	mutex_unlock(&vpfe->lock);
 
 	return ret;
-- 
1.8.5.1
