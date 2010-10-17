From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Sun, 17 Oct 2010 00:17:09 -0600
Message-ID: <20101017061709.GA10912@angua.secretlab.ca>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<20101014003833.GB4456@yookeroo>
	<20101014014036.GE15286@angua.secretlab.ca>
	<20101014034821.GH4456@yookeroo>
	<20101014045413.GK15286@angua.secretlab.ca>
	<20101016070238.GE5036@yookeroo>
	<AANLkTi=QaV5KvhFzyci2yykmsV9+Zz71vmoRrrFDGvK-@mail.gmail.com>
	<1287258643.4535.1453.camel@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1287258643.4535.1453.camel@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 16, 2010 at 12:50:43PM -0700, John Bonesio wrote:
> On Sat, 2010-10-16 at 12:57 -0600, Grant Likely wrote:
> > The removal or replacement of nodes is exactly the same.  However,
> > instead of adding to a node, we set a flag in the new node stating
> > that it replaces the node in the preceding tree.  Or in the case of
> > removal, we set a flag that states the node in the preceding tree is
> > to be removed without a replacement.
> > 
> > In terms of implementation this should be straight forward.  In the
> > merge_nodes function, check the new node for a replace/remove flag,
> > and if it is set then remove/replace the old node instead of merging
> > with the new.  This can probably be performed in the
> > while(new_node->children) loop.
> 
> This doesn't look straight forward to me at all. From what I can tell,
> the dtc is pretty much a 2 pass compilation system. It parses and builds
> up an in memory tree structure, then it runs through and generates the
> bits for the dtb file.
> 
> Right now it merges trees during the parsing phase (not just my
> implementation, but also with what was already implemented). So, if it
> sees
> 	/trim-node/ node;
> It's going to be looking for the node it will replace (or remove). At
> this point it's not going to know if 'node' was defined in this instance
> of the tree or if node is in a previous tree. Internally it just keeps
> in memory the current merged tree it has processed so far.

Yes, but dtc doesn't need to resolve the node immediately.  It can
defer until merge_nodes() time.  I took the code you wrote (which made
this really easy because I didn't have to fiddle with removing and
freeing attached nodes), and adapted it to do exactly this today.
I've attached the patch.

The patch isn't complete, and it is using the suffix keyword syntax
because that was the approach that seemed quickest to implement.  It
also needs more error checking and it doesn't have any test cases; but
those are easy to add.  The patch also includes the test file that I
used when hacking on this.

What's really nice about this approach is that the exact same code
handles both the top level and the subnode usage of the /*-node/
keywords.

g.


>From 1c823cab1d508355af3edae4f6d4e9439ef73eeb Mon Sep 17 00:00:00 2001
From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Date: Fri, 15 Oct 2010 18:07:50 -0700
Subject: [PATCH] Implements new features for updating existing device tree nodes.

This is interesting when the /include/ "<filename>" feature is used. This way
we can create base device tree source files for a family of systems and modify
the device tree for a specific system.

The current system allows an existing node to be extended with new properties
and subnodes.

The new features allow an existing node to be replaced completely by the new
properties and subnodes. The new features also allow an existing node to be
deleted.

This patch does not yet provide a way to remove properties.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 dtc-lexer.l  |   12 ++++++++
 dtc-parser.y |   12 ++++++++
 dtc.h        |   14 +++++++++
 livetree.c   |   76 +++++++++++++++++++++++++++++++++++++++++++++++++--
 mydts.dts    |   85 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 196 insertions(+), 3 deletions(-)
 create mode 100644 mydts.dts

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 081e13a..a24edf5 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -96,6 +96,18 @@ static int pop_input_file(void);
 			return DT_MEMRESERVE;
 		}
 
+<*>"/trim-node/"	{
+			DPRINT("Keyword: /trim-node/\n");
+			BEGIN_DEFAULT();
+			return DT_REPLACENODE;
+		}
+
+<*>"/remove-node/"	{
+			DPRINT("Keyword: /remove-node/\n");
+			BEGIN_DEFAULT();
+			return DT_REMOVENODE;
+		}
+
 <*>{LABEL}:	{
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
diff --git a/dtc-parser.y b/dtc-parser.y
index 0aaf8e8..343ac76 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -54,6 +54,8 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 
 %token DT_V1
 %token DT_MEMRESERVE
+%token DT_REPLACENODE
+%token DT_REMOVENODE
 %token <propnodename> DT_PROPNODENAME
 %token <literal> DT_LITERAL
 %token <cbase> DT_BASE
@@ -147,6 +149,16 @@ nodedef:
 		{
 			$$ = build_node($2, $3);
 		}
+	| DT_REPLACENODE nodedef
+		{
+			$2->merge_op = NODE_MERGE_OP_REPLACE;
+			$$ = $2;
+		}
+	| DT_REMOVENODE ';'
+		{
+			$$ = build_node(NULL, NULL);
+			$$->merge_op = NODE_MERGE_OP_REMOVE;
+		}
 	;
 
 proplist:
diff --git a/dtc.h b/dtc.h
index b36ac5d..56027d4 100644
--- a/dtc.h
+++ b/dtc.h
@@ -139,6 +139,12 @@ struct property {
 	struct label *labels;
 };
 
+enum node_merge_ops {
+	NODE_MERGE_OP_EXTEND = 0,
+	NODE_MERGE_OP_REMOVE,
+	NODE_MERGE_OP_REPLACE,
+};
+
 struct node {
 	char *name;
 	struct property *proplist;
@@ -154,6 +160,8 @@ struct node {
 	int addr_cells, size_cells;
 
 	struct label *labels;
+
+	int merge_op;
 };
 
 #define for_each_label(l0, l) \
@@ -165,6 +173,10 @@ struct node {
 #define for_each_child(n, c)	\
 	for ((c) = (n)->children; (c); (c) = (c)->next_sibling)
 
+#define for_each_child_safe(n, c, cn)	\
+	for ((c) = (n)->children, (cn) = (c) ? (c)->next_sibling : NULL; \
+	     (c); (c) = (cn), (cn) = (cn) ? (cn)->next_sibling : NULL)
+
 void add_label(struct label **labels, char *label);
 
 struct property *build_property(char *name, struct data val);
@@ -175,6 +187,8 @@ struct node *build_node(struct property *proplist, struct node *children);
 struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
+void clear_node(struct node *node);
+void unlink_node(struct node *node);
 
 void add_property(struct node *node, struct property *prop);
 void add_child(struct node *parent, struct node *child);
diff --git a/livetree.c b/livetree.c
index 13c5f10..302827a 100644
--- a/livetree.c
+++ b/livetree.c
@@ -100,12 +100,82 @@ struct node *name_node(struct node *node, char *name)
 	return node;
 }
 
+void clear_node(struct node *node)
+{
+	struct property *prop;
+	struct node *child;
+
+	while (node->proplist) {
+		/* Pop the property off the list */
+		prop = node->proplist;
+		node->proplist = prop->next;
+		prop->next = NULL;
+
+		free(prop);
+	}
+
+	/* Free up the node's children */
+	/* This assumes we have a tree and not a cylic or acylic graph */
+	while (node->children) {
+		/* Pop the child node off the list */
+		child = node->children;
+		node->children = child->next_sibling;
+		child->parent = NULL;
+		child->next_sibling = NULL;
+
+		clear_node(child);
+		free(child);
+	}
+}
+
+void unlink_node(struct node *node)
+{
+	struct node *parent = node->parent;
+	struct node *next_sibling = node->next_sibling;
+	struct node *child;
+
+	assert(parent); /* can't unlink root node */
+
+	node->parent = NULL;
+	node->next_sibling = NULL;
+
+	/* if the node is the first child ... */
+	if (parent->children == node) {
+		parent->children = next_sibling;
+		return;
+	}
+
+	for_each_child(parent, child) {
+		if (child->next_sibling == node) {
+			child->next_sibling = next_sibling;
+			return;
+		}
+	}
+
+	assert(1); /* Woah! We've got an inconsistent tree here */
+}
+
 struct node *merge_nodes(struct node *old_node, struct node *new_node)
 {
 	struct property *new_prop, *old_prop;
-	struct node *new_child, *old_child;
+	struct node *new_child, *old_child, *next_child;
 	struct label *l;
 
+	if (new_node->merge_op == NODE_MERGE_OP_REMOVE) {
+		/* Make sure this doesn't attempt to remove the root */
+		assert(old_node->parent);
+
+		unlink_node(old_node);
+		clear_node(old_node);
+		free(old_node);
+		free(new_node);
+		return NULL;
+	};
+
+	/* remove the contents of the old node */
+	if (new_node->merge_op == NODE_MERGE_OP_REPLACE)
+		clear_node(old_node);
+
 	/* Add new node labels to old node */
 	for_each_label(new_node->labels, l)
 		add_label(&old_node->labels, l->label);
@@ -147,7 +217,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 		new_child->next_sibling = NULL;
 
 		/* Search for a collision.  Merge if there is */
-		for_each_child(old_node, old_child) {
+		for_each_child_safe(old_node, old_child, next_child) {
 			if (streq(old_child->name, new_child->name)) {
 				merge_nodes(old_child, new_child);
 				new_child = NULL;
@@ -155,7 +225,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 			}
 		}
 
-		/* if no collision occured, add child to the old node. */
+		/* if no collision occurred, add child to the old node. */
 		if (new_child)
 			add_child(old_node, new_child);
 	}
diff --git a/mydts.dts b/mydts.dts
new file mode 100644
index 0000000..bfa8829
--- /dev/null
+++ b/mydts.dts
@@ -0,0 +1,85 @@
+/dts-v1/;
+
+/ {
+	node1 {
+		expect-2-nodes--one-trimmed;
+		node1 { prop; node { }; };
+		remove-me { prop; node { }; };
+		node2 { prop; node { }; };
+	};
+	node2 {
+		expect-1-node;
+		node1 { };
+		remove-me { };
+	};
+	node3 {
+		expect-1-node;
+		remove-me { };
+		node1 { };
+	};
+	node4 {
+		expect-0-nodes;
+		remove-me { };
+	};
+	node5 {
+		expect-0-nodes;
+		remove-me { };
+		remove-me2 { };
+	};
+
+	node6 {
+		node1 {
+			expect-2-nodes--one-trimmed;
+			trim1: node1 { prop; node { }; };
+			remove1: remove-me { prop; node { }; };
+			node2 { prop; node { }; };
+		};
+		node2 {
+			expect-1-node;
+			node1 { };
+			remove2: remove-me { };
+		};
+		node3 {
+			expect-1-node;
+			remove3: remove-me { };
+			node1 { };
+		};
+		node4 {
+			expect-0-nodes;
+			remove4: remove-me { };
+		};
+		node5 {
+			expect-0-nodes;
+			remove5: remove-me { };
+			remove6: remove-me2 { };
+		};
+	};
+};
+
+/ {
+	node1 {
+		node1 /trim-node/ { trimmed; };
+		remove-me /remove-node/;
+	};
+	node2 {
+		remove-me /remove-node/;
+	};
+	node3 {
+		remove-me /remove-node/;
+	};
+	node4 {
+		remove-me /remove-node/;
+	};
+	node5 {
+		remove-me /remove-node/;
+		remove-me2 /remove-node/;
+	};
+};
+
+&remove1 /remove-node/;
+&trim1 /trim-node/ { trimmed; };
+&remove2 /remove-node/;
+&remove3 /remove-node/;
+&remove4 /remove-node/;
+&remove5 /remove-node/;
+&remove6 /remove-node/;
-- 
1.7.1
