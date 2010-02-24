From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] Allow device tree to be modified by additonal device tree
	sections
Date: Tue, 23 Feb 2010 19:05:53 -0700
Message-ID: <fa686aa41002231805q1f5c6179j6fb7f6cd0558972e@mail.gmail.com>
References: <20100223192659.11939.42521.stgit@angua>
	<20100224013658.GG7187@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100224013658.GG7187@yookeroo>
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

On Tue, Feb 23, 2010 at 6:36 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Feb 23, 2010 at 12:28:13PM -0700, Grant Likely wrote:
>> This patch allows the following construct:
>>
>> / {
>> =A0 =A0 =A0 property-a =3D "old";
>> =A0 =A0 =A0 property-b =3D "does not change";
>> };
>>
>> / {
>> =A0 =A0 =A0 property-a =3D "changed";
>> =A0 =A0 =A0 property-c =3D "new";
>> =A0 =A0 =A0 node-a {
>> =A0 =A0 =A0 };
>> };
>
> Heh. =A0I'm glad I didn't far last night with my own implementation of
> the concept.

:-)

>> Where the later device tree overrides the properties found in the
>> earlier tree. =A0This is useful for laying down a template device tree
>> in an include file and modifying it for a specific board without having
>> to clone the entire tree.
>>
>> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> ---
>>
>> I haven't extensively tested this patch yet, and I haven't figured out y=
et
>> how to properly write the test cases, but I want to get this out there to
>> make sure I'm taking the right approach.
>
> Ok, I have a test case from my start to this, which you can use. =A0Your
> dts files give a wider range of cases to check, but they'll also need
> more test code to verify.
>
> To add testcases, you basically just list them in run_tests.sh. =A0For
> simple things, like just invoking dtc, or checking things for which
> there is already a test program, it may be sufficient just to add the
> right things into there. =A0For more complex and specific testing you'll
> need to write a testcase binary, which should use the macros in
> tests.h to indicate success or failure.
>
> In this case, I think the simplest way to go is to write dts files
> which use the merge functionality to create a tree identical to one of
> the existing samples (like test_tree1.dts). =A0Then the testcase
> consists of two parts, one invoking dtc on the merge tree (to check
> that it even processes it without error), then a second comparing the
> output tree to the thing it's supposed to match.
>
> We won't be able to use the existing dtbs_equal_ordered,
> unfortunately, because the merge behaviour could do odd things to the
> order. =A0Still, I've been meaning to implement a dtbs_equal_unordered
> for ages.
>
>> diff --git a/dtc-parser.y b/dtc-parser.y
>> index bd9e097..8f5c4a3 100644
>> --- a/dtc-parser.y
>> +++ b/dtc-parser.y
>> @@ -75,6 +75,7 @@ static unsigned long long eval_literal(const char *s, =
int base, int bits);
>> =A0%type <proplist> proplist
>>
>> =A0%type <node> devicetree
>> +%type <node> devicetrees
>> =A0%type <node> nodedef
>> =A0%type <node> subnode
>> =A0%type <nodelist> subnodes
>> @@ -83,7 +84,7 @@ static unsigned long long eval_literal(const char *s, =
int base, int bits);
>> =A0%%
>>
>> =A0sourcefile:
>> - =A0 =A0 =A0 DT_V1 ';' memreserves devicetree
>> + =A0 =A0 =A0 DT_V1 ';' memreserves devicetrees
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 the_boot_info =3D build_boot=
_info($3, $4,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 guess_boot_cpuid($4));
>> @@ -115,6 +116,17 @@ addr:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 ;
>>
>> +devicetrees:
>> + =A0 =A0 =A0 /* empty */
>
> We always want at least one device tree block, so the base case here
> should be 'devicetree', rather than empty.

Okay, I'll change this.  I'm unclear however, if a single 'devicetree'
can get promoted up to a 'devicetrees', then will that cause problems
with the 'devicetree devicetrees' rule because the stack will contain
a 'devicetrees' when the rule wants a 'devicetree' first?

>> + =A0 =A0 printf("Merge node, old_node:%s new_node:%s\n", old_node->name,
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_node ? new_node->name : "<NULL>" );
>
> There already exist some debug() macros in dtc.h for this sort of
> message.

I hadn't meant to leave this in.  It's already gone.

>
>> + =A0 =A0 if (!new_node)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return old_node;
>
> With the grammar change suggested above, you don't need this.

Cool.

>
>> + =A0 =A0 /* Move the override properties into the old node. =A0If there
>> + =A0 =A0 =A0* is a collision, replace the old definition with the new */
>> + =A0 =A0 while (new_node->proplist) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* Pop the property off the list */
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_prop =3D new_node->proplist;
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_node->proplist =3D new_prop->next;
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_prop->next =3D NULL;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* Look for a collision, set new value if ther=
e is */
>> + =A0 =A0 =A0 =A0 =A0 =A0 for_each_property(old_node, old_prop) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (strcmp(old_prop->name, new=
_prop->name) =3D=3D 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 old_prop->val =
=3D new_prop->val;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(new_prop);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new_prop =3D N=
ULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>
> I guess there should be a data_free() here of the old value. =A0Mind you
> memory management in dtc is already a bit of a mess. =A0I've considered
> moving it to talloc() (Tridge's nifty hierarchical pool allocator) or,
> more controversially, just never bothering to free() anything on the
> grounds that dtc processes are always shortlived anyway.

Okay, think about it and let me know what you want me to do here.

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* Assuming no collision, add the property to =
the old node. */
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (new_prop)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 add_property(old_node, new_pro=
p);
>> + =A0 =A0 }
>> +
>> + =A0 =A0 /* Move the override child nodes into the primary node. =A0If
>> + =A0 =A0 =A0* there is a collision, then merge the nodes. */
>> + =A0 =A0 while (new_node->children) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* Pop the child node off the list */
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_child =3D new_node->children;
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_node->children =3D new_child->next_sibling;
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_child->parent =3D NULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_child->next_sibling =3D NULL;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* Search for a collision. =A0Merge if there i=
s */
>> + =A0 =A0 =A0 =A0 =A0 =A0 for_each_child(old_node, old_child) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (strcmp(old_child->name, ne=
w_child->name)
>> =3D=3D 0) {
>
> Ok, you should use the streq() macro instead of an explicit strcmp()
> =3D=3D 0.

okay.

> =A0However, there's also a bigger question here. =A0How precise do
> we want the nodename matching to be. =A0Should we be using the OF-style
> matchin where you can omit the unit address when it's unambiguous.
>
> i.e. Should we allow:
>
> / {
> =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0somebus@1234 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0widget@17 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0};
> };
>
> / {
> =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0somebus {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0widget {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0new-property;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0};
> };
>

My opinion: no way.  We're not working with real OF, and none of the
use cases I see have any need of such a feature.  While we could
forbid it now and permit it later, we cannot permit it now and forbid
it later.  I say no until someone comes up with a reasonable use case
on why it should be implemented.

g.
