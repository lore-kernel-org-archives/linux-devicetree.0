From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 2/4] tools: gpio: Add necessary include paths
Date: Tue, 23 Feb 2016 08:54:47 +0100
Message-ID: <1456214089-13954-2-git-send-email-mpa@pengutronix.de>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Markus Pargmann <mpa@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Add include paths to the Makefile so that linux/gpio.h can be found even
on systems without this header.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 tools/gpio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 4d198d5c4203..3f5b3f427b9c 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -1,5 +1,5 @@
 CC = $(CROSS_COMPILE)gcc
-CFLAGS += -Wall -g -D_GNU_SOURCE
+CFLAGS += -Wall -g -D_GNU_SOURCE -I ../include -I ../../include/uapi
 
 all: lsgpio
 
-- 
2.7.0

