From: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: Fix device tree blob corruption.
Date: Tue, 21 Sep 2010 11:54:52 +0530
Message-ID: <1285050292-11216-1-git-send-email-shaju.abraham@linaro.org>
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

The device tree support for arm is broken in git://git.secretlab.ca/git/linux-2.6.git test-devtree. 
due to not reserving the memory used by the device tree blob.The device tree blob gets corrupted
as a result. The patch reserves the memblock used by device tree blob.

Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mm/init.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 018b76e..c03ceb9 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -310,6 +310,8 @@ void __init arm_memblock_init(struct meminfo *mi, struct machine_desc *mdesc)
 	}
 #endif
 #ifdef CONFIG_OF_FLATTREE
+	if (phys_devtree_size)
+		memblock_reserve(phys_devtree_start, phys_devtree_size);
 	if (phys_initrd_size)
 		memblock_reserve(phys_initrd_start, phys_initrd_size);
 #endif
-- 
1.7.2
