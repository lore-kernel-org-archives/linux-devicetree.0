From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/3] dtc: Support character literals in bytestrings
Date: Fri, 9 Sep 2011 17:25:32 +1000
Message-ID: <20110909072532.GC9025@yookeroo.fritz.box>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-4-git-send-email-robotboy@chromium.org>
	<20110908035149.GO30278@yookeroo.fritz.box>
	<20110908070716.GC15955@ponder.secretlab.ca>
	<20110908130109.GW30278@yookeroo.fritz.box>
	<CAF6FioWOuK3szFb8FD+_fde0HpZ0TJJXx51ZL=BAcZFSojRGCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6FioWOuK3szFb8FD+_fde0HpZ0TJJXx51ZL=BAcZFSojRGCQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 08, 2011 at 11:30:42PM -0700, Anton Staaf wrote:
> On Thu, Sep 8, 2011 at 6:01 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Thu, Sep 08, 2011 at 12:07:16AM -0700, Grant Likely wrote:
> >> On Thu, Sep 08, 2011 at 01:51:49PM +1000, David Gibson wrote:
> >> > On Wed, Sep 07, 2011 at 04:15:40PM -0700, Anton Staaf wrote:
> >> > > With this patch the following property assignment:
> >> > >
> >> > > =A0 =A0 property =3D ['a' 2b '\r'];
> >> > >
> >> > > is equivalent to:
> >> > >
> >> > > =A0 =A0 property =3D [61 2b 0d];
> >> >
> >> > So, I still have some reservations about this syntax.
> >> >
> >> > It occurred to me: do you actually need to intermix character and
> >> > hexbyte values that much? =A0Could I suggest an alternate sytax as:
> >> >
> >> > =A0 =A0 property =3D 'a', [2b], 'r';
> >> >
> >> > The new character literals sufficiently distinct not to cause proble=
ms
> >> > here, and it maintains the , =3D=3D bytestring append behaviour we a=
lready
> >> > have.
> >> >
> >> > Thoughts?
> >>
> >> Does it matter much? =A0I'm happy with either. =A0Is there a downside =
to
> >> the first syntax?
> >
> > Well.. probably not. =A0I'm just nervous about adding anything in the
> > lexically weird bytestring context.
> =

> Which is completely understandable.  Let's continue to mull that over
> while we think up a sane syntax for specifying the size of a cell in a
> cell list.  Would it be reasonable to specify the size per list?

That was what I had in mind.

>  Or
> would you like to have a mechanism and syntax to specify it per cell
> entry in the list.  If it is per cell entry then we have to deal with
> the strange packings that would come from something like:
> =

> property =3D <0x11223344 byte(0x55) 0x66778899>
> =

> I'm not suggesting that the byte(...) syntax be used by the way.  :)
> But the above situation would lead to a value of 0x55667788 and a
> trailing 0x99, which then has to be either promoted to a uint32_t

Well.. only if you're now interpreting the property as an array of
u32s, which if you specified it with that byte in the middle, is
presumably not how this property is typically interpreted.

> because it was originally in a uint32_t literal, or left as a byte,
> not very obvious.  The other option would be to do some sort of local
> packing.  Where the above would turn into the same as:

> property =3D <0x11223344 0x55 0x66778899>

Um, I'm really not sure what you're getting at with this one.

> But that has all sorts of problems.  When do you start a new uint32_t
> cell.  If it's only when you overflow out of the current one or when
> you see a full uint32_t literal then you could split a uint16_t across
> a cell boundary.

So, I have it on Mitch Bradley's authority, that the properties should
in general be treated as bytestrings and that we should *never* do
padding in there for the sake of alignment.

>  I suppose this problem already exists because of the
> "," syntax.  And so you could make a cell list that contains a bunch
> of uint32_t values that are stored in a property in such a way as to
> be unaligned.

Yes, and intentionally so.  Way back, we used to always 4-byte align
at the beginning of a cell list, but I took that out on Mitch's advice
(plus it was easier that way).  I believe there are some bindings out
there (though they don't seem to be in common, current use) than
define properties to contain a string followed by cells, which will
lead to unaligned cell values.

> The alternative of specifying the size of the cells in a list seems
> cleaner to me.  You still can generate unaligned values in a property
> using ",", but within a cell list you can't.  So then what would be a
> good syntax for that.  Perhaps:

I concur.

> property =3D !uint16 <0x12 0x3456>
> =

> or
> =

> property =3D !uint8 <0xff 0xaa>
> =

> or to explicitly get the default uint32_t behavior
> =

> property =3D !uint32 <0x12345678 0 12>

Well, I think this is better than anything I've yet considered, though
still not quite good enough.

> This has the advantage that ! is not currently used in any of the dts
> syntax.  And having it at the front of the cell list definition means
> that you can check and correctly pack/append each literal as they are
> read.  It has the disadvantage that if we want to use ! to mean
> logical not at some point it will complicate that parsing.

Yeah, and I'd really prefer not to make life difficult for
implementing expressions.  So, some vague, and possibly contradictory
points on this topic:

 * If we can do it in a way that's not too verbose, I'd prefer both
a marker for the size present at both < and >, so that on a big array
a human has an extra visual clue that this is an array of non-default
size.

 * I've toyed with the idea of different bracketing types for the
different sizes.  e.g. << >> for 64-bit values, and, uh, something for
8 and 16.  Haven't come up with any variants on this that don't seem
excessively brief and cryptic, though.

 * Also contemplated something like <$8 0xff 0x00 > or <.8 0xff 0x00>
for 8-bit values, but it seems pretty ugly.

I supposed modifying your suggestion, but combining with our existing
convention for "reserved words" we could do:

	prop =3D /uint8/ <0xab 0xcd>;

I don't love it, but it's about the best I've come up with yet.  And
in particular it's probably the variant I'd be least upset to carry
around as legacy if we come up with a better way in future.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
