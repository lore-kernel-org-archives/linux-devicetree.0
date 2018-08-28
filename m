Return-Path: <SRS0=s5iF=LL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38807 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbeH1Qkh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Aug 2018 12:40:37 -0400
Received: by mail-pl1-f194.google.com with SMTP id u11-v6so687203plq.5
        for <devicetree@vger.kernel.org>; Tue, 28 Aug 2018 05:49:06 -0700 (PDT)
From: sim manseop <semtax33@gmail.com>
Subject: [PATCH 2/2] dt-bindings: fix document typo
Date: Tue, 28 Aug 2018 12:48:58 +0000
Message-Id: <20180828124858.2183-1-semtax33@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: sim manseop <semtax33@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Fix Documentation typo : (SMbus -> SMBus)

Signed-off-by: manseop sim <semtax33@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index 11263982470e..44efafdfd7f5 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -84,7 +84,7 @@ Binding may contain optional "interrupts" property, describing interrupts
 used by the device. I2C core will assign "irq" interrupt (or the very first
 interrupt if not using interrupt names) as primary interrupt for the slave.
 
-Alternatively, devices supporting SMbus Host Notify, and connected to
+Alternatively, devices supporting SMBus Host Notify, and connected to
 adapters that support this feature, may use "host-notify" property. I2C
 core will create a virtual interrupt for Host Notify and assign it as
 primary interrupt for the slave.
-- 
2.17.1
