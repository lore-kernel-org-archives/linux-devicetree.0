From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org: Re: [PATCH] Add merging of labelled
	subnodes. This patch allows the following]
Date: Mon, 20 Sep 2010 13:32:55 +1000
Message-ID: <20100920033255.GB6762@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Done.  I think the testcase we have for it is not ideal, but that's
easily fixed later.

----- Forwarded message from Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> -----

Date: Sat, 18 Sep 2010 17:54:47 -0600
From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org,
	devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Subject: Re: [PATCH] Add merging of labelled subnodes. This patch allows th=
e following

David, can you please ack adding your s-o-b to this one?  It is mostly
your patch anyway, but I had tested it and added a failure test case.
Then Jon will be able to merge it.

g.

---------- Forwarded message ----------
From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Date: Mon, Mar 1, 2010 at 9:54 AM
Subject: [PATCH] Add merging of labelled subnodes. This patch allows
the following
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org,
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org


From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

syntax:

/ {
=A0 =A0 =A0 =A0child {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label: subchild {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
=A0 =A0 =A0 =A0};
};

&label {
=A0 =A0 =A0 =A0prop =3D "value";
};

which will result in the following tree:

/ {
=A0 =A0 =A0 =A0child {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label: subchild {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prop =3D "value";
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
=A0 =A0 =A0 =A0};
};

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

Hi Jon,

This works well for me. =A0I've added another test case to ensure that using
a non-existent label will fail. =A0This patch is primarily from David now, =
so
I've changed the From: attribution, but it still needs his s-o-b line.

Cheers,
g.

=A0dtc-lexer.l =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
=A0dtc-parser.y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 24 +++=
+++++++++--------
=A0tests/nonexist-node-ref2.dts =A0 =A0 =A0 =A0| =A0 10 +++++++++
=A0tests/run_tests.sh =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A03 +++
=A0tests/test_tree1.dts =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
=A0tests/test_tree1_merge.dts =A0 =A0 =A0 =A0 =A0| =A0 =A04 +--
=A0tests/test_tree1_merge_labelled.dts | =A0 41 +++++++++++++++++++++++++++=
++++++++
=A07 files changed, 71 insertions(+), 15 deletions(-)
=A0create mode 100644 tests/nonexist-node-ref2.dts
=A0create mode 100644 tests/test_tree1_merge_labelled.dts

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 3c3434c..5a7e476 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -109,7 +109,7 @@ static int pop_input_file(void);
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return DT_LITERAL;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}

-\&{LABEL} =A0 =A0 =A0{ =A0 =A0 =A0 /* label reference */
+<*>\&{LABEL} =A0 { =A0 =A0 =A0 /* label reference */
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0DPRINT("Ref: %s\n", yytext+1=
);
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0yylval.labelref =3D xstrdup(=
yytext+1);
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return DT_REF;
diff --git a/dtc-parser.y b/dtc-parser.y
index dea19c1..ed87d3b 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -74,7 +74,6 @@ static unsigned long long eval_literal(const char
*s, int base, int bits);
=A0%type <prop> propdef
=A0%type <proplist> proplist

-%type <node> devicetree
=A0%type <node> devicetrees
=A0%type <node> nodedef
=A0%type <node> subnode
@@ -121,20 +120,25 @@ addr:
=A0 =A0 =A0 =A0 =A0;

=A0devicetrees:
- =A0 =A0 =A0 =A0 devicetree
+ =A0 =A0 =A0 =A0 '/' nodedef
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D $1;
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D name_node($2, "");
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
- =A0 =A0 =A0 | devicetrees devicetree
+ =A0 =A0 =A0 | devicetrees '/' nodedef
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D merge_nodes($1, $2);
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D merge_nodes($1, $3);
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
- =A0 =A0 =A0 ;
-
-devicetree:
- =A0 =A0 =A0 =A0 '/' nodedef
+ =A0 =A0 =A0 | devicetrees DT_REF nodedef
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D name_node($2, "");
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct node *target;
+
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 target =3D get_node_by_label(=
$1, $2);
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (target)
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 merge_nodes(t=
arget, $3);
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 yyerror("labe=
l does not exist in "
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 " node redefinition");
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D $1;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
=A0 =A0 =A0 =A0;

diff --git a/tests/nonexist-node-ref2.dts b/tests/nonexist-node-ref2.dts
new file mode 100644
index 0000000..44b4ebe
--- /dev/null
+++ b/tests/nonexist-node-ref2.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+
+/ {
+ =A0 =A0 =A0 label: node {
+ =A0 =A0 =A0 };
+};
+
+/* Try to redefine a node using a non-existent label */
+&nosuchnode {
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 43b9d44..3ce71c4 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -300,6 +300,8 @@ dtc_tests () {
=A0 =A0 # Check merge/overlay functionality
=A0 =A0 run_dtc_test -I dts -O dtb -o dtc_tree1_merge.test.dtb test_tree1_m=
erge.dts
=A0 =A0 tree1_tests dtc_tree1_merge.test.dtb test_tree1.dtb
+ =A0 =A0run_dtc_test -I dts -O dtb -o dtc_tree1_merge_labelled.test.dtb
test_tree1_merge_labelled.dts
+ =A0 =A0tree1_tests dtc_tree1_merge_labelled.test.dtb test_tree1.dtb
=A0 =A0 run_dtc_test -I dts -O dtb -o multilabel_merge.test.dtb multilabel_=
merge.dts
=A0 =A0 run_test references multilabel.test.dtb
=A0 =A0 run_test dtbs_equal_ordered multilabel.test.dtb multilabel_merge.te=
st.dtb
@@ -312,6 +314,7 @@ dtc_tests () {
=A0 =A0 check_tests minusone-phandle.dts explicit_phandles
=A0 =A0 run_sh_test dtc-checkfails.sh phandle_references -- -I dts -O dtb
nonexist-node-ref.dts
=A0 =A0 run_sh_test dtc-checkfails.sh phandle_references -- -I dts -O dtb
nonexist-label-ref.dts
+ =A0 =A0run_sh_test dtc-fatal.sh -I dts -O dtb nonexist-node-ref2.dts
=A0 =A0 check_tests bad-name-property.dts name_properties

=A0 =A0 check_tests bad-ncells.dts address_cells_is_cell
size_cells_is_cell interrupt_cells_is_cell
diff --git a/tests/test_tree1.dts b/tests/test_tree1.dts
index 218c382..4f0ce45 100644
--- a/tests/test_tree1.dts
+++ b/tests/test_tree1.dts
@@ -25,7 +25,7 @@
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linux,phandle =3D <0x2000>;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prop-int =3D <123456789>;

- =A0 =A0 =A0 =A0 =A0 =A0 =A0 subsubnode@0 {
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ssn0: subsubnode@0 {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0phandle =3D <0x2001>;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "subsubnode2"=
, "subsubnode";
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prop-int =3D <0726746425>;
diff --git a/tests/test_tree1_merge.dts b/tests/test_tree1_merge.dts
index f580da8..fc191fd 100644
--- a/tests/test_tree1_merge.dts
+++ b/tests/test_tree1_merge.dts
@@ -34,12 +34,10 @@
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prop-int =3D [deadbeef];
=A0 =A0 =A0 =A0};
=A0 =A0 =A0 =A0subnode@2 {
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 subsubnode@0 {
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ssn0: subsubnode@0 {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0phandle =3D <0x2001>;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "subsubnode2"=
, "subsubnode";
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prop-int =3D <0726746425>;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
=A0 =A0 =A0 =A0};
=A0};
-
-
diff --git a/tests/test_tree1_merge_labelled.dts
b/tests/test_tree1_merge_labelled.dts
new file mode 100644
index 0000000..46a6840
--- /dev/null
+++ b/tests/test_tree1_merge_labelled.dts
@@ -0,0 +1,41 @@
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+ =A0 =A0 =A0 compatible =3D "test_tree1";
+ =A0 =A0 =A0 prop-int =3D <0xdeadbeef>;
+ =A0 =A0 =A0 prop-str =3D "hello world";
+
+ =A0 =A0 =A0 subnode@1 {
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "subnode1";
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop-int =3D [deadbeef];
+
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 subsubnode {
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "subsubnode1",=
 "subsubnode";
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop-int =3D <0xdeadbeef>;
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
+
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ss1 {
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
+ =A0 =A0 =A0 };
+
+ =A0 =A0 =A0 subnode@2 {
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 linux,phandle =3D <0x2000>;
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop-int =3D <123456789>;
+
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ssn0: subsubnode@0 {
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D <0x2001>;
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop-int =3D <0xbad>;
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
+
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ss2 {
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
+ =A0 =A0 =A0 };
+};
+
+&ssn0 {
+ =A0 =A0 =A0 compatible =3D "subsubnode2", "subsubnode";
+ =A0 =A0 =A0 prop-int =3D <0726746425>;
+};




-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.


----- End forwarded message -----

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
