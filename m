From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [PATCH 1/1] of: add vendor prefix for ISEE 2007 S.L.
Date: Thu, 24 Oct 2013 22:40:19 +0200
Message-ID: <1382647219-6118-1-git-send-email-javier@dowhile0.org>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>
List-Id: devicetree@vger.kernel.org

This trivial patch adds ISEE 2007 S.L. to the list of
devicetree vendor prefixes.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2956800..becc6f9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -34,6 +34,7 @@ ibm	International Business Machines (IBM)
 idt	Integrated Device Technologies, Inc.
 img	Imagination Technologies Ltd.
 intercontrol	Inter Control Group
+isee	ISEE 2007 S.L.
 linux	Linux-specific binding
 lsi	LSI Corp. (LSI Logic)
 marvell	Marvell Technology Group Ltd.
-- 
1.8.4.rc3

