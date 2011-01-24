From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [PATCH OF 12/14] x86/rtc: don't register rtc if we the DT blob
Date: Mon, 24 Jan 2011 09:59:00 +0530
Message-ID: <1295843342-1122-13-git-send-email-bigeasy@linutronix.de>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1295843342-1122-1-git-send-email-bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

or we might end up with two device nodes for the same hardware.

Cc: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
 arch/x86/kernel/rtc.c |    3 +++
 include/linux/of.h    |   12 ++++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/rtc.c b/arch/x86/kernel/rtc.c
index 6f39cab..3f2ad26 100644
--- a/arch/x86/kernel/rtc.c
+++ b/arch/x86/kernel/rtc.c
@@ -6,6 +6,7 @@
 #include <linux/acpi.h>
 #include <linux/bcd.h>
 #include <linux/pnp.h>
+#include <linux/of.h>
 
 #include <asm/vsyscall.h>
 #include <asm/x86_init.h>
@@ -236,6 +237,8 @@ static __init int add_rtc_cmos(void)
 		}
 	}
 #endif
+	if (of_have_populated_dt())
+		return 0;
 
 	platform_device_register(&rtc_device);
 	dev_info(&rtc_device.dev,
diff --git a/include/linux/of.h b/include/linux/of.h
index cad7cf0..016968d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -70,6 +70,11 @@ extern struct device_node *allnodes;
 extern struct device_node *of_chosen;
 extern rwlock_t devtree_lock;
 
+static inline int of_have_populated_dt(void)
+{
+	return allnodes != NULL;
+}
+
 static inline bool of_node_is_root(const struct device_node *node)
 {
 	return node && (node->parent == NULL);
@@ -222,5 +227,12 @@ extern void of_attach_node(struct device_node *);
 extern void of_detach_node(struct device_node *);
 #endif
 
+#else
+
+static inline int of_have_populated_dt(void)
+{
+	return 0;
+}
+
 #endif /* CONFIG_OF */
 #endif /* _LINUX_OF_H */
-- 
1.7.3.2
