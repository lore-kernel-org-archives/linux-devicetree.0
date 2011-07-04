From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dt: add 'const' for of_property_read_string parameter
	**out_string
Date: Mon,  4 Jul 2011 09:01:18 +0800
Message-ID: <1309741278-26776-1-git-send-email-shawn.guo@linaro.org>
References: <20110703210312.GA13742@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110703210312.GA13742-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The existing dt codes usually call of_get_property to get a string
property and save it as a 'const char *'.  The patch adds'const' for
of_property_read_string parameter **out_string to make the converting
of existing code a little easier.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/base.c  |    2 +-
 include/linux/of.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b8b65fd..57ec27b 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -639,7 +639,7 @@ EXPORT_SYMBOL_GPL(of_property_read_u32);
  * The out_string pointer is modified only if a valid string can be decoded.
  */
 int of_property_read_string(struct device_node *np, char *propname,
-				char **out_string)
+				const char **out_string)
 {
 	struct property *prop = of_find_property(np, propname, NULL);
 	if (!prop)
diff --git a/include/linux/of.h b/include/linux/of.h
index 4fc4c1b..b238520 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -198,7 +198,7 @@ extern struct property *of_find_property(const struct device_node *np,
 extern int of_property_read_u32(struct device_node *np, char *propname,
 					u32 *out_value);
 extern int of_property_read_string(struct device_node *np, char *propname,
-					char **out_string);
+					const char **out_string);
 extern int of_device_is_compatible(const struct device_node *device,
 				   const char *);
 extern int of_device_is_available(const struct device_node *device);
-- 
1.7.4.1
