Return-Path: <loeliger@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1399913280-6915-4-git-send-email-holler@ahsoftware.de>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de>
	<1399913280-6915-4-git-send-email-holler@ahsoftware.de>
Date: Mon, 12 May 2014 15:38:40 -0500
Message-ID: <CAJgR-BhnFngGr9qxa7NvF7GExiCAr1=HS16AtN20uj7nCmLcKQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/9] dt: deps: dtc: Add option to print initialization order
From: Jon Loeliger <loeliger@gmail.com>
Content-Type: multipart/alternative; boundary=001a1134a45cb8ab9104f939ee28
To: Alexander Holler <holler@ahsoftware.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jon Loeliger <jdl@jdl.com>, Russell King <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--001a1134a45cb8ab9104f939ee28
Content-Type: text/plain; charset=UTF-8

So, this should be rebased on the actual DTC repository,
and not the kernel's copy of the DTC under scripts.

Thanks,
jdl



On Mon, May 12, 2014 at 11:47 AM, Alexander Holler <holler@ahsoftware.de>wrote:

> Add option -t to print the default initialization order.
> No other output will be generated.
>
> To print the order, just use something like this:
>
>         CROSS_COMPILE=gcc-foo ARCH=arm make foo.dtb
>         scripts/dtc/dtc -I dtb -t arch/arm/boot/dts/foo.dtb
>
> Since it's now possible to check to for cycles in the dependency graph,
> this is now done too.
>
> Signed-off-by: Alexander Holler <holler@ahsoftware.de>
> ---
>  scripts/dtc/dependencies.c | 346
> +++++++++++++++++++++++++++++++++++++++++++++
>  scripts/dtc/dtc.c          |  24 +++-
>  scripts/dtc/dtc.h          |   2 +
>  3 files changed, 371 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/dtc/dependencies.c b/scripts/dtc/dependencies.c
> index dd4658c..8fe1a8c 100644
> --- a/scripts/dtc/dependencies.c
> +++ b/scripts/dtc/dependencies.c
> @@ -106,3 +106,349 @@ void add_dependencies(struct boot_info *bi)
>  {
>         process_nodes_props(bi->dt, bi->dt);
>  }
> +
> +/*
> + * The code below is in large parts a copy of drivers/of/of_dependencies.c
> + * in the Linux kernel. So both files do share the same bugs.
> + * The next few ugly defines do exist to keep the differences at a
> minimum.
> + */
> +static struct node *tree;
> +#define pr_cont(format, ...) printf(format, ##__VA_ARGS__)
> +#define pr_info(format, ...) printf(format, ##__VA_ARGS__)
> +#define pr_warn(format, ...) printf(format, ##__VA_ARGS__)
> +#define pr_err(format, ...) fprintf(stderr, format, ##__VA_ARGS__)
> +typedef cell_t __be32;
> +#define device_node node
> +#define full_name fullpath
> +#define __initdata
> +#define __init
> +#define unlikely(a) (a)
> +#define of_node_put(a)
> +#define of_find_node_by_phandle(v) get_node_by_phandle(tree, v)
> +#define __of_get_property(a, b, c) get_property(a, b)
> +#define for_each_child_of_node(a, b) for_each_child(a, b)
> +
> +
> +#define MAX_DT_NODES 1000 /* maximum number of vertices */
> +#define MAX_EDGES (MAX_DT_NODES*2) /* maximum number of edges
> (dependencies) */
> +
> +struct edgenode {
> +       uint32_t y; /* phandle */
> +       struct edgenode *next; /* next edge in list */
> +};
> +
> +/*
> + * Vertex numbers do correspond to phandle numbers. That means the graph
> + * does contain as much vertices as the maximum of all phandles.
> + * Or in other words, we assume that for all phandles in the device tree
> + * 0 < phandle < MAX_DT_NODES+1 is true.
> + */
> +struct dep_graph {
> +       struct edgenode edge_slots[MAX_EDGES]; /* used to avoid kmalloc */
> +       struct edgenode *edges[MAX_DT_NODES+1]; /* adjacency info */
> +       unsigned nvertices; /* number of vertices in graph */
> +       unsigned nedges; /* number of edges in graph */
> +       bool processed[MAX_DT_NODES+1]; /* which vertices have been
> processed */
> +       bool include_node[MAX_DT_NODES+1]; /* which nodes to consider */
> +       bool discovered[MAX_DT_NODES+1]; /* which vertices have been found
> */
> +       bool finished; /* if true, cut off search immediately */
> +};
> +static struct dep_graph graph __initdata;
> +
> +struct init_order {
> +       uint32_t max_phandle; /* the max used phandle */
> +       uint32_t old_max_phandle; /* used to keep track of added phandles
> */
> +       struct device_node *order[MAX_DT_NODES+1];
> +       unsigned count;
> +       /* Used to keep track of parent devices in regard to the DT */
> +       uint32_t parent_by_phandle[MAX_DT_NODES+1];
> +       struct device *device_by_phandle[MAX_DT_NODES+1];
> +};
> +static struct init_order order __initdata;
> +
> +
> +/* Copied from drivers/of/base.c (because it's lockless). */
> +static int __init __of_device_is_available(struct device_node *device)
> +{
> +       struct property *status;
> +
> +       if (!device)
> +               return 0;
> +
> +       status = get_property(device, "status");
> +       if (status == NULL)
> +               return 1;
> +
> +       if (status->val.len > 0) {
> +               if (!strcmp(status->val.val, "okay") ||
> +                               !strcmp(status->val.val, "ok"))
> +                       return 1;
> +       }
> +
> +       return 0;
> +}
> +
> +/*
> + * x is a dependant of y or in other words
> + * y will be initialized before x.
> + */
> +static int __init insert_edge(uint32_t x, uint32_t y)
> +{
> +       struct edgenode *p; /* temporary pointer */
> +
> +       if (unlikely(x > MAX_DT_NODES || y > MAX_DT_NODES)) {
> +               pr_err("Node found with phandle 0x%x > MAX_DT_NODES
> (%d)!\n",
> +                       x > MAX_DT_NODES ? x : y, MAX_DT_NODES);
> +               return -EINVAL;
> +       }
> +       if (unlikely(!x || !y))
> +               return 0;
> +       if (unlikely(graph.nedges >= MAX_EDGES)) {
> +               pr_err("Maximum number of edges (%d) reached!\n",
> MAX_EDGES);
> +               return -EINVAL;
> +       }
> +       p = &graph.edge_slots[graph.nedges++];
> +       graph.include_node[x] = 1;
> +       graph.include_node[y] = 1;
> +       p->y = y;
> +       p->next = graph.edges[x];
> +       graph.edges[x] = p; /* insert at head of list */
> +
> +       graph.nvertices = (x > graph.nvertices) ? x : graph.nvertices;
> +       graph.nvertices = (y > graph.nvertices) ? y : graph.nvertices;
> +       return 0;
> +}
> +
> +static void __init print_node_name(uint32_t v)
> +{
> +       struct device_node *node;
> +
> +       node = of_find_node_by_phandle(v);
> +       if (!node) {
> +               pr_err("Node for phandle 0x%x not found", v);
> +               return;
> +       }
> +       if (node->name)
> +               pr_err("%s", node->name);
> +       if (node->full_name)
> +               pr_err(" (%s)", node->full_name);
> +       of_node_put(node);
> +}
> +
> +/*
> + * I would prefer to use the BGL (Boost Graph Library), but as I can't
> use it
> + * here (for obvious reasons), the next four functions below are based on
> + * code of Steven Skiena's book 'The Algorithm Design Manual'.
> + */
> +
> +static void __init process_edge(uint32_t x, uint32_t y)
> +{
> +       if (unlikely(graph.discovered[y] && !graph.processed[y])) {
> +               pr_err("Cycle found 0x%x ", x);
> +               print_node_name(x);
> +               pr_cont(" <-> 0x%x ", y);
> +               print_node_name(y);
> +               pr_cont("!\n");
> +               graph.finished = 1;
> +       }
> +}
> +
> +static void __init process_vertex_late(uint32_t v)
> +{
> +       struct device_node *node;
> +
> +       node = of_find_node_by_phandle(v);
> +       if (!node) {
> +               pr_err("No node for phandle 0x%x not found", v);
> +               return;
> +       }
> +       order.order[order.count++] = node;
> +}
> +
> +static void __init depth_first_search(uint32_t v)
> +{
> +       struct edgenode *p;
> +       uint32_t y; /* successor vertex */
> +
> +       if (graph.finished)
> +               return;
> +       graph.discovered[v] = 1;
> +       p = graph.edges[v];
> +       while (p) {
> +               y = p->y;
> +               if (!graph.discovered[y]) {
> +                       process_edge(v, y);
> +                       depth_first_search(y);
> +               } else
> +                       process_edge(v, y);
> +               if (graph.finished)
> +                       return;
> +               p = p->next;
> +       }
> +       process_vertex_late(v);
> +       graph.processed[v] = 1;
> +}
> +
> +static void __init topological_sort(void)
> +{
> +       unsigned i;
> +
> +       for (i = 1; i <= graph.nvertices; ++i)
> +               if (!graph.discovered[i] && graph.include_node[i])
> +                       depth_first_search(i);
> +}
> +
> +static int __init add_dep_list(struct device_node *node)
> +{
> +       const __be32 *list, *list_end;
> +       uint32_t ph;
> +       struct property *prop;
> +       int rc = 0;
> +       struct device_node *dep;
> +
> +       prop = get_property(node, "dependencies");
> +       if (!prop || !prop->val.len || prop->val.len%sizeof(*list))
> +               return 0;
> +       list = (const __be32 *)prop->val.val;
> +       list_end = list + prop->val.len / sizeof(*list);
> +       while (list < list_end) {
> +               ph = fdt32_to_cpu(*list++);
> +               if (unlikely(!ph)) {
> +                       /* Should never happen */
> +                       if (node->name)
> +                               pr_warn("phandle == 0 for %s\n",
> node->name);
> +                       continue;
> +               }
> +               dep = of_find_node_by_phandle(ph);
> +               if (unlikely(!dep)) {
> +                       pr_err("No DT node for dependency with phandle
> 0x%x found\n",
> +                               ph);
> +                       continue;
> +               }
> +               rc = insert_edge(node->phandle, ph);
> +               if (rc)
> +                       break;
> +       }
> +
> +       return rc;
> +}
> +
> +/* Copied from drivers/of/base.c */
> +static const char *of_prop_next_string(struct property *prop, const char
> *cur)
> +{
> +       const char *curv = cur;
> +
> +       if (!prop)
> +               return NULL;
> +
> +       if (!cur)
> +               return prop->val.val;
> +
> +       curv += strlen(cur) + 1;
> +       if (curv >= prop->val.val + prop->val.len)
> +               return NULL;
> +
> +       return curv;
> +}
> +
> +static int __init add_deps_lnx(struct device_node *parent,
> +                               struct device_node *node)
> +{
> +       struct device_node *child;
> +       int rc = 0;
> +
> +       if (!__of_device_is_available(node))
> +               return 0;
> +       if (__of_get_property(node, "compatible", NULL)) {
> +               if (!parent->phandle) {
> +                       if (__of_get_property(parent, "compatible", NULL))
> +                               parent->phandle = 1 + order.max_phandle++;
> +               }
> +               if (!node->phandle)
> +                       node->phandle = 1 + order.max_phandle++;
> +               rc = insert_edge(node->phandle, parent->phandle);
> +               if (rc)
> +                       return rc;
> +               if (unlikely(order.parent_by_phandle[node->phandle])) {
> +                       /* sanity check */
> +                       pr_err("0x%x already has a parent!\n",
> node->phandle);
> +                       return -EINVAL;
> +               }
> +               order.parent_by_phandle[node->phandle] = parent->phandle;
> +               rc = add_dep_list(node);
> +               if (unlikely(rc))
> +                       return rc;
> +               parent = node; /* change the parent only if node is a
> driver */
> +       }
> +       for_each_child_of_node(node, child) {
> +               rc = add_deps_lnx(parent, child);
> +               if (unlikely(rc))
> +                       break;
> +       }
> +
> +       return rc;
> +}
> +
> +static void calc_max_phandle(struct node *np)
> +{
> +       struct node *child;
> +
> +       if (!np || np->deleted)
> +               return;
> +       if (np->phandle > order.max_phandle)
> +               order.max_phandle = np->phandle;
> +
> +       for_each_child(np, child)
> +               calc_max_phandle(child);
> +
> +       return;
> +}
> +
> +void __init of_init_print_order(const char *name)
> +{
> +       unsigned i;
> +       struct property *prop;
> +       const char *cp;
> +
> +       pr_info("Default initialization order for %s:\n", name);
> +       for (i = 0; i < order.count; ++i) {
> +               pr_info("init %u 0x%x", i, order.order[i]->phandle);
> +               if (order.order[i]->name)
> +                       pr_cont(" %s", order.order[i]->name);
> +               if (order.order[i]->full_name)
> +                       pr_cont(" (%s)", order.order[i]->full_name);
> +               prop = get_property(order.order[i], "compatible");
> +               for (cp = of_prop_next_string(prop, NULL); cp;
> +                    cp = of_prop_next_string(prop, cp))
> +                       pr_cont(" %s", cp);
> +               pr_cont(" (parent 0x%x)\n",
> +                       order.parent_by_phandle[order.order[i]->phandle]);
> +       }
> +}
> +
> +int __init of_init_build_order(struct device_node *root)
> +{
> +       struct device_node *child;
> +       int rc = 0;
> +
> +       tree = root;
> +       if (unlikely(!root))
> +               return -EINVAL;
> +
> +       calc_max_phandle(root);
> +       order.old_max_phandle = order.max_phandle;
> +
> +       for_each_child_of_node(root, child) {
> +               rc = add_deps_lnx(root, child);
> +               if (unlikely(rc))
> +                       break;
> +       }
> +
> +       of_node_put(root);
> +       topological_sort();
> +
> +       if (graph.finished)
> +               return -EINVAL; /* cycle found */
> +
> +       return rc;
> +}
> diff --git a/scripts/dtc/dtc.c b/scripts/dtc/dtc.c
> index fbe49d9..ac9858c 100644
> --- a/scripts/dtc/dtc.c
> +++ b/scripts/dtc/dtc.c
> @@ -88,6 +88,8 @@ static void  __attribute__ ((noreturn)) usage(void)
>         fprintf(stderr, "\t\tSort nodes and properties before outputting
> (only useful for\n\t\tcomparing trees)\n");
>         fprintf(stderr, "\t-D\n");
>         fprintf(stderr, "\t\tDo not automatically add dependencies for
> phandle references\n");
> +       fprintf(stderr, "\t-t\n");
> +       fprintf(stderr, "\t\tPrint (default) initialization order\n");
>         fprintf(stderr, "\t-v\n");
>         fprintf(stderr, "\t\tPrint DTC version and exit\n");
>         fprintf(stderr, "\t-H <phandle format>\n");
> @@ -110,6 +112,7 @@ int main(int argc, char *argv[])
>         const char *depname = NULL;
>         int force = 0, sort = 0;
>         int dependencies = 1;
> +       int init_order = 0;
>         const char *arg;
>         int opt;
>         FILE *outf = NULL;
> @@ -121,7 +124,7 @@ int main(int argc, char *argv[])
>         minsize    = 0;
>         padsize    = 0;
>
> -       while ((opt = getopt(argc, argv,
> "hI:O:o:V:d:R:S:p:fqb:i:vH:sDW:E:"))
> +       while ((opt = getopt(argc, argv,
> "hI:O:o:V:d:R:S:p:fqb:i:vH:sDtW:E:"))
>                         != EOF) {
>                 switch (opt) {
>                 case 'I':
> @@ -183,6 +186,10 @@ int main(int argc, char *argv[])
>                         dependencies = false;
>                         break;
>
> +               case 't':
> +                       init_order = true;
> +                       break;
> +
>                 case 'W':
>                         parse_checks_option(true, false, optarg);
>                         break;
> @@ -245,6 +252,13 @@ int main(int argc, char *argv[])
>         if (dependencies)
>                 add_dependencies(bi);
>
> +       if (init_order) {
> +               if (of_init_build_order(bi->dt))
> +                       exit(2);
> +               of_init_print_order(arg);
> +               exit(0);
> +       }
> +
>         if (streq(outname, "-")) {
>                 outf = stdout;
>         } else {
> @@ -266,5 +280,13 @@ int main(int argc, char *argv[])
>                 die("Unknown output format \"%s\"\n", outform);
>         }
>
> +       /*
> +        * Check for cycles by building the initialzation order.
> +        * This is done after the output was saved because it
> +        * changes the tree slightly.
> +        */
> +       if (of_init_build_order(bi->dt))
> +               exit(2);
> +
>         exit(0);
>  }
> diff --git a/scripts/dtc/dtc.h b/scripts/dtc/dtc.h
> index c3dbeac..b89e08a 100644
> --- a/scripts/dtc/dtc.h
> +++ b/scripts/dtc/dtc.h
> @@ -269,5 +269,7 @@ struct boot_info *dt_from_fs(const char *dirname);
>
>  /* Dependencies */
>  void add_dependencies(struct boot_info *bi);
> +void of_init_print_order(const char *name);
> +int of_init_build_order(struct node *root);
>
>  #endif /* _DTC_H */
> --
> 1.8.3.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--001a1134a45cb8ab9104f939ee28
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So, this should be rebased on the actual DTC repository,<b=
r>and not the kernel&#39;s copy of the DTC under scripts.<br><br>Thanks,<br=
>jdl<br><br></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_qu=
ote">
On Mon, May 12, 2014 at 11:47 AM, Alexander Holler <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:holler@ahsoftware.de" target=3D"_blank">holler@ahsoftware.d=
e</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Add option -t to print the default initialization order.<br>
No other output will be generated.<br>
<br>
To print the order, just use something like this:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CROSS_COMPILE=3Dgcc-foo ARCH=3Darm make foo.dtb=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/dtc/dtc -I dtb -t arch/arm/boot/dts/foo=
.dtb<br>
<br>
Since it&#39;s now possible to check to for cycles in the dependency graph,=
<br>
this is now done too.<br>
<br>
Signed-off-by: Alexander Holler &lt;<a href=3D"mailto:holler@ahsoftware.de"=
>holler@ahsoftware.de</a>&gt;<br>
---<br>
=C2=A0scripts/dtc/dependencies.c | 346 ++++++++++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A0scripts/dtc/dtc.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A024 +++-<b=
r>
=C2=A0scripts/dtc/dtc.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +<br>
=C2=A03 files changed, 371 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/dtc/dependencies.c b/scripts/dtc/dependencies.c<br>
index dd4658c..8fe1a8c 100644<br>
--- a/scripts/dtc/dependencies.c<br>
+++ b/scripts/dtc/dependencies.c<br>
@@ -106,3 +106,349 @@ void add_dependencies(struct boot_info *bi)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 process_nodes_props(bi-&gt;dt, bi-&gt;dt);<br>
=C2=A0}<br>
+<br>
+/*<br>
+ * The code below is in large parts a copy of drivers/of/of_dependencies.c=
<br>
+ * in the Linux kernel. So both files do share the same bugs.<br>
+ * The next few ugly defines do exist to keep the differences at a minimum=
.<br>
+ */<br>
+static struct node *tree;<br>
+#define pr_cont(format, ...) printf(format, ##__VA_ARGS__)<br>
+#define pr_info(format, ...) printf(format, ##__VA_ARGS__)<br>
+#define pr_warn(format, ...) printf(format, ##__VA_ARGS__)<br>
+#define pr_err(format, ...) fprintf(stderr, format, ##__VA_ARGS__)<br>
+typedef cell_t __be32;<br>
+#define device_node node<br>
+#define full_name fullpath<br>
+#define __initdata<br>
+#define __init<br>
+#define unlikely(a) (a)<br>
+#define of_node_put(a)<br>
+#define of_find_node_by_phandle(v) get_node_by_phandle(tree, v)<br>
+#define __of_get_property(a, b, c) get_property(a, b)<br>
+#define for_each_child_of_node(a, b) for_each_child(a, b)<br>
+<br>
+<br>
+#define MAX_DT_NODES 1000 /* maximum number of vertices */<br>
+#define MAX_EDGES (MAX_DT_NODES*2) /* maximum number of edges (dependencie=
s) */<br>
+<br>
+struct edgenode {<br>
+ =C2=A0 =C2=A0 =C2=A0 uint32_t y; /* phandle */<br>
+ =C2=A0 =C2=A0 =C2=A0 struct edgenode *next; /* next edge in list */<br>
+};<br>
+<br>
+/*<br>
+ * Vertex numbers do correspond to phandle numbers. That means the graph<b=
r>
+ * does contain as much vertices as the maximum of all phandles.<br>
+ * Or in other words, we assume that for all phandles in the device tree<b=
r>
+ * 0 &lt; phandle &lt; MAX_DT_NODES+1 is true.<br>
+ */<br>
+struct dep_graph {<br>
+ =C2=A0 =C2=A0 =C2=A0 struct edgenode edge_slots[MAX_EDGES]; /* used to av=
oid kmalloc */<br>
+ =C2=A0 =C2=A0 =C2=A0 struct edgenode *edges[MAX_DT_NODES+1]; /* adjacency=
 info */<br>
+ =C2=A0 =C2=A0 =C2=A0 unsigned nvertices; /* number of vertices in graph *=
/<br>
+ =C2=A0 =C2=A0 =C2=A0 unsigned nedges; /* number of edges in graph */<br>
+ =C2=A0 =C2=A0 =C2=A0 bool processed[MAX_DT_NODES+1]; /* which vertices ha=
ve been processed */<br>
+ =C2=A0 =C2=A0 =C2=A0 bool include_node[MAX_DT_NODES+1]; /* which nodes to=
 consider */<br>
+ =C2=A0 =C2=A0 =C2=A0 bool discovered[MAX_DT_NODES+1]; /* which vertices h=
ave been found */<br>
+ =C2=A0 =C2=A0 =C2=A0 bool finished; /* if true, cut off search immediatel=
y */<br>
+};<br>
+static struct dep_graph graph __initdata;<br>
+<br>
+struct init_order {<br>
+ =C2=A0 =C2=A0 =C2=A0 uint32_t max_phandle; /* the max used phandle */<br>
+ =C2=A0 =C2=A0 =C2=A0 uint32_t old_max_phandle; /* used to keep track of a=
dded phandles */<br>
+ =C2=A0 =C2=A0 =C2=A0 struct device_node *order[MAX_DT_NODES+1];<br>
+ =C2=A0 =C2=A0 =C2=A0 unsigned count;<br>
+ =C2=A0 =C2=A0 =C2=A0 /* Used to keep track of parent devices in regard to=
 the DT */<br>
+ =C2=A0 =C2=A0 =C2=A0 uint32_t parent_by_phandle[MAX_DT_NODES+1];<br>
+ =C2=A0 =C2=A0 =C2=A0 struct device *device_by_phandle[MAX_DT_NODES+1];<br=
>
+};<br>
+static struct init_order order __initdata;<br>
+<br>
+<br>
+/* Copied from drivers/of/base.c (because it&#39;s lockless). */<br>
+static int __init __of_device_is_available(struct device_node *device)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 struct property *status;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 if (!device)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 status =3D get_property(device, &quot;status&quot;);=
<br>
+ =C2=A0 =C2=A0 =C2=A0 if (status =3D=3D NULL)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 if (status-&gt;val.len &gt; 0) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strcmp(status-&gt;v=
al.val, &quot;okay&quot;) ||<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !strcmp(status-&gt;val.val, &quot;ok&quot;)=
)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 1;<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+/*<br>
+ * x is a dependant of y or in other words<br>
+ * y will be initialized before x.<br>
+ */<br>
+static int __init insert_edge(uint32_t x, uint32_t y)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 struct edgenode *p; /* temporary pointer */<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 if (unlikely(x &gt; MAX_DT_NODES || y &gt; MAX_DT_NO=
DES)) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;Node found =
with phandle 0x%x &gt; MAX_DT_NODES (%d)!\n&quot;,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 x &gt; MAX_DT_NODES ? x : y, MAX_DT_NODES);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+ =C2=A0 =C2=A0 =C2=A0 if (unlikely(!x || !y))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+ =C2=A0 =C2=A0 =C2=A0 if (unlikely(graph.nedges &gt;=3D MAX_EDGES)) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;Maximum num=
ber of edges (%d) reached!\n&quot;, MAX_EDGES);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+ =C2=A0 =C2=A0 =C2=A0 p =3D &amp;graph.edge_slots[graph.nedges++];<br>
+ =C2=A0 =C2=A0 =C2=A0 graph.include_node[x] =3D 1;<br>
+ =C2=A0 =C2=A0 =C2=A0 graph.include_node[y] =3D 1;<br>
+ =C2=A0 =C2=A0 =C2=A0 p-&gt;y =3D y;<br>
+ =C2=A0 =C2=A0 =C2=A0 p-&gt;next =3D graph.edges[x];<br>
+ =C2=A0 =C2=A0 =C2=A0 graph.edges[x] =3D p; /* insert at head of list */<b=
r>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 graph.nvertices =3D (x &gt; graph.nvertices) ? x : g=
raph.nvertices;<br>
+ =C2=A0 =C2=A0 =C2=A0 graph.nvertices =3D (y &gt; graph.nvertices) ? y : g=
raph.nvertices;<br>
+ =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void __init print_node_name(uint32_t v)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 struct device_node *node;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 node =3D of_find_node_by_phandle(v);<br>
+ =C2=A0 =C2=A0 =C2=A0 if (!node) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;Node for ph=
andle 0x%x not found&quot;, v);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+ =C2=A0 =C2=A0 =C2=A0 if (node-&gt;name)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;%s&quot;, n=
ode-&gt;name);<br>
+ =C2=A0 =C2=A0 =C2=A0 if (node-&gt;full_name)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot; (%s)&quot;=
, node-&gt;full_name);<br>
+ =C2=A0 =C2=A0 =C2=A0 of_node_put(node);<br>
+}<br>
+<br>
+/*<br>
+ * I would prefer to use the BGL (Boost Graph Library), but as I can&#39;t=
 use it<br>
+ * here (for obvious reasons), the next four functions below are based on<=
br>
+ * code of Steven Skiena&#39;s book &#39;The Algorithm Design Manual&#39;.=
<br>
+ */<br>
+<br>
+static void __init process_edge(uint32_t x, uint32_t y)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 if (unlikely(graph.discovered[y] &amp;&amp; !graph.p=
rocessed[y])) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;Cycle found=
 0x%x &quot;, x);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_node_name(x);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_cont(&quot; &lt;-&gt;=
 0x%x &quot;, y);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_node_name(y);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_cont(&quot;!\n&quot;)=
;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 graph.finished =3D 1;<br=
>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void __init process_vertex_late(uint32_t v)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 struct device_node *node;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 node =3D of_find_node_by_phandle(v);<br>
+ =C2=A0 =C2=A0 =C2=A0 if (!node) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;No node for=
 phandle 0x%x not found&quot;, v);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+ =C2=A0 =C2=A0 =C2=A0 order.order[order.count++] =3D node;<br>
+}<br>
+<br>
+static void __init depth_first_search(uint32_t v)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 struct edgenode *p;<br>
+ =C2=A0 =C2=A0 =C2=A0 uint32_t y; /* successor vertex */<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 if (graph.finished)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+ =C2=A0 =C2=A0 =C2=A0 graph.discovered[v] =3D 1;<br>
+ =C2=A0 =C2=A0 =C2=A0 p =3D graph.edges[v];<br>
+ =C2=A0 =C2=A0 =C2=A0 while (p) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y =3D p-&gt;y;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!graph.discovered[y]=
) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 process_edge(v, y);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 depth_first_search(y);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 process_edge(v, y);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (graph.finished)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D p-&gt;next;<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+ =C2=A0 =C2=A0 =C2=A0 process_vertex_late(v);<br>
+ =C2=A0 =C2=A0 =C2=A0 graph.processed[v] =3D 1;<br>
+}<br>
+<br>
+static void __init topological_sort(void)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 unsigned i;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 for (i =3D 1; i &lt;=3D graph.nvertices; ++i)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!graph.discovered[i]=
 &amp;&amp; graph.include_node[i])<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 depth_first_search(i);<br>
+}<br>
+<br>
+static int __init add_dep_list(struct device_node *node)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 const __be32 *list, *list_end;<br>
+ =C2=A0 =C2=A0 =C2=A0 uint32_t ph;<br>
+ =C2=A0 =C2=A0 =C2=A0 struct property *prop;<br>
+ =C2=A0 =C2=A0 =C2=A0 int rc =3D 0;<br>
+ =C2=A0 =C2=A0 =C2=A0 struct device_node *dep;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 prop =3D get_property(node, &quot;dependencies&quot;=
);<br>
+ =C2=A0 =C2=A0 =C2=A0 if (!prop || !prop-&gt;val.len || prop-&gt;val.len%s=
izeof(*list))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+ =C2=A0 =C2=A0 =C2=A0 list =3D (const __be32 *)prop-&gt;val.val;<br>
+ =C2=A0 =C2=A0 =C2=A0 list_end =3D list + prop-&gt;val.len / sizeof(*list)=
;<br>
+ =C2=A0 =C2=A0 =C2=A0 while (list &lt; list_end) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ph =3D fdt32_to_cpu(*lis=
t++);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(!ph)) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Should never happen */<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (node-&gt;name)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warn(&quot;phandle =3D=3D 0 for %s\n&quo=
t;, node-&gt;name);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep =3D of_find_node_by_=
phandle(ph);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(!dep)) {<br=
>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pr_err(&quot;No DT node for dependency with phandle 0x%x found\n&quot;,=
<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ph);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D insert_edge(node-=
&gt;phandle, ph);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 return rc;<br>
+}<br>
+<br>
+/* Copied from drivers/of/base.c */<br>
+static const char *of_prop_next_string(struct property *prop, const char *=
cur)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 const char *curv =3D cur;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 if (!prop)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 if (!cur)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return prop-&gt;val.val;=
<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 curv +=3D strlen(cur) + 1;<br>
+ =C2=A0 =C2=A0 =C2=A0 if (curv &gt;=3D prop-&gt;val.val + prop-&gt;val.len=
)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 return curv;<br>
+}<br>
+<br>
+static int __init add_deps_lnx(struct device_node *parent,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *node)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 struct device_node *child;<br>
+ =C2=A0 =C2=A0 =C2=A0 int rc =3D 0;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 if (!__of_device_is_available(node))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+ =C2=A0 =C2=A0 =C2=A0 if (__of_get_property(node, &quot;compatible&quot;, =
NULL)) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!parent-&gt;phandle)=
 {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (__of_get_property(parent, &quot;compatible&quot;, NULL))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parent-&gt;phandle =3D 1 + order.max_phandl=
e++;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!node-&gt;phandle)<b=
r>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 node-&gt;phandle =3D 1 + order.max_phandle++;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D insert_edge(node-=
&gt;phandle, parent-&gt;phandle);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return rc;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(order.paren=
t_by_phandle[node-&gt;phandle])) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* sanity check */<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pr_err(&quot;0x%x already has a parent!\n&quot;, node-&gt;phandle);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -EINVAL;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 order.parent_by_phandle[=
node-&gt;phandle] =3D parent-&gt;phandle;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D add_dep_list(node=
);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(rc))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return rc;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parent =3D node; /* chan=
ge the parent only if node is a driver */<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+ =C2=A0 =C2=A0 =C2=A0 for_each_child_of_node(node, child) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D add_deps_lnx(pare=
nt, child);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(rc))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 return rc;<br>
+}<br>
+<br>
+static void calc_max_phandle(struct node *np)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 struct node *child;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 if (!np || np-&gt;deleted)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+ =C2=A0 =C2=A0 =C2=A0 if (np-&gt;phandle &gt; order.max_phandle)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 order.max_phandle =3D np=
-&gt;phandle;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 for_each_child(np, child)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 calc_max_phandle(child);=
<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 return;<br>
+}<br>
+<br>
+void __init of_init_print_order(const char *name)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 unsigned i;<br>
+ =C2=A0 =C2=A0 =C2=A0 struct property *prop;<br>
+ =C2=A0 =C2=A0 =C2=A0 const char *cp;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 pr_info(&quot;Default initialization order for %s:\n=
&quot;, name);<br>
+ =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; order.count; ++i) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info(&quot;init %u 0x=
%x&quot;, i, order.order[i]-&gt;phandle);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (order.order[i]-&gt;n=
ame)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pr_cont(&quot; %s&quot;, order.order[i]-&gt;name);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (order.order[i]-&gt;f=
ull_name)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pr_cont(&quot; (%s)&quot;, order.order[i]-&gt;full_name);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prop =3D get_property(or=
der.order[i], &quot;compatible&quot;);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (cp =3D of_prop_next=
_string(prop, NULL); cp;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp =
=3D of_prop_next_string(prop, cp))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pr_cont(&quot; %s&quot;, cp);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_cont(&quot; (parent 0=
x%x)\n&quot;,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 order.parent_by_phandle[order.order[i]-&gt;phandle]);<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+int __init of_init_build_order(struct device_node *root)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 struct device_node *child;<br>
+ =C2=A0 =C2=A0 =C2=A0 int rc =3D 0;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 tree =3D root;<br>
+ =C2=A0 =C2=A0 =C2=A0 if (unlikely(!root))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 calc_max_phandle(root);<br>
+ =C2=A0 =C2=A0 =C2=A0 order.old_max_phandle =3D order.max_phandle;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 for_each_child_of_node(root, child) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D add_deps_lnx(root=
, child);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(rc))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 of_node_put(root);<br>
+ =C2=A0 =C2=A0 =C2=A0 topological_sort();<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 if (graph.finished)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL; /* cycle=
 found */<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 return rc;<br>
+}<br>
diff --git a/scripts/dtc/dtc.c b/scripts/dtc/dtc.c<br>
index fbe49d9..ac9858c 100644<br>
--- a/scripts/dtc/dtc.c<br>
+++ b/scripts/dtc/dtc.c<br>
@@ -88,6 +88,8 @@ static void =C2=A0__attribute__ ((noreturn)) usage(void)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;\t\tSort nodes and proper=
ties before outputting (only useful for\n\t\tcomparing trees)\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;\t-D\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;\t\tDo not automatically =
add dependencies for phandle references\n&quot;);<br>
+ =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;\t-t\n&quot;);<br>
+ =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;\t\tPrint (default) initializa=
tion order\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;\t-v\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;\t\tPrint DTC version and=
 exit\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;\t-H &lt;phandle format&g=
t;\n&quot;);<br>
@@ -110,6 +112,7 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *depname =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int force =3D 0, sort =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int dependencies =3D 1;<br>
+ =C2=A0 =C2=A0 =C2=A0 int init_order =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *arg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int opt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 FILE *outf =3D NULL;<br>
@@ -121,7 +124,7 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 minsize =C2=A0 =C2=A0=3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 padsize =C2=A0 =C2=A0=3D 0;<br>
<br>
- =C2=A0 =C2=A0 =C2=A0 while ((opt =3D getopt(argc, argv, &quot;hI:O:o:V:d:=
R:S:p:fqb:i:vH:sDW:E:&quot;))<br>
+ =C2=A0 =C2=A0 =C2=A0 while ((opt =3D getopt(argc, argv, &quot;hI:O:o:V:d:=
R:S:p:fqb:i:vH:sDtW:E:&quot;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 !=3D EOF) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (opt) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;I&#39;:<b=
r>
@@ -183,6 +186,10 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dependencies =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;t&#39;:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 init_order =3D true;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;W&#39;:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 parse_checks_option(true, false, optarg);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
@@ -245,6 +252,13 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dependencies)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_dependencies(bi=
);<br>
<br>
+ =C2=A0 =C2=A0 =C2=A0 if (init_order) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (of_init_build_order(=
bi-&gt;dt))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(2);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_init_print_order(arg)=
;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (streq(outname, &quot;-&quot;)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outf =3D stdout;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
@@ -266,5 +280,13 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die(&quot;Unknown o=
utput format \&quot;%s\&quot;\n&quot;, outform);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+ =C2=A0 =C2=A0 =C2=A0 /*<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0* Check for cycles by building the initialzati=
on order.<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0* This is done after the output was saved beca=
use it<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0* changes the tree slightly.<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+ =C2=A0 =C2=A0 =C2=A0 if (of_init_build_order(bi-&gt;dt))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(2);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);<br>
=C2=A0}<br>
diff --git a/scripts/dtc/dtc.h b/scripts/dtc/dtc.h<br>
index c3dbeac..b89e08a 100644<br>
--- a/scripts/dtc/dtc.h<br>
+++ b/scripts/dtc/dtc.h<br>
@@ -269,5 +269,7 @@ struct boot_info *dt_from_fs(const char *dirname);<br>
<br>
=C2=A0/* Dependencies */<br>
=C2=A0void add_dependencies(struct boot_info *bi);<br>
+void of_init_print_order(const char *name);<br>
+int of_init_build_order(struct node *root);<br>
<br>
=C2=A0#endif /* _DTC_H */<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.3.1<br>
<br>
<br>
_______________________________________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@li=
sts.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" ta=
rget=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l</a><br>
</font></span></blockquote></div><br></div>

--001a1134a45cb8ab9104f939ee28--
