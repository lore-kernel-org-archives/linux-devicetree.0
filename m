Return-Path: <SRS0=fTn5=JD=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 4/5] input: touchscreen: eeti: fix link to documentation in header
Date: Sun, 17 Jun 2018 13:46:58 +0200
Message-Id: <20180617114659.367-4-daniel@zonque.org>
In-Reply-To: <20180617114659.367-1-daniel@zonque.org>
References: <20180617114659.367-1-daniel@zonque.org>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Keep this up-to-date in case anybody need to dive into the documentation
again.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/eeti_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index e7fade1a895c..0c1092fb4955 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -3,7 +3,7 @@
  *   Copyright (c) 2009 Daniel Mack <daniel@caiaq.de>
  *
  * See EETI's software guide for the protocol specification:
- *   http://home.eeti.com.tw/web20/eg/guide.htm
+ *   http://home.eeti.com.tw/documentation.html
  *
  * Based on migor_ts.c
  *   Copyright (c) 2008 Magnus Damm
-- 
2.17.1
