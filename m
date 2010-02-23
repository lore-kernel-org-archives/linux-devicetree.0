From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Tue, 23 Feb 2010 13:04:29 +1100
Message-ID: <20100223020429.GC12285@yookeroo>
References: <1222460748-20127-7-git-send-email-jdl@jdl.com>
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
Content-Disposition: inline
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 22, 2010 at 02:59:25PM -0700, Grant Likely wrote:
> On Mon, Feb 22, 2010 at 9:13 AM, Yoder Stuart-B08248
> <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> >
> >> > That still leaves node and property deletion to cover. =A0In keeping
> >> > with the above approach, I'd like to do that in the form of
> >> "negative
> >> > redefinitions" of properties or nodes. =A0A neat syntax for
> >> that doesn't
> >> > immediately occur to be for that yet, though.
> >>
> >> hmmm. =A0I'll think more about it too. =A0I agree that a negative
> >> redefinition sounds like a reasonable approach. =A0I do want the abili=
ty
> >> to drop nodes easily. =A0It would make it easy to handle SoC or FPGA
> >> design variants.
> >
> > We had a similar problem in the Freescale Embedded Hypervisor
> > to control the generation of guest device trees. =A0 We defined
> > several 'magic' properties that had special meaning in
> > the context of a node update.
> =

> heh, so the functionality is definitely needed, but boy is that ugly!
> :-)  I really do think there needs to be a syntactically distinct
> method of deleting nodes and properties.  Magic property names that
> look like normal properties worry me.

Ah, yeah.  However, as Stuart said, the magic properties need to be
interpreted at runtime, so in that case it kind of makes sense.  What
we're discussing here, does have the interesting possibility that we
could extend it so that with the right flag set from command line
option and/or a special directive in the .dts we could have a mode
where instead of immediately processing node and property
redefinitions in our new syntax, we instead build them into magic
properties in the FEH format.  Doubtless there would be some
complications, but it's something to think about later, maybe.

> What about something like this:  Right now nodes are defined by <name>
> { [<property>|<node>]; ... }; and properties are defined by <name>; or
> <name> =3D <value>;  To differentiate a command from either a node or
> property definition, perhaps round braces could be used:
> =

> so for the definition:
> a-node {
>         property-1;
>         property-2 =3D "blah";
>         child-1 {
>                 ...
>         };
> };
> =

> you could delete property-2 and node-1 with:
> a-node {
>         delete-node(child-1);
>         delete-property(property-2);
> };

Hrm.  I don't particularly like it, but I guess it's an option.

> > We also had the need to prepend to a <stringlist> so that
> > compatible properties could be updated.
> >
> > =A0 prepend-stringlist =A0<stringlist> The value is a string list that
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
specifies on or more property name/value
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
pairs.
> =

> This is a bit of a harder problem.  I've go no ideas on how to handle
> this in a syntactically elegant way.

Actually, that I think we can handle relatively neatly.  We define a
special symbol which can be used in property definitions and expands
to the property's previous value.  So you could do:
	compatible =3D "newthing", /prev/;
(I don't particularly like '/prev/' as the symbol, but you get the
basic idea).


Actually, here's one thought.  At present, a reference to a node label
expands to the node's full path.  I don't think it's too far out of
keeping with that for a reference to a property label to expand to the
property's value.  Then we could have a special form of that which
means reference to this property's previous value, instead of
explicitly giving a property label.  Still not sure what to make the
actual symbols.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
