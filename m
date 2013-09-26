From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 11/21] mips: add explicit includes of prom.h
Date: Thu, 26 Sep 2013 13:50:46 -0500
Message-ID: <1380221456-11192-12-git-send-email-robherring2@gmail.com>
References: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

In preparation of removing prom.h include by of.h, add explicit includes.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/lantiq/prom.c           | 1 +
 arch/mips/mti-sead3/sead3-setup.c | 2 ++
 arch/mips/ralink/of.c             | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/mips/lantiq/prom.c b/arch/mips/lantiq/prom.c
index 49c4603..19686c5 100644
--- a/arch/mips/lantiq/prom.c
+++ b/arch/mips/lantiq/prom.c
@@ -14,6 +14,7 @@
 
 #include <asm/bootinfo.h>
 #include <asm/time.h>
+#include <asm/prom.h>
 
 #include <lantiq.h>
 
diff --git a/arch/mips/mti-sead3/sead3-setup.c b/arch/mips/mti-sead3/sead3-setup.c
index b5059dc..928ba84 100644
--- a/arch/mips/mti-sead3/sead3-setup.c
+++ b/arch/mips/mti-sead3/sead3-setup.c
@@ -10,6 +10,8 @@
 #include <linux/of_fdt.h>
 #include <linux/bootmem.h>
 
+#include <asm/prom.h>
+
 #include <asm/mips-boards/generic.h>
 
 const char *get_system_type(void)
diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
index ce38d11..58c4fd52 100644
--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -21,6 +21,7 @@
 #include <asm/reboot.h>
 #include <asm/bootinfo.h>
 #include <asm/addrspace.h>
+#include <asm/prom.h>
 
 #include "common.h"
 
-- 
1.8.1.2
