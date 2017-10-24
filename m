From: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] livetree: avoid assertion of orphan phandles with overlays
Date: Tue, 24 Oct 2017 17:14:18 +0300
Message-ID: <1508854458-9937-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Right now, check_interrupts_property fails with overlays, as the phandle
for the interrupt-parent can be orphan. Avoid this by allowing the orphan
node to pass the assert check.

The process_checks() call is also moved later during init sequence,
so that we can use the global variable generate_fixups to check if
we are compiling an overlay.

Signed-off-by: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
---
 dtc.c      | 3 ++-
 livetree.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/dtc.c b/dtc.c
index 5ed873c..a0f4603 100644
--- a/dtc.c
+++ b/dtc.c
@@ -319,13 +319,14 @@ int main(int argc, char *argv[])
 		dti->boot_cpuid_phys = cmdline_boot_cpuid;
 
 	fill_fullpaths(dti->dt, "");
-	process_checks(force, dti);
 
 	/* on a plugin, generate by default */
 	if (dti->dtsflags & DTSF_PLUGIN) {
 		generate_fixups = 1;
 	}
 
+	process_checks(force, dti);
+
 	if (auto_label_aliases)
 		generate_label_tree(dti, "aliases", false);
 
diff --git a/livetree.c b/livetree.c
index 6846ad2..d6a7681 100644
--- a/livetree.c
+++ b/livetree.c
@@ -540,7 +540,7 @@ struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
 {
 	struct node *child, *node;
 
-	assert((phandle != 0) && (phandle != -1));
+	assert((phandle != 0 && (phandle != -1 || generate_fixups == 1)));
 
 	if (tree->phandle == phandle) {
 		if (tree->deleted)
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
