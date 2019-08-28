From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 1/3] scsi: ufs: Introduce vops for resetting device
Date: Wed, 28 Aug 2019 12:17:54 -0700
Message-ID: <20190828191756.24312-2-bjorn.andersson@linaro.org>
References: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <agross@kernel.org>, Bean Huo <beanhuo@micron.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

Some UFS memory devices needs their reset line toggled in order to get
them into a good state for initialization. Provide a new vops to allow
the platform driver to implement this operation.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- None

 drivers/scsi/ufs/ufshcd.c | 6 ++++++
 drivers/scsi/ufs/ufshcd.h | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 219c435d69a7..0fb4bfdd7943 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6235,6 +6235,9 @@ static int ufshcd_reset_and_restore(struct ufs_hba *hba)
 	int retries = MAX_HOST_RESET_RETRIES;
 
 	do {
+		/* Reset the attached device */
+		ufshcd_vops_device_reset(hba);
+
 		err = ufshcd_host_reset_and_restore(hba);
 	} while (err && --retries);
 
@@ -8371,6 +8374,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 		goto exit_gating;
 	}
 
+	/* Reset the attached device */
+	ufshcd_vops_device_reset(hba);
+
 	/* Host controller enable */
 	err = ufshcd_hba_enable(hba);
 	if (err) {
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 9f61550abc7f..c94cfda52829 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -298,6 +298,7 @@ struct ufs_pwr_mode_info {
  * @resume: called during host controller PM callback
  * @dbg_register_dump: used to dump controller debug information
  * @phy_initialization: used to initialize phys
+ * @device_reset: called to issue a reset pulse on the UFS device
  */
 struct ufs_hba_variant_ops {
 	const char *name;
@@ -326,6 +327,7 @@ struct ufs_hba_variant_ops {
 	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
 	void	(*dbg_register_dump)(struct ufs_hba *hba);
 	int	(*phy_initialization)(struct ufs_hba *);
+	void	(*device_reset)(struct ufs_hba *hba);
 };
 
 /* clock gating state  */
@@ -1070,6 +1072,12 @@ static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
 		hba->vops->dbg_register_dump(hba);
 }
 
+static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
+{
+	if (hba->vops && hba->vops->device_reset)
+		hba->vops->device_reset(hba);
+}
+
 extern struct ufs_pm_lvl_states ufs_pm_lvl_states[];
 
 /*
-- 
2.18.0
