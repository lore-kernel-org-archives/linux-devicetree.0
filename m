From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH] of: Add vendor prefix for Cadence
Date: Fri,  1 Nov 2013 08:42:04 -0700
Message-ID: <1383320524-17689-1-git-send-email-soren.brinkmann@xilinx.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

Drivers like clocksource/cadence_ttc and net/macb already use the 'cdns'
prefix for Cadence IP.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2956800f0240..1ce180ce610d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -16,6 +16,7 @@ avago	Avago Technologies
 bosch	Bosch Sensortec GmbH
 brcm	Broadcom Corporation
 cavium	Cavium, Inc.
+cdns	Cadence Design Systems Inc.
 chrp	Common Hardware Reference Platform
 cirrus	Cirrus Logic, Inc.
 cortina	Cortina Systems, Inc.
-- 
1.8.4.1

