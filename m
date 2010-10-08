From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/2 v2] of: move phandle/ihandle into types.h and export to
	userspace
Date: Fri, 8 Oct 2010 00:43:54 -0700
Message-ID: <20101008004354.13b5b254@debxo>
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
To: sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


We need phandle for some exported sparc headers; of.h isn't an
exported header, and it would be silly to export it when all we
really need is one or two types from it.  Also, later patches
use phandle in structs that are exported to userspace, so export
a __kernel_phandle type.

Signed-off-by: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
---
 include/linux/of.h    |    3 ---
 include/linux/types.h |    7 +++++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index cad7cf0..db184dc 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -25,9 +25,6 @@
 
 #ifdef CONFIG_OF
 
-typedef u32 phandle;
-typedef u32 ihandle;
-
 struct property {
 	char	*name;
 	int	length;
diff --git a/include/linux/types.h b/include/linux/types.h
index 01a082f..67a034a 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -178,10 +178,17 @@ typedef __u64 __bitwise __be64;
 typedef __u16 __bitwise __sum16;
 typedef __u32 __bitwise __wsum;
 
+/* Basic openboot/openfirmware types */
+typedef __u32 __kernel_phandle;
+typedef __u32 __kernel_ihandle;
+
 #ifdef __KERNEL__
 typedef unsigned __bitwise__ gfp_t;
 typedef unsigned __bitwise__ fmode_t;
 
+typedef __kernel_phandle phandle;
+typedef __kernel_ihandle ihandle;
+
 #ifdef CONFIG_PHYS_ADDR_T_64BIT
 typedef u64 phys_addr_t;
 #else
-- 
1.5.6.5
