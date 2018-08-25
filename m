Return-Path: <SRS0=YVKm=LI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37080 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbeHYVgo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Aug 2018 17:36:44 -0400
Received: by mail-pl1-f194.google.com with SMTP id c6-v6so2385388pls.4
        for <devicetree@vger.kernel.org>; Sat, 25 Aug 2018 10:57:05 -0700 (PDT)
From: sim manseop <semtax33@gmail.com>
Subject: [PATCH] staging: i2c: fix typo in brcm,bcm2835-i2c.txt
Date: Sat, 25 Aug 2018 17:56:57 +0000
Message-Id: <20180825175657.4103-1-semtax33@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: sim manseop <semtax33@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Fix typo brcm,bcm2835-i2c.txt between dts address and register address mismatch.
Signed-off-by: manseop sim <semtax33@gmail.com>
---
 Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
index e9de3756752b..ec78f84893ec 100644
--- a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
@@ -11,7 +11,7 @@ Recommended properties:
 
 Example:
 
-i2c@20205000 {
+i2c@7e205000 {
 	compatible = "brcm,bcm2835-i2c";
 	reg = <0x7e205000 0x1000>;
 	interrupts = <2 21>;
-- 
2.17.1
