From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 08/11] powerpc/5200: convert mpc5200 to use
	of_platform_populate()
Date: Wed, 15 Jun 2011 22:42:43 -0600
Message-ID: <20110616044238.29371.57578.stgit@ponder>
References: <20110616042653.29371.2052.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110616042653.29371.2052.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinu
List-Id: devicetree@vger.kernel.org

of_platform_populate() also handles nodes at the root of the tree,
which is wanted for things like describing the sound complex.  This
patch converts mpc5200 support to use of_platform_populate() instead
of of_platform_bus_probe().

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 arch/powerpc/platforms/52xx/mpc52xx_common.c |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_common.c b/arch/powerpc/platforms/52xx/mpc52xx_common.c
index 41f3a7e..6a2fde2 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_common.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_common.c
@@ -97,13 +97,11 @@ struct mpc52xx_gpio_wkup __iomem *wkup_gpio;
  *					of the localplus bus to the of_platform
  *					bus.
  */
-void __init
-mpc52xx_declare_of_platform_devices(void)
+void __init mpc52xx_declare_of_platform_devices(void)
 {
-	/* Find every child of the SOC node and add it to of_platform */
-	if (of_platform_bus_probe(NULL, mpc52xx_bus_ids, NULL))
-		printk(KERN_ERR __FILE__ ": "
-			"Error while probing of_platform bus\n");
+	/* Find all the 'platform' devices and register them. */
+	if (of_platform_populate(NULL, mpc52xx_bus_ids, NULL, NULL))
+		pr_err(__FILE__ ": Error while populating devices from DT\n");
 }
 
 /*
