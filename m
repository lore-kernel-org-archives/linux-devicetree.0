From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 10/15] tpm/tpm_i2c_stm_st33: Few code cleanup
Date: Mon, 13 Oct 2014 22:19:35 +0200
Message-ID: <1413231580-4970-12-git-send-email-christophe-h.ricard@st.com>
References: <1413231580-4970-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413231580-4970-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Cleanup code indentation, braces, test variable when NULL.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 6980708..cc5aef3 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -27,7 +27,7 @@
  *
  * @Synopsis:
  *	09/15/2010:	First shot driver tpm_tis driver for
-			 lpc is used as model.
+ *			 lpc is used as model.
  */
 
 #include <linux/pci.h>
@@ -396,7 +396,7 @@ static int wait_for_stat(struct tpm_chip *chip, u8 mask, unsigned long timeout,
 	long r;
 	u8 status;
 
-	 if (chip->vendor.irq) {
+	if (chip->vendor.irq) {
 		r = wait_for_serirq_timeout(chip, ((tpm_stm_i2c_status
 							(chip) & mask) ==
 						       mask), timeout);
@@ -432,8 +432,7 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 	       wait_for_stat(chip,
 			     TPM_STS_DATA_AVAIL | TPM_STS_VALID,
 			     chip->vendor.timeout_c,
-			     &chip->vendor.read_queue)
-	       == 0) {
+			     &chip->vendor.read_queue) == 0) {
 		burstcnt = get_burstcount(chip);
 		if (burstcnt < 0)
 			return burstcnt;
@@ -485,7 +484,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 	struct i2c_client *client;
 	struct tpm_stm_dev *tpm_dev;
 
-	if (chip == NULL)
+	if (!chip)
 		return -EBUSY;
 	if (len < TPM_HEADER_SIZE)
 		return -EBUSY;
@@ -562,7 +561,7 @@ static int tpm_stm_i2c_recv(struct tpm_chip *chip, unsigned char *buf,
 	int size = 0;
 	int expected;
 
-	if (chip == NULL)
+	if (!chip)
 		return -EBUSY;
 
 	if (count < TPM_HEADER_SIZE) {
@@ -583,7 +582,7 @@ static int tpm_stm_i2c_recv(struct tpm_chip *chip, unsigned char *buf,
 	}
 
 	size += recv_data(chip, &buf[TPM_HEADER_SIZE],
-					expected - TPM_HEADER_SIZE);
+			expected - TPM_HEADER_SIZE);
 	if (size < expected) {
 		dev_err(chip->dev, "Unable to read remainder of result\n");
 		size = -ETIME;
@@ -663,7 +662,7 @@ static int tpm_stm_i2c_request_resources(struct i2c_client *client,
 	int r;
 
 	pdata = client->dev.platform_data;
-	if (pdata == NULL) {
+	if (!pdata) {
 		pr_err("No platform data\n");
 		return -EINVAL;
 	}
@@ -695,12 +694,12 @@ static int
 tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	int r;
-	u8 intmask;
+	u8 intmask = 0;
 	struct tpm_chip *chip;
 	struct st33zp24_platform_data *platform_data;
 	struct tpm_stm_dev *tpm_dev;
 
-	if (client == NULL) {
+	if (!client) {
 		pr_info("%s: i2c client is NULL. Device not accessible.\n",
 			__func__);
 		return -ENODEV;
@@ -762,8 +761,7 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 		clear_interruption(tpm_dev);
 		r = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-				tpm_ioserirq_handler,
-				IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+				tpm_ioserirq_handler, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 				"TPM SERIRQ management", chip);
 		if (r < 0) {
 			dev_err(chip->dev , "TPM SERIRQ signals %d not available\n",
@@ -811,7 +809,7 @@ _tpm_clean_answer:
 /*
  * tpm_stm_i2c_remove remove the TPM device
  * @param: client, the i2c_client drescription (TPM I2C description).
-		clear_bit(0, &chip->is_open);
+ *		clear_bit(0, &chip->is_open);
  * @return: 0 in case of success.
  */
 static int tpm_stm_i2c_remove(struct i2c_client *client)
@@ -841,6 +839,7 @@ static int tpm_stm_i2c_pm_suspend(struct device *dev)
 		gpio_set_value(pin_infos->io_lpcpd, 0);
 	else
 		r = tpm_pm_suspend(dev);
+
 	return r;
 } /* tpm_stm_i2c_suspend() */
 
@@ -875,6 +874,7 @@ static const struct i2c_device_id tpm_stm_i2c_id[] = {
 	{TPM_ST33_I2C, 0},
 	{}
 };
+MODULE_DEVICE_TABLE(i2c, tpm_stm_i2c_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id of_st33zp24_i2c_match[] = {
@@ -884,7 +884,6 @@ static const struct of_device_id of_st33zp24_i2c_match[] = {
 MODULE_DEVICE_TABLE(of, of_st33zp24_i2c_match);
 #endif
 
-MODULE_DEVICE_TABLE(i2c, tpm_stm_i2c_id);
 static SIMPLE_DEV_PM_OPS(tpm_stm_i2c_ops, tpm_stm_i2c_pm_suspend,
 	tpm_stm_i2c_pm_resume);
 static struct i2c_driver tpm_stm_i2c_driver = {
@@ -893,7 +892,7 @@ static struct i2c_driver tpm_stm_i2c_driver = {
 		.name = TPM_ST33_I2C,
 		.pm = &tpm_stm_i2c_ops,
 		.of_match_table = of_match_ptr(of_st33zp24_i2c_match),
-		   },
+	},
 	.probe = tpm_stm_i2c_probe,
 	.remove = tpm_stm_i2c_remove,
 	.id_table = tpm_stm_i2c_id
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
