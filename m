From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Tue, 23 Feb 2010 12:47:18 +1100
Message-ID: <20100223014718.GB12285@yookeroo>
References: <1222460748-20127-5-git-send-email-jdl@jdl.com>
	<1222460748-20127-6-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa41002212226i4c83376cn8d88a045dd13fe00-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 21, 2010 at 11:26:18PM -0700, Grant Likely wrote:
> On Sun, Feb 21, 2010 at 6:30 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> =

> >> The model that I'm using to approach the problem is to add syntax for
> >> including .dts files (exactly how Jon proposed) and syntax for going
> >> back after the tree is parsed and changing things. =A0I'm not an expert
> >> on syntax, so I'm open to changes in the details, but this is what I'm
> >> thinking. =A0Add the following directives to the syntax:
> >>
> >> /include/ Include a file
> >
> > Uh.. we already have /include/, which works pretty much exactly as you
> > want it to.
> =

> Well how about that.  I guess we do.  I learned something today.
> =

> > Ok, I quite like the functionality, but I'm not that fond of the
> > syntax. =A0I think I have a similar but neater proposal, at least for
> > the adding-stuff parts. =A0There's two parts to my counter-proposal
> >
> > 1) This is essentially part of your proposal, but I'm separating it
> > out from the /cd/ syntax.
> >
> > We allow redefinition of properties, nodes, or even the whole device
> > tree. =A0For properties the later definition overrides the earlier. =A0=
For
> > nodes, or the whole tree, the definitions are merged in the obvious
> > way (again with later property definitions overriding earlier). =A0In
> > this way an include could define a base tree, and you could then
> > define an "overlay" tree which adds things or changes properties where
> > necessary.
> =

> Yes, I agree with this.  It's pretty well describes the functionality
> that I was thinking about.
> =

> > Optional extension: because allowing redefinitions potentially allows
> > genuine mistakes to silently generate unexpected output, it might be
> > wise to allow only "weak" definitions, marked somehow, to be
> > overriden. =A0I'm not sure what syntax we'd use for that.
> =

> Examples?  I'm not clear on what potential mistakes you're thinking
> about.

Erm, I was thinking about making a typo and overriding something you
didn't intend intstead of something you did.  But I can't really come
up with something more concrete than that, so yeah, it's probably not
that big a deal.

> That being said, I could see it potentially being valuable to be able
> to assign an 'invalid' value to a property so that is *must* get
> overridden before dtc will generate valid output.

That is a very good point.  And it ties in with something I've
considered before of having some sort of invalid value (which might or
might not also reserve space in the dtb) to mark things which ought to
be poked by the bootloader before the tree is passed to the kernel.
Thoughts have varied on whether that would be purely a documentation
thing, or whether this would also have a dtb representation so it
could actually be checked at runtime, but then syntax which allows the
first would easily allow a later extension to implement the second.

Obviously that's not quite the same thing as here, since clearly it
would be permissible to generate trees with this sort of invalid
value, unlike your proposal.  But I don't think that's an
insurmountable problem.

> > I think (1) fits very naturally into the existing syntax.
> =

> I agree.  It certainly provides better containment than my /cd/ suggestio=
n.
> =

> > 2) The trouble with the above is that having included a template
> > device tree, redefining some property deep within it is unpleasantly
> > verbose. =A0You address that with /cd/, which I don't like very much.
> > So my counter proposal is that we allow a path instead of just a name
> > at the beginning of a node definition. =A0This would essentially define
> > an empty node for all the initial path elements, then let the node
> > body define the final path element in the appropriate location. =A0So:
> >
> > /include/ template.dtsi;
> >
> > /somebus@XX/someotherbus@XX/i2c@XX/board-control-widget@XXX {
> > =A0 =A0 =A0 =A0board-specific-property =3D "whatever";
> > };
> >
> > Optional extension 1: Give an error if the earlier path components
> > haven't been defined yet (i.e. _don't+ allow implicit mkdir -p like
> > behaviour). =A0I suspect this would rarely to never be an inconvenience,
> > because you don't generally want to define a node with no properties
> > at all, and it would catch some genuine mistakes (like a typo which
> > adds a / to a node name).
> =

> Yeah, this sounds reasonable.
> =

> > Optional extension 2: Allow a node label to be invoked at the
> > beginning of a node redefinition in. =A0That would let include files put
> > labels on the nodes most likely to be extended or overriden,
> > particularly if they're buried deep in the tree and then the necessary
> > redefinitions become less verbose again.
> =

> I think this is absolutely essential.  With respect to the FPGA use
> case, nodes are going to move around, possibly quite a bit as the FPGA
> design develops.  It is critical to have some kind of handle to a node
> other than the node name or location because they will change.

Yes, I thought that might be the case.

>  I
> think this might even be able to be handled as part (3) because it
> doesn't have the '/' processing issue that part (2) has.  For example:
> =

> instead of:
> / {
>         parent@1234 {
>                 child@abcd {
>                         new-property =3D <0x01234567>;
>                 };
>         };
> };
> =

> do this:
> =

> &child-label {
>         new-property =3D <0x01234567>;
> };

And, you know, it turns out '&' is one of the other characters that is
neither in the current grammar for node names, nor does it appear in
any device tree I've encountered.  So this syntax is probably ok,
too.  Ah.. with the proviso that I think to make sense you could only
use this form at the top level (so at the top level nodes would be
introduced by either '/' or '&label' whereas at lowever levels it
would be by a nodepropname token.

[Something to be aware of in the lexical issues that surround node and
property names is that while IEEE1275 specifies a fairly limited set
of characters for them, there exist device trees in the wild (in Apple
and IBM firmwares, mostly) that have characters not in that set.  So
to be pragmatic we have to allow a pretty wide selection here]

> > (2) is a bit more problematic syntax-wise. =A0The fact that paths are
> > now possible before the node definition raises some lexical issues.
> > In particular it means the /-surrounded "reserved words" might no
> > longer be clearly lexically distinct from a node definition (I chose
> > to make the reserved words surround by / specifically so that that
> > would be the case). =A0I suspect this is not a fatal problem, but I'll
> > need to think about it some more.
> =

> Actually, as long as I can reference a specific node by label, I don't
> think I need the ability to pass in the full path.  Label provides the
> functionality I need.

You know, I was kind of hoping you'd say that :).  After all it is
still possible to override by explicit path, it's just a bit verbose,
which is ok if it's not needed particularly often.

> > That still leaves node and property deletion to cover. =A0In keeping
> > with the above approach, I'd like to do that in the form of "negative
> > redefinitions" of properties or nodes. =A0A neat syntax for that doesn't
> > immediately occur to be for that yet, though.
> =

> hmmm.  I'll think more about it too.  I agree that a negative
> redefinition sounds like a reasonable approach.  I do want the ability
> to drop nodes easily.  It would make it easy to handle SoC or FPGA
> design variants.

Yeah.  Unfortunately we can't use something as simple as '- propname;'
because '-' is a valid character in node and propery names.  For
properties we could maybe do something like:
	obsolete-property =3D /null/;
But that doesn't extend neatly to node removal.

> >> And that's it. =A0I think this covers the functionality that I need.
> >> What does everyone think? =A0Are there other important use cases that I
> >> should also be addressing?
> >
> > Probably, but I'm not really sure what they are.
> >
> > So I think my proposal (1) above accomplishes some of what you want,
> > while being unlikely to badly conflict with any of the various paths
> > we might want to take in the future. =A0So, shall we proceed in that
> > direction while we think about the rest?
> =

> Yeah, I think so.  Okay, so how about some examples then of what I
> think you're describing:
> =

> 1) Add or modify properties to a node
> /include/ "base-tree.dtsi"
> / {
>         node {
>                 new-property =3D <0x1234>;
>         };
> };

Yes.

> 2) Add a new node:
> /include/ "base-tree.dtsi"
> / {
>         parent {
>                 new-child {
>                         new-properties;
>                 };
>         };
> };

Yes.

> 3) Add a new node with a label:
> /include/ "base-tree.dtsi"
> / {
>         parent {
>                 new-label: new-child {
>                         new-properties;
>                 };
>         };
> };

Yes.

> 4) add a label to an existing node
> /include/ "base-tree.dtsi"
> / {
>         new-label: existing-node { };
> };

Ah.. yes, hadn't thought of that.  Which reminds me of another
extension I've had in mind for a while, which I suspect we'll want
along with this stuff to avoid having some really weird corner cases.
At present, because of the way things are stored in the internal data
structures, it's only possible to have a single label on a node or
property (which a wart already, since you can have any number of
labels at the same point within a property value).  I think having
redefinitions would significantly increase the chances that this
limitation will be a problem in practice.

> 5) Start from a labeled node instead of the root node:
> /include/ "base-tree.dtsi"
> &existing-label {
>         new-property =3D <0xabcd>;
> };
> =

> Do I have this right?

I think so.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
