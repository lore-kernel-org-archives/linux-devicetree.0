From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] pinctrl: remove duplicated include from pinctrl-xway.c
Date: Wed, 10 Oct 2012 20:59:32 +0800
Message-ID: <CAPgLHd_XnZU_E3zso2F1y1GFYHewrGUSSSf8yG9LRjVkbpGL=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove duplicated include.

dpatch engine is used to auto generate this patch.
(https://github.com/weiyj/dpatch)

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/pinctrl/pinctrl-xway.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index f8d917d..b9bcaec 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -17,8 +17,6 @@
 #include <linux/ioport.h>
 #include <linux/io.h>
 #include <linux/device.h>
-#include <linux/module.h>
-#include <linux/io.h>
 #include <linux/platform_device.h>
 
 #include "pinctrl-lantiq.h"
