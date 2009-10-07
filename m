From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 04/12] of: Move OF_IS_DYNAMIC and OF_MARK_DYNAMIC macros
	to of.h
Date: Tue, 06 Oct 2009 22:30:47 -0600
Message-ID: <20091007043039.16890.182.stgit__38773.4320517213$1254890060$gmane$org@angua>
References: <20091007041007.16890.62194.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091007041007.16890.62194.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, microblaze-uclinux
List-Id: devicetree@vger.kernel.org

Merge of common code duplicated between Sparc, PowerPC and Microblaze

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/sparc/include/asm/prom.h |    3 ---
 include/linux/of.h            |    3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/include/asm/prom.h b/arch/sparc/include/asm/prom.h
index e5f4a1d..ddbd870 100644
--- a/arch/sparc/include/asm/prom.h
+++ b/arch/sparc/include/asm/prom.h
@@ -34,9 +34,6 @@ struct of_irq_controller {
 	void		*data;
 };
 
-#define OF_IS_DYNAMIC(x) test_bit(OF_DYNAMIC, &x->_flags)
-#define OF_MARK_DYNAMIC(x) set_bit(OF_DYNAMIC, &x->_flags)
-
 extern struct device_node *of_find_node_by_cpuid(int cpuid);
 extern int of_set_property(struct device_node *node, const char *name, void *val, int len);
 extern struct mutex of_set_property_mutex;
diff --git a/include/linux/of.h b/include/linux/of.h
index 65a158d..a66c1eb 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -69,6 +69,9 @@ struct device_node {
 #define OF_DYNAMIC	1 /* node and properties were allocated via kmalloc */
 #define OF_DETACHED	2 /* node has been detached from the device tree */
 
+#define OF_IS_DYNAMIC(x) test_bit(OF_DYNAMIC, &x->_flags)
+#define OF_MARK_DYNAMIC(x) set_bit(OF_DYNAMIC, &x->_flags)
+
 #define OF_BAD_ADDR	((u64)-1)
 
 extern struct device_node *of_find_node_by_name(struct device_node *from,
