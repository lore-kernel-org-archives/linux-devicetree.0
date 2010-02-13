From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 6/9] of: remove unused extern reference to devtree_lock
Date: Sat, 13 Feb 2010 09:02:58 -0700
Message-ID: <20100213160258.4767.22371.stgit__46726.4805025936$1266077255$gmane$org@angua>
References: <20100213154838.4767.83881.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100213154838.4767.83881.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, sparclinu
List-Id: devicetree@vger.kernel.org

Neither the powerpc nor the microblaze code use devtree_lock anymore.
Remove the extern reference.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/microblaze/include/asm/prom.h |    2 --
 arch/powerpc/kernel/prom.c         |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/microblaze/include/asm/prom.h b/arch/microblaze/include/asm/prom.h
index ddc5c57..8b1ebd3 100644
--- a/arch/microblaze/include/asm/prom.h
+++ b/arch/microblaze/include/asm/prom.h
@@ -30,8 +30,6 @@ extern struct device_node *of_chosen;
 
 #define HAVE_ARCH_DEVTREE_FIXUPS
 
-extern rwlock_t devtree_lock;	/* temporary while merging */
-
 /* Other Prototypes */
 extern int early_uartlite_console(void);
 
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 5bbbdb2..4869c93 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -67,8 +67,6 @@ int __initdata iommu_force_on;
 unsigned long tce_alloc_start, tce_alloc_end;
 #endif
 
-extern rwlock_t devtree_lock;	/* temporary while merging */
-
 /* export that to outside world */
 struct device_node *of_chosen;
