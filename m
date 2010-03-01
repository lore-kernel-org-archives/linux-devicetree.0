From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Mon, 1 Mar 2010 14:49:17 -0700
Message-ID: <fa686aa41003011349i367a423cx2c59953e6afc9b75@mail.gmail.com>
References: <1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
	<fa686aa41003011115m1bb0b644g5014340f6c312ee9@mail.gmail.com>
	<4288fc0b-79a4-42fd-9e77-573dbad79210@SG2EHSMHS004.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4288fc0b-79a4-42fd-9e77-573dbad79210-RaUQJvECHiuXHCJdrdq+zrjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen, good comments...

On Mon, Mar 1, 2010 at 1:30 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> Given the following tree...
>>
>> / {
>> =A0 =A0 =A0 =A0 child-label: child {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D <0xbad>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 grandchild-label: grandchild {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> =A0 =A0 =A0 =A0 };
>> };
>>
>> ...here are the use cases that I see as important (plus some suggested
>> syntax. =A0I'm not happy with it though, and I'm open to better ideas).
>>
>> 1) Deleting a property from a node:
>> &child-label {
>> =A0 =A0 =A0 =A0 /* syntax to delete "prop" property */
>> =A0 =A0 =A0 =A0 delete-prop("prop");
>> =A0 =A0 =A0 =A0 ^prop; =A0/* this isn't very good, hard to differentiate=
 from
>> node deletion */
>> =A0 =A0 =A0 =A0 __delete_property =3D "prop";
>> };
>>
>> 2) Delete a child node:
>> &child-label {
>> =A0 =A0 =A0 =A0 /* syntax to delete "grandchild" node */
>> =A0 =A0 =A0 =A0 delete-node("grandchild");
>> =A0 =A0 =A0 =A0 ^grandchild;
>> =A0 =A0 =A0 =A0 __delete_node =3D "grandchild";
>> =A0 =A0 =A0 =A0 grandchild =3D ^{};
>> };
>>
>> 3) Delete a labelled node from the top level:
>> delete-node(&grandchild-label);
>>
>> Comments? =A0Suggestions? =A0Better ideas? =A0Please? =A0Don't inflict p=
ain on
>> yourself by letting me decide the syntax.
>>
>> g.
>
> One thing I've seen in the past is that there is a sequentialization ques=
tion in this, which becomes
> more apparent once deletion is allowed.
>
> First off, my assumption is that each node name is always unique in a tre=
e, even when overrides are allowed.
> Otherwise the sub-node and property ordering becomes important.

Yes, multiple sibling nodes with the same name are not allowed by dtc.
 I believe multiple siblings of the same name is legal with
OpenFirmware, but that is at least partially because in OpenFirmware
the @<addr> portion isn't necessarily part of the name.  (Imagine
having triplets and naming them Sally@1, Sally@2 and Sally@3!)

However, the same name can be used by non-siblings.  For example, the
following is totally legal:

/ {
    foo {
        foo {
        };
    };
};

> foo {
> =A0 =A0 =A0 =A0bar =3D 2;
> =A0 =A0 =A0 =A0bar =3D 3; // Illegal
> } ;
>
>
> foo {
> =A0 =A0 =A0 =A0bar =3D 2;
> }
> foo {
> =A0 =A0 =A0 =A0bar =3D 3; // Legal
> };
>
>
> So, essentially, sequentialization of operation is forced by the concaten=
ation of trees.

Yes, you are exactly correct.  The model is to fully form 2 trees, and
then overlay the latter on the former.

> Similarly:
>
> foo {
> =A0 =A0 =A0 =A0bar-label: bar =3D 2;
> }
> &bar-label =3D 3;

This actually isn't legal, but for an entirely different reason.  Even
though labels can be applied to properties, property labels aren't
actually used for anything unless asm output is selected.  All tree
modification as of now is done from the context of nodes.
Redefinition can start from the root node, or it can start from a
labelled node, but there is no syntax defined for modifying a labelled
property.

It is possible to add redefinition of labelled properties, but I'd
like to see a use case first, and why it is better than the current
form (similar to the arguments I put forth for node redefinition by
label).

So, if I rework your example to use nodes...

foo {
        bar-label: bar {
                prop =3D 2;
        };
};
&bar-label {
        prop =3D 3;
};

So, yes, prop in the second tree overrides the prop in the first tree
because it is the same property name in the 'bar' node.

> delete has the similar problem.
>
> foo {
> =A0 =A0 =A0 =A0bar =3D 2;
> =A0 =A0 =A0 =A0delete(bar); // Should be illegal
> }
>
> foo {
> =A0 =A0 =A0 =A0bar-label: bar =3D 2;
> }
> delete(&bar-label); =A0// Legal.
> foo {
> =A0 =A0 =A0 =A0bar-label: bar =3D 4; =A0// Legal, even though previously =
deleted
> }

reworked to use nodes:
foo {
        bar-label: bar {
                prop =3D 2;
                delete(bar); // should be illegal
        };
};
foo {
        bar-label: bar {  /* legal, adds label to node */
                prop =3D 3;  /* legal, changes prop */
        };
};
delete-node(&bar-label};  // legal
foo {
        bar-label: bar {  /* Legal, even though previously deleted */
                prop =3D 4;
        };
};

> So, regardless of the syntax, I think it's important to ensure the above =
checks and sequentiality.
> There's also a canonicalization question, because you can spit out the or=
iginal source, or the 'reduction'
> which results in all the overrides and deletions. =A0 I think from lookin=
g at Grant's patch, this is already
> the way things work, but I don't think anyone had really explicitly state=
d that.

Hmmm, perhaps nobody has.  Yes, each node redefinition is fully
processed before going on to the next one.  Think: a stack of
transparencies where each new sheet masks/changed/adds to the one
below it.

> One trick is that the below is problematic, or at least hard to verify st=
atically.
>
> foo {
> =A0 =A0 =A0 =A0delete(&bar-label); // Legal.

This is never legal.  If deleting by label, it must be at the top
level.  It doesn't make sense to use a label reference inside a node
block, since the node block is already supposed to define where you
are working in the tree.

> =A0 =A0 =A0 =A0delete(bar); // May or may not be Illegal, since don't kno=
w what bar-label references

No longer an issue since the previous line is illegal.

Also, must be either delete-node() or delete-prop() since nodes and
properties can use the same names.

> }
>
> So, to syntax: the sequentialization property may be more syntactically o=
bvious if deletion resembles
> setting a property or node like:
>
> =A0^bar
> =A0!bar
> or even
> =A0bar =3D !;
> =A0bar !;

That's an interesting point.  Perhaps it would be better to use a
syntax that enforces the concept of overlays, and talk about masking
out instead of deleting nodes and properties from the earlier tree.

I kind of like the ^ syntax, but there would have to be syntax
variations for both node and property masking.  I'm not sure it's a
good idea to dedicate otherwise valid node name characters to the
purpose of masking.

>
> Which brings up the question 'undeletion question'. =A0Can you do:
>
> d-label: delete(bar);
> delete(&d-label);

Not sure I follow.  It certainly isn't be valid to apply a label to a
command like delete().

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
