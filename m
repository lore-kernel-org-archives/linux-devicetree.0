From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2] of: Add empty of_device_is_available() function
Date: Thu, 14 Feb 2013 09:37:12 +0900
Message-ID: <1360802233-19289-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds an empty of_device_is_available() function for
!CONFIG_OF builds.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
V1: Fix email address.

 include/linux/of.h |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 5ebcc5c..0be17ad 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -377,6 +377,11 @@ static inline int of_device_is_compatible(const struct device_node *device,
 	return 0;
 }
 
+static inline int of_device_is_available(const struct device_node *device)
+{
+	return 0;
+}
+
 static inline struct property *of_find_property(const struct device_node *np,
 						const char *name,
 						int *lenp)
-- 
1.7.10.4
