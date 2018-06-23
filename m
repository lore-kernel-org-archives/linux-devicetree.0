Return-Path: <SRS0=78dS=JJ=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 4/4] input: touchscreen: eeti: fix link to documentation and email address in header
Date: Sat, 23 Jun 2018 17:45:33 +0200
Message-Id: <20180623154533.26901-5-daniel@zonque.org>
In-Reply-To: <20180623154533.26901-1-daniel@zonque.org>
References: <20180623154533.26901-1-daniel@zonque.org>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Keep the documentation link up-to-date in case anybody need to dive into it
again, and update email address while at it.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/eeti_ts.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index 84561dfde7c4..7fe41965c5d1 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -1,9 +1,9 @@
 /*
  * Touch Screen driver for EETI's I2C connected touch screen panels
- *   Copyright (c) 2009 Daniel Mack <daniel@caiaq.de>
+ *   Copyright (c) 2009,2018 Daniel Mack <daniel@zonque.org>
  *
  * See EETI's software guide for the protocol specification:
- *   http://home.eeti.com.tw/web20/eg/guide.htm
+ *   http://home.eeti.com.tw/documentation.html
  *
  * Based on migor_ts.c
  *   Copyright (c) 2008 Magnus Damm
@@ -271,5 +271,5 @@ static struct i2c_driver eeti_ts_driver = {
 module_i2c_driver(eeti_ts_driver);
 
 MODULE_DESCRIPTION("EETI Touchscreen driver");
-MODULE_AUTHOR("Daniel Mack <daniel@caiaq.de>");
+MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
 MODULE_LICENSE("GPL");
-- 
2.17.1
