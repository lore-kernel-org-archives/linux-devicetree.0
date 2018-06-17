Return-Path: <SRS0=fTn5=JD=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 5/5] input: touchscreen: eeti: update email address
Date: Sun, 17 Jun 2018 13:46:59 +0200
Message-Id: <20180617114659.367-5-daniel@zonque.org>
In-Reply-To: <20180617114659.367-1-daniel@zonque.org>
References: <20180617114659.367-1-daniel@zonque.org>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Update the email address in the header and in the module properties.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/eeti_ts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index 0c1092fb4955..51060299b06a 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -1,6 +1,6 @@
 /*
  * Touch Screen driver for EETI's I2C connected touch screen panels
- *   Copyright (c) 2009 Daniel Mack <daniel@caiaq.de>
+ *   Copyright (c) 2009,2018 Daniel Mack <daniel@zonque.org>
  *
  * See EETI's software guide for the protocol specification:
  *   http://home.eeti.com.tw/documentation.html
@@ -291,5 +291,5 @@ static struct i2c_driver eeti_ts_driver = {
 module_i2c_driver(eeti_ts_driver);
 
 MODULE_DESCRIPTION("EETI Touchscreen driver");
-MODULE_AUTHOR("Daniel Mack <daniel@caiaq.de>");
+MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
 MODULE_LICENSE("GPL");
-- 
2.17.1
