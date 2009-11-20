From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: [PATCH 4/4 v2] Include of_dynamic.h in pseries/reconfig.c
Date: Fri, 20 Nov 2009 09:09:13 -0600
Message-ID: <4B06B119.1080402@austin.ibm.com>
References: <4B06AF33.1000400@austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4B06AF33.1000400-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Include the newly created linux/of_dynamic.h to pick up the 
of_[attach,detach]_node declarations.

Signed-off-by: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>

---
 arch/powerpc/platforms/pseries/reconfig.c |    1 +
 1 file changed, 1 insertion(+)

Index: test-devicetree/arch/powerpc/platforms/pseries/reconfig.c
===================================================================
--- test-devicetree.orig/arch/powerpc/platforms/pseries/reconfig.c	2009-11-20 11:59:00.000000000 -0600
+++ test-devicetree/arch/powerpc/platforms/pseries/reconfig.c	2009-11-20 12:37:32.000000000 -0600
@@ -15,6 +15,7 @@
 #include <linux/kref.h>
 #include <linux/notifier.h>
 #include <linux/proc_fs.h>
+#include <linux/of_dynamic.h>
 
 #include <asm/prom.h>
 #include <asm/machdep.h>
