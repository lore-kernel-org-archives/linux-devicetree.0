From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Tue, 23 Feb 2010 15:10:18 +1100
Message-ID: <20100223041018.GD12285@yookeroo>
References: <1222460748-20127-7-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<20100223014718.GB12285@yookeroo>
	<fa686aa41002221817s5f15dc4cy5ab873a61de2cb2f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa41002221817s5f15dc4cy5ab873a61de2cb2f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Mon, Feb 22, 2010 at 07:17:55PM -0700, Grant Likely wrote:
> On Mon, Feb 22, 2010 at 6:47 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Sun, Feb 21, 2010 at 11:26:18PM -0700, Grant Likely wrote:
> >> That being said, I could see it potentially being valuable to be able
> >> to assign an 'invalid' value to a property so that is *must* get
> >> overridden before dtc will generate valid output.
> >
> > That is a very good point. =A0And it ties in with something I've
> > considered before of having some sort of invalid value (which might or
> > might not also reserve space in the dtb) to mark things which ought to
> > be poked by the bootloader before the tree is passed to the kernel.
> > Thoughts have varied on whether that would be purely a documentation
> > thing, or whether this would also have a dtb representation so it
> > could actually be checked at runtime, but then syntax which allows the
> > first would easily allow a later extension to implement the second.
> >
> > Obviously that's not quite the same thing as here, since clearly it
> > would be permissible to generate trees with this sort of invalid
> > value, unlike your proposal. =A0But I don't think that's an
> > insurmountable problem.
> =

> Right, not quite the same thing, but this easy can easily be deferred.
>  I don't actually have any real use cases that depend on this, so I
> don't think we need to jump through hoops right now to get it.

Yes, quite so.

> >> =A0I
> >> think this might even be able to be handled as part (3) because it
> >> doesn't have the '/' processing issue that part (2) has. =A0For exampl=
e:
> >>
> >> instead of:
> >> / {
> >> =A0 =A0 =A0 =A0 parent@1234 {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 child@abcd {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new-property =3D <0x01=
234567>;
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> >> =A0 =A0 =A0 =A0 };
> >> };
> >>
> >> do this:
> >>
> >> &child-label {
> >> =A0 =A0 =A0 =A0 new-property =3D <0x01234567>;
> >> };
> >
> > And, you know, it turns out '&' is one of the other characters that is
> > neither in the current grammar for node names, nor does it appear in
> > any device tree I've encountered. =A0So this syntax is probably ok,
> > too.
> =

> I specifically chose this syntax because it matches the "property =3D
> &label;" syntax used when assigning a path to a property, so .dts
> authors know that a bare "&label" means the full path to a node.  I
> think it helps with clarity.

Yes, I concur.

> >  =A0Ah.. with the proviso that I think to make sense you could only
> > use this form at the top level (so at the top level nodes would be
> > introduced by either '/' or '&label' whereas at lowever levels it
> > would be by a nodepropname token.
> =

> Absolutely.  I also made the assumption that &label is only valid at
> the top level.

Excellent.

> > [Something to be aware of in the lexical issues that surround node and
> > property names is that while IEEE1275 specifies a fairly limited set
> > of characters for them, there exist device trees in the wild (in Apple
> > and IBM firmwares, mostly) that have characters not in that set. =A0So
> > to be pragmatic we have to allow a pretty wide selection here]
> =

> On that note, does the grammer support an escape sequence for
> characters with a special meaning?  ie. a \<char> sequence?  Doing so
> would sidestep the issue for any exotic trees that come across.

Not at present, though I have considered it on several occasions.  My
preferred would probably be that for anything with exotic characters a
quoted string is instead used for the node name (including the C-like
\-escapes which we already support).

One of the uses I had in mind for this is to be able to do -Idtb -Odts
on a mildly corrupted tree and have something that's at least
syntactically correct and reversible.

> >> > (2) is a bit more problematic syntax-wise. =A0The fact that paths are
> >> > now possible before the node definition raises some lexical issues.
> >> > In particular it means the /-surrounded "reserved words" might no
> >> > longer be clearly lexically distinct from a node definition (I chose
> >> > to make the reserved words surround by / specifically so that that
> >> > would be the case). =A0I suspect this is not a fatal problem, but I'=
ll
> >> > need to think about it some more.
> >>
> >> Actually, as long as I can reference a specific node by label, I don't
> >> think I need the ability to pass in the full path. =A0Label provides t=
he
> >> functionality I need.
> >
> > You know, I was kind of hoping you'd say that :). =A0After all it is
> > still possible to override by explicit path, it's just a bit verbose,
> > which is ok if it's not needed particularly often.
> =

> :-)  I'm okay with verbose in this case.

Seems we agree.

> >> 4) add a label to an existing node
> >> /include/ "base-tree.dtsi"
> >> / {
> >> =A0 =A0 =A0 =A0 new-label: existing-node { };
> >> };
> >
> > Ah.. yes, hadn't thought of that. =A0Which reminds me of another
> > extension I've had in mind for a while, which I suspect we'll want
> > along with this stuff to avoid having some really weird corner cases.
> > At present, because of the way things are stored in the internal data
> > structures, it's only possible to have a single label on a node or
> > property (which a wart already, since you can have any number of
> > labels at the same point within a property value). =A0I think having
> > redefinitions would significantly increase the chances that this
> > limitation will be a problem in practice.
> =

> Okay, this will probably need to be solved then.  It would probably be
> a bad idea to encode limitations into the language that are really
> just an artifact of the current implementation.  That being said,
> while I would use this, I won't be hamstrung by the lack of this
> feature in the near term.

Right.

> >> 5) Start from a labeled node instead of the root node:
> >> /include/ "base-tree.dtsi"
> >> &existing-label {
> >> =A0 =A0 =A0 =A0 new-property =3D <0xabcd>;
> >> };
> >>
> >> Do I have this right?
> >
> > I think so.
> =

> Cool.  Are you able to prototype the new features?  I have no idea
> where to start, and I'm pretty buried in the ARM port at the moment.
> However, if you implement it then I'll immediately convert all the
> MPC5200 .dts files to use it.

Heh, yes, well. I'm pretty busy myself with things of direct interest
to my employer.  So.. I'll see what I can do, but no promises.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
