Return-Path: <devicetree-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:57207 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751319Ab3HTQlC (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 12:41:02 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/2] of: add vendor prefix for Mentor Graphics
Date: Tue, 20 Aug 2013 18:40:26 +0200
Message-Id: <1377016827-26827-1-git-send-email-bigeasy@linutronix.de>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Lee Jones <lee.jones@linaro.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-ID: <devicetree@vger.kernel.org>

This prefix is currently used for the musb driver.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 366ce9b..3065e79 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -36,6 +36,7 @@ linux	Linux-specific binding
 lsi	LSI Corp. (LSI Logic)
 marvell	Marvell Technology Group Ltd.
 maxim	Maxim Integrated Products
+mentor	Mentor Graphics
 mosaixtech	Mosaix Technologies, Inc.
 national	National Semiconductor
 nintendo	Nintendo
-- 
1.8.4.rc2

