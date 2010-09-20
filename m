From: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Fix the Kernel Crash if Initrd is not passed in Device tree
Date: Mon, 20 Sep 2010 15:58:54 +0530
Message-ID: <1284978534-30944-1-git-send-email-shaju.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The code should check for the size of the phys_initrd_size rather than
phys_devtree_size before calling memblock_reserve().If initrd is not passed
from the Device Tree  the parameters phys_initrd_start, and phys_initrd_size are
zeros.The kernel complaints with a BUG if the arguments passed to memblock_reserve
are zeroes.

Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
This patch applies to Grant Likely's tree test-devtree branch

 arch/arm/mm/init.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 9ddace8..018b76e 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -310,7 +310,7 @@ void __init arm_memblock_init(struct meminfo *mi, struct machine_desc *mdesc)
 	}
 #endif
 #ifdef CONFIG_OF_FLATTREE
-	if (phys_devtree_size)
+	if (phys_initrd_size)
 		memblock_reserve(phys_initrd_start, phys_initrd_size);
 #endif
 
-- 
1.7.2
