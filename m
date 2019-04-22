Return-Path: <SRS0=1iwi=SY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.bugwerft.de ([46.23.86.59]:50078 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbfDVIfv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Apr 2019 04:35:51 -0400
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 1/2] input: touch: eeti: move ISR code to own function
Date: Mon, 22 Apr 2019 10:35:39 +0200
Message-Id: <20190422083540.8380-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Move the ISR handling code to its own function and change the logic to bail
immediately in case of .running is false or if the attn_gpio is available
but unasserted.

This allows us to call the function at any time to check for the state of
attn_gpio.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/eeti_ts.c | 30 +++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index 7fe41965c5d1..f5724aaa815b 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -75,14 +75,19 @@ static void eeti_ts_report_event(struct eeti_ts *eeti, u8 *buf)
 	input_sync(eeti->input);
 }
 
-static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
+static void eeti_ts_read(struct eeti_ts *eeti)
 {
-	struct eeti_ts *eeti = dev_id;
-	int len;
-	int error;
+	int len, error;
 	char buf[6];
 
-	do {
+	for (;;) {
+		if (!eeti->running)
+			break;
+
+		if (eeti->attn_gpio &&
+		    gpiod_get_value_cansleep(eeti->attn_gpio) == 0)
+			break;
+
 		len = i2c_master_recv(eeti->client, buf, sizeof(buf));
 		if (len != sizeof(buf)) {
 			error = len < 0 ? len : -EIO;
@@ -92,12 +97,17 @@ static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
 			break;
 		}
 
-		if (buf[0] & 0x80) {
-			/* Motion packet */
+		/* Motion packet */
+		if (buf[0] & 0x80)
 			eeti_ts_report_event(eeti, buf);
-		}
-	} while (eeti->running &&
-		 eeti->attn_gpio && gpiod_get_value_cansleep(eeti->attn_gpio));
+	}
+}
+
+static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
+{
+	struct eeti_ts *eeti = dev_id;
+
+	eeti_ts_read(eeti);
 
 	return IRQ_HANDLED;
 }
-- 
2.20.1
