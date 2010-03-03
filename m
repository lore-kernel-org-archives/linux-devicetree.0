From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Wed, 3 Mar 2010 09:18:28 -0700
Message-ID: <fa686aa41003030818g33d7bee0t83ac1e44b2428d7@mail.gmail.com>
References: <20080930145537.GJ18313@secretlab.ca>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
	<fa686aa41003011115m1bb0b644g5014340f6c312ee9@mail.gmail.com>
	<4288fc0b-79a4-42fd-9e77-573dbad79210@SG2EHSMHS004.ehs.local>
	<fa686aa41003011349i367a423cx2c59953e6afc9b75@mail.gmail.com>
	<72f497af-412c-4a05-90c2-5df0be00d93f@VA3EHSMHS007.ehs.local>
	<20100302231203.GO23435@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100302231203.GO23435@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 2, 2010 at 4:12 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Mon, Mar 01, 2010 at 02:17:47PM -0800, Stephen Neuendorffer wrote:
>> > -----Original Message-----
>> > From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of =
Grant Likely
>> > Sent: Monday, March 01, 2010 1:49 PM
>> > To: Stephen Neuendorffer
>> > Cc: Yoder Stuart-B08248; Wood Scott-B07421; devicetree-discuss@ozlabs.=
org; John Williams; Jeremy Kerr
>> > Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
> [snip]
>> > This is never legal. =A0If deleting by label, it must be at the top
>> > level. =A0It doesn't make sense to use a label reference inside a node
>> > block, since the node block is already supposed to define where you
>> > are working in the tree.
>> >
>> > > =A0 =A0 =A0 =A0delete(bar); // May or may not be Illegal, since don'=
t know what bar-label references
>> >
>> > No longer an issue since the previous line is illegal.
>> >
>> > Also, must be either delete-node() or delete-prop() since nodes and
>> > properties can use the same names.
>>
>> So, is it true that a tree which is overlayed on another tree can be
>> independently verified to be independent of internal ordering? =A0This
>> would be nice if so.
>
> Hrm, yes and no. =A0Most of our tests for duplicate labels and so forth
> are only performed after all the overlay/merging is completed.
>
> Which brings up another inconsistency in the current processing.
> Although:
>
> =A0 =A0 =A0 =A0/ {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0foo =3D "bar";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0foo =3D "baz";
> =A0 =A0 =A0 =A0};
>
> is illegal and will cause an error, the way that merge_nodes() is
> implemented means that the following will be accepted:
>
> =A0 =A0 =A0 =A0/ {
> =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0/ {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0foo =3D "bar";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0foo =3D "baz";
> =A0 =A0 =A0 =A0};
>
> (and the foo property will have the final value "baz").

That should be easy to fix.  How about the following change to prevent
duplicate properties even getting added to the livetree.  This patch
isn't complete, it breaks some of the test cases because it fails in a
different way, and it makes some of the post-checks redundant.

g.

commit f676848929e6764b3a6c14f14eafacdfcaab5f15
Author: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Date:   Wed Mar 3 09:15:30 2010 -0700

    Don't add duplicate properties to the live tree

diff --git a/dtc-parser.y b/dtc-parser.y
index ed87d3b..053ae67 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -156,6 +156,11 @@ proplist:
 		}
 	| proplist propdef
 		{
+			if (find_property($1, $2->name)) {
+				yyerror("syntax error: duplicate property");
+				YYERROR;
+			}
+
 			$$ =3D chain_property($2, $1);
 		}
 	;
diff --git a/dtc.h b/dtc.h
index b36ac5d..78033fb 100644
--- a/dtc.h
+++ b/dtc.h
@@ -170,6 +170,7 @@ void add_label(struct label **labels, char *label);
 struct property *build_property(char *name, struct data val);
 struct property *chain_property(struct property *first, struct property *l=
ist);
 struct property *reverse_properties(struct property *first);
+struct property *find_property(struct property *proplist, const char *name=
);

 struct node *build_node(struct property *proplist, struct node *children);
 struct node *name_node(struct node *node, char *name);
diff --git a/livetree.c b/livetree.c
index 13c5f10..924e131 100644
--- a/livetree.c
+++ b/livetree.c
@@ -74,6 +74,15 @@ struct property *reverse_properties(struct property *fir=
st)
 	return head;
 }

+struct property *find_property(struct property *proplist, const char *name)
+{
+	for (; proplist; proplist =3D proplist->next)
+		if (streq(proplist->name, name))
+			return proplist;
+
+	return NULL;
+}
+
 struct node *build_node(struct property *proplist, struct node *children)
 {
 	struct node *new =3D xmalloc(sizeof(*new));


-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
