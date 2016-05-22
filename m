From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 15/54] MAINTAINERS: Add file patterns for dma device tree bindings
Date: Sun, 22 May 2016 11:05:52 +0200
Message-ID: <1463907991-7916-16-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vinod Koul <vinod.koul@intel.com>
Cc: dmaengine@vger.kernel.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0079717d52e46222..c79b99dd3a0bf22d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3786,6 +3786,7 @@ Q:	https://patchwork.kernel.org/project/linux-dmaengine/list/
 S:	Maintained
 F:	drivers/dma/
 F:	include/linux/dmaengine.h
+F:	Documentation/devicetree/bindings/dma/
 F:	Documentation/dmaengine/
 T:	git git://git.infradead.org/users/vkoul/slave-dma.git
 
-- 
1.9.1
