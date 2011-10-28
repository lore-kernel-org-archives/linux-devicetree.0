From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: RFC: option to toggle dtc checks on and off
Date: Fri, 28 Oct 2011 16:15:25 +1100
Message-ID: <20111028051525.GA7215@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Here is a draft patch which adds a -C option to dtc, allowing
individual semantic checks to be turned on and off.  It also allows
indivudual checks to be set as triggering either warnings or errors.

I have a couple of concerns about it in its present form.  First, the
current syntax is that "-C -checkname" disables a check, "-C
checkname" turns a check on as a warning and "-C +checkname" turns it
on as an error.  I'm not convinced this is a great syntax.

Second, turning on a check will force on all prerequisite checks for
it.  Turning a check off will disable all checks for which it is a
prerequisite.  This seems necessary, since a check can't safely be
executed without having first checked its prereqs, but this could have
some very non-obvious effects from the command line.

Index: dtc/checks.c
===================================================================
--- dtc.orig/checks.c	2011-04-11 13:47:41.000000000 +1000
+++ dtc/checks.c	2011-10-28 14:42:31.846917479 +1100
@@ -644,6 +644,69 @@ static struct check *check_table[] = {
 	&obsolete_chosen_interrupt_controller,
 };
 
+static void set_check_level(struct check *c, int level)
+{
+	int i;
+
+	fprintf(stderr, "Setting '%s' check level to %d\n",
+		c->name, level);
+
+	if (level > c->level) {
+		/* Raising level, also raise it for prereqs */
+		for (i = 0; i < c->num_prereqs; i++)
+			set_check_level(c->prereq[i], level);
+	}
+
+	if (level < c->level) {
+		/* Lowering level, also lower it for things this is
+		 * the prereq for */
+		for (i = 0; i < ARRAY_SIZE(check_table); i++) {
+			struct check *cc = check_table[i];
+			int j;
+
+			for (j = 0; j < cc->num_prereqs; j++)
+				if (cc->prereq[j] == c)
+					set_check_level(cc, level);
+		}
+	}
+
+	c->level = level;
+}
+
+void parse_checks_option(const char *optarg)
+{
+	int i;
+	const char *name;
+	int level;
+
+	switch (optarg[0]) {
+	case '-':
+		level = IGNORE;
+		name = optarg + 1;
+		break;
+
+	case '+':
+		level = ERROR;
+		name = optarg + 1;
+		break;
+
+	default:
+		level = WARN;
+		name = optarg;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(check_table); i++) {
+		struct check *c = check_table[i];
+
+		if (streq(c->name, name)) {
+			set_check_level(c, level);
+			return;
+		}
+	}
+
+	die("Unrecognized check name \"%s\"\n", name);
+}
+
 void process_checks(int force, struct boot_info *bi)
 {
 	struct node *dt = bi->dt;
Index: dtc/dtc.c
===================================================================
--- dtc.orig/dtc.c	2011-07-18 09:20:15.000000000 +1000
+++ dtc/dtc.c	2011-10-28 14:43:34.743229363 +1100
@@ -111,7 +111,7 @@ int main(int argc, char *argv[])
 	minsize    = 0;
 	padsize    = 0;
 
-	while ((opt = getopt(argc, argv, "hI:O:o:V:R:S:p:fqb:vH:s")) != EOF) {
+	while ((opt = getopt(argc, argv, "hI:O:o:V:R:S:p:fqb:vH:sC:")) != EOF) {
 		switch (opt) {
 		case 'I':
 			inform = optarg;
@@ -162,6 +162,10 @@ int main(int argc, char *argv[])
 			sort = 1;
 			break;
 
+		case 'C':
+			parse_checks_option(optarg);
+			break;
+
 		case 'h':
 		default:
 			usage();
Index: dtc/dtc.h
===================================================================
--- dtc.orig/dtc.h	2011-10-12 09:56:55.000000000 +1100
+++ dtc/dtc.h	2011-10-28 14:42:31.846917479 +1100
@@ -225,6 +225,7 @@ void sort_tree(struct boot_info *bi);
 
 /* Checks */
 
+void parse_checks_option(const char *optarg);
 void process_checks(int force, struct boot_info *bi);
 
 /* Flattened trees */


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
