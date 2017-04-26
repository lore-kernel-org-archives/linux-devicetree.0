From: Geoff Lansberry <geoff-R+k406RtEhcAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] NFC: trf7970a: Correct register settings for 27MHz clock
Date: Wed, 26 Apr 2017 09:48:33 -0400
Message-ID: <1493214513-12245-1-git-send-email-geoff@kuvee.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org, justin-R+k406RtEhcAvxtiuMwx3w@public.gmane.org, colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, Geoff Lansberry <geoff-R+k406RtEhcAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In prior commits the selected clock frequency does not propagate
correctly to what is written the the TRF7970A_MODULATOR_SYS_CLK_CTRL
register.
Also fixes a bug that causes the device tree property check to always
pass.

Signed-off-by: Geoff Lansberry <geoff-R+k406RtEhcAvxtiuMwx3w@public.gmane.org>
---
 drivers/nfc/trf7970a.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 2d1c8ca..c278b0e 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -2071,7 +2071,7 @@ static int trf7970a_probe(struct spi_device *spi)
 	}
 
 	of_property_read_u32(np, "clock-frequency", &clk_freq);
-	if ((clk_freq != TRF7970A_27MHZ_CLOCK_FREQUENCY) ||
+	if ((clk_freq != TRF7970A_27MHZ_CLOCK_FREQUENCY) &&
 		(clk_freq != TRF7970A_13MHZ_CLOCK_FREQUENCY)) {
 		dev_err(trf->dev,
 			"clock-frequency (%u Hz) unsupported\n",
@@ -2079,6 +2079,13 @@ static int trf7970a_probe(struct spi_device *spi)
 		return -EINVAL;
 	}
 
+	if (clk_freq == TRF7970A_27MHZ_CLOCK_FREQUENCY) {
+		trf->modulator_sys_clk_ctrl = TRF7970A_MODULATOR_27MHZ;
+		dev_dbg(trf->dev, "trf7970a configured for 27MHz crystal\n");
+	} else {
+		trf->modulator_sys_clk_ctrl = 0;
+	}
+
 	if (of_property_read_bool(np, "en2-rf-quirk"))
 		trf->quirks |= TRF7970A_QUIRK_EN2_MUST_STAY_LOW;
 
-- 
2.7.4
