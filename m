From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH v2 3/6] arm/dt: consolidate atags setup into
	setup_machine_atags
Date: Mon, 31 Jan 2011 14:04:05 -0700
Message-ID: <20110131210405.15105.37881.stgit@localhost6.localdomain6>
References: <20110131203626.15105.64302.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110131203626.15105.64302.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, buytenh@
List-Id: devicetree@vger.kernel.org

In preparation for adding device tree support, this patch consolidates
all of the atag-specific setup into a single function.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 arch/arm/kernel/setup.c |   68 ++++++++++++++++++++++++-----------------------
 1 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index d211609..cbc1836 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -424,25 +424,6 @@ void cpu_init(void)
 	    : "r14");
 }
 
-static struct machine_desc * __init setup_machine(unsigned int nr)
-{
-	struct machine_desc *list;
-
-	/*
-	 * locate machine in the list of supported machines.
-	 */
-	list = lookup_machine_type(nr);
-	if (!list) {
-		printk("Machine configuration botched (nr %d), unable "
-		       "to continue.\n", nr);
-		while (1);
-	}
-
-	printk("Machine: %s\n", list->name);
-
-	return list;
-}
-
 int __init arm_add_memory(unsigned long start, unsigned long size)
 {
 	struct membank *bank = &meminfo.bank[meminfo.nr_banks];
@@ -796,21 +777,23 @@ static void __init squash_mem_tags(struct tag *tag)
 			tag->hdr.tag = ATAG_NONE;
 }
 
-void __init setup_arch(char **cmdline_p)
+static struct machine_desc * __init setup_machine_tags(unsigned int nr)
 {
 	struct tag *tags = (struct tag *)&init_tags;
 	struct machine_desc *mdesc;
 	char *from = default_command_line;
 
-	unwind_init();
-
-	setup_processor();
-	mdesc = setup_machine(machine_arch_type);
-	machine_desc = mdesc;
-	machine_name = mdesc->name;
+	/*
+	 * locate machine in the list of supported machines.
+	 */
+	mdesc = lookup_machine_type(nr);
+	if (!mdesc) {
+		printk("Machine configuration botched (nr %d), unable "
+		       "to continue.\n", nr);
+		while (1);
+	}
 
-	if (mdesc->soft_reboot)
-		reboot_setup("s");
+	printk("Machine: %s\n", mdesc->name);
 
 	if (__atags_pointer)
 		tags = phys_to_virt(__atags_pointer);
@@ -838,16 +821,35 @@ void __init setup_arch(char **cmdline_p)
 		parse_tags(tags);
 	}
 
-	init_mm.start_code = (unsigned long) _text;
-	init_mm.end_code   = (unsigned long) _etext;
-	init_mm.end_data   = (unsigned long) _edata;
-	init_mm.brk	   = (unsigned long) _end;
-
 	/* parse_early_param needs a boot_command_line */
 	strlcpy(boot_command_line, from, COMMAND_LINE_SIZE);
 
 	/* populate cmd_line too for later use, preserving boot_command_line */
 	strlcpy(cmd_line, boot_command_line, COMMAND_LINE_SIZE);
+
+	return mdesc;
+}
+
+
+void __init setup_arch(char **cmdline_p)
+{
+	struct machine_desc *mdesc;
+
+	unwind_init();
+
+	setup_processor();
+	mdesc = setup_machine_tags(machine_arch_type);
+	machine_desc = mdesc;
+	machine_name = mdesc->name;
+
+	if (mdesc->soft_reboot)
+		reboot_setup("s");
+
+	init_mm.start_code = (unsigned long) _text;
+	init_mm.end_code   = (unsigned long) _etext;
+	init_mm.end_data   = (unsigned long) _edata;
+	init_mm.brk	   = (unsigned long) _end;
+
 	*cmdline_p = cmd_line;
 
 	parse_early_param();
