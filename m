From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] of/flattree: forward declare struct device_node in of_fdt.h
Date: Sat, 08 Jan 2011 21:30:49 -0700
Message-ID: <20110109043049.12860.28198.stgit@localhost6.localdomain6>
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

This patch forward declares struct device_node to fix a compile error
when of_fdt.h is included, but of.h is not.  Alternately, including
linux/of.h could have been added to of_fdt.h, but that pulls in a lot
of unnecessary declarations when only working with the flattened
form.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 include/linux/of_fdt.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index fb327f3..38cc8eb 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -59,6 +59,8 @@ struct boot_param_header {
 
 #if defined(CONFIG_OF_FLATTREE)
 
+struct device_node;
+
 /* For scanning an arbitrary device-tree at any time */
 extern char *of_fdt_get_string(struct boot_param_header *blob, u32 offset);
 extern void *of_fdt_get_property(struct boot_param_header *blob,
