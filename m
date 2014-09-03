From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=5D=20Documentation=20regarding=20attaching=20OF=20Selftest=20testdata?=
Date: Wed,  3 Sep 2014 00:16:29 -0700
Message-ID: <1409728589-9019-1-git-send-email-gaurav.minocha.os@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch add a document that explains how the selftest test data
 is dynamically attached into the live device tree irrespective
 of the machine's architecture.

Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/of_selftest.txt |  204 ++++++++++++++++++++++=
++++++++
 1 file changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/of_selftest.txt

diff --git a/Documentation/devicetree/of_selftest.txt b/Documentation/d=
evicetree/of_selftest.txt
new file mode 100644
index 0000000..b1d9250
--- /dev/null
+++ b/Documentation/devicetree/of_selftest.txt
@@ -0,0 +1,204 @@
+=EF=BB=BFOpen Firmware Device Tree Selftest
+-----------------------------------
+
+Author: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+
+1. Introduction
+
+This document explains how the test data required for executing OF sel=
ftest=20
+is attached to the live tree dynamically, independent of the machine's
+architecture.=20
+
+It is recommended to read the following documents before moving ahead.
+
+[1] Documentation/devicetree/usage-model.txt
+[2] http://www.devicetree.org/Device_Tree_Usage
+
+OF Selftest has been designed to test the interface (include/linux/of.=
h)=20
+provided to device driver developers to fetch the device information..=
etc.=20
+from the unflattened device tree data structure. This interface is use=
d by=20
+most of the device drivers in various use cases.
+
+
+2. Test-data
+
+The Device Tree Source file (drivers/of/testcase-data/testcases.dts) c=
ontains=20
+the test data required for executing the unit tests automated in=20
+drivers/of/selftests.c. Currently, following Device Tree Source Includ=
e files=20
+(.dtsi) are included in testcase.dts:
+
+drivers/of/testcase-data/tests-interrupts.dtsi
+drivers/of/testcase-data/tests-platform.dtsi
+drivers/of/testcase-data/tests-phandle.dtsi
+drivers/of/testcase-data/tests-match.dtsi
+
+When the kernel is build with OF_SELFTEST enabled, then the following =
make rule
+
+$(obj)/%.dtb: $(src)/%.dts FORCE
+	$(call if_changed_dep, dtc)
+
+is used to compile the DT source file (testcase.dts) into a binary blo=
b=20
+(testcase.dtb), also referred as flattened DT.
+
+After that, using the following rule the binary blob above is wrapped =
as an
+assembly file (testcase.dtb.S).
+
+$(obj)/%.dtb.S: $(obj)/%.dtb
+	$(call cmd, dt_S_dtb)
+
+The assembly file is compiled into an object file (testcase.dtb.o), an=
d is
+linked into the kernel image.
+
+
+2.1. Adding the test data
+
+Un-flattened device tree structure:
+
+Un-flattened device tree consists of connected device_node(s) in form =
of a tree=20
+structure described below.
+
+// following struct members are used to construct the tree
+struct device_node {
+    ...
+    struct  device_node *parent;
+    struct  device_node *child;
+    struct  device_node *sibling;
+    struct  device_node *allnext;   /* next in list of all nodes */
+    ...
+ };
+
+Figure 1, describes a generic structure of machine=E2=80=99s un-flatte=
ned device tree=20
+considering only child and sibling pointers. There exists another poin=
ter,=20
+*parent, that is used to traverse the tree in the reverse direction. S=
o, at
+a particular level the child node and all the sibling nodes will have =
a parent=20
+pointer pointing to a common node (e.g. child1, sibling2, sibling3, si=
bling4=E2=80=99s=20
+parent points to root node) =20
+
+root (=E2=80=98/=E2=80=99)
+   |
+child1 -> sibling2 -> sibling3 -> sibling4 -> null
+   |         |           |           |
+   |         |           |          null
+   |         |        child31 -> sibling32 -> null
+   |         |           |          |
+   |         |          null       null
+   |      child21 -> sibling22 -> sibling23 -> null
+   |         |          |            |
+   |        null       null         null
+child11 -> sibling12 -> sibling13 -> sibling14 -> null
+   |           |           |            |
+   |           |           |           null
+  null        null       child131 -> null
+                           |
+                          null
+
+Figure 1: Generic structure of un-flattened device tree
+
+
+*allnext: it is used to link all the nodes of DT into a list. So, for =
the
+ above tree the list would be as follows:
+
+root->child1->child11->sibling12->sibling13->child131->sibling14->sibl=
ing2->
+child21->sibling22->sibling23->sibling3->child31->sibling32->sibling4-=
>null
+
+Before executing OF selftest, it is required to attach the test data t=
o=20
+machine's device tree (if present). So, when selftest_data_add() is ca=
lled,
+at first it reads the flattened device tree data linked into the kerne=
l image
+via the following kernel symbols:
+
+__dtb_testcases_begin - address marking the start of test data blob =20
+__dtb_testcases_end   - address marking the end of test data blob
+
+Secondly, it calls of_fdt_unflatten_device_tree() to unflatten the fla=
ttened=20
+blob. And finally, if the machine=E2=80=99s device tree (i.e live tree=
) is present,=20
+then it attaches the unflattened test data tree to the live tree, else=
 it=20
+attaches itself as a live device tree.
+
+attach_node_and_children() uses of_attach_node() to attach the nodes i=
nto the=20
+live tree as explained below. To explain the same, the test data tree =
described
+ in Figure 2 is attached to the live tree described in Figure 1.
+
+root (=E2=80=98/=E2=80=99)
+    |
+ testcase-data
+    |
+ test-child0 -> test-sibling1 -> test-sibling2 -> test-sibling3 -> nul=
l
+    |               |                |                |
+ test-child01      null             null             null
+
+
+allnext list:
+
+root->testcase-data->test-child0->test-child01->test-sibling1->test-si=
bling2
+->test-sibling3->null
+=20
+Figure 2: Example test data tree to be attached to live tree.
+
+According to the scenario above, the live tree is already present so i=
t isn=E2=80=99t=20
+required to attach the root(=E2=80=98/=E2=80=99) node. All other nodes=
 are attached by calling
+of_attach_node() on each node.
+
+In the function of_attach_node(), the new node is attached as the chil=
d of the=20
+given parent in live tree. But, if parent already has a child then the=
 new node
+replaces the current child and turns it into its sibling. So, when the=
 testcase
+data node is attached to the live tree above (Figure 1), the final str=
ucture is
+ as shown in Figure 3. =20
+
+root (=E2=80=98/=E2=80=99)
+   |
+testcase-data -> child1 -> sibling2 -> sibling3 -> sibling4 -> null
+   |               |          |           |           |
+ (...)             |          |           |          null
+                   |          |         child31 -> sibling32 -> null
+                   |          |           |           |
+                   |          |          null        null
+                   |        child21 -> sibling22 -> sibling23 -> null
+                   |          |           |            |
+                   |         null        null         null
+                child11 -> sibling12 -> sibling13 -> sibling14 -> null
+                   |          |            |            |
+                  null       null          |           null
+                                        child131 -> null
+                                           |
+                                          null
+----------------------------------------------------------------------=
-
+
+root (=E2=80=98/=E2=80=99)
+   |
+testcase-data -> child1 -> sibling2 -> sibling3 -> sibling4 -> null
+   |               |          |           |           |
+   |             (...)      (...)       (...)        null=20
+   |
+test-sibling3 -> test-sibling2 -> test-sibling1 -> test-child0 -> null
+   |                |                   |                |
+  null             null                null         test-child01
+
+
+Figure 3: Live device tree structure after attaching the testcase-data=
=2E
+
+
+Astute readers would have noticed that test-child0 node becomes the la=
st=20
+sibling compared to the earlier structure (Figure 2). After attaching =
first=20
+test-child0 the test-sibling1 is attached that pushes the child node=20
+(i.e. test-child0) to become a sibling and makes itself a child node,
+ as mentioned above.=20
+
+If a duplicate node is found (i.e. if a node with same full_name prope=
rty is=20
+already present in the live tree), then the node isn=E2=80=99t attache=
d rather its=20
+properties are updated to the live tree=E2=80=99s node by calling the =
function=20
+update_node_properties().
+
+
+2.2. Removing the test data
+
+Once the test case execution is complete, selftest_data_remove is call=
ed in=20
+order to remove the device nodes attached initially (first the leaf no=
des are=20
+detached and then moving up the parent nodes are removed, and eventual=
ly the=20
+whole tree). selftest_data_remove() calls detach_node_and_children() t=
hat uses=20
+of_detach_node() to detach the nodes from the live device tree.
+
+To detach a node, of_detach_node() first updates all_next linked list,=
 by=20
+attaching the previous node=E2=80=99s allnext to current node=E2=80=99=
s allnext pointer. And=20
+then, it either updates the child pointer of given node=E2=80=99s pare=
nt to its=20
+sibling or attaches the previous sibling to the given node=E2=80=99s s=
ibling, as=20
+appropriate. That is it :)
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
