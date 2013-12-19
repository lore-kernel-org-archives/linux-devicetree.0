From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/2] of: add vendor prefix for Mentor Graphics
Date: Thu, 19 Dec 2013 17:25:50 +0100
Message-ID: <1387470351-4696-1-git-send-email-bigeasy@linutronix.de>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Felipe Balbi <balbi@ti.com>, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: devicetree@vger.kernel.org

This prefix is currently used for the musb driver.

Acked-by: Stephen Warren <swarren@nvidia.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8c75d85..cb5c438 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -43,6 +43,7 @@ linux	Linux-specific binding
 lsi	LSI Corp. (LSI Logic)
 marvell	Marvell Technology Group Ltd.
 maxim	Maxim Integrated Products
+mentor	Mentor Graphics
 microchip	Microchip Technology Inc.
 mosaixtech	Mosaix Technologies, Inc.
 national	National Semiconductor
-- 
1.8.5.1

