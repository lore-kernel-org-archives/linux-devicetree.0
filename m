From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH resend] OF/device-tree: Add some entries to vendor-prefixes.txt
Date: Wed, 14 Dec 2011 15:26:19 -0800
Message-ID: <1323905179-28355-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney@cavium.com>

We are currently using 'cavium', 'cortina' and 'st', add them to the
list of known prefixes.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index afb9bff..6708797 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -8,7 +8,9 @@ amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
 apm	Applied Micro Circuits Corporation (APM)
 arm	ARM Ltd.
 atmel	Atmel Corporation
+cavium	Cavium, Inc.
 chrp	Common Hardware Reference Platform
+cortina	Cortina Systems, Inc.
 dallas	Maxim Integrated Products (formerly Dallas Semiconductor)
 denx	Denx Software Engineering
 epson	Seiko Epson Corp.
@@ -36,6 +38,7 @@ schindler	Schindler
 sil	Silicon Image
 simtek
 sirf	SiRF Technology, Inc.
+st	STMicroelectronics
 stericsson	ST-Ericsson
 ti	Texas Instruments
 wlf	Wolfson Microelectronics
-- 
1.7.2.3
