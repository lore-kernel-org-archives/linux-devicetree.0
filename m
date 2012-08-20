From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 dtc-1.3.0] dtc: Add --strip-disabled option to dtc(v2).
Date: Mon, 20 Aug 2012 11:24:07 +0100
Message-ID: <1345458247-15701-1-git-send-email-srinivas.kandagatla@st.com>
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
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: mmarek-AlSwsSmVLrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org, B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>

This patch allows dtc to strip out nodes in its output based on status
property. Now the dtc has additional long option --strip-disabled to
strip all the nodes which do not have status property set to "okay" or
"ok". Nodes which do not have status property are not stripped.

SOCs have lot of device tree infrastructure files which mark the
device nodes as disabled and the board level device tree enables them if
required. However while creating device tree blob, the compiler can
exclude nodes marked as disabled, doing this way will reduce the size
of device tree blob. The size change will be significant once the SOC
adds all the possible devices in to the device trees. As there could be
100s of Ips on SOCs but the board actually uses may be 20-25 IP's.

However care has to be taken if your boardloader is is updating status
property.

In our case this has reduced the blob size from 29K to 15K.

Also nodes with status="disabled" is are never probed by dt platform bus
code.

Again, this is an optional parameter to dtc, Can be used by people who
want to strip all the device nodes which do not have status property set
to "okay" or "ok".


Changes from v1:
	Add node_is_stripped function and also update help with more info.


Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
---


patch is generated on top of git://git.jdl.com/software/dtc.git.

previous discussion on this patch is at
http://comments.gmane.org/gmane.linux.kbuild.devel/8527
and
http://comments.gmane.org/gmane.linux.drivers.devicetree/19626



 dtc.c        |   14 ++++++++++++--
 dtc.h        |    6 ++++++
 flattree.c   |    3 +++
 livetree.c   |   24 ++++++++++++++++++++++++
 treesource.c |    3 +++
 5 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/dtc.c b/dtc.c
index a375683..5d44c20 100644
--- a/dtc.c
+++ b/dtc.c
@@ -30,6 +30,7 @@ int quiet;		/* Level of quietness */
 int reservenum;		/* Number of memory reservation slots */
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
+int strip_disabled;	/* strip disabled nodes in output */
 int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
 
 static void fill_fullpaths(struct node *tree, const char *prefix)
@@ -96,6 +97,8 @@ static void  __attribute__ ((noreturn)) usage(void)
 	fprintf(stderr, "\t-W [no-]<checkname>\n");
 	fprintf(stderr, "\t-E [no-]<checkname>\n");
 	fprintf(stderr, "\t\t\tenable or disable warnings and errors\n");
+	fprintf(stderr, "\t--strip-disabled\n");
+	fprintf(stderr, "\t\tStrip nodes with status property not set to \"okay\" or \"ok\". (usefull\n\t\tto reduce the ouput size)\n");
 	exit(3);
 }
 
@@ -112,15 +115,22 @@ int main(int argc, char *argv[])
 	FILE *outf = NULL;
 	int outversion = DEFAULT_FDT_VERSION;
 	long long cmdline_boot_cpuid = -1;
+	struct option loptions[] =	{
+		{"strip-disabled", no_argument, &strip_disabled, 1},
+	};
 
 	quiet      = 0;
 	reservenum = 0;
 	minsize    = 0;
 	padsize    = 0;
+	strip_disabled = 0;
 
-	while ((opt = getopt(argc, argv, "hI:O:o:V:d:R:S:p:fqb:i:vH:sW:E:"))
-			!= EOF) {
+	while ((opt = getopt_long(argc, argv,
+				"hI:O:o:V:d:R:S:p:fqb:i:vH:sW:E:",
+				loptions, NULL)) != EOF) {
 		switch (opt) {
+		case 0: /* Long option set */
+			break;
 		case 'I':
 			inform = optarg;
 			break;
diff --git a/dtc.h b/dtc.h
index 7ee2d54..6be2422 100644
--- a/dtc.h
+++ b/dtc.h
@@ -31,6 +31,7 @@
 #include <ctype.h>
 #include <errno.h>
 #include <unistd.h>
+#include <getopt.h>
 
 #include <libfdt_env.h>
 #include <fdt.h>
@@ -53,6 +54,7 @@ extern int quiet;		/* Level of quietness */
 extern int reservenum;		/* Number of memory reservation slots */
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
+extern int strip_disabled;	/* strip disabled nodes in output */
 extern int phandle_format;	/* Use linux,phandle or phandle properties */
 
 #define PHANDLE_LEGACY	0x1
@@ -224,6 +226,10 @@ struct boot_info *build_boot_info(struct reserve_info *reservelist,
 				  struct node *tree, uint32_t boot_cpuid_phys);
 void sort_tree(struct boot_info *bi);
 
+int is_device_node_avaiable(struct node *node);
+
+int node_is_stripped(struct node *node);
+
 /* Checks */
 
 void parse_checks_option(bool warn, bool error, const char *optarg);
diff --git a/flattree.c b/flattree.c
index 28d0b23..e649082 100644
--- a/flattree.c
+++ b/flattree.c
@@ -304,6 +304,9 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 	}
 
 	for_each_child(tree, child) {
+		if (node_is_stripped(child))
+			continue;
+
 		flatten_tree(child, emit, etarget, strbuf, vi);
 	}
 
diff --git a/livetree.c b/livetree.c
index c9209d5..e4777f9 100644
--- a/livetree.c
+++ b/livetree.c
@@ -607,3 +607,27 @@ void sort_tree(struct boot_info *bi)
 	sort_reserve_entries(bi);
 	sort_node(bi->dt);
 }
+
+int is_device_node_avaiable(struct node *node)
+{
+	struct property *status;
+
+	status = get_property(node, "status");
+	if (status == NULL)
+		return 1;
+
+	if (status->val.len > 0) {
+		if (!strcmp(status->val.val, "okay") ||
+			 !strcmp(status->val.val, "ok"))
+			return 1;
+	}
+
+	return 0;
+}
+
+int node_is_stripped(struct node *node)
+{
+	if (strip_disabled && !is_device_node_avaiable(node))
+		return 1;
+	return 0;
+}
diff --git a/treesource.c b/treesource.c
index 33eeba5..c80c12c 100644
--- a/treesource.c
+++ b/treesource.c
@@ -255,6 +255,9 @@ static void write_tree_source_node(FILE *f, struct node *tree, int level)
 		write_propval(f, prop);
 	}
 	for_each_child(tree, child) {
+		if (node_is_stripped(child))
+			continue;
+
 		fprintf(f, "\n");
 		write_tree_source_node(f, child, level+1);
 	}
-- 
1.7.0.4
