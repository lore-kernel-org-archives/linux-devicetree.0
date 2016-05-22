From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 40/54] MAINTAINERS: Add file patterns for regmap device tree bindings
Date: Sun, 22 May 2016 11:06:17 +0200
Message-ID: <1463907991-7916-41-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1942e29d55320f01..d419cdbe35cbacab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9603,6 +9603,7 @@ M:	Mark Brown <broonie@kernel.org>
 L:	linux-kernel@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
 S:	Supported
+F:	Documentation/devicetree/bindings/regmap/
 F:	drivers/base/regmap/
 F:	include/linux/regmap.h
 
-- 
1.9.1
