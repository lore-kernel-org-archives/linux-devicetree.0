From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 2/4] drivers: base: cacheinfo: fix boot error message when acpi is enabled
Date: Fri, 28 Oct 2016 09:45:29 +0100
Message-ID: <1477644331-25559-3-git-send-email-sudeep.holla@arm.com>
References: <1477644331-25559-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477644331-25559-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

ARM64 enables both CONFIG_OF and CONFIG_ACPI and the firmware can pass
both ACPI tables and the device tree. Based on the kernel parameter, one
of the two will be chosen. If acpi is enabled, then device tree is not
unflattened.

Currently ARM64 platforms report:
"
	Failed to find cpu0 device node
	Unable to detect cache hierarchy from DT for CPU 0
"
which is incorrect when booting with ACPI. Also latest ACPI v6.1 has no
support for cache properties/hierarchy.

This patch adds check for unflattened device tree and also returns as
"not supported" if ACPI is runtime enabled.

It also removes the reference to DT from the error message as the cache
hierarchy can be detected from the firmware(OF/DT/ACPI)

Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 drivers/base/cacheinfo.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index ecde8957835a..70e13cf06ed0 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -16,6 +16,7 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
+#include <linux/acpi.h>
 #include <linux/bitops.h>
 #include <linux/cacheinfo.h>
 #include <linux/compiler.h>
@@ -104,12 +105,16 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *this_leaf, *sib_leaf;
 	unsigned int index;
-	int ret;
+	int ret = 0;
 
 	if (this_cpu_ci->cpu_map_populated)
 		return 0;
 
-	ret = cache_setup_of_node(cpu);
+	if (of_have_populated_dt())
+		ret = cache_setup_of_node(cpu);
+	else if (!acpi_disabled)
+		/* No cache property/hierarchy support yet in ACPI */
+		ret = -ENOTSUPP;
 	if (ret)
 		return ret;
 
@@ -206,8 +211,7 @@ static int detect_cache_attributes(unsigned int cpu)
 	 */
 	ret = cache_shared_cpu_map_setup(cpu);
 	if (ret) {
-		pr_warn("Unable to detect cache hierarchy from DT for CPU %d\n",
-			cpu);
+		pr_warn("Unable to detect cache hierarchy for CPU %d\n", cpu);
 		goto free_ci;
 	}
 	return 0;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
