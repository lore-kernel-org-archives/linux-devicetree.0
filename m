Return-Path: <SRS0=Ur6f=NQ=labundy.com=jeff@kernel.org>
From: Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 2/2] input: touchscreen: Add support for Azoteq IQS550/572/525
Date: Sun,  4 Nov 2018 21:57:22 -0600
Message-Id: <1541390242-8355-2-git-send-email-jeff@labundy.com>
In-Reply-To: <1541390242-8355-1-git-send-email-jeff@labundy.com>
References: <1541390242-8355-1-git-send-email-jeff@labundy.com>
To: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org, rydberg@bitmath.org, robh+dt@kernel.org, mark.rutland@arm.com, Jeff LaBundy <jeff@labundy.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds support for the Azoteq IQS550/572/525 family of
trackpad/touchscreen controllers.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/Kconfig  |   10 +
 drivers/input/touchscreen/Makefile |    1 +
 drivers/input/touchscreen/iqs5xx.c | 1071 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1082 insertions(+)
 create mode 100644 drivers/input/touchscreen/iqs5xx.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 5374bd5..3323cf8 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1286,4 +1286,14 @@ config TOUCHSCREEN_ROHM_BU21023
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
index c217516..ccb3bd6 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -108,3 +108,4 @@ obj-$(CONFIG_TOUCHSCREEN_ZET6223)	+= zet6223.o
 obj-$(CONFIG_TOUCHSCREEN_ZFORCE)	+= zforce_ts.o
 obj-$(CONFIG_TOUCHSCREEN_COLIBRI_VF50)	+= colibri-vf50-ts.o
 obj-$(CONFIG_TOUCHSCREEN_ROHM_BU21023)	+= rohm_bu21023.o
+obj-$(CONFIG_TOUCHSCREEN_IQS5XX)	+= iqs5xx.o
diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
new file mode 100644
index 0000000..d494115
--- /dev/null
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -0,0 +1,1071 @@
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
+#define IQS5XX_VER_INFO_LEN	5
+#define IQS5XX_TOUCH_INFO_LEN	(7 * IQS5XX_NUM_CONTACTS)
+
+#define IQS5XX_PROD_NUM		0x0000
+#define IQS5XX_PROD_NUM_IQS550	40
+#define IQS5XX_PROD_NUM_IQS572	58
+#define IQS5XX_PROD_NUM_IQS525	52
+
+#define IQS5XX_PROJ_NUM		0x0002
+#define IQS5XX_PROJ_NUM_A000	0
+#define IQS5XX_PROJ_NUM_B000	15
+
+#define IQS5XX_MAJOR_VER	0x0004
+#define IQS5XX_MAJOR_VER_SPEC	2
+
+#define IQS5XX_ABS_X		0x0016
+
+#define IQS5XX_SYS_CTRL1	0x0432
+#define IQS5XX_RESUME		0x00
+#define IQS5XX_SUSPEND		0x01
+
+#define IQS5XX_SYS_CFG0		0x058E
+#define IQS5XX_SW_INPUT_EVENT	0x10
+#define IQS5XX_SETUP_COMPLETE	0x40
+
+#define IQS5XX_SYS_CFG1		0x058F
+#define IQS5XX_EVENT_MODE	0x01
+#define IQS5XX_TP_EVENT		0x04
+
+#define IQS5XX_TOTAL_RX		0x063D
+#define IQS5XX_TOTAL_TX		0x063E
+
+#define IQS5XX_XY_CFG0		0x0669
+#define IQS5XX_FLIP_X		0x01
+#define IQS5XX_FLIP_Y		0x02
+#define IQS5XX_SWITCH_XY_AXIS	0x04
+
+#define IQS5XX_X_RES		0x066E
+#define IQS5XX_Y_RES		0x0670
+
+#define IQS5XX_EXP_VER		0x0677
+
+#define IQS5XX_CHKSM		0x83C0
+#define IQS5XX_APP		0x8400
+#define IQS5XX_CSTM		0xBE00
+#define IQS5XX_PMAP_END		0xBFFF
+
+#define IQS5XX_END_COMM		0xEEEE
+
+#define IQS5XX_CHKSM_LEN	(IQS5XX_APP - IQS5XX_CHKSM)
+#define IQS5XX_APP_LEN		(IQS5XX_CSTM - IQS5XX_APP)
+#define IQS5XX_CSTM_LEN		(IQS5XX_PMAP_END + 1 - IQS5XX_CSTM)
+#define IQS5XX_PMAP_LEN		(IQS5XX_PMAP_END + 1 - IQS5XX_CHKSM)
+
+#define IQS5XX_REC_SIZE_MAX	260
+#define IQS5XX_REC_FIELD_WIDTH	2
+#define IQS5XX_REC_LEN		0
+#define IQS5XX_REC_ADDRH	1
+#define IQS5XX_REC_ADDRL	2
+#define IQS5XX_REC_TYPE		3
+#define IQS5XX_REC_DATA		4
+#define IQS5XX_REC_ADDR_EOF	0xFFFF
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
+
+struct iqs5xx_private {
+	struct i2c_client *client;
+	struct input_dev *input;
+	struct gpio_desc *reset_gpio;
+	u16 exp_ver_spec;
+	u8 touch_info[IQS5XX_TOUCH_INFO_LEN];
+	bool disabled;
+};
+
+static const char * const iqs5xx_fw_names[] = {
+	"iqs550.hex",
+	"iqs572.hex",
+	"iqs525.hex",
+};
+
+static int iqs5xx_read_bytes(struct i2c_client *client,
+				u16 reg, u8 *val8, u16 len)
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
+	dev_err(&client->dev, "Failed to read from address %04X: %d\n",
+			reg, ret);
+
+	return ret;
+}
+
+static int iqs5xx_read_word(struct i2c_client *client, u16 reg, u16 *val)
+{
+	u8 val8[sizeof(*val)];
+	int ret;
+
+	ret = iqs5xx_read_bytes(client, reg, val8, sizeof(*val));
+	if (ret)
+		return ret;
+
+	*val = get_unaligned_be16(val8);
+
+	return 0;
+}
+
+static int iqs5xx_write_bytes(struct i2c_client *client,
+				u16 reg, u8 *val8, u16 len)
+{
+	int ret, i;
+	int mlen = sizeof(reg) + len;
+	u8 *mbuf = kzalloc(mlen, GFP_KERNEL);
+
+	if (!mbuf)
+		return -ENOMEM;
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
+		if (ret == mlen) {
+			ret = 0;
+			goto msg_sent;
+		}
+
+		usleep_range(200, 300);
+	}
+
+	if (ret >= 0)
+		ret = -EIO;
+
+	dev_err(&client->dev, "Failed to write to address %04X: %d\n",
+			reg, ret);
+
+msg_sent:
+	kfree(mbuf);
+
+	return ret;
+}
+
+static int iqs5xx_write_word(struct i2c_client *client, u16 reg, u16 val)
+{
+	u8 val8[sizeof(val)];
+
+	put_unaligned_be16(val, val8);
+
+	return iqs5xx_write_bytes(client, reg, val8, sizeof(val));
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
+	*mbuf = bl_cmd;
+	put_unaligned_be16(bl_addr, mbuf + sizeof(bl_cmd));
+
+	msg.addr = client->addr ^ IQS5XX_BL_ADDR_MASK;
+	msg.flags = 0;
+	msg.len = sizeof(bl_cmd);
+	msg.buf = mbuf;
+
+	switch (bl_cmd) {
+	case IQS5XX_BL_CMD_VER:
+	case IQS5XX_BL_CMD_EXEC:
+	case IQS5XX_BL_CMD_CRC:
+		break;
+	case IQS5XX_BL_CMD_READ:
+		msg.len += sizeof(bl_addr);
+		break;
+	default:
+		dev_err(&client->dev,
+				"Unrecognized bootloader command: 0x%02X\n",
+				bl_cmd);
+		return -EINVAL;
+	}
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret < 1)
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
+	default:
+		return 0;
+	}
+
+	msg.flags = I2C_M_RD;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret < 1)
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
+static int iqs5xx_bl_write_blk(struct i2c_client *client,
+				u16 bl_addr, u8 *bl_data)
+{
+	struct i2c_msg msg;
+	int ret;
+	int mlen = sizeof(bl_addr) + IQS5XX_BL_BLK_LEN_MAX;
+	u8 *mbuf = kzalloc(mlen, GFP_KERNEL);
+
+	if (!mbuf)
+		return -ENOMEM;
+
+	put_unaligned_be16(bl_addr, mbuf);
+	memcpy(mbuf + sizeof(bl_addr), bl_data, IQS5XX_BL_BLK_LEN_MAX);
+
+	msg.addr = client->addr ^ IQS5XX_BL_ADDR_MASK;
+	msg.flags = 0;
+	msg.len = mlen;
+	msg.buf = mbuf;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret == 1) {
+		ret = 0;
+		goto msg_sent;
+	}
+
+	if (ret >= 0)
+		ret = -EIO;
+
+	dev_err(&client->dev, "Failed to write block at address %04X: %d\n",
+			bl_addr, ret);
+
+msg_sent:
+	kfree(mbuf);
+
+	return ret;
+}
+
+static int iqs5xx_bl_read_blk(struct i2c_client *client, u8 *bl_data)
+{
+	struct i2c_msg msg;
+	int ret;
+
+	msg.addr = client->addr ^ IQS5XX_BL_ADDR_MASK;
+	msg.flags = I2C_M_RD;
+	msg.len = IQS5XX_BL_BLK_LEN_MAX;
+	msg.buf = bl_data;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret == 1)
+		return 0;
+
+	if (ret >= 0)
+		ret = -EIO;
+
+	dev_err(&client->dev, "Failed to perform block read: %d\n", ret);
+
+	return ret;
+}
+
+static int iqs5xx_bl_verify(struct i2c_client *client, u16 bl_addr,
+				u8 *pmap_data, u16 pmap_len, bool *cmp)
+{
+	int ret, i;
+	u8 *bl_data = kzalloc(IQS5XX_BL_BLK_LEN_MAX, GFP_KERNEL);
+
+	if (!bl_data)
+		return -ENOMEM;
+
+	if (pmap_len % IQS5XX_BL_BLK_LEN_MAX) {
+		dev_err(&client->dev, "Invalid block length: %d\n", pmap_len);
+		ret = -EINVAL;
+		goto err_kfree;
+	}
+
+	for (i = 0; i < pmap_len; i += IQS5XX_BL_BLK_LEN_MAX) {
+		ret = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_READ, bl_addr + i);
+		if (ret)
+			goto err_kfree;
+
+		ret = iqs5xx_bl_read_blk(client, bl_data);
+		if (ret)
+			goto err_kfree;
+
+		if (memcmp(bl_data, pmap_data + i, IQS5XX_BL_BLK_LEN_MAX)) {
+			*cmp = true;
+			goto err_kfree;
+		}
+	}
+
+	*cmp = false;
+
+err_kfree:
+	kfree(bl_data);
+
+	return ret;
+}
+
+static u8 iqs5xx_rec_field(const u8 *rec_src)
+{
+	int i;
+	u8 rec_raw, rec_bin;
+	u8 rec_acc = 0;
+
+	for (i = 0; i < IQS5XX_REC_FIELD_WIDTH; i++) {
+		rec_raw = *(rec_src + i);
+
+		switch (rec_raw) {
+		case '0' ... '9':
+			rec_bin = rec_raw - '0';
+			break;
+		case 'a' ... 'f':
+			rec_bin = rec_raw - 'a' + 10;
+			break;
+		case 'A' ... 'F':
+			rec_bin = rec_raw - 'A' + 10;
+			break;
+		default:
+			rec_bin = 0;
+		}
+
+		rec_acc += rec_bin << (IQS5XX_REC_FIELD_WIDTH - i - 1) * 4;
+	}
+
+	return rec_acc;
+}
+
+static int iqs5xx_update_firmware(struct i2c_client *client, u8 fw_name_index)
+{
+	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
+	const struct firmware *fw;
+	const char *fw_name;
+	bool cmp_cstm;
+	int ret, i, j;
+	u8 *pmap = kzalloc(IQS5XX_PMAP_LEN, GFP_KERNEL);
+	u8 rec[IQS5XX_REC_SIZE_MAX];
+	u8 rec_end, rec_chksm;
+	u8 val8;
+	u16 val;
+	u16 rec_addr = 0;
+	u32 pos = 0;
+
+	if (!pmap)
+		return -ENOMEM;
+
+	if (fw_name_index > ARRAY_SIZE(iqs5xx_fw_names)) {
+		ret = -EINVAL;
+		goto err_kfree;
+	}
+
+	fw_name = iqs5xx_fw_names[fw_name_index];
+	dev_info(&client->dev, "Updating device from firmware %s...\n",
+			fw_name);
+
+	ret = request_firmware(&fw, fw_name, &client->dev);
+	if (ret) {
+		dev_err(&client->dev, "Failed to request firmware %s: %d\n",
+				fw_name, ret);
+		goto err_kfree;
+	}
+
+	while (pos < fw->size) {
+		if (rec_addr == IQS5XX_REC_ADDR_EOF) {
+			dev_err(&client->dev, "Unexpected record past EOF\n");
+			ret = -EINVAL;
+			goto err_rls_fw;
+		}
+
+		if (fw->data[pos++] != ':') {
+			dev_err(&client->dev, "Invalid record placement\n");
+			ret = -EINVAL;
+			goto err_rls_fw;
+		}
+
+		rec[IQS5XX_REC_LEN] = iqs5xx_rec_field(fw->data + pos);
+		pos += IQS5XX_REC_FIELD_WIDTH;
+
+		rec_end = IQS5XX_REC_DATA + rec[IQS5XX_REC_LEN];
+		for (i = IQS5XX_REC_ADDRH; i <= rec_end; i++) {
+			rec[i] = iqs5xx_rec_field(fw->data + pos);
+			pos += IQS5XX_REC_FIELD_WIDTH;
+		}
+
+		rec_addr = get_unaligned_be16(rec + IQS5XX_REC_ADDRH);
+
+		rec_chksm = 0;
+		for (i = IQS5XX_REC_LEN; i < rec_end; i++)
+			rec_chksm += rec[i];
+		rec_chksm = ~rec_chksm + 1;
+
+		/*
+		 * The checksum field for records corresponding to user-exported
+		 * settings does not appear to be recalculated when the firmware
+		 * is exported, so skip checksum verification for that region.
+		 */
+		if (rec_chksm != rec[rec_end] && rec_addr < IQS5XX_CSTM) {
+			dev_err(&client->dev,
+					"Invalid record checksum: 0x%02X\n",
+					rec[rec_end]);
+			ret = -EINVAL;
+			goto err_rls_fw;
+		}
+
+		switch (rec[IQS5XX_REC_TYPE]) {
+		case IQS5XX_REC_TYPE_DATA:
+			if (rec_addr < IQS5XX_CHKSM
+					|| rec_addr > IQS5XX_PMAP_END) {
+				dev_err(&client->dev,
+					"Invalid record address: 0x%04X\n",
+					rec_addr);
+				ret = -EINVAL;
+				goto err_rls_fw;
+			}
+			memcpy(pmap + rec_addr - IQS5XX_CHKSM,
+					rec + IQS5XX_REC_DATA,
+					rec[IQS5XX_REC_LEN]);
+			break;
+		case IQS5XX_REC_TYPE_EOF:
+			if (rec_addr != IQS5XX_REC_ADDR_EOF) {
+				dev_err(&client->dev,
+					"Unexpected record address: 0x%04X\n",
+					rec_addr);
+				ret = -EINVAL;
+				goto err_rls_fw;
+			}
+			break;
+		default:
+			dev_err(&client->dev,
+					"Unexpected record type: 0x%02X\n",
+					rec_addr);
+			ret = -EINVAL;
+			goto err_rls_fw;
+		}
+
+		pos += IQS5XX_REC_FIELD_WIDTH;
+	}
+
+	/*
+	 * The device opens a bootloader polling window for 2 ms following the
+	 * release of reset. If the host cannot establish communication during
+	 * this time frame, it must cycle reset again.
+	 */
+	for (i = 0; i < IQS5XX_NUM_RETRIES; i++) {
+		iqs5xx_reset(client);
+
+		for (j = 0; j < IQS5XX_NUM_RETRIES; j++) {
+			ret = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_VER, 0);
+			if (!ret)
+				break;
+		}
+
+		if (!ret)
+			break;
+	}
+
+	if (i == IQS5XX_NUM_RETRIES) {
+		dev_err(&client->dev, "Failed to enter bootloader: %d\n", ret);
+		goto err_rls_fw;
+	}
+
+	for (i = 0; i < IQS5XX_PMAP_LEN; i += IQS5XX_BL_BLK_LEN_MAX) {
+		ret = iqs5xx_bl_write_blk(client, IQS5XX_CHKSM + i, pmap + i);
+		if (ret)
+			goto err_rls_fw;
+
+		usleep_range(10000, 10100);
+	}
+
+	ret = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_CRC, 0);
+	if (ret)
+		goto err_rls_fw;
+
+	ret = iqs5xx_bl_verify(client, IQS5XX_CSTM,
+			pmap + IQS5XX_CHKSM_LEN + IQS5XX_APP_LEN,
+			IQS5XX_CSTM_LEN, &cmp_cstm);
+	if (ret)
+		goto err_rls_fw;
+
+	if (cmp_cstm) {
+		dev_err(&client->dev, "Failed to verify custom settings\n");
+		ret = -EIO;
+		goto err_rls_fw;
+	}
+
+	ret = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_EXEC, 0);
+	if (ret)
+		goto err_rls_fw;
+
+	usleep_range(10000, 10100);
+
+	ret = iqs5xx_read_word(client, IQS5XX_PROJ_NUM, &val);
+	if (ret)
+		goto err_rls_fw;
+
+	if (val != IQS5XX_PROJ_NUM_B000) {
+		dev_err(&client->dev, "Unexpected project number: %d\n", val);
+		ret = -ENODEV;
+		goto err_rls_fw;
+	}
+
+	ret = iqs5xx_read_bytes(client, IQS5XX_MAJOR_VER, &val8, sizeof(val8));
+	if (ret)
+		goto err_rls_fw;
+
+	if (val8 != IQS5XX_MAJOR_VER_SPEC) {
+		dev_err(&client->dev, "Unexpected major version: %d\n", val8);
+		ret = -ENODEV;
+		goto err_rls_fw;
+	}
+
+	if (iqs5xx->exp_ver_spec) {
+		ret = iqs5xx_read_word(client, IQS5XX_EXP_VER, &val);
+		if (ret)
+			goto err_rls_fw;
+
+		if (val != iqs5xx->exp_ver_spec) {
+			dev_err(&client->dev,
+					"Unexpected export version: %d.%d\n",
+					(val & 0xFF00) >> 8, val & 0x00FF);
+			ret = -ENODEV;
+		}
+	}
+
+err_rls_fw:
+	release_firmware(fw);
+
+err_kfree:
+	kfree(pmap);
+
+	return ret;
+}
+
+static int iqs5xx_dev_id(struct i2c_client *client)
+{
+	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
+	int ret;
+	u16 val;
+	u8 ver_info[IQS5XX_VER_INFO_LEN];
+	u8 exp_ver_major = 0;
+	u8 exp_ver_minor = 0;
+	u8 fw_name_index;
+
+	device_property_read_u8(&client->dev,
+			"azoteq,exp-ver-major", &exp_ver_major);
+	device_property_read_u8(&client->dev,
+			"azoteq,exp-ver-minor", &exp_ver_minor);
+	iqs5xx->exp_ver_spec = (exp_ver_major << 8) | exp_ver_minor;
+
+	iqs5xx_reset(client);
+	usleep_range(10000, 10100);
+
+	ret = iqs5xx_read_bytes(client,
+			IQS5XX_PROD_NUM, ver_info, IQS5XX_VER_INFO_LEN);
+	if (ret)
+		return ret;
+
+	/*
+	 * A000 and B000 devices use 8-bit and 16-bit addressing, respectively.
+	 * Querying an A000 device's version information with 16-bit addressing
+	 * gives the appearance that the data is shifted by one byte; a nonzero
+	 * leading array element suggests this could be the case.
+	 */
+	if (*ver_info) {
+		memmove(ver_info + sizeof(u8), ver_info,
+				IQS5XX_VER_INFO_LEN - sizeof(u8));
+		*ver_info = 0;
+	}
+
+	val = get_unaligned_be16(ver_info + IQS5XX_PROD_NUM);
+	switch (val) {
+	case IQS5XX_PROD_NUM_IQS550:
+		fw_name_index = 0;
+		break;
+	case IQS5XX_PROD_NUM_IQS572:
+		fw_name_index = 1;
+		break;
+	case IQS5XX_PROD_NUM_IQS525:
+		fw_name_index = 2;
+		break;
+	default:
+		dev_err(&client->dev, "Unrecognized product number: %d\n", val);
+		return -ENODEV;
+	}
+
+	val = get_unaligned_be16(ver_info + IQS5XX_PROJ_NUM);
+	switch (val) {
+	case IQS5XX_PROJ_NUM_A000:
+		dev_info(&client->dev, "Unexpected project number: %d\n", val);
+		return iqs5xx_update_firmware(client, fw_name_index);
+	case IQS5XX_PROJ_NUM_B000:
+		break;
+	default:
+		dev_err(&client->dev, "Unrecognized project number: %d\n", val);
+		return -ENODEV;
+	}
+
+	val = *(ver_info + IQS5XX_MAJOR_VER);
+	if (val != IQS5XX_MAJOR_VER_SPEC) {
+		dev_info(&client->dev, "Unexpected major version: %d\n", val);
+		return iqs5xx_update_firmware(client, fw_name_index);
+	}
+
+	if (iqs5xx->exp_ver_spec) {
+		ret = iqs5xx_read_word(client, IQS5XX_EXP_VER, &val);
+		if (ret)
+			return ret;
+
+		if (val != iqs5xx->exp_ver_spec) {
+			dev_info(&client->dev,
+					"Unexpected export version: %d.%d\n",
+					(val & 0xFF00) >> 8, val & 0x00FF);
+			return iqs5xx_update_firmware(client, fw_name_index);
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
+	int ret;
+	u16 x_res, x_res_max;
+	u16 y_res, y_res_max;
+	u8 val8;
+
+	touchscreen_parse_properties(iqs5xx->input, true, &prop);
+
+	ret = iqs5xx_read_bytes(client, IQS5XX_TOTAL_RX, &val8, sizeof(val8));
+	if (ret)
+		return ret;
+	x_res_max = (val8 - 1) * IQS5XX_NUM_POINTS;
+
+	ret = iqs5xx_read_bytes(client, IQS5XX_TOTAL_TX, &val8, sizeof(val8));
+	if (ret)
+		return ret;
+	y_res_max = (val8 - 1) * IQS5XX_NUM_POINTS;
+
+	ret = iqs5xx_read_bytes(client, IQS5XX_XY_CFG0, &val8, sizeof(val8));
+	if (ret)
+		return ret;
+
+	if (prop.swap_x_y)
+		val8 ^= IQS5XX_SWITCH_XY_AXIS;
+
+	if (val8 & IQS5XX_SWITCH_XY_AXIS)
+		swap(x_res_max, y_res_max);
+
+	if (prop.max_x > x_res_max || prop.max_y > y_res_max) {
+		dev_err(&client->dev, "Invalid resolution: %d x %d\n",
+				prop.swap_x_y ? prop.max_y : prop.max_x,
+				prop.swap_x_y ? prop.max_x : prop.max_y);
+		return -EINVAL;
+	}
+
+	if (prop.invert_x)
+		val8 ^= IQS5XX_FLIP_X;
+
+	if (prop.invert_y)
+		val8 ^= IQS5XX_FLIP_Y;
+
+	ret = iqs5xx_write_bytes(client, IQS5XX_XY_CFG0, &val8, sizeof(val8));
+	if (ret)
+		return ret;
+
+	ret = iqs5xx_read_word(client, IQS5XX_X_RES, &x_res);
+	if (ret)
+		return ret;
+
+	ret = iqs5xx_read_word(client, IQS5XX_Y_RES, &y_res);
+	if (ret)
+		return ret;
+
+	if (prop.max_x)
+		x_res = (u16)prop.max_x;
+	else
+		input_abs_set_max(iqs5xx->input, prop.swap_x_y ?
+				ABS_MT_POSITION_Y : ABS_MT_POSITION_X, x_res);
+
+	if (prop.max_y)
+		y_res = (u16)prop.max_y;
+	else
+		input_abs_set_max(iqs5xx->input, prop.swap_x_y ?
+				ABS_MT_POSITION_X : ABS_MT_POSITION_Y, y_res);
+
+	ret = iqs5xx_write_word(client,
+			prop.swap_x_y ? IQS5XX_Y_RES : IQS5XX_X_RES, x_res);
+	if (ret)
+		return ret;
+
+	ret = iqs5xx_write_word(client,
+			prop.swap_x_y ? IQS5XX_X_RES : IQS5XX_Y_RES, y_res);
+	if (ret)
+		return ret;
+
+	ret = iqs5xx_read_bytes(client, IQS5XX_SYS_CFG0, &val8, sizeof(val8));
+	if (ret)
+		return ret;
+
+	val8 |= IQS5XX_SETUP_COMPLETE;
+	val8 &= ~IQS5XX_SW_INPUT_EVENT;
+	ret = iqs5xx_write_bytes(client, IQS5XX_SYS_CFG0, &val8, sizeof(val8));
+	if (ret)
+		return ret;
+
+	val8 = IQS5XX_TP_EVENT | IQS5XX_EVENT_MODE;
+	ret = iqs5xx_write_bytes(client, IQS5XX_SYS_CFG1, &val8, sizeof(val8));
+	if (ret)
+		return ret;
+
+	ret = iqs5xx_write_bytes(client, IQS5XX_END_COMM, &val8, sizeof(val8));
+	if (ret)
+		return ret;
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
+	struct i2c_client *client = iqs5xx->client;
+	struct input_dev *input = iqs5xx->input;
+	int ret, i;
+	u16 abs_x, abs_y, pressure;
+	u8 pos = 0;
+
+	ret = iqs5xx_read_bytes(client, IQS5XX_ABS_X,
+			iqs5xx->touch_info, IQS5XX_TOUCH_INFO_LEN);
+	if (ret)
+		return IRQ_NONE;
+
+	for (i = 0; i < IQS5XX_NUM_CONTACTS; i++) {
+		abs_x = get_unaligned_be16(iqs5xx->touch_info + pos);
+		pos += sizeof(abs_x);
+
+		abs_y = get_unaligned_be16(iqs5xx->touch_info + pos);
+		pos += sizeof(abs_y);
+
+		pressure = get_unaligned_be16(iqs5xx->touch_info + pos);
+		pos += (sizeof(pressure) + sizeof(u8));
+
+		input_mt_slot(input, i);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, pressure > 0);
+
+		if (pressure > 0) {
+			input_report_abs(input, ABS_MT_POSITION_X, abs_x);
+			input_report_abs(input, ABS_MT_POSITION_Y, abs_y);
+			input_report_abs(input, ABS_MT_PRESSURE, pressure);
+		}
+	}
+
+	input_mt_sync_frame(input);
+	input_sync(input);
+
+	ret = iqs5xx_write_bytes(client, IQS5XX_END_COMM, &pos, sizeof(pos));
+	if (ret)
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static int iqs5xx_set_state(struct i2c_client *client, u8 state)
+{
+	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
+	int ret;
+
+	if ((iqs5xx->disabled && state == IQS5XX_SUSPEND)
+			|| (!iqs5xx->disabled && state == IQS5XX_RESUME))
+		return 0;
+
+	/*
+	 * Addressing the device outside of a communication window prompts it
+	 * to assert the RDY output, so disable the interrupt line to prevent
+	 * the handler from servicing a false interrupt.
+	 */
+	disable_irq(client->irq);
+
+	ret = iqs5xx_write_bytes(client,
+			IQS5XX_SYS_CTRL1, &state, sizeof(state));
+	if (ret)
+		return ret;
+
+	ret = iqs5xx_write_bytes(client,
+			IQS5XX_END_COMM, &state, sizeof(state));
+	if (ret)
+		return ret;
+
+	enable_irq(client->irq);
+
+	iqs5xx->disabled = (state == IQS5XX_SUSPEND);
+
+	return 0;
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
+	int ret = 0;
+
+	mutex_lock(&iqs5xx->input->mutex);
+
+	if (iqs5xx->input->users)
+		ret = iqs5xx_set_state(iqs5xx->client, IQS5XX_SUSPEND);
+
+	mutex_unlock(&iqs5xx->input->mutex);
+
+	return ret;
+}
+
+static int __maybe_unused iqs5xx_resume(struct device *dev)
+{
+	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
+	int ret = 0;
+
+	mutex_lock(&iqs5xx->input->mutex);
+
+	if (iqs5xx->input->users)
+		ret = iqs5xx_set_state(iqs5xx->client, IQS5XX_RESUME);
+
+	mutex_unlock(&iqs5xx->input->mutex);
+
+	return ret;
+}
+
+static SIMPLE_DEV_PM_OPS(iqs5xx_pm, iqs5xx_suspend, iqs5xx_resume);
+
+static int iqs5xx_probe(struct i2c_client *client,
+				const struct i2c_device_id *id)
+{
+	struct iqs5xx_private *iqs5xx;
+	struct input_dev *input;
+	int ret;
+
+	iqs5xx = devm_kzalloc(&client->dev,
+			sizeof(struct iqs5xx_private), GFP_KERNEL);
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
+		ret = PTR_ERR(iqs5xx->reset_gpio);
+		dev_err(&client->dev, "Failed to request GPIO: %d\n", ret);
+		return ret;
+	}
+
+	ret = iqs5xx_dev_id(client);
+	if (ret)
+		return ret;
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
+	ret = iqs5xx_dev_init(client);
+	if (ret)
+		return ret;
+
+	ret = input_mt_init_slots(input, IQS5XX_NUM_CONTACTS, INPUT_MT_DIRECT);
+	if (ret) {
+		dev_err(&client->dev, "Failed to initialize slots: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_request_threaded_irq(&client->dev, client->irq,
+			NULL, iqs5xx_irq,
+			IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+			client->name, iqs5xx);
+	if (ret) {
+		dev_err(&client->dev, "Failed to request IRQ: %d\n", ret);
+		return ret;
+	}
+
+	ret = input_register_device(input);
+	if (ret) {
+		dev_err(&client->dev, "Failed to register device: %d\n", ret);
+		return ret;
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
