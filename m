From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/16] tpm/tpm_i2c_stm_st33: Few code cleanup
Date: Tue,  7 Oct 2014 21:44:54 +0200
Message-ID: <1412711101-988-10-git-send-email-christophe-h.ricard@st.com>
References: <1412711101-988-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412711101-988-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Cleanup code indentation, braces, test variable when NULL.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index ac23f0f..cb5a0387 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -399,7 +399,7 @@ static int wait_for_stat(struct tpm_chip *chip, u8 mask, unsigned long timeout,
 	long r;
 	u8 status;
 
-	 if (chip->vendor.irq) {
+	if (chip->vendor.irq) {
 		r = wait_for_serirq_timeout(chip, ((tpm_stm_i2c_status
 							(chip) & mask) ==
 						       mask), timeout);
@@ -435,8 +435,7 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 	       wait_for_stat(chip,
 			     TPM_STS_DATA_AVAIL | TPM_STS_VALID,
 			     chip->vendor.timeout_c,
-			     &chip->vendor.read_queue)
-	       == 0) {
+			     &chip->vendor.read_queue) == 0) {
 		burstcnt = get_burstcount(chip);
 		if (burstcnt < 0)
 			return burstcnt;
@@ -488,7 +487,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 	struct i2c_client *client;
 	struct tpm_stm_dev *tpm_dev;
 
-	if (chip == NULL)
+	if (!chip)
 		return -EBUSY;
 	if (len < TPM_HEADER_SIZE)
 		return -EBUSY;
@@ -565,7 +564,7 @@ static int tpm_stm_i2c_recv(struct tpm_chip *chip, unsigned char *buf,
 	int size = 0;
 	int expected;
 
-	if (chip == NULL)
+	if (!chip)
 		return -EBUSY;
 
 	if (count < TPM_HEADER_SIZE) {
@@ -586,7 +585,7 @@ static int tpm_stm_i2c_recv(struct tpm_chip *chip, unsigned char *buf,
 	}
 
 	size += recv_data(chip, &buf[TPM_HEADER_SIZE],
-					expected - TPM_HEADER_SIZE);
+			expected - TPM_HEADER_SIZE);
 	if (size < expected) {
 		dev_err(chip->dev, "Unable to read remainder of result\n");
 		size = -ETIME;
@@ -684,7 +683,7 @@ static int tpm_stm_i2c_request_resources(struct i2c_client *client,
 	int irq;
 
 	pdata = client->dev.platform_data;
-	if (pdata == NULL) {
+	if (!pdata) {
 		pr_err("No platform data\n");
 		return -EINVAL;
 	}
@@ -735,12 +734,12 @@ static int
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
@@ -802,8 +801,7 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 		clear_interruption(tpm_dev);
 		r = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-				tpm_ioserirq_handler,
-				IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+				tpm_ioserirq_handler, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 				"TPM SERIRQ management", chip);
 		if (r < 0) {
 			dev_err(chip->dev , "TPM SERIRQ signals %d not available\n",
@@ -884,6 +882,7 @@ static int tpm_stm_i2c_pm_suspend(struct device *dev)
 		gpio_set_value(pin_infos->io_lpcpd, 0);
 	else
 		r = tpm_pm_suspend(dev);
+
 	return r;
 } /* tpm_stm_i2c_suspend() */
 
@@ -937,7 +936,7 @@ static struct i2c_driver tpm_stm_i2c_driver = {
 		#ifdef CONFIG_OF
 			.of_match_table = of_match_ptr(of_st33zp24_i2c_match),
 		#endif
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
