From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 2/2] Allow nodes at the root to be specified by path as well
	as by label.
Date: Mon, 18 Oct 2010 13:25:50 -0700
Message-ID: <20101018202540.24286.12690.stgit@riker>
References: <20101018202353.24286.74857.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101018202353.24286.74857.stgit@riker>
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

Changes to allow us to specify a node by it's path. A path can be used in
place of a label.

This is particularly useful when overriding existing nodes.
This way we don't have to label every possible node in a device tree we know
is a base device tree for a class of systems, and we know the tree will be
modified for the specific systems.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 dtc-parser.y |   16 ++++++++++++----
 1 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 56d7789..0efd0cc 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -134,22 +134,30 @@ devicetree:
 		{
 			struct node *target;
 
-			target = get_node_by_label($1, $2);
+			if ($2[0] == '/')
+				target = get_node_by_path($1, $2);
+			else
+				target = get_node_by_label($1, $2);
+
 			if (target)
 				merge_nodes(target, $3);
 			else
-				print_error("label, '%s' not found", $2);
+				print_error("label or path, '%s', not found", $2);
 			$$ = $1;
 		}
 	| devicetree DT_REMOVENODE DT_REF ';'
 		{
 			struct node *target;
 
-			target = get_node_by_label($1, $3);
+			if ($3[0] == '/')
+				target = get_node_by_path($1, $3);
+			else
+				target = get_node_by_label($1, $3);
+
 			if (target)
 				remove_nodes(target);
 			else
-				print_error("label, '%s' not found", $3);
+				print_error("label or path, '%s', not found", $3);
 		}
 	;
