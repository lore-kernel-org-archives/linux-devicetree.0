From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/9] iio: humidity: hts221: do not overwrite reserved data during power-down
Date: Sun,  9 Jul 2017 18:56:58 +0200
Message-ID: <20170709165704.26311-4-lorenzo.bianconi@st.com>
References: <20170709165704.26311-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170709165704.26311-1-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fixes: e4a70e3e7d84 (iio: humidity: add support to hts221 rh/temp device)
Fixes: b7079eeac5da (iio: humidity: hts221: add power management support)
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
---
 drivers/iio/humidity/hts221_core.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
index 9546b0ea6283..b36734b8070e 100644
--- a/drivers/iio/humidity/hts221_core.c
+++ b/drivers/iio/humidity/hts221_core.c
@@ -305,11 +305,10 @@ int hts221_power_on(struct hts221_hw *hw)
 
 int hts221_power_off(struct hts221_hw *hw)
 {
-	__le16 data = 0;
 	int err;
 
-	err = hw->tf->write(hw->dev, HTS221_REG_CNTRL1_ADDR, sizeof(data),
-			    (u8 *)&data);
+	err = hts221_write_with_mask(hw, HTS221_REG_CNTRL1_ADDR,
+				     HTS221_ENABLE_MASK, false);
 	if (err < 0)
 		return err;
 
@@ -692,11 +691,10 @@ static int __maybe_unused hts221_suspend(struct device *dev)
 {
 	struct iio_dev *iio_dev = dev_get_drvdata(dev);
 	struct hts221_hw *hw = iio_priv(iio_dev);
-	__le16 data = 0;
 	int err;
 
-	err = hw->tf->write(hw->dev, HTS221_REG_CNTRL1_ADDR, sizeof(data),
-			    (u8 *)&data);
+	err = hts221_write_with_mask(hw, HTS221_REG_CNTRL1_ADDR,
+				     HTS221_ENABLE_MASK, false);
 
 	return err < 0 ? err : 0;
 }
-- 
2.13.1
