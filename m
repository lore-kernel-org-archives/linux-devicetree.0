From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v3 5/5] dt/tty/opal: Use of_get_child_by_name to get a named
 child.
Date: Mon, 17 Sep 2012 09:58:16 +0100
Message-ID: <1347872296-3812-1-git-send-email-srinivas.kandagatla@st.com>
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
To: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>

As follow-up to "dt: introduce of_get_child_by_name to get child node by
name." patch, This patch removes some of the code duplication in the
driver by replacing it with of_get_child_by_name instead.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
---
 drivers/tty/hvc/hvc_opal.c |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 0d2ea0c..4c7d161 100644
--- a/drivers/tty/hvc/hvc_opal.c
+++ b/drivers/tty/hvc/hvc_opal.c
@@ -344,7 +344,7 @@ void __init hvc_opal_init_early(void)
 			return;
 		}
 	} else {
-		struct device_node *opal, *np;
+		struct device_node *opal;
 
 		/* Current OPAL takeover doesn't provide the stdout
 		 * path, so we hard wire it
@@ -360,12 +360,7 @@ void __init hvc_opal_init_early(void)
 		}
 		if (!opal)
 			return;
-		for_each_child_of_node(opal, np) {
-			if (!strcmp(np->name, "serial")) {
-				stdout_node = np;
-				break;
-			}
-		}
+		stdout_node = of_get_child_by_name(opal, "serial");
 		of_node_put(opal);
 	}
 	if (!stdout_node)
-- 
1.7.0.4
