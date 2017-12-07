From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH RESEND 2/2] MAINTAINERS: add DT binding docs for AT24
Date: Thu,  7 Dec 2017 11:38:29 +0100
Message-ID: <20171207103829.3342-3-wsa@the-dreams.de>
References: <20171207103829.3342-1-wsa@the-dreams.de>
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20171207103829.3342-1-wsa@the-dreams.de>
Sender: linux-i2c-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Wolfram Sang <wsa@the-dreams.de>
List-Id: devicetree@vger.kernel.org

The driver gained DT support recently, so we should add the binding docs
in the MAINTAINERS file.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4fdcb12616c7a..22b52125558c8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2262,6 +2262,7 @@ AT24 EEPROM DRIVER
 M:	Bartosz Golaszewski <brgl@bgdev.pl>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/eeprom/at24.txt
 F:	drivers/misc/eeprom/at24.c
 F:	include/linux/platform_data/at24.h
 
-- 
2.11.0
