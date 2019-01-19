Return-Path: <SRS0=VDIu=P3=labundy.com=jeff@kernel.org>
From: Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v5 2/2] input: touchscreen: Add support for Azoteq IQS550/572/525
Date: Fri, 18 Jan 2019 21:21:31 -0600
Message-Id: <1547868091-32079-2-git-send-email-jeff@labundy.com>
In-Reply-To: <1547868091-32079-1-git-send-email-jeff@labundy.com>
References: <1547868091-32079-1-git-send-email-jeff@labundy.com>
To: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org, rydberg@bitmath.org, robh+dt@kernel.org, mark.rutland@arm.com, Jeff LaBundy <jeff@labundy.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds support for the Azoteq IQS550/572/525 family of
trackpad/touchscreen controllers.

The driver has been tested with an IQS550EV02 evaluation board. A
demonstration of the driver's capabilities is available here:

https://youtu.be/sRNNx4XZBts

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v5:
  - Demoted the first instance of dev_err in iqs5xx_update_firmware to dev_info
  - Updated the commit message to describe the test setup and provide a link to
    a demonstration of the driver's capabilities

Changes in v4:
  - Replaced 'ret' with 'error' where applicable
  - Made use of packed structures to parse device ID and touch data registers
    as well as firmware records
  - Overhauled iqs5xx_update_firmware to make use of existing helper functions
    and to be robust against erroneous firmware files
  - Refactored and fortified the bootloader steps in iqs5xx_update_firmware by
    allowing additional retries upon failure
  - Optimized register read/write functions and added wrappers for single-byte
    transactions
  - Updated the error handling in iqs5xx_set_state and removed the superfluous
    'disabled' flag
  - General improvements to error messages returned via dev_err

Changes in v3:
  - None

Changes in v2:
  - Rebased on top of updated iqs5xx.txt
  - Refactored the axis configuration logic in iqs5xx_dev_init to adhere to the
    behavior defined in touchscreen.txt

 drivers/input/touchscreen/Kconfig  |   10 +
 drivers/input/touchscreen/Makefile |    1 +
 drivers/input/touchscreen/iqs5xx.c | 1015 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1026 insertions(+)
 create mode 100644 drivers/input/touchscreen/iqs5xx.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index af6027c..3f38c80 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1311,4 +1311,14 @@ config TOUCHSCREEN_ROHM_BU21023
 	  To compile this driver as a module, choose M here: the
 	  module will be called bu21023_ts.

+config TOUCHSCREEN_IQS5XX
+	tristate "Azoteq IQS550/572/525 trackpad/touchscreen controller"
+	depends on I2C
+	help
+	  Say Y to enable support for the Azoteq IQS550/572/525
+	  family of trackpad/touchscreen controllers.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called iqs5xx.
+
 endif
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index fcc7605..084a596 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -110,3 +110,4 @@ obj-$(CONFIG_TOUCHSCREEN_ZFORCE)	+= zforce_ts.o
 obj-$(CONFIG_TOUCHSCREEN_COLIBRI_VF50)	+= colibri-vf50-ts.o
 obj-$(CONFIG_TOUCHSCREEN_ROHM_BU21023)	+= rohm_bu21023.o
 obj-$(CONFIG_TOUCHSCREEN_RASPBERRYPI_FW)	+= raspberrypi-ts.o
+obj-$(CONFIG_TOUCHSCREEN_IQS5XX)	+= iqs5xx.o
diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
new file mode 100644
index 0000000..80d6da1
--- /dev/null
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -0,0 +1,1015 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Azoteq IQS550/572/525 Trackpad/Touchscreen Controller
+ *
+ * Copyright (C) 2018
+ * Author: Jeff LaBundy <jeff@labundy.com>
+ *
+ * Note: these devices require firmware exported from a PC-based configuration
+ * tool made available by the manufacturer. The driver expects the firmware to
+ * be named according to the device (e.g. iqs550.hex for IQS550).
+ *
+ * Link to PC-based configuration tool and data sheet: http://www.azoteq.com/
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <asm/unaligned.h>
+
+#define IQS5XX_NUM_RETRIES	10
+#define IQS5XX_NUM_POINTS	256
+#define IQS5XX_NUM_CONTACTS	5
+#define IQS5XX_WR_BYTES_MAX	2
+
+#define IQS5XX_PROD_NUM_IQS550	40
+#define IQS5XX_PROD_NUM_IQS572	58
+#define IQS5XX_PROD_NUM_IQS525	52
+#define IQS5XX_PROJ_NUM_A000	0
+#define IQS5XX_PROJ_NUM_B000	15
+#define IQS5XX_MAJOR_VER_SPEC	2
+
+#define IQS5XX_RESUME		0x00
+#define IQS5XX_SUSPEND		0x01
+
+#define IQS5XX_SW_INPUT_EVENT	0x10
+#define IQS5XX_SETUP_COMPLETE	0x40
+#define IQS5XX_EVENT_MODE	0x01
+#define IQS5XX_TP_EVENT		0x04
+
+#define IQS5XX_FLIP_X		0x01
+#define IQS5XX_FLIP_Y		0x02
+#define IQS5XX_SWITCH_XY_AXIS	0x04
+
+#define IQS5XX_PROD_NUM		0x0000
+#define IQS5XX_ABS_X		0x0016
+#define IQS5XX_ABS_Y		0x0018
+#define IQS5XX_SYS_CTRL0	0x0431
+#define IQS5XX_SYS_CTRL1	0x0432
+#define IQS5XX_SYS_CFG0		0x058E
+#define IQS5XX_SYS_CFG1		0x058F
+#define IQS5XX_TOTAL_RX		0x063D
+#define IQS5XX_TOTAL_TX		0x063E
+#define IQS5XX_XY_CFG0		0x0669
+#define IQS5XX_X_RES		0x066E
+#define IQS5XX_Y_RES		0x0670
+#define IQS5XX_EXP_VER		0x0677
+#define IQS5XX_CHKSM		0x83C0
+#define IQS5XX_APP		0x8400
+#define IQS5XX_CSTM		0xBE00
+#define IQS5XX_PMAP_END		0xBFFF
+#define IQS5XX_END_COMM		0xEEEE
+
+#define IQS5XX_CHKSM_LEN	(IQS5XX_APP - IQS5XX_CHKSM)
+#define IQS5XX_APP_LEN		(IQS5XX_CSTM - IQS5XX_APP)
+#define IQS5XX_CSTM_LEN		(IQS5XX_PMAP_END + 1 - IQS5XX_CSTM)
+#define IQS5XX_PMAP_LEN		(IQS5XX_PMAP_END + 1 - IQS5XX_CHKSM)
+
+#define IQS5XX_FW_NAME_LEN	11
+#define IQS5XX_REC_HDR_LEN	4
+#define IQS5XX_REC_LEN_MAX	256
+#define IQS5XX_REC_TYPE_DATA	0x00
+#define IQS5XX_REC_TYPE_EOF	0x01
+
+#define IQS5XX_BL_ADDR_MASK	0x40
+#define IQS5XX_BL_CMD_VER	0x00
+#define IQS5XX_BL_CMD_READ	0x01
+#define IQS5XX_BL_CMD_EXEC	0x02
+#define IQS5XX_BL_CMD_CRC	0x03
+#define IQS5XX_BL_BLK_LEN_MAX	64
+#define IQS5XX_BL_ID		0x0200
+#define IQS5XX_BL_CRC_PASS	0x00
+#define IQS5XX_BL_CRC_FAIL	0x01
+#define IQS5XX_BL_ATTEMPTS	3
+
+struct iqs5xx_private {
+	struct i2c_client *client;
+	struct input_dev *input;
+	struct gpio_desc *reset_gpio;
+};
+
+struct iqs5xx_dev_id_info {
+	__be16 prod_num;
+	__be16 proj_num;
+	u8 major_ver;
+	u8 minor_ver;
+	u8 bl_status;
+} __packed;
+
+struct iqs5xx_ihex_rec {
+	char start;
+	char len[2];
+	char addr[4];
+	char type[2];
+	char data[2];
+} __packed;
+
+struct iqs5xx_touch_data {
+	__be16 abs_x;
+	__be16 abs_y;
+	__be16 strength;
+	u8 area;
+} __packed;
+
+static int iqs5xx_read_burst(struct i2c_client *client,
+				u16 reg, u8 *val8, u8 len)
+{
+	__be16 reg_buf = cpu_to_be16(reg);
+	int ret, i;
+	struct i2c_msg msg[] = {
+		{
+			.addr = client->addr,
+			.flags = 0,
+			.len = sizeof(reg_buf),
+			.buf = (u8 *)&reg_buf,
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.len = len,
+			.buf = val8,
+		},
+	};
+
+	/*
+	 * The first addressing attempt outside of a communication window fails
+	 * and must be retried, after which the device clock stretches until it
+	 * is available.
+	 */
+	for (i = 0; i < IQS5XX_NUM_RETRIES; i++) {
+		ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+		if (ret == ARRAY_SIZE(msg))
+			return 0;
+
+		usleep_range(200, 300);
+	}
+
+	if (ret >= 0)
+		ret = -EIO;
+
+	dev_err(&client->dev, "Failed to read from address 0x%04X: %d\n",
+			reg, ret);
+
+	return ret;
+}
+
+static int iqs5xx_read_word(struct i2c_client *client, u16 reg, u16 *val)
+{
+	__be16 val_buf;
+	int error;
+
+	error = iqs5xx_read_burst(client, reg, (u8 *)&val_buf, sizeof(val_buf));
+	if (error)
+		return error;
+
+	*val = be16_to_cpu(val_buf);
+
+	return 0;
+}
+
+static int iqs5xx_read_byte(struct i2c_client *client, u16 reg, u8 *val8)
+{
+	return iqs5xx_read_burst(client, reg, val8, sizeof(*val8));
+}
+
+static int iqs5xx_write_burst(struct i2c_client *client,
+				u16 reg, u8 *val8, u8 len)
+{
+	int ret, i;
+	u8 mlen = sizeof(reg) + len;
+	u8 mbuf[sizeof(reg) + IQS5XX_WR_BYTES_MAX];
+
+	if (len > IQS5XX_WR_BYTES_MAX)
+		return -EINVAL;
+
+	put_unaligned_be16(reg, mbuf);
+	memcpy(mbuf + sizeof(reg), val8, len);
+
+	/*
+	 * The first addressing attempt outside of a communication window fails
+	 * and must be retried, after which the device clock stretches until it
+	 * is available.
+	 */
+	for (i = 0; i < IQS5XX_NUM_RETRIES; i++) {
+		ret = i2c_master_send(client, (char *)mbuf, mlen);
+		if (ret == mlen)
+			return 0;
+
+		usleep_range(200, 300);
+	}
+
+	if (ret >= 0)
+		ret = -EIO;
+
+	dev_err(&client->dev, "Failed to write to address 0x%04X: %d\n",
+			reg, ret);
+
+	return ret;
+}
+
+static int iqs5xx_write_word(struct i2c_client *client, u16 reg, u16 val)
+{
+	__be16 val_buf = cpu_to_be16(val);
+
+	return iqs5xx_write_burst(client, reg, (u8 *)&val_buf, sizeof(val_buf));
+}
+
+static int iqs5xx_write_byte(struct i2c_client *client, u16 reg, u8 val8)
+{
+	return iqs5xx_write_burst(client, reg, &val8, sizeof(val8));
+}
+
+static void iqs5xx_reset(struct i2c_client *client)
+{
+	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
+
+	gpiod_set_value_cansleep(iqs5xx->reset_gpio, 0);
+	usleep_range(200, 300);
+
+	gpiod_set_value_cansleep(iqs5xx->reset_gpio, 1);
+}
+
+static int iqs5xx_bl_cmd(struct i2c_client *client, u8 bl_cmd, u16 bl_addr)
+{
+	struct i2c_msg msg;
+	int ret;
+	u8 mbuf[sizeof(bl_cmd) + sizeof(bl_addr)];
+
+	msg.addr = client->addr ^ IQS5XX_BL_ADDR_MASK;
+	msg.flags = 0;
+	msg.len = sizeof(bl_cmd);
+	msg.buf = mbuf;
+
+	*mbuf = bl_cmd;
+
+	switch (bl_cmd) {
+	case IQS5XX_BL_CMD_VER:
+	case IQS5XX_BL_CMD_CRC:
+	case IQS5XX_BL_CMD_EXEC:
+		break;
+	case IQS5XX_BL_CMD_READ:
+		msg.len += sizeof(bl_addr);
+		put_unaligned_be16(bl_addr, mbuf + sizeof(bl_cmd));
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret != 1)
+		goto msg_fail;
+
+	switch (bl_cmd) {
+	case IQS5XX_BL_CMD_VER:
+		msg.len = sizeof(u16);
+		break;
+	case IQS5XX_BL_CMD_CRC:
+		msg.len = sizeof(u8);
+		/*
+		 * This delay saves the bus controller the trouble of having to
+		 * tolerate a relatively long clock-stretching period while the
+		 * CRC is calculated.
+		 */
+		msleep(50);
+		break;
+	case IQS5XX_BL_CMD_EXEC:
+		usleep_range(10000, 10100);
+		/* intentionally fall through */
+	default:
+		return 0;
+	}
+
+	msg.flags = I2C_M_RD;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret != 1)
+		goto msg_fail;
+
+	if (bl_cmd == IQS5XX_BL_CMD_VER
+			&& get_unaligned_be16(mbuf) != IQS5XX_BL_ID) {
+		dev_err(&client->dev, "Unexpected bootloader ID: 0x%04X\n",
+				get_unaligned_be16(mbuf));
+		return -EINVAL;
+	}
+
+	if (bl_cmd == IQS5XX_BL_CMD_CRC && *mbuf != IQS5XX_BL_CRC_PASS) {
+		dev_err(&client->dev, "Bootloader CRC failed\n");
+		return -EIO;
+	}
+
+	return 0;
+
+msg_fail:
+	if (ret >= 0)
+		ret = -EIO;
+
+	if (bl_cmd != IQS5XX_BL_CMD_VER)
+		dev_err(&client->dev,
+				"Unsuccessful bootloader command 0x%02X: %d\n",
+				bl_cmd, ret);
+
+	return ret;
+}
+
+static int iqs5xx_bl_write(struct i2c_client *client,
+				u16 bl_addr, u8 *pmap_data, u16 pmap_len)
+{
+	struct i2c_msg msg;
+	int ret, i;
+	u8 mbuf[sizeof(bl_addr) + IQS5XX_BL_BLK_LEN_MAX];
+
+	if (pmap_len % IQS5XX_BL_BLK_LEN_MAX)
+		return -EINVAL;
+
+	msg.addr = client->addr ^ IQS5XX_BL_ADDR_MASK;
+	msg.flags = 0;
+	msg.len = ARRAY_SIZE(mbuf);
+	msg.buf = mbuf;
+
+	for (i = 0; i < pmap_len; i += IQS5XX_BL_BLK_LEN_MAX) {
+		put_unaligned_be16(bl_addr + i, mbuf);
+		memcpy(mbuf + sizeof(bl_addr),
+				pmap_data + i, IQS5XX_BL_BLK_LEN_MAX);
+
+		ret = i2c_transfer(client->adapter, &msg, 1);
+		if (ret != 1)
+			goto msg_fail;
+
+		usleep_range(10000, 10100);
+	}
+
+	return 0;
+
+msg_fail:
+	if (ret >= 0)
+		ret = -EIO;
+
+	dev_err(&client->dev, "Failed to write block at address 0x%04X: %d\n",
+			bl_addr + i, ret);
+
+	return ret;
+}
+
+static int iqs5xx_bl_verify(struct i2c_client *client,
+				u16 bl_addr, u8 *pmap_data, u16 pmap_len)
+{
+	struct i2c_msg msg;
+	int ret, i;
+	u8 bl_data[IQS5XX_BL_BLK_LEN_MAX];
+
+	if (pmap_len % IQS5XX_BL_BLK_LEN_MAX)
+		return -EINVAL;
+
+	msg.addr = client->addr ^ IQS5XX_BL_ADDR_MASK;
+	msg.flags = I2C_M_RD;
+	msg.len = IQS5XX_BL_BLK_LEN_MAX;
+	msg.buf = bl_data;
+
+	for (i = 0; i < pmap_len; i += IQS5XX_BL_BLK_LEN_MAX) {
+		ret = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_READ, bl_addr + i);
+		if (ret)
+			return ret;
+
+		ret = i2c_transfer(client->adapter, &msg, 1);
+		if (ret != 1)
+			goto msg_fail;
+
+		if (memcmp(bl_data, pmap_data + i, IQS5XX_BL_BLK_LEN_MAX)) {
+			dev_err(&client->dev,
+				"Failed to verify block at address 0x%04X\n",
+				bl_addr + i);
+			return -EIO;
+		}
+	}
+
+	return 0;
+
+msg_fail:
+	if (ret >= 0)
+		ret = -EIO;
+
+	dev_err(&client->dev, "Failed to read block at address 0x%04X: %d\n",
+			bl_addr + i, ret);
+
+	return ret;
+}
+
+static int iqs5xx_update_firmware(struct i2c_client *client)
+{
+	struct iqs5xx_ihex_rec *rec;
+	const struct firmware *fw;
+	char fw_name[IQS5XX_FW_NAME_LEN];
+	int error, i, j;
+	u32 pos = 0;
+	u16 rec_num = 1;
+	u16 rec_addr;
+	u8 rec_len, rec_type, rec_chksm, chksm;
+	u8 rec_hdr[IQS5XX_REC_HDR_LEN];
+	u8 rec_data[IQS5XX_REC_LEN_MAX];
+	u8 *pmap = kzalloc(IQS5XX_PMAP_LEN, GFP_KERNEL);
+
+	if (!pmap)
+		return -ENOMEM;
+
+	snprintf(fw_name, ARRAY_SIZE(fw_name), "%s.hex", client->name);
+	dev_info(&client->dev, "Updating device from firmware %s...\n",
+			fw_name);
+
+	error = request_firmware(&fw, fw_name, &client->dev);
+	if (error) {
+		dev_err(&client->dev, "Failed to request firmware %s: %d\n",
+				fw_name, error);
+		goto err_kfree;
+	}
+
+	do {
+		if (pos + sizeof(*rec) > fw->size) {
+			dev_err(&client->dev, "Insufficient firmware size\n");
+			error = -EINVAL;
+			goto err_rls_fw;
+		}
+		rec = (struct iqs5xx_ihex_rec *)(fw->data + pos);
+		pos += sizeof(*rec);
+
+		if (rec->start != ':') {
+			dev_err(&client->dev, "Invalid start at record %u\n",
+					rec_num);
+			error = -EINVAL;
+			goto err_rls_fw;
+		}
+
+		error = hex2bin(rec_hdr, rec->len, ARRAY_SIZE(rec_hdr));
+		if (error) {
+			dev_err(&client->dev, "Invalid header at record %u\n",
+					rec_num);
+			goto err_rls_fw;
+		}
+
+		rec_len = *rec_hdr;
+		rec_addr = get_unaligned_be16(rec_hdr + sizeof(rec_len));
+		rec_type = *(rec_hdr + sizeof(rec_len) + sizeof(rec_addr));
+
+		if (pos + rec_len * 2 > fw->size) {
+			dev_err(&client->dev, "Insufficient firmware size\n");
+			error = -EINVAL;
+			goto err_rls_fw;
+		}
+		pos += (rec_len * 2);
+
+		error = hex2bin(rec_data, rec->data, rec_len);
+		if (error) {
+			dev_err(&client->dev, "Invalid data at record %u\n",
+					rec_num);
+			goto err_rls_fw;
+		}
+
+		error = hex2bin(&rec_chksm, rec->data + rec_len * 2, 1);
+		if (error) {
+			dev_err(&client->dev, "Invalid checksum at record %u\n",
+					rec_num);
+			goto err_rls_fw;
+		}
+
+		chksm = 0;
+		for (i = 0; i < ARRAY_SIZE(rec_hdr); i++)
+			chksm += rec_hdr[i];
+		for (i = 0; i < rec_len; i++)
+			chksm += rec_data[i];
+		chksm = ~chksm + 1;
+
+		/*
+		 * The checksum field for records corresponding to user-exported
+		 * settings does not appear to be recalculated when the firmware
+		 * is exported, so skip checksum verification for that region.
+		 */
+		if (chksm != rec_chksm && rec_addr < IQS5XX_CSTM) {
+			dev_err(&client->dev,
+					"Incorrect checksum at record %u\n",
+					rec_num);
+			error = -EINVAL;
+			goto err_rls_fw;
+		}
+
+		switch (rec_type) {
+		case IQS5XX_REC_TYPE_DATA:
+			if (rec_addr < IQS5XX_CHKSM
+					|| rec_addr > IQS5XX_PMAP_END) {
+				dev_err(&client->dev,
+					"Invalid address at record %u\n",
+					rec_num);
+				error = -EINVAL;
+				goto err_rls_fw;
+			}
+			memcpy(pmap + rec_addr - IQS5XX_CHKSM,
+					rec_data, rec_len);
+			break;
+		case IQS5XX_REC_TYPE_EOF:
+			break;
+		default:
+			dev_err(&client->dev, "Invalid type at record %u\n",
+					rec_num);
+			error = -EINVAL;
+			goto err_rls_fw;
+		}
+
+		rec_num++;
+		while (pos < fw->size) {
+			if (*(fw->data + pos) == ':')
+				break;
+			pos++;
+		}
+	} while (rec_type != IQS5XX_REC_TYPE_EOF);
+
+	/*
+	 * The device opens a bootloader polling window for 2 ms following the
+	 * release of reset. If the host cannot establish communication during
+	 * this time frame, it must cycle reset again.
+	 */
+	for (i = 0; i < IQS5XX_BL_ATTEMPTS; i++) {
+		iqs5xx_reset(client);
+
+		for (j = 0; j < IQS5XX_NUM_RETRIES; j++) {
+			error = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_VER, 0);
+			if (error == -EINVAL || !error)
+				break;
+		}
+
+		if (error == -EINVAL)
+			continue;
+
+		if (j == IQS5XX_NUM_RETRIES) {
+			dev_err(&client->dev,
+					"Failed to enter bootloader: %d\n",
+					error);
+			continue;
+		}
+
+		error = iqs5xx_bl_write(client, IQS5XX_CHKSM,
+				pmap, IQS5XX_PMAP_LEN);
+		if (error)
+			continue;
+
+		error = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_CRC, 0);
+		if (error)
+			continue;
+
+		error = iqs5xx_bl_verify(client, IQS5XX_CSTM,
+				pmap + IQS5XX_CHKSM_LEN + IQS5XX_APP_LEN,
+				IQS5XX_CSTM_LEN);
+		if (error)
+			continue;
+
+		error = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_EXEC, 0);
+		if (!error)
+			goto err_rls_fw;
+	}
+
+	dev_err(&client->dev, "Aborting update after %d attempts\n", i);
+
+err_rls_fw:
+	release_firmware(fw);
+
+err_kfree:
+	kfree(pmap);
+
+	return error;
+}
+
+static int iqs5xx_dev_id(struct i2c_client *client, __be16 exp_ver_spec)
+{
+	struct iqs5xx_dev_id_info *dev_id_info;
+	int error;
+	u16 val;
+	u8 buf[sizeof(*dev_id_info) + 1];
+
+	/*
+	 * Failure to read the device's ID registers could represent corrupted
+	 * firmware. In that case, -EAGAIN is returned to prompt the caller to
+	 * enter the bootloader. If the device is truly absent, the bootloader
+	 * is inaccessible and the caller fails as well.
+	 */
+	buf[0] = 0;
+	error = iqs5xx_read_burst(client,
+			IQS5XX_PROD_NUM, &buf[1], sizeof(*dev_id_info));
+	if (error)
+		return -EAGAIN;
+
+	/*
+	 * A000 and B000 devices use 8-bit and 16-bit addressing, respectively.
+	 * Querying an A000 device's version information with 16-bit addressing
+	 * gives the appearance that the data is shifted by one byte; a nonzero
+	 * leading array element suggests this could be the case (in which case
+	 * the missing zero is prepended).
+	 */
+	dev_id_info = (struct iqs5xx_dev_id_info *)&buf[(buf[1] > 0) ? 0 : 1];
+
+	switch (be16_to_cpu(dev_id_info->prod_num)) {
+	case IQS5XX_PROD_NUM_IQS550:
+	case IQS5XX_PROD_NUM_IQS572:
+	case IQS5XX_PROD_NUM_IQS525:
+		break;
+	default:
+		dev_err(&client->dev, "Unrecognized product number: %u\n",
+				be16_to_cpu(dev_id_info->prod_num));
+		return -EINVAL;
+	}
+
+	switch (be16_to_cpu(dev_id_info->proj_num)) {
+	case IQS5XX_PROJ_NUM_A000:
+		dev_err(&client->dev, "Found legacy A000 firmware\n");
+		return -EAGAIN;
+	case IQS5XX_PROJ_NUM_B000:
+		break;
+	default:
+		dev_err(&client->dev, "Unrecognized project number: %u\n",
+				be16_to_cpu(dev_id_info->proj_num));
+		return -EINVAL;
+	}
+
+	if (dev_id_info->major_ver != IQS5XX_MAJOR_VER_SPEC) {
+		dev_err(&client->dev, "Unexpected major version: %u\n",
+				dev_id_info->major_ver);
+		return -EAGAIN;
+	}
+
+	if (be16_to_cpu(exp_ver_spec)) {
+		error = iqs5xx_read_word(client, IQS5XX_EXP_VER, &val);
+		if (error)
+			return error;
+
+		if (val != be16_to_cpu(exp_ver_spec)) {
+			dev_err(&client->dev,
+					"Unexpected export version: %u.%u\n",
+					(val & 0xFF00) >> 8, val & 0x00FF);
+			return -EAGAIN;
+		}
+	}
+
+	return 0;
+}
+
+static int iqs5xx_dev_init(struct i2c_client *client)
+{
+	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
+	struct touchscreen_properties prop;
+	int error;
+	u16 max_x, max_x_hw;
+	u16 max_y, max_y_hw;
+	u8 val8;
+
+	error = iqs5xx_read_byte(client, IQS5XX_TOTAL_RX, &val8);
+	if (error)
+		return error;
+	max_x_hw = (val8 - 1) * IQS5XX_NUM_POINTS;
+
+	error = iqs5xx_read_byte(client, IQS5XX_TOTAL_TX, &val8);
+	if (error)
+		return error;
+	max_y_hw = (val8 - 1) * IQS5XX_NUM_POINTS;
+
+	error = iqs5xx_read_byte(client, IQS5XX_XY_CFG0, &val8);
+	if (error)
+		return error;
+
+	if (val8 & IQS5XX_SWITCH_XY_AXIS)
+		swap(max_x_hw, max_y_hw);
+
+	touchscreen_parse_properties(iqs5xx->input, true, &prop);
+
+	if (prop.swap_x_y)
+		val8 ^= IQS5XX_SWITCH_XY_AXIS;
+
+	if (prop.invert_x)
+		val8 ^= prop.swap_x_y ? IQS5XX_FLIP_Y : IQS5XX_FLIP_X;
+
+	if (prop.invert_y)
+		val8 ^= prop.swap_x_y ? IQS5XX_FLIP_X : IQS5XX_FLIP_Y;
+
+	error = iqs5xx_write_byte(client, IQS5XX_XY_CFG0, val8);
+	if (error)
+		return error;
+
+	if (prop.max_x > max_x_hw) {
+		dev_err(&client->dev, "Invalid maximum x-coordinate: %u > %u\n",
+				prop.max_x, max_x_hw);
+		return -EINVAL;
+	} else if (prop.max_x == 0) {
+		error = iqs5xx_read_word(client, IQS5XX_X_RES, &max_x);
+		if (error)
+			return error;
+
+		input_abs_set_max(iqs5xx->input, prop.swap_x_y ?
+				ABS_MT_POSITION_Y : ABS_MT_POSITION_X, max_x);
+	} else {
+		max_x = (u16)prop.max_x;
+	}
+
+	if (prop.max_y > max_y_hw) {
+		dev_err(&client->dev, "Invalid maximum y-coordinate: %u > %u\n",
+				prop.max_y, max_y_hw);
+		return -EINVAL;
+	} else if (prop.max_y == 0) {
+		error = iqs5xx_read_word(client, IQS5XX_Y_RES, &max_y);
+		if (error)
+			return error;
+
+		input_abs_set_max(iqs5xx->input, prop.swap_x_y ?
+				ABS_MT_POSITION_X : ABS_MT_POSITION_Y, max_y);
+	} else {
+		max_y = (u16)prop.max_y;
+	}
+
+	/*
+	 * Write horizontal and vertical resolution to the device in case its
+	 * original defaults were overridden or swapped as per the properties
+	 * specified in the device tree.
+	 */
+	error = iqs5xx_write_word(client,
+			prop.swap_x_y ? IQS5XX_Y_RES : IQS5XX_X_RES, max_x);
+	if (error)
+		return error;
+
+	error = iqs5xx_write_word(client,
+			prop.swap_x_y ? IQS5XX_X_RES : IQS5XX_Y_RES, max_y);
+	if (error)
+		return error;
+
+	error = iqs5xx_read_byte(client, IQS5XX_SYS_CFG0, &val8);
+	if (error)
+		return error;
+
+	val8 |= IQS5XX_SETUP_COMPLETE;
+	val8 &= ~IQS5XX_SW_INPUT_EVENT;
+	error = iqs5xx_write_byte(client, IQS5XX_SYS_CFG0, val8);
+	if (error)
+		return error;
+
+	val8 = IQS5XX_TP_EVENT | IQS5XX_EVENT_MODE;
+	error = iqs5xx_write_byte(client, IQS5XX_SYS_CFG1, val8);
+	if (error)
+		return error;
+
+	error = iqs5xx_write_byte(client, IQS5XX_END_COMM, 0);
+	if (error)
+		return error;
+
+	/*
+	 * The return from this function is delayed so as to avoid a relatively
+	 * long clock-stretching period that occurs during open and close call-
+	 * backs made when the input device is subsequently registered.
+	 */
+	msleep(100);
+
+	return 0;
+}
+
+static irqreturn_t iqs5xx_irq(int irq, void *data)
+{
+	struct iqs5xx_private *iqs5xx = (struct iqs5xx_private *)data;
+	struct iqs5xx_touch_data *touch_data;
+	struct i2c_client *client = iqs5xx->client;
+	struct input_dev *input = iqs5xx->input;
+	int error, i;
+	u8 buf[sizeof(*touch_data) * IQS5XX_NUM_CONTACTS];
+
+	error = iqs5xx_read_burst(client, IQS5XX_ABS_X, buf, ARRAY_SIZE(buf));
+	if (error)
+		return IRQ_NONE;
+
+	for (i = 0, touch_data = (struct iqs5xx_touch_data *)buf;
+			i < IQS5XX_NUM_CONTACTS; i++, touch_data++) {
+		input_mt_slot(input, i);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER,
+				be16_to_cpu(touch_data->strength) > 0);
+
+		if (!be16_to_cpu(touch_data->strength))
+			continue;
+
+		input_report_abs(input, ABS_MT_POSITION_X,
+				be16_to_cpu(touch_data->abs_x));
+		input_report_abs(input, ABS_MT_POSITION_Y,
+				be16_to_cpu(touch_data->abs_y));
+		input_report_abs(input, ABS_MT_PRESSURE,
+				be16_to_cpu(touch_data->strength));
+	}
+
+	input_mt_sync_frame(input);
+	input_sync(input);
+
+	error = iqs5xx_write_byte(client, IQS5XX_END_COMM, 0);
+	if (error)
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static int iqs5xx_set_state(struct i2c_client *client, u8 state)
+{
+	int error1, error2;
+
+	/*
+	 * Addressing the device outside of a communication window prompts it
+	 * to assert the RDY output, so disable the interrupt line to prevent
+	 * the handler from servicing a false interrupt.
+	 */
+	disable_irq(client->irq);
+
+	error1 = iqs5xx_write_byte(client, IQS5XX_SYS_CTRL1, state);
+	error2 = iqs5xx_write_byte(client, IQS5XX_END_COMM, 0);
+
+	usleep_range(200, 300);
+	enable_irq(client->irq);
+
+	if (error1)
+		return error1;
+
+	return error2;
+}
+
+static int iqs5xx_open(struct input_dev *input)
+{
+	struct iqs5xx_private *iqs5xx = input_get_drvdata(input);
+
+	return iqs5xx_set_state(iqs5xx->client, IQS5XX_RESUME);
+}
+
+static void iqs5xx_close(struct input_dev *input)
+{
+	struct iqs5xx_private *iqs5xx = input_get_drvdata(input);
+
+	iqs5xx_set_state(iqs5xx->client, IQS5XX_SUSPEND);
+}
+
+static int __maybe_unused iqs5xx_suspend(struct device *dev)
+{
+	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
+	int error = 0;
+
+	mutex_lock(&iqs5xx->input->mutex);
+
+	if (iqs5xx->input->users)
+		error = iqs5xx_set_state(iqs5xx->client, IQS5XX_SUSPEND);
+
+	mutex_unlock(&iqs5xx->input->mutex);
+
+	return error;
+}
+
+static int __maybe_unused iqs5xx_resume(struct device *dev)
+{
+	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
+	int error = 0;
+
+	mutex_lock(&iqs5xx->input->mutex);
+
+	if (iqs5xx->input->users)
+		error = iqs5xx_set_state(iqs5xx->client, IQS5XX_RESUME);
+
+	mutex_unlock(&iqs5xx->input->mutex);
+
+	return error;
+}
+
+static SIMPLE_DEV_PM_OPS(iqs5xx_pm, iqs5xx_suspend, iqs5xx_resume);
+
+static int iqs5xx_probe(struct i2c_client *client,
+				const struct i2c_device_id *id)
+{
+	struct iqs5xx_private *iqs5xx;
+	struct input_dev *input;
+	int error;
+	__be16 exp_ver_spec = cpu_to_be16(0);
+
+	iqs5xx = devm_kzalloc(&client->dev, sizeof(*iqs5xx), GFP_KERNEL);
+	if (!iqs5xx)
+		return -ENOMEM;
+
+	dev_set_drvdata(&client->dev, iqs5xx);
+
+	i2c_set_clientdata(client, iqs5xx);
+	iqs5xx->client = client;
+
+	iqs5xx->reset_gpio = devm_gpiod_get(&client->dev,
+			"reset", GPIOD_OUT_LOW);
+	if (IS_ERR(iqs5xx->reset_gpio)) {
+		error = PTR_ERR(iqs5xx->reset_gpio);
+		dev_err(&client->dev, "Failed to request GPIO: %d\n", error);
+		return error;
+	}
+
+	device_property_read_u8(&client->dev,
+			"azoteq,exp-ver-major", (u8 *)&exp_ver_spec);
+	device_property_read_u8(&client->dev,
+			"azoteq,exp-ver-minor", (u8 *)&exp_ver_spec + 1);
+
+	iqs5xx_reset(client);
+	usleep_range(10000, 10100);
+
+	error = iqs5xx_dev_id(client, exp_ver_spec);
+	switch (error) {
+	case 0:
+		break;
+	case -EAGAIN:
+		error = iqs5xx_update_firmware(client);
+		if (error)
+			return error;
+
+		error = iqs5xx_dev_id(client, exp_ver_spec);
+		if (error) {
+			dev_err(&client->dev,
+					"Aborting device initialization\n");
+			return -EINVAL;
+		}
+		break;
+	default:
+		return error;
+	}
+
+	input = devm_input_allocate_device(&client->dev);
+	if (!input)
+		return -ENOMEM;
+
+	input_set_drvdata(input, iqs5xx);
+	iqs5xx->input = input;
+
+	input->name = client->name;
+	input->id.bustype = BUS_I2C;
+	input->open = iqs5xx_open;
+	input->close = iqs5xx_close;
+
+	input_set_capability(input, EV_ABS, ABS_MT_POSITION_X);
+	input_set_capability(input, EV_ABS, ABS_MT_POSITION_Y);
+	input_set_capability(input, EV_ABS, ABS_MT_PRESSURE);
+
+	error = iqs5xx_dev_init(client);
+	if (error)
+		return error;
+
+	error = input_mt_init_slots(input,
+			IQS5XX_NUM_CONTACTS, INPUT_MT_DIRECT);
+	if (error) {
+		dev_err(&client->dev,
+				"Failed to initialize slots: %d\n", error);
+		return error;
+	}
+
+	error = devm_request_threaded_irq(&client->dev, client->irq,
+			NULL, iqs5xx_irq,
+			IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+			client->name, iqs5xx);
+	if (error) {
+		dev_err(&client->dev, "Failed to request IRQ: %d\n", error);
+		return error;
+	}
+
+	error = input_register_device(input);
+	if (error) {
+		dev_err(&client->dev, "Failed to register device: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static const struct i2c_device_id iqs5xx_id[] = {
+	{ "iqs550", 0 },
+	{ "iqs572", 1 },
+	{ "iqs525", 2 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, iqs5xx_id);
+
+static const struct of_device_id iqs5xx_of_match[] = {
+	{ .compatible = "azoteq,iqs550" },
+	{ .compatible = "azoteq,iqs572" },
+	{ .compatible = "azoteq,iqs525" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, iqs5xx_of_match);
+
+static struct i2c_driver iqs5xx_i2c_driver = {
+	.driver = {
+		.name	= "iqs5xx",
+		.of_match_table = iqs5xx_of_match,
+		.pm = &iqs5xx_pm,
+	},
+	.id_table	= iqs5xx_id,
+	.probe		= iqs5xx_probe,
+};
+module_i2c_driver(iqs5xx_i2c_driver);
+
+MODULE_AUTHOR("Jeff LaBundy <jeff@labundy.com>");
+MODULE_DESCRIPTION("Azoteq IQS550/572/525 Trackpad/Touchscreen Controller");
+MODULE_LICENSE("GPL");
--
2.7.4
