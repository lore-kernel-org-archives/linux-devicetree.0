Return-Path: <SRS0=kqCD=VI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.bugwerft.de ([46.23.86.59]:35042 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726016AbfGKMpP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 11 Jul 2019 08:45:15 -0400
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 1/2] device-tree: bindinds: add NXP PCT2075 as compatible device to LM75
Date: Thu, 11 Jul 2019 14:45:03 +0200
Message-Id: <20190711124504.7580-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

The PCT2075 is compatible to other chips that are already handled by
the LM75 driver.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 Documentation/devicetree/bindings/hwmon/lm75.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
index 12d8cf7cf592..bfb22b249708 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.txt
+++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
@@ -15,6 +15,7 @@ Required properties:
 		"maxim,max31725",
 		"maxim,max31726",
 		"maxim,mcp980x",
+		"nxp,pct2075",
 		"st,stds75",
 		"st,stlm75",
 		"microchip,tcn75",
-- 
2.21.0
