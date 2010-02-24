From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Update .gitignore files
Date: Wed, 24 Feb 2010 12:06:23 -0700
Message-ID: <20100224190622.10055.74394.stgit@angua>
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
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Filter out all the generated bits from git revision control
---

 .gitignore       |    7 +++++--
 tests/.gitignore |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 tests/.gitignore

diff --git a/.gitignore b/.gitignore
index 92f9a34..ae7a46a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -5,5 +5,8 @@
 *~
 *.tab.[ch]
 lex.yy.c
-dtc
-ftdump
+*.lex.c
+/dtc
+/ftdump
+/convert-dtsv0
+/version_gen.h
diff --git a/tests/.gitignore b/tests/.gitignore
new file mode 100644
index 0000000..c4e1205
--- /dev/null
+++ b/tests/.gitignore
@@ -0,0 +1,47 @@
+*.dtb
+*.dtb.test.dts
+*.dts.test.s
+/add_subnode_with_nops
+/asm_tree_dump
+/boot-cpuid
+/del_node
+/del_property
+/dtbs_equal_ordered
+/dumptrees
+/extra-terminating-null
+/find_property
+/get_alias
+/get_mem_rsv
+/get_name
+/get_path
+/get_phandle
+/getprop
+/incbin
+/mangle-layout
+/move_and_save
+/node_check_compatible
+/node_offset_by_compatible
+/node_offset_by_phandle
+/node_offset_by_prop_value
+/nop_node
+/nop_property
+/nopulate
+/notfound
+/open_pack
+/parent_offset
+/path-references
+/path_offset
+/path_offset_aliases
+/phandle_format
+/references
+/root_node
+/rw_tree1
+/set_name
+/setprop
+/setprop_inplace
+/string_escapes
+/subnode_offset
+/supernode_atdepth_offset
+/sw_tree1
+/truncated_property
+/value-labels
