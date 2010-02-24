From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: dtc: Allow multiple labels on nodes and properties
Date: Tue, 23 Feb 2010 19:10:38 -0700
Message-ID: <fa686aa41002231810r123bc0a5r75df79481b6069be@mail.gmail.com>
References: <20100224010312.GF7187@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100224010312.GF7187@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2010 at 6:03 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> At present, both the grammar and our internal data structures mean
> that there can be only one label on a node, property or memreserve
> entry. =A0This is a fairly arbitrary constraint, given that any number
> of value labels can appear at the same point, and that in C you can
> have any number of labels on the same statement.
>
> This is pretty much a non-issue now, but it may become important with
> some of the extensions that Grant and I have in mind. =A0It's not that
> hard to change, so this patch does so, allowing an arbitrary number of
> labels on any given node or property. =A0As usual a testcase is added
> too.
>
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

As little as I know about the dtc; this looks sane to me.  FWIW...
Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

>
> Index: dtc/tests/multilabel.dts
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- /dev/null =A0 1970-01-01 00:00:00.000000000 +0000
> +++ dtc/tests/multilabel.dts =A0 =A02010-02-23 21:22:00.392145072 +1100
> @@ -0,0 +1,38 @@
> +/dts-v1/;
> +
> +m1: mq: /memreserve/ 0 0x1000;
> +
> +/ {
> + =A0 =A0 =A0 p1: px: prop =3D "foo";
> +
> + =A0 =A0 =A0 /* Explicit phandles */
> + =A0 =A0 =A0 n1: nx: node1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 linux,phandle =3D <0x2000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ref =3D <&{/node2}>; /* reference precedes =
target */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 lref =3D <&ny>;
> + =A0 =A0 =A0 };
> + =A0 =A0 =A0 ny: n2: node2 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ref =3D <&{/node1}>; /* reference after tar=
get */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 lref =3D <&nx>;
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 /* Implicit phandles */
> + =A0 =A0 =A0 n3: node3 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ref =3D <&{/node4}>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 lref =3D <&n4>;
> + =A0 =A0 =A0 };
> + =A0 =A0 =A0 n4: node4 {
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 /* Explicit phandle with implicit value */
> + =A0 =A0 =A0 /* This self-reference is the standard way to tag a node as=
 requiring
> + =A0 =A0 =A0 =A0* a phandle (perhaps for reference by nodes that will be=
 dynamically
> + =A0 =A0 =A0 =A0* added) without explicitly allocating it a phandle.
> + =A0 =A0 =A0 =A0* The self-reference requires some special internal hand=
ling, though
> + =A0 =A0 =A0 =A0* so check it actually works */
> + =A0 =A0 =A0 n5: nz: node5 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 linux,phandle =3D <&n5>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D <&nz>;
> + =A0 =A0 =A0 };
> +};
> Index: dtc/tests/run_tests.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/tests/run_tests.sh 2010-02-23 20:25:38.708956748 +1100
> +++ dtc/tests/run_tests.sh =A0 =A0 =A02010-02-23 20:26:12.371978082 +1100
> @@ -222,6 +222,9 @@ dtc_tests () {
> =A0 =A0 =A0 =A0run_test phandle_format dtc_references.test.$f.dtb $f
> =A0 =A0 done
>
> + =A0 =A0run_dtc_test -I dts -O dtb -o multilabel.test.dtb multilabel.dts
> + =A0 =A0run_test references multilabel.test.dtb
> +
> =A0 =A0 run_dtc_test -I dts -O dtb -o dtc_comments.test.dtb comments.dts
> =A0 =A0 run_dtc_test -I dts -O dtb -o dtc_comments-cmp.test.dtb comments-=
cmp.dts
> =A0 =A0 run_test dtbs_equal_ordered dtc_comments.test.dtb dtc_comments-cm=
p.test.dtb
> Index: dtc/dtc-parser.y
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/dtc-parser.y =A0 =A0 =A0 2010-02-23 20:19:37.315975392 +1100
> +++ dtc/dtc-parser.y =A0 =A02010-02-23 21:27:31.104219098 +1100
> @@ -78,7 +78,6 @@ static unsigned long long eval_literal(c
> =A0%type <node> nodedef
> =A0%type <node> subnode
> =A0%type <nodelist> subnodes
> -%type <labelref> label
>
> =A0%%
>
> @@ -102,9 +101,14 @@ memreserves:
> =A0 =A0 =A0 =A0;
>
> =A0memreserve:
> - =A0 =A0 =A0 =A0 label DT_MEMRESERVE addr addr ';'
> + =A0 =A0 =A0 =A0 DT_MEMRESERVE addr addr ';'
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D build_reserve_entry(=
$3, $4, $1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D build_reserve_entry(=
$2, $3);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 | DT_LABEL memreserve
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 add_label(&$2->labels, $1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D $2;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0;
>
> @@ -118,7 +122,7 @@ addr:
> =A0devicetree:
> =A0 =A0 =A0 =A0 =A0'/' nodedef
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D name_node($2, "", NU=
LL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D name_node($2, "");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0;
>
> @@ -141,13 +145,18 @@ proplist:
> =A0 =A0 =A0 =A0;
>
> =A0propdef:
> - =A0 =A0 =A0 =A0 label DT_PROPNODENAME '=3D' propdata ';'
> + =A0 =A0 =A0 =A0 DT_PROPNODENAME '=3D' propdata ';'
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D build_property($1, $=
3);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 | DT_PROPNODENAME ';'
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D build_property($2, $=
4, $1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D build_property($1, e=
mpty_data);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 | label DT_PROPNODENAME ';'
> + =A0 =A0 =A0 | DT_LABEL propdef
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D build_property($2, e=
mpty_data, $1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 add_label(&$2->labels, $1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D $2;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0;
>
> @@ -264,7 +273,7 @@ subnodes:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$$ =3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 | =A0subnode subnodes
> + =A0 =A0 =A0 | subnode subnodes
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$$ =3D chain_node($1, $2);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> @@ -276,20 +285,14 @@ subnodes:
> =A0 =A0 =A0 =A0;
>
> =A0subnode:
> - =A0 =A0 =A0 =A0 label DT_PROPNODENAME nodedef
> + =A0 =A0 =A0 =A0 DT_PROPNODENAME nodedef
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D name_node($3, $2, $1=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D name_node($2, $1);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 ;
> -
> -label:
> - =A0 =A0 =A0 =A0 /* empty */
> + =A0 =A0 =A0 | DT_LABEL subnode
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 | DT_LABEL
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D $1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 add_label(&$2->labels, $1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D $2;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0;
>
> Index: dtc/dtc.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/dtc.h =A0 =A0 =A02010-02-23 20:19:37.287957166 +1100
> +++ dtc/dtc.h =A0 2010-02-23 21:26:04.067960304 +1100
> @@ -125,13 +125,18 @@ int data_is_one_string(struct data d);
> =A0#define MAX_NODENAME_LEN =A0 =A0 =A0 31
>
> =A0/* Live trees */
> +struct label {
> + =A0 =A0 =A0 char *label;
> + =A0 =A0 =A0 struct label *next;
> +};
> +
> =A0struct property {
> =A0 =A0 =A0 =A0char *name;
> =A0 =A0 =A0 =A0struct data val;
>
> =A0 =A0 =A0 =A0struct property *next;
>
> - =A0 =A0 =A0 char *label;
> + =A0 =A0 =A0 struct label *labels;
> =A0};
>
> =A0struct node {
> @@ -148,21 +153,26 @@ struct node {
> =A0 =A0 =A0 =A0cell_t phandle;
> =A0 =A0 =A0 =A0int addr_cells, size_cells;
>
> - =A0 =A0 =A0 char *label;
> + =A0 =A0 =A0 struct label *labels;
> =A0};
>
> +#define for_each_label(l0, l) \
> + =A0 =A0 =A0 for ((l) =3D (l0); (l); (l) =3D (l)->next)
> +
> =A0#define for_each_property(n, p) \
> =A0 =A0 =A0 =A0for ((p) =3D (n)->proplist; (p); (p) =3D (p)->next)
>
> =A0#define for_each_child(n, c) =A0 \
> =A0 =A0 =A0 =A0for ((c) =3D (n)->children; (c); (c) =3D (c)->next_sibling)
>
> -struct property *build_property(char *name, struct data val, char *label=
);
> +void add_label(struct label **labels, char *label);
> +
> +struct property *build_property(char *name, struct data val);
> =A0struct property *chain_property(struct property *first, struct propert=
y *list);
> =A0struct property *reverse_properties(struct property *first);
>
> =A0struct node *build_node(struct property *proplist, struct node *childr=
en);
> -struct node *name_node(struct node *node, char *name, char *label);
> +struct node *name_node(struct node *node, char *name);
> =A0struct node *chain_node(struct node *first, struct node *list);
>
> =A0void add_property(struct node *node, struct property *prop);
> @@ -191,10 +201,10 @@ struct reserve_info {
>
> =A0 =A0 =A0 =A0struct reserve_info *next;
>
> - =A0 =A0 =A0 char *label;
> + =A0 =A0 =A0 struct label *labels;
> =A0};
>
> -struct reserve_info *build_reserve_entry(uint64_t start, uint64_t len, c=
har *label);
> +struct reserve_info *build_reserve_entry(uint64_t start, uint64_t len);
> =A0struct reserve_info *chain_reserve_entry(struct reserve_info *first,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 struct reserve_info *list);
> =A0struct reserve_info *add_reserve_entry(struct reserve_info *list,
> Index: dtc/flattree.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/flattree.c 2010-02-23 20:19:37.327957222 +1100
> +++ dtc/flattree.c =A0 =A0 =A02010-02-23 21:22:38.223958196 +1100
> @@ -52,9 +52,9 @@ struct emitter {
> =A0 =A0 =A0 =A0void (*string)(void *, char *, int);
> =A0 =A0 =A0 =A0void (*align)(void *, int);
> =A0 =A0 =A0 =A0void (*data)(void *, struct data);
> - =A0 =A0 =A0 void (*beginnode)(void *, const char *);
> - =A0 =A0 =A0 void (*endnode)(void *, const char *);
> - =A0 =A0 =A0 void (*property)(void *, const char *);
> + =A0 =A0 =A0 void (*beginnode)(void *, struct label *labels);
> + =A0 =A0 =A0 void (*endnode)(void *, struct label *labels);
> + =A0 =A0 =A0 void (*property)(void *, struct label *labels);
> =A0};
>
> =A0static void bin_emit_cell(void *e, cell_t val)
> @@ -89,17 +89,17 @@ static void bin_emit_data(void *e, struc
> =A0 =A0 =A0 =A0*dtbuf =3D data_append_data(*dtbuf, d.val, d.len);
> =A0}
>
> -static void bin_emit_beginnode(void *e, const char *label)
> +static void bin_emit_beginnode(void *e, struct label *labels)
> =A0{
> =A0 =A0 =A0 =A0bin_emit_cell(e, FDT_BEGIN_NODE);
> =A0}
>
> -static void bin_emit_endnode(void *e, const char *label)
> +static void bin_emit_endnode(void *e, struct label *labels)
> =A0{
> =A0 =A0 =A0 =A0bin_emit_cell(e, FDT_END_NODE);
> =A0}
>
> -static void bin_emit_property(void *e, const char *label)
> +static void bin_emit_property(void *e, struct label *labels)
> =A0{
> =A0 =A0 =A0 =A0bin_emit_cell(e, FDT_PROP);
> =A0}
> @@ -191,37 +191,40 @@ static void asm_emit_data(void *e, struc
> =A0 =A0 =A0 =A0assert(off =3D=3D d.len);
> =A0}
>
> -static void asm_emit_beginnode(void *e, const char *label)
> +static void asm_emit_beginnode(void *e, struct label *labels)
> =A0{
> =A0 =A0 =A0 =A0FILE *f =3D e;
> + =A0 =A0 =A0 struct label *l;
>
> - =A0 =A0 =A0 if (label) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "\t.globl\t%s\n", label);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s:\n", label);
> + =A0 =A0 =A0 for_each_label(labels, l) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "\t.globl\t%s\n", l->label);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s:\n", l->label);
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0fprintf(f, "\t/* FDT_BEGIN_NODE */\n");
> =A0 =A0 =A0 =A0asm_emit_cell(e, FDT_BEGIN_NODE);
> =A0}
>
> -static void asm_emit_endnode(void *e, const char *label)
> +static void asm_emit_endnode(void *e, struct label *labels)
> =A0{
> =A0 =A0 =A0 =A0FILE *f =3D e;
> + =A0 =A0 =A0 struct label *l;
>
> =A0 =A0 =A0 =A0fprintf(f, "\t/* FDT_END_NODE */\n");
> =A0 =A0 =A0 =A0asm_emit_cell(e, FDT_END_NODE);
> - =A0 =A0 =A0 if (label) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "\t.globl\t%s_end\n", label);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s_end:\n", label);
> + =A0 =A0 =A0 for_each_label(labels, l) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "\t.globl\t%s_end\n", l->label);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s_end:\n", l->label);
> =A0 =A0 =A0 =A0}
> =A0}
>
> -static void asm_emit_property(void *e, const char *label)
> +static void asm_emit_property(void *e, struct label *labels)
> =A0{
> =A0 =A0 =A0 =A0FILE *f =3D e;
> + =A0 =A0 =A0 struct label *l;
>
> - =A0 =A0 =A0 if (label) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "\t.globl\t%s\n", label);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s:\n", label);
> + =A0 =A0 =A0 for_each_label(labels, l) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "\t.globl\t%s\n", l->label);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s:\n", l->label);
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0fprintf(f, "\t/* FDT_PROP */\n");
> =A0 =A0 =A0 =A0asm_emit_cell(e, FDT_PROP);
> @@ -260,7 +263,7 @@ static void flatten_tree(struct node *tr
> =A0 =A0 =A0 =A0struct node *child;
> =A0 =A0 =A0 =A0int seen_name_prop =3D 0;
>
> - =A0 =A0 =A0 emit->beginnode(etarget, tree->label);
> + =A0 =A0 =A0 emit->beginnode(etarget, tree->labels);
>
> =A0 =A0 =A0 =A0if (vi->flags & FTF_FULLPATH)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit->string(etarget, tree->fullpath, 0);
> @@ -277,7 +280,7 @@ static void flatten_tree(struct node *tr
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nameoff =3D stringtable_insert(strbuf, pro=
p->name);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit->property(etarget, prop->label);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit->property(etarget, prop->labels);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit->cell(etarget, prop->val.len);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit->cell(etarget, nameoff);
>
> @@ -304,7 +307,7 @@ static void flatten_tree(struct node *tr
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0flatten_tree(child, emit, etarget, strbuf,=
 vi);
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 emit->endnode(etarget, tree->label);
> + =A0 =A0 =A0 emit->endnode(etarget, tree->labels);
> =A0}
>
> =A0static struct data flatten_reserve_list(struct reserve_info *reserveli=
st,
> @@ -525,9 +528,11 @@ void dt_to_asm(FILE *f, struct boot_info
> =A0 =A0 =A0 =A0 * as it appears .quad isn't available in some assemblers.
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0for (re =3D bi->reservelist; re; re =3D re->next) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (re->label) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "\t.globl\t%s\n"=
, re->label);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s:\n", re->lab=
el);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct label *l;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_label(re->labels, l) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "\t.globl\t%s\n"=
, l->label);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s:\n", l->labe=
l);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ASM_EMIT_BELONG(f, "0x%08x", (unsigned int=
)(re->re.address >> 32));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ASM_EMIT_BELONG(f, "0x%08x",
> @@ -684,7 +689,7 @@ static struct property *flat_read_proper
>
> =A0 =A0 =A0 =A0val =3D flat_read_data(dtbuf, proplen);
>
> - =A0 =A0 =A0 return build_property(name, val, NULL);
> + =A0 =A0 =A0 return build_property(name, val);
> =A0}
>
>
> @@ -709,7 +714,7 @@ static struct reserve_info *flat_read_me
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (re.size =3D=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 new =3D build_reserve_entry(re.address, re.=
size, NULL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 new =3D build_reserve_entry(re.address, re.=
size);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reservelist =3D add_reserve_entry(reservel=
ist, new);
> =A0 =A0 =A0 =A0}
>
> Index: dtc/fstree.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/fstree.c =A0 2010-02-23 20:19:37.295956576 +1100
> +++ dtc/fstree.c =A0 =A0 =A0 =A02010-02-23 20:26:42.703959114 +1100
> @@ -60,8 +60,7 @@ static struct node *read_fstree(const ch
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prop =3D b=
uild_property(xstrdup(de->d_name),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data_copy_file(pfile,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0st.st_size),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NULL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0st.st_size)=
);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0add_proper=
ty(tree, prop);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fclose(pfi=
le);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> @@ -69,8 +68,7 @@ static struct node *read_fstree(const ch
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct node *newchild;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0newchild =3D read_fstree(t=
mpnam);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 newchild =3D name_node(newc=
hild, xstrdup(de->d_name),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0NULL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 newchild =3D name_node(newc=
hild, xstrdup(de->d_name));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0add_child(tree, newchild);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> @@ -85,7 +83,7 @@ struct boot_info *dt_from_fs(const char
> =A0 =A0 =A0 =A0struct node *tree;
>
> =A0 =A0 =A0 =A0tree =3D read_fstree(dirname);
> - =A0 =A0 =A0 tree =3D name_node(tree, "", NULL);
> + =A0 =A0 =A0 tree =3D name_node(tree, "");
>
> =A0 =A0 =A0 =A0return build_boot_info(NULL, tree, guess_boot_cpuid(tree));
> =A0}
> Index: dtc/livetree.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/livetree.c 2010-02-23 20:27:00.423956836 +1100
> +++ dtc/livetree.c =A0 =A0 =A02010-02-23 21:25:44.091960558 +1100
> @@ -24,17 +24,24 @@
> =A0* Tree building functions
> =A0*/
>
> -struct property *build_property(char *name, struct data val, char *label)
> +void add_label(struct label **labels, char *label)
> +{
> + =A0 =A0 =A0 struct label *new =3D xmalloc(sizeof(*new));
> +
> + =A0 =A0 =A0 new->label =3D label;
> + =A0 =A0 =A0 new->next =3D *labels;
> + =A0 =A0 =A0 *labels =3D new;
> +}
> +
> +struct property *build_property(char *name, struct data val)
> =A0{
> =A0 =A0 =A0 =A0struct property *new =3D xmalloc(sizeof(*new));
>
> + =A0 =A0 =A0 memset(new, 0, sizeof(*new));
> +
> =A0 =A0 =A0 =A0new->name =3D name;
> =A0 =A0 =A0 =A0new->val =3D val;
>
> - =A0 =A0 =A0 new->next =3D NULL;
> -
> - =A0 =A0 =A0 new->label =3D label;
> -
> =A0 =A0 =A0 =A0return new;
> =A0}
>
> @@ -78,14 +85,12 @@ struct node *build_node(struct property
> =A0 =A0 =A0 =A0return new;
> =A0}
>
> -struct node *name_node(struct node *node, char *name, char * label)
> +struct node *name_node(struct node *node, char *name)
> =A0{
> =A0 =A0 =A0 =A0assert(node->name =3D=3D NULL);
>
> =A0 =A0 =A0 =A0node->name =3D name;
>
> - =A0 =A0 =A0 node->label =3D label;
> -
> =A0 =A0 =A0 =A0return node;
> =A0}
>
> @@ -124,8 +129,7 @@ void add_child(struct node *parent, stru
> =A0 =A0 =A0 =A0*p =3D child;
> =A0}
>
> -struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0char *label)
> +struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
> =A0{
> =A0 =A0 =A0 =A0struct reserve_info *new =3D xmalloc(sizeof(*new));
>
> @@ -134,8 +138,6 @@ struct reserve_info *build_reserve_entry
>
> =A0 =A0 =A0 =A0new->next =3D NULL;
>
> - =A0 =A0 =A0 new->label =3D label;
> -
> =A0 =A0 =A0 =A0return new;
> =A0}
>
> @@ -217,8 +219,11 @@ struct property *get_property_by_label(s
> =A0 =A0 =A0 =A0*node =3D tree;
>
> =A0 =A0 =A0 =A0for_each_property(tree, prop) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (prop->label && streq(prop->label, label=
))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return prop;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct label *l;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_label(prop->labels, l)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (streq(l->label, label))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return prop;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0for_each_child(tree, c) {
> @@ -296,11 +301,13 @@ struct node *get_node_by_path(struct nod
> =A0struct node *get_node_by_label(struct node *tree, const char *label)
> =A0{
> =A0 =A0 =A0 =A0struct node *child, *node;
> + =A0 =A0 =A0 struct label *l;
>
> =A0 =A0 =A0 =A0assert(label && (strlen(label) > 0));
>
> - =A0 =A0 =A0 if (tree->label && streq(tree->label, label))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return tree;
> + =A0 =A0 =A0 for_each_label(tree->labels, l)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (streq(l->label, label))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return tree;
>
> =A0 =A0 =A0 =A0for_each_child(tree, child) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0node =3D get_node_by_label(child, label);
> @@ -353,15 +360,13 @@ cell_t get_node_phandle(struct node *roo
> =A0 =A0 =A0 =A0 =A0 =A0&& (phandle_format & PHANDLE_LEGACY))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0add_property(node,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 build_property("l=
inux,phandle",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 data_append_cell(empty_data, phandle),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 NULL));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 data_append_cell(empty_data, phandle)));
>
> =A0 =A0 =A0 =A0if (!get_property(node, "phandle")
> =A0 =A0 =A0 =A0 =A0 =A0&& (phandle_format & PHANDLE_EPAPR))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0add_property(node,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 build_property("p=
handle",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 data_append_cell(empty_data, phandle),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 NULL));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 data_append_cell(empty_data, phandle)));
>
> =A0 =A0 =A0 =A0/* If the node *does* have a phandle property, we must
> =A0 =A0 =A0 =A0 * be dealing with a self-referencing phandle, which will =
be
> Index: dtc/checks.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/checks.c =A0 2010-02-23 20:36:00.637005770 +1100
> +++ dtc/checks.c =A0 =A0 =A0 =A02010-02-23 20:48:07.763956954 +1100
> @@ -314,16 +314,19 @@ static void check_duplicate_label(struct
> =A0static void check_duplicate_label_node(struct check *c, struct node *d=
t,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 struct node *node)
> =A0{
> - =A0 =A0 =A0 if (node->label)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 check_duplicate_label(c, dt, node->label, n=
ode, NULL, NULL);
> + =A0 =A0 =A0 struct label *l;
> +
> + =A0 =A0 =A0 for_each_label(node->labels, l)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 check_duplicate_label(c, dt, l->label, node=
, NULL, NULL);
> =A0}
> =A0static void check_duplicate_label_prop(struct check *c, struct node *d=
t,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 struct node *node, struct property *prop)
> =A0{
> =A0 =A0 =A0 =A0struct marker *m =3D prop->val.markers;
> + =A0 =A0 =A0 struct label *l;
>
> - =A0 =A0 =A0 if (prop->label)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 check_duplicate_label(c, dt, prop->label, n=
ode, prop, NULL);
> + =A0 =A0 =A0 for_each_label(prop->labels, l)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 check_duplicate_label(c, dt, l->label, node=
, prop, NULL);
>
> =A0 =A0 =A0 =A0for_each_marker_of_type(m, LABEL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0check_duplicate_label(c, dt, m->ref, node,=
 prop, m);
> Index: dtc/treesource.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/treesource.c =A0 =A0 =A0 2010-02-23 20:46:05.111977449 +1100
> +++ dtc/treesource.c =A0 =A02010-02-23 21:23:10.720754157 +1100
> @@ -235,10 +235,11 @@ static void write_tree_source_node(FILE
> =A0{
> =A0 =A0 =A0 =A0struct property *prop;
> =A0 =A0 =A0 =A0struct node *child;
> + =A0 =A0 =A0 struct label *l;
>
> =A0 =A0 =A0 =A0write_prefix(f, level);
> - =A0 =A0 =A0 if (tree->label)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s: ", tree->label);
> + =A0 =A0 =A0 for_each_label(tree->labels, l)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s: ", l->label);
> =A0 =A0 =A0 =A0if (tree->name && (*tree->name))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(f, "%s {\n", tree->name);
> =A0 =A0 =A0 =A0else
> @@ -246,8 +247,8 @@ static void write_tree_source_node(FILE
>
> =A0 =A0 =A0 =A0for_each_property(tree, prop) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0write_prefix(f, level+1);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (prop->label)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s: ", prop->la=
bel);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_label(prop->labels, l)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s: ", l->label=
);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(f, "%s", prop->name);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0write_propval(f, prop);
> =A0 =A0 =A0 =A0}
> @@ -267,8 +268,10 @@ void dt_to_source(FILE *f, struct boot_i
> =A0 =A0 =A0 =A0fprintf(f, "/dts-v1/;\n\n");
>
> =A0 =A0 =A0 =A0for (re =3D bi->reservelist; re; re =3D re->next) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (re->label)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s: ", re->labe=
l);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct label *l;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_label(re->labels, l)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(f, "%s: ", l->label=
);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(f, "/memreserve/\t0x%016llx 0x%016=
llx;\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(unsigned long long)re->re=
.address,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(unsigned long long)re->re=
.size);
>
>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
