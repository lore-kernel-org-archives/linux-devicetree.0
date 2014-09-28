From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] To remove non-ascii characters in of_selftest.txt
Date: Sun, 28 Sep 2014 12:38:07 -0700
Message-ID: <1411933087-4272-1-git-send-email-gaurav.minocha.os@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch removes the non-ascii characters in
Documentation/devicetree/of_selftest.txt

Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/of_selftest.txt | 28 ++++++++++++++----------=
----
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/of_selftest.txt b/Documentation/d=
evicetree/of_selftest.txt
index 9326bba..99f8d8b 100644
--- a/Documentation/devicetree/of_selftest.txt
+++ b/Documentation/devicetree/of_selftest.txt
@@ -67,14 +67,14 @@ struct device_node {
     ...
  };
=20
-Figure 1, describes a generic structure of machine=E2=80=99s un-flatte=
ned device tree
+Figure 1, describes a generic structure of machine's un-flattened devi=
ce tree
 considering only child and sibling pointers. There exists another poin=
ter,
 *parent, that is used to traverse the tree in the reverse direction. S=
o, at
 a particular level the child node and all the sibling nodes will have =
a parent
-pointer pointing to a common node (e.g. child1, sibling2, sibling3, si=
bling4=E2=80=99s
+pointer pointing to a common node (e.g. child1, sibling2, sibling3, si=
bling4's
 parent points to root node)
=20
-root (=E2=80=98/=E2=80=99)
+root ('/')
    |
 child1 -> sibling2 -> sibling3 -> sibling4 -> null
    |         |           |           |
@@ -110,7 +110,7 @@ __dtb_testcases_begin - address marking the start o=
f test data blob
 __dtb_testcases_end   - address marking the end of test data blob
=20
 Secondly, it calls of_fdt_unflatten_device_tree() to unflatten the fla=
ttened
-blob. And finally, if the machine=E2=80=99s device tree (i.e live tree=
) is present,
+blob. And finally, if the machine's device tree (i.e live tree) is pre=
sent,
 then it attaches the unflattened test data tree to the live tree, else=
 it
 attaches itself as a live device tree.
=20
@@ -118,7 +118,7 @@ attach_node_and_children() uses of_attach_node() to=
 attach the nodes into the
 live tree as explained below. To explain the same, the test data tree =
described
  in Figure 2 is attached to the live tree described in Figure 1.
=20
-root (=E2=80=98/=E2=80=99)
+root ('/')
     |
  testcase-data
     |
@@ -134,8 +134,8 @@ root->testcase-data->test-child0->test-child01->tes=
t-sibling1->test-sibling2
=20
 Figure 2: Example test data tree to be attached to live tree.
=20
-According to the scenario above, the live tree is already present so i=
t isn=E2=80=99t
-required to attach the root(=E2=80=98/=E2=80=99) node. All other nodes=
 are attached by calling
+According to the scenario above, the live tree is already present so i=
t isn't
+required to attach the root('/') node. All other nodes are attached by=
 calling
 of_attach_node() on each node.
=20
 In the function of_attach_node(), the new node is attached as the chil=
d of the
@@ -144,7 +144,7 @@ replaces the current child and turns it into its si=
bling. So, when the testcase
 data node is attached to the live tree above (Figure 1), the final str=
ucture is
  as shown in Figure 3.
=20
-root (=E2=80=98/=E2=80=99)
+root ('/')
    |
 testcase-data -> child1 -> sibling2 -> sibling3 -> sibling4 -> null
    |               |          |           |           |
@@ -163,7 +163,7 @@ testcase-data -> child1 -> sibling2 -> sibling3 -> =
sibling4 -> null
                                           null
 ----------------------------------------------------------------------=
-
=20
-root (=E2=80=98/=E2=80=99)
+root ('/')
    |
 testcase-data -> child1 -> sibling2 -> sibling3 -> sibling4 -> null
    |               |          |           |           |
@@ -184,8 +184,8 @@ test-child0 the test-sibling1 is attached that push=
es the child node
  as mentioned above.
=20
 If a duplicate node is found (i.e. if a node with same full_name prope=
rty is
-already present in the live tree), then the node isn=E2=80=99t attache=
d rather its
-properties are updated to the live tree=E2=80=99s node by calling the =
function
+already present in the live tree), then the node isn't attached rather=
 its
+properties are updated to the live tree's node by calling the function
 update_node_properties().
=20
=20
@@ -198,7 +198,7 @@ whole tree). selftest_data_remove() calls detach_no=
de_and_children() that uses
 of_detach_node() to detach the nodes from the live device tree.
=20
 To detach a node, of_detach_node() first updates all_next linked list,=
 by
-attaching the previous node=E2=80=99s allnext to current node=E2=80=99=
s allnext pointer. And
-then, it either updates the child pointer of given node=E2=80=99s pare=
nt to its
-sibling or attaches the previous sibling to the given node=E2=80=99s s=
ibling, as
+attaching the previous node's allnext to current node's allnext pointe=
r. And
+then, it either updates the child pointer of given node's parent to it=
s
+sibling or attaches the previous sibling to the given node's sibling, =
as
 appropriate. That is it :)
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
