From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] DT: Add vendor prefix for Spansion Inc.
Date: Tue,  4 Feb 2014 22:59:09 +0100
Message-ID: <1391551149-15958-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@linux-m68k.org>

This is already in active use in several DTS files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 3f900cd51bf0..29afbdedec3c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -78,6 +78,7 @@ silabs	Silicon Laboratories
 simtek
 sirf	SiRF Technology, Inc.
 snps 	Synopsys, Inc.
+spansion	Spansion Inc.
 st	STMicroelectronics
 ste	ST-Ericsson
 stericsson	ST-Ericsson
-- 
1.7.9.5
