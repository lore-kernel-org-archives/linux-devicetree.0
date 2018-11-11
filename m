Return-Path: <SRS0=dUsd=NW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35408 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728126AbeKLAEl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 11 Nov 2018 19:04:41 -0500
Received: by mail-wr1-f67.google.com with SMTP id z16-v6so6568222wrv.2
        for <devicetree@vger.kernel.org>; Sun, 11 Nov 2018 06:15:59 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 7/9] iio: imu: st_lsm6dsx: add st_lsm6dsx_push_tagged_data routine
Date: Sun, 11 Nov 2018 15:15:34 +0100
Message-Id: <d65aca136a7d53305e2ca757f1df10c11082adc8.1541945612.git.lorenzo.bianconi@redhat.com>
In-Reply-To: <cover.1541945612.git.lorenzo.bianconi@redhat.com>
References: <cover.1541945612.git.lorenzo.bianconi@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Introduce st_lsm6dsx_push_tagged_data routine to push samples
to iio buffers. st_lsm6dsx_push_tagged_data will be reused adding
hw fifo support to st_lsm6dsx i2c embedded controller in order to
improve code readability

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
---
 .../iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c    | 44 ++++++++++++-------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
index 6a379767b919..4e7ff370cbe0 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
@@ -453,6 +453,31 @@ int st_lsm6dsx_read_fifo(struct st_lsm6dsx_hw *hw)
 	return read_len;
 }
 
+static int
+st_lsm6dsx_push_tagged_data(struct st_lsm6dsx_hw *hw, u8 tag,
+			    u8 *data, s64 ts)
+{
+	struct st_lsm6dsx_sensor *sensor;
+	struct iio_dev *iio_dev;
+
+	switch (tag) {
+	case ST_LSM6DSX_GYRO_TAG:
+		iio_dev = hw->iio_devs[ST_LSM6DSX_ID_GYRO];
+		break;
+	case ST_LSM6DSX_ACC_TAG:
+		iio_dev = hw->iio_devs[ST_LSM6DSX_ID_ACC];
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	sensor = iio_priv(iio_dev);
+	iio_push_to_buffers_with_timestamp(iio_dev, data,
+					   ts + sensor->ts_ref);
+
+	return 0;
+}
+
 /**
  * st_lsm6dsx_read_tagged_fifo() - LSM6DSO read FIFO routine
  * @hw: Pointer to instance of struct st_lsm6dsx_hw.
@@ -508,8 +533,7 @@ int st_lsm6dsx_read_tagged_fifo(struct st_lsm6dsx_hw *hw)
 			       ST_LSM6DSX_SAMPLE_SIZE);
 
 			tag = hw->buff[i] >> 3;
-			switch (tag) {
-			case ST_LSM6DSX_TS_TAG:
+			if (tag == ST_LSM6DSX_TS_TAG) {
 				/*
 				 * hw timestamp is 4B long and it is stored
 				 * in FIFO according to this schema:
@@ -526,19 +550,9 @@ int st_lsm6dsx_read_tagged_fifo(struct st_lsm6dsx_hw *hw)
 				if (!reset_ts && ts >= 0xffff0000)
 					reset_ts = true;
 				ts *= ST_LSM6DSX_TS_SENSITIVITY;
-				break;
-			case ST_LSM6DSX_GYRO_TAG:
-				iio_push_to_buffers_with_timestamp(
-					hw->iio_devs[ST_LSM6DSX_ID_GYRO],
-					iio_buff, gyro_sensor->ts_ref + ts);
-				break;
-			case ST_LSM6DSX_ACC_TAG:
-				iio_push_to_buffers_with_timestamp(
-					hw->iio_devs[ST_LSM6DSX_ID_ACC],
-					iio_buff, acc_sensor->ts_ref + ts);
-				break;
-			default:
-				break;
+			} else {
+				st_lsm6dsx_push_tagged_data(hw, tag, iio_buff,
+							    ts);
 			}
 		}
 	}
-- 
2.19.1
