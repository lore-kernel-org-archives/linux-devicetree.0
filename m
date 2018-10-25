From: Lars Poeschel <poeschel@lemonage.de>
Subject: [PATCH v3 1/5] nfc: pn533: i2c: "pn532" as dt compatible string
Date: Thu, 25 Oct 2018 15:29:32 +0200
Message-ID: <20181025132937.24405-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Lars Poeschel <poeschel@lemonage.de>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

It is favourable to have one unified compatible string for devices that
have multiple interfaces. So this adds simply "pn532" as the devicetree
binding compatible string and makes a note that the old ones are
deprecated.

Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
---
 drivers/nfc/pn533/i2c.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index 4389eb4c8d0b..f4eae9dd5305 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -258,6 +258,11 @@ static int pn533_i2c_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id of_pn533_i2c_match[] = {
+	{ .compatible = "nxp,pn532", },
+	/*
+	 * NOTE: The use of the compatibles with the trailing "...-i2c" is
+	 * deprecated and will be removed.
+	 */
 	{ .compatible = "nxp,pn533-i2c", },
 	{ .compatible = "nxp,pn532-i2c", },
 	{},
-- 
2.19.1
