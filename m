From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Add merging of labelled subnodes. This patch allows the
	following
Date: Sun, 28 Feb 2010 23:49:26 -0700
Message-ID: <fa686aa41002282249m4f44c215of8da87de3252c349@mail.gmail.com>
References: <20100226190651.5143.12956.stgit@angua>
	<20100301062202.GC23435@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100301062202.GC23435@yookeroo>
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

On Sun, Feb 28, 2010 at 11:22 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Feb 26, 2010 at 12:07:28PM -0700, Grant Likely wrote:
>> syntax:
>>
>> / {
>> =A0 =A0 =A0 child {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 label: subchild {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> =A0 =A0 =A0 };
>> };
>>
>> &label {
>> =A0 =A0 =A0 prop =3D "value";
>> };
>>
>> which will result in the following tree:
>> / {
>> =A0 =A0 =A0 child {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 label: subchild {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D "value";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> =A0 =A0 =A0 };
>> };
>>
>> ---
>>
>> Hi Jon and David
>>
>> This patch isn't quite finished yet, but I'm getting it out there for
>> feedback. =A0In particular, I'm don't know how best to handle errors in
>> livetree.c. =A0The way I'm currently handling it is calling yyerror()
>> from livetree.c, which results in a compile warning.
>
> Hrm, that's a bit ugly.
>
>> I also don't yet have a test case for referencing a label that doesn't
>> exist in the main tree.
>
> Ah, yeah. =A0Testcases for incorrect input are often the fiddliest.
>
> So, here's my counter-proposal. =A0By rearranging the grammar a little,
> and putting the labelled merge logic into dtc-parser.y itself, it
> accomplishes the same thing without the warning, and with a bit less
> code.

Nice.  I like.  I'll give it a spin tomorrow.

g.

>
> Index: dtc/dtc-lexer.l
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/dtc-lexer.l =A0 =A0 =A0 =A02010-02-09 10:26:06.840350087 +11=
00
> +++ dtc/dtc-lexer.l =A0 =A0 2010-03-01 14:22:26.927391539 +1100
> @@ -109,7 +109,7 @@ static int pop_input_file(void);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return DT_LITERAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> -\&{LABEL} =A0 =A0 =A0{ =A0 =A0 =A0 /* label reference */
> +<*>\&{LABEL} =A0 { =A0 =A0 =A0 /* label reference */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0DPRINT("Ref: %s\n", yytext=
+1);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0yylval.labelref =3D xstrdu=
p(yytext+1);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return DT_REF;
> Index: dtc/dtc-parser.y
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/dtc-parser.y =A0 =A0 =A0 2010-02-26 10:40:00.136001074 +1100
> +++ dtc/dtc-parser.y =A0 =A02010-03-01 17:15:59.779380861 +1100
> @@ -74,7 +74,6 @@ static unsigned long long eval_literal(c
> =A0%type <prop> propdef
> =A0%type <proplist> proplist
>
> -%type <node> devicetree
> =A0%type <node> devicetrees
> =A0%type <node> nodedef
> =A0%type <node> subnode
> @@ -121,20 +120,25 @@ addr:
> =A0 =A0 =A0 =A0 =A0;
>
> =A0devicetrees:
> - =A0 =A0 =A0 =A0 devicetree
> + =A0 =A0 =A0 =A0 '/' nodedef
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D $1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D name_node($2, "");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 | devicetrees devicetree
> + =A0 =A0 =A0 | devicetrees '/' nodedef
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D merge_nodes($1, $2);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D merge_nodes($1, $3);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 ;
> -
> -devicetree:
> - =A0 =A0 =A0 =A0 '/' nodedef
> + =A0 =A0 =A0 | devicetrees DT_REF nodedef
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D name_node($2, "");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct node *target;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 target =3D get_node_by_labe=
l($1, $2);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (target)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 merge_nodes=
(target, $3);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 yyerror("la=
bel does not exist in "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 " node redefinition");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D $1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0;
>
> Index: dtc/tests/run_tests.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/tests/run_tests.sh 2010-03-01 14:21:48.607391244 +1100
> +++ dtc/tests/run_tests.sh =A0 =A0 =A02010-03-01 14:22:26.931385551 +1100
> @@ -301,6 +301,8 @@ dtc_tests () {
> =A0 =A0 # Check merge/overlay functionality
> =A0 =A0 run_dtc_test -I dts -O dtb -o dtc_tree1_merge.test.dtb test_tree1=
_merge.dts
> =A0 =A0 tree1_tests dtc_tree1_merge.test.dtb test_tree1.dtb
> + =A0 =A0run_dtc_test -I dts -O dtb -o dtc_tree1_merge_labelled.test.dtb =
test_tree1_merge_labelled.dts
> + =A0 =A0tree1_tests dtc_tree1_merge_labelled.test.dtb test_tree1.dtb
> =A0 =A0 run_dtc_test -I dts -O dtb -o multilabel_merge.test.dtb multilabe=
l_merge.dts
> =A0 =A0 run_test references multilabel.test.dtb
> =A0 =A0 run_test dtbs_equal_ordered multilabel.test.dtb multilabel_merge.=
test.dtb
> Index: dtc/tests/test_tree1.dts
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/tests/test_tree1.dts =A0 =A0 =A0 2009-11-27 08:45:46.0000000=
00 +1100
> +++ dtc/tests/test_tree1.dts =A0 =A02010-03-01 14:22:26.959424732 +1100
> @@ -25,7 +25,7 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linux,phandle =3D <0x2000>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prop-int =3D <123456789>;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 subsubnode@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ssn0: subsubnode@0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0phandle =3D <0x2001>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "subsubnode=
2", "subsubnode";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prop-int =3D <0726746425>;
> Index: dtc/tests/test_tree1_merge.dts
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- dtc.orig/tests/test_tree1_merge.dts 2010-02-26 10:40:00.136001074 +11=
00
> +++ dtc/tests/test_tree1_merge.dts =A0 =A0 =A02010-03-01 14:22:26.9674247=
71 +1100
> @@ -34,12 +34,10 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prop-int =3D [deadbeef];
> =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0subnode@2 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 subsubnode@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ssn0: subsubnode@0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0phandle =3D <0x2001>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "subsubnode=
2", "subsubnode";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prop-int =3D <0726746425>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0};
> =A0};
> -
> -
> Index: dtc/tests/test_tree1_merge_labelled.dts
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- /dev/null =A0 1970-01-01 00:00:00.000000000 +0000
> +++ dtc/tests/test_tree1_merge_labelled.dts =A0 =A0 2010-03-01 14:22:26.9=
67424771 +1100
> @@ -0,0 +1,41 @@
> +/dts-v1/;
> +
> +/memreserve/ 0xdeadbeef00000000 0x100000;
> +/memreserve/ 123456789 010000;
> +
> +/ {
> + =A0 =A0 =A0 compatible =3D "test_tree1";
> + =A0 =A0 =A0 prop-int =3D <0xdeadbeef>;
> + =A0 =A0 =A0 prop-str =3D "hello world";
> +
> + =A0 =A0 =A0 subnode@1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "subnode1";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop-int =3D [deadbeef];
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 subsubnode {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "subsubnode1=
", "subsubnode";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop-int =3D <0xdeadbeef>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ss1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 subnode@2 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 linux,phandle =3D <0x2000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop-int =3D <123456789>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ssn0: subsubnode@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D <0x2001>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop-int =3D <0xbad>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ss2 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +};
> +
> +&ssn0 {
> + =A0 =A0 =A0 compatible =3D "subsubnode2", "subsubnode";
> + =A0 =A0 =A0 prop-int =3D <0726746425>;
> +};
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
