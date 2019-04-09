Return-Path: <SRS0=MvHc=SL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr740048.outbound.protection.outlook.com ([40.107.74.48]:37664
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726129AbfDIGUF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 9 Apr 2019 02:20:05 -0400
From: <michael.hennerich@analog.com>
Subject: [PATCH v3 2/2] power: supply: ltc3651-charger: Fix device name (rename files)
Date: Tue, 9 Apr 2019 08:24:41 +0200
Message-ID: <1554791081-10950-2-git-send-email-michael.hennerich@analog.com>
In-Reply-To: <1554791081-10950-1-git-send-email-michael.hennerich@analog.com>
References: <1554791081-10950-1-git-send-email-michael.hennerich@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: mike.looijmans@topic.nl, sre@kernel.org, robh+dt@kernel.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, robin.getz@analog.com, Michael Hennerich <michael.hennerich@analog.com>
List-ID: <devicetree@vger.kernel.org>

From: Michael Hennerich <michael.hennerich@analog.com>

rename only - no functional changes

Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
---
 .../bindings/power/supply/{ltc3651-charger.txt => lt3651-charger.txt}   | 0
 drivers/power/supply/Makefile                                           | 2 +-
 drivers/power/supply/{ltc3651-charger.c => lt3651-charger.c}            | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/power/supply/{ltc3651-charger.txt => lt3651-charger.txt} (100%)
 rename drivers/power/supply/{ltc3651-charger.c => lt3651-charger.c} (100%)

diff --git a/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt b/Documentation/devicetree/bindings/power/supply/lt3651-charger.txt
similarity index 100%
rename from Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
rename to Documentation/devicetree/bindings/power/supply/lt3651-charger.txt
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 714c602..a2b3ab1 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -67,7 +67,7 @@ obj-$(CONFIG_CHARGER_LP8727)	+= lp8727_charger.o
 obj-$(CONFIG_CHARGER_LP8788)	+= lp8788-charger.o
 obj-$(CONFIG_CHARGER_GPIO)	+= gpio-charger.o
 obj-$(CONFIG_CHARGER_MANAGER)	+= charger-manager.o
-obj-$(CONFIG_CHARGER_LT3651)	+= ltc3651-charger.o
+obj-$(CONFIG_CHARGER_LT3651)	+= lt3651-charger.o
 obj-$(CONFIG_CHARGER_MAX14577)	+= max14577_charger.o
 obj-$(CONFIG_CHARGER_DETECTOR_MAX14656)	+= max14656_charger_detector.o
 obj-$(CONFIG_CHARGER_MAX77693)	+= max77693_charger.o
diff --git a/drivers/power/supply/ltc3651-charger.c b/drivers/power/supply/lt3651-charger.c
similarity index 100%
rename from drivers/power/supply/ltc3651-charger.c
rename to drivers/power/supply/lt3651-charger.c
-- 
2.7.4
