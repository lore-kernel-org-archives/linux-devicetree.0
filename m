From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 04/10] iio: humidity: hts221: avoid useless ODR reconfiguration
Date: Mon, 17 Jul 2017 19:38:59 +0200
Message-ID: <20170717173905.8209-5-lorenzo.bianconi@st.com>
References: <20170717173905.8209-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170717173905.8209-1-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Configure sensor ODR just in hts221_write_raw() in order to avoid
to set device sample rate multiple times.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
---
 drivers/iio/humidity/hts221_core.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
index 6e5847386a45..f99adc44139e 100644
--- a/drivers/iio/humidity/hts221_core.c
+++ b/drivers/iio/humidity/hts221_core.c
@@ -208,11 +208,6 @@ static int hts221_update_odr(struct hts221_hw *hw, u8 odr)
 	if (err < 0)
 		return err;
 
-	err = hts221_write_with_mask(hw, HTS221_REG_CNTRL1_ADDR,
-				     HTS221_ENABLE_MASK, 1);
-	if (err < 0)
-		return err;
-
 	hw->odr = odr;
 
 	return 0;
@@ -294,7 +289,8 @@ int hts221_power_on(struct hts221_hw *hw)
 {
 	int err;
 
-	err = hts221_update_odr(hw, hw->odr);
+	err = hts221_write_with_mask(hw, HTS221_REG_CNTRL1_ADDR,
+				     HTS221_ENABLE_MASK, true);
 	if (err < 0)
 		return err;
 
@@ -627,8 +623,6 @@ int hts221_probe(struct iio_dev *iio_dev)
 	if (err < 0)
 		return err;
 
-	hw->odr = hts221_odr_table[0].hz;
-
 	iio_dev->modes = INDIO_DIRECT_MODE;
 	iio_dev->dev.parent = hw->dev;
 	iio_dev->available_scan_masks = hts221_scan_masks;
@@ -643,6 +637,10 @@ int hts221_probe(struct iio_dev *iio_dev)
 	if (err < 0)
 		return err;
 
+	err = hts221_update_odr(hw, hts221_odr_table[0].hz);
+	if (err < 0)
+		return err;
+
 	/* configure humidity sensor */
 	err = hts221_parse_rh_caldata(hw);
 	if (err < 0) {
@@ -706,7 +704,8 @@ static int __maybe_unused hts221_resume(struct device *dev)
 	int err = 0;
 
 	if (hw->enabled)
-		err = hts221_update_odr(hw, hw->odr);
+		err = hts221_write_with_mask(hw, HTS221_REG_CNTRL1_ADDR,
+					     HTS221_ENABLE_MASK, true);
 
 	return err;
 }
-- 
2.13.2
