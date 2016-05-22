From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 11/54] MAINTAINERS: Add file patterns for clock device tree bindings
Date: Sun, 22 May 2016 11:05:48 +0200
Message-ID: <1463907991-7916-12-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 47dac1ce82896697..4c9f31233670e9dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3095,6 +3095,7 @@ M:	Stephen Boyd <sboyd@codeaurora.org>
 L:	linux-clk@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
 S:	Maintained
+F:	Documentation/devicetree/bindings/clock/
 F:	drivers/clk/
 X:	drivers/clk/clkdev.c
 F:	include/linux/clk-pr*
-- 
1.9.1
