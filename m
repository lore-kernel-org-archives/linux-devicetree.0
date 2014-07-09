From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/13] of: Add vendor prefix for Sitronix
Date: Wed,  9 Jul 2014 14:23:31 +0200
Message-ID: <1404908623-909-2-git-send-email-geert+renesas@glider.be>
References: <1404908623-909-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404908623-909-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The stock ticker for Sitronix is just a number.
"sitronix,st1232" is used for the Sitronix st1232 touchscreen controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 46a311e728a8..967bb7797a54 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -120,6 +120,7 @@ silabs	Silicon Laboratories
 simtek
 sii	Seiko Instruments, Inc.
 sirf	SiRF Technology, Inc.
+sitronix	Sitronix Technology Corporation
 smsc	Standard Microsystems Corporation
 snps 	Synopsys, Inc.
 spansion	Spansion Inc.
-- 
1.9.1
