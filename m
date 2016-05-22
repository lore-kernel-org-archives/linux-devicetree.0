From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 30/54] MAINTAINERS: Add file patterns for mips device tree bindings
Date: Sun, 22 May 2016 11:06:07 +0200
Message-ID: <1463907991-7916-31-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 48ef0bd805968787..c1e413b2c61a9746 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7536,6 +7536,7 @@ W:	http://www.linux-mips.org/
 T:	git git://git.linux-mips.org/pub/scm/ralf/linux.git
 Q:	http://patchwork.linux-mips.org/project/linux-mips/list/
 S:	Supported
+F:	Documentation/devicetree/bindings/mips/
 F:	Documentation/mips/
 F:	arch/mips/
 
-- 
1.9.1
