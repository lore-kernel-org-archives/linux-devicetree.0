From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Mon, 1 Mar 2010 12:15:42 -0700
Message-ID: <fa686aa41003011115m1bb0b644g5014340f6c312ee9@mail.gmail.com>
References: <1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
	<fa686aa41002221359m4d857e4cn3a1c56c32a24d21d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41002221359m4d857e4cn3a1c56c32a24d21d-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 22, 2010 at 2:59 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Mon, Feb 22, 2010 at 9:13 AM, Yoder Stuart-B08248
> <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>>
>>> > That still leaves node and property deletion to cover. =A0In keeping
>>> > with the above approach, I'd like to do that in the form of
>>> "negative
>>> > redefinitions" of properties or nodes. =A0A neat syntax for
>>> that doesn't
>>> > immediately occur to be for that yet, though.
>>>
>>> hmmm. =A0I'll think more about it too. =A0I agree that a negative
>>> redefinition sounds like a reasonable approach. =A0I do want the ability
>>> to drop nodes easily. =A0It would make it easy to handle SoC or FPGA
>>> design variants.
>>
>> We had a similar problem in the Freescale Embedded Hypervisor
>> to control the generation of guest device trees. =A0 We defined
>> several 'magic' properties that had special meaning in
>> the context of a node update.
>
> heh, so the functionality is definitely needed, but boy is that ugly!
> :-) =A0I really do think there needs to be a syntactically distinct
> method of deleting nodes and properties. =A0Magic property names that
> look like normal properties worry me.
>
> What about something like this: =A0Right now nodes are defined by <name>
> { [<property>|<node>]; ... }; and properties are defined by <name>; or
> <name> =3D <value>; =A0To differentiate a command from either a node or
> property definition, perhaps round braces could be used:
>
> so for the definition:
> a-node {
> =A0 =A0 =A0 =A0property-1;
> =A0 =A0 =A0 =A0property-2 =3D "blah";
> =A0 =A0 =A0 =A0child-1 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0};
> };
>
> you could delete property-2 and node-1 with:
> a-node {
> =A0 =A0 =A0 =A0delete-node(child-1);
> =A0 =A0 =A0 =A0delete-property(property-2);
> };

Okay.  So the redefinition of nodes feature got implemented far faster
than I expected it would.  Woohoo!  :-)

That leaves the last bit that I really care about; deleting nodes and
properties.  I can probably find the time to implement the C code for
this, but have no idea how to do the grammer, and I don't think we've
got a consensus on syntax.

Given the following tree...

/ {
        child-label: child {
                prop =3D <0xbad>;
                grandchild-label: grandchild {
                };
        };
};

...here are the use cases that I see as important (plus some suggested
syntax.  I'm not happy with it though, and I'm open to better ideas).

1) Deleting a property from a node:
&child-label {
        /* syntax to delete "prop" property */
        delete-prop("prop");
        ^prop;  /* this isn't very good, hard to differentiate from
node deletion */
        __delete_property =3D "prop";
};

2) Delete a child node:
&child-label {
        /* syntax to delete "grandchild" node */
        delete-node("grandchild");
        ^grandchild;
        __delete_node =3D "grandchild";
        grandchild =3D ^{};
};

3) Delete a labelled node from the top level:
delete-node(&grandchild-label);

Comments?  Suggestions?  Better ideas?  Please?  Don't inflict pain on
yourself by letting me decide the syntax.

g.
