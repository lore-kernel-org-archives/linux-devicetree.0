From: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Subject: [PATCH 4/9] arch/powerpc/platforms/powermac: Drop unnecessary null
	test
Date: Tue, 3 Aug 2010 23:33:43 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1008032333250.20393__22493.1770623245$1280871278$gmane$org@ask.diku.dk>
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
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>

for_each_node_by_name binds its first argument to a non-null value, and
thus any null test on the value of that argument is superfluous.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
iterator I;
expression x,E;
@@

I(x,...) { <...
(
- (x != NULL) &&
  E
  ...> }
// </smpl>

Signed-off-by: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>

---
 arch/powerpc/platforms/powermac/feature.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index 9e1b9fd..537957b 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -2867,7 +2867,7 @@ set_initial_features(void)
 
 		/* Switch airport off */
 		for_each_node_by_name(np, "radio") {
-			if (np && np->parent == macio_chips[0].of_node) {
+			if (np->parent == macio_chips[0].of_node) {
 				macio_chips[0].flags |= MACIO_FLAG_AIRPORT_ON;
 				core99_airport_enable(np, 0, 0);
 			}
