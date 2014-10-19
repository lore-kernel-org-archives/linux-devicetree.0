From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 07/15] tpm/tpm_i2c_stm_st33: Replace tpm_st33_* function with tpm_stm_*
Date: Sun, 19 Oct 2014 23:11:17 +0200
Message-ID: <1413753085-9958-8-git-send-email-christophe-h.ricard@st.com>
References: <1413753085-9958-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413753085-9958-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

For sanity, replace every tpm_st33_* with tpm_stm_*

Reviewed-By: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 50 ++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 4997eff..fdcdf9b 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -225,7 +225,7 @@ static int wait_for_serirq_timeout(struct tpm_chip *chip, bool condition,
 			status = 1;
 	}
 	return status;
-}
+} /* wait_for_serirq_timeout() */
 
 /*
  * tpm_stm_i2c_cancel, cancel is not implemented.
@@ -242,7 +242,7 @@ static void tpm_stm_i2c_cancel(struct tpm_chip *chip)
 	I2C_WRITE_DATA(tpm_dev, TPM_STS, &data, 1);
 	if (chip->vendor.irq)
 		wait_for_serirq_timeout(chip, 1, chip->vendor.timeout_a);
-}	/* tpm_stm_i2c_cancel() */
+} /* tpm_stm_i2c_cancel() */
 
 /*
  * tpm_stm_spi_status return the TPM_STS register
@@ -258,7 +258,7 @@ static u8 tpm_stm_i2c_status(struct tpm_chip *chip)
 
 	I2C_READ_DATA(tpm_dev, TPM_STS, &data, 1);
 	return data;
-}				/* tpm_stm_i2c_status() */
+} /* tpm_stm_i2c_status() */
 
 
 /*
@@ -592,7 +592,7 @@ out:
 	return size;
 }
 
-static bool tpm_st33_i2c_req_canceled(struct tpm_chip *chip, u8 status)
+static bool tpm_stm_i2c_req_canceled(struct tpm_chip *chip, u8 status)
 {
 	return (status == TPM_STS_COMMAND_READY);
 }
@@ -604,7 +604,7 @@ static const struct tpm_class_ops st_i2c_tpm = {
 	.status = tpm_stm_i2c_status,
 	.req_complete_mask = TPM_STS_DATA_AVAIL | TPM_STS_VALID,
 	.req_complete_val = TPM_STS_DATA_AVAIL | TPM_STS_VALID,
-	.req_canceled = tpm_st33_i2c_req_canceled,
+	.req_canceled = tpm_stm_i2c_req_canceled,
 };
 
 static int interrupts;
@@ -616,14 +616,14 @@ module_param(power_mgt, int, 0444);
 MODULE_PARM_DESC(power_mgt, "Power Management");
 
 /*
- * tpm_st33_i2c_probe initialize the TPM device
+ * tpm_stm_i2c_probe initialize the TPM device
  * @param: client, the i2c_client drescription (TPM I2C description).
  * @param: id, the i2c_device_id struct.
  * @return: 0 in case of success.
  *	 -1 in other case.
  */
 static int
-tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
+tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	int r;
 	u8 intmask;
@@ -748,12 +748,12 @@ end:
 }
 
 /*
- * tpm_st33_i2c_remove remove the TPM device
+ * tpm_stm_i2c_remove remove the TPM device
  * @param: client, the i2c_client drescription (TPM I2C description).
 		clear_bit(0, &chip->is_open);
  * @return: 0 in case of success.
  */
-static int tpm_st33_i2c_remove(struct i2c_client *client)
+static int tpm_stm_i2c_remove(struct i2c_client *client)
 {
 	struct tpm_chip *chip =
 		(struct tpm_chip *) i2c_get_clientdata(client);
@@ -766,12 +766,12 @@ static int tpm_st33_i2c_remove(struct i2c_client *client)
 
 #ifdef CONFIG_PM_SLEEP
 /*
- * tpm_st33_i2c_pm_suspend suspend the TPM device
+ * tpm_stm_i2c_pm_suspend suspend the TPM device
  * @param: client, the i2c_client drescription (TPM I2C description).
  * @param: mesg, the power management message.
  * @return: 0 in case of success.
  */
-static int tpm_st33_i2c_pm_suspend(struct device *dev)
+static int tpm_stm_i2c_pm_suspend(struct device *dev)
 {
 	struct st33zp24_platform_data *pin_infos = dev->platform_data;
 	int r = 0;
@@ -781,14 +781,14 @@ static int tpm_st33_i2c_pm_suspend(struct device *dev)
 	else
 		r = tpm_pm_suspend(dev);
 	return r;
-}				/* tpm_st33_i2c_suspend() */
+} /* tpm_stm_i2c_suspend() */
 
 /*
- * tpm_st33_i2c_pm_resume resume the TPM device
+ * tpm_stm_i2c_pm_resume resume the TPM device
  * @param: client, the i2c_client drescription (TPM I2C description).
  * @return: 0 in case of success.
  */
-static int tpm_st33_i2c_pm_resume(struct device *dev)
+static int tpm_stm_i2c_pm_resume(struct device *dev)
 {
 	struct tpm_chip *chip = dev_get_drvdata(dev);
 	struct st33zp24_platform_data *pin_infos = dev->platform_data;
@@ -807,28 +807,28 @@ static int tpm_st33_i2c_pm_resume(struct device *dev)
 			tpm_do_selftest(chip);
 	}
 	return r;
-}				/* tpm_st33_i2c_pm_resume() */
+} /* tpm_stm_i2c_pm_resume() */
 #endif
 
-static const struct i2c_device_id tpm_st33_i2c_id[] = {
+static const struct i2c_device_id tpm_stm_i2c_id[] = {
 	{TPM_ST33_I2C, 0},
 	{}
 };
-MODULE_DEVICE_TABLE(i2c, tpm_st33_i2c_id);
-static SIMPLE_DEV_PM_OPS(tpm_st33_i2c_ops, tpm_st33_i2c_pm_suspend,
-	tpm_st33_i2c_pm_resume);
-static struct i2c_driver tpm_st33_i2c_driver = {
+MODULE_DEVICE_TABLE(i2c, tpm_stm_i2c_id);
+static SIMPLE_DEV_PM_OPS(tpm_stm_i2c_ops, tpm_stm_i2c_pm_suspend,
+	tpm_stm_i2c_pm_resume);
+static struct i2c_driver tpm_stm_i2c_driver = {
 	.driver = {
 		   .owner = THIS_MODULE,
 		   .name = TPM_ST33_I2C,
-		   .pm = &tpm_st33_i2c_ops,
+		   .pm = &tpm_stm_i2c_ops,
 		   },
-	.probe = tpm_st33_i2c_probe,
-	.remove = tpm_st33_i2c_remove,
-	.id_table = tpm_st33_i2c_id
+	.probe = tpm_stm_i2c_probe,
+	.remove = tpm_stm_i2c_remove,
+	.id_table = tpm_stm_i2c_id
 };
 
-module_i2c_driver(tpm_st33_i2c_driver);
+module_i2c_driver(tpm_stm_i2c_driver);
 
 MODULE_AUTHOR("Christophe Ricard (tpmsupport-qxv4g6HH51o@public.gmane.org)");
 MODULE_DESCRIPTION("STM TPM I2C ST33 Driver");
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
