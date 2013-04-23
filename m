From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/8] metag: of_platform_populate from arch generic code
Date: Tue, 23 Apr 2013 15:33:20 +0100
Message-ID: <1366727607-27444-2-git-send-email-james.hogan@imgtec.com>
References: <1366727607-27444-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366727607-27444-1-git-send-email-james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

If no init_machine callback is provided, call of_platform_populate()
instead. This allows a board/SoC that only needs to call
of_platform_populate to omit the callback altogether.

Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 arch/metag/kernel/setup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/metag/kernel/setup.c b/arch/metag/kernel/setup.c
index 4f5726f..e18cebb 100644
--- a/arch/metag/kernel/setup.c
+++ b/arch/metag/kernel/setup.c
@@ -20,6 +20,7 @@
 #include <linux/memblock.h>
 #include <linux/mm.h>
 #include <linux/of_fdt.h>
+#include <linux/of_platform.h>
 #include <linux/pfn.h>
 #include <linux/root_dev.h>
 #include <linux/sched.h>
@@ -424,6 +425,9 @@ static int __init customize_machine(void)
 	/* customizes platform devices, or adds new ones */
 	if (machine_desc->init_machine)
 		machine_desc->init_machine();
+	else
+		of_platform_populate(NULL, of_default_bus_match_table, NULL,
+				     NULL);
 	return 0;
 }
 arch_initcall(customize_machine);
-- 
1.8.1.2
