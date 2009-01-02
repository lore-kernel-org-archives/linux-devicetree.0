From: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2] libfdt: Add version.lds file
Date: Fri, 2 Jan 2009 08:19:51 -0500
Message-ID: <20090102131951.GA8954@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the initial symbol versioning file as groundwork for creating
a libfdt shared library

Signed-off-by: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 libfdt/version.lds |   54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 libfdt/version.lds

diff --git a/libfdt/version.lds b/libfdt/version.lds
new file mode 100644
index 0000000..3c3994e
--- /dev/null
+++ b/libfdt/version.lds
@@ -0,0 +1,54 @@
+LIBFDT_1.2 {
+	global:
+		fdt_next_node;
+		fdt_check_header;
+		fdt_move;
+		fdt_string;
+		fdt_num_mem_rsv;
+		fdt_get_mem_rsv;
+		fdt_subnode_offset_namelen;
+		fdt_subnode_offset;
+		fdt_path_offset;
+		fdt_get_name;
+		fdt_get_property_namelen;
+		fdt_get_property;
+		fdt_getprop_namelen;
+		fdt_getprop;
+		fdt_get_phandle;
+		fdt_get_alias_namelen;
+		fdt_get_alias;
+		fdt_get_path;
+		fdt_supernode_atdepth_offset;
+		fdt_node_depth;
+		fdt_parent_offset;
+		fdt_node_offset_by_prop_value;
+		fdt_node_offset_by_phandle;
+		fdt_node_check_compatible;
+		fdt_node_offset_by_compatible;
+		fdt_setprop_inplace;
+		fdt_nop_property;
+		fdt_nop_node;
+		fdt_create;
+		fdt_add_reservemap_entry;
+		fdt_finish_reservemap;
+		fdt_begin_node;
+		fdt_property;
+		fdt_end_node;
+		fdt_finish;
+		fdt_open_into;
+		fdt_pack;
+		fdt_add_mem_rsv;
+		fdt_del_mem_rsv;
+		fdt_set_name;
+		fdt_setprop;
+		fdt_delprop;
+		fdt_add_subnode_namelen;
+		fdt_add_subnode;
+		fdt_del_node;
+		fdt_strerror;
+		fdt_offset_ptr;
+		fdt_next_tag;
+
+	local:
+		*;
+};
-- 
1.6.0.6
