From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: [PATCH 1/2] of: Add Semtech Corp. vendor prefix
Date: Thu, 12 Apr 2012 13:20:12 +0200
Message-ID: <1334229613-678-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: linux-input@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

This commit adds a device tree vendor prefix for Semtech Corp.

Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@lists.ozlabs.org
Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 6b6e465..19af408 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -44,6 +44,7 @@ simtek
 sirf	SiRF Technology, Inc.
 st	STMicroelectronics
 stericsson	ST-Ericsson
+sx	Semtech Corp.
 ti	Texas Instruments
 wlf	Wolfson Microelectronics
 xlnx	Xilinx
-- 
1.7.10

