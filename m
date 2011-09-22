From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 2/3] dtc: Support character literals in cell lists
Date: Thu, 22 Sep 2011 12:09:16 +1000
Message-ID: <20110922020916.GC22223@yookeroo.fritz.box>
References: <1315595791-25793-1-git-send-email-robotboy@chromium.org>
	<1315595791-25793-3-git-send-email-robotboy@chromium.org>
	<20110912004437.GG9025@yookeroo.fritz.box>
	<E1R4y4v-0000Nf-5A@jdl.com>
	<20110919020034.GJ9025@yookeroo.fritz.box>
	<CAF6FioU5_uEh0fLyRBnD7DkPyo_UfjAaWxNONXSxDukpg3QPeg@mail.gmail.com>
	<20110920005931.GB29197@yookeroo.fritz.box>
	<CAF6FioWTyMEf_BP+_VcJ57jqQt-y9np0n7SkTy6TFMNWWQE-MQ@mail.gmail.com>
	<20110920033441.GI29197@yookeroo.fritz.box>
	<CAF6FioUJkya4kSFQ6+6tYbGcNw5WPSUT8UkgUANmqhhBwZhU1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6FioUJkya4kSFQ6+6tYbGcNw5WPSUT8UkgUANmqhhBwZhU1g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 12:38:17PM -0700, Anton Staaf wrote:
> On Mon, Sep 19, 2011 at 8:34 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Mon, Sep 19, 2011 at 07:54:09PM -0700, Anton Staaf wrote:
> >> On Mon, Sep 19, 2011 at 5:59 PM, David Gibson
> >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> > On Mon, Sep 19, 2011 at 09:45:34AM -0700, Anton Staaf wrote:
> >> >> On Sun, Sep 18, 2011 at 7:00 PM, David Gibson
> >> >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> >> > On Sat, Sep 17, 2011 at 11:49:21AM -0500, Jon Loeliger wrote:
> >> >> >> > On Fri, Sep 09, 2011 at 12:16:30PM -0700, Anton Staaf wrote:
> >> >> >> > > With this patch the following property assignment:
> >> >> >> > >
> >> >> >> > > =A0 =A0 property =3D <0x12345678 'a' '\r' 100>;
> >> >> >> > >
> >> >> >> > > is equivalent to:
> >> >> >> > >
> >> >> >> > > =A0 =A0 property =3D <0x12345678 0x00000061 0x0000000D 0x000=
00064>
> >> >> >> > >
> >> >> >> > > Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> >> >> >
> >> >> >> > Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> >> >> >>
> >> >> >> So, I *think* we want to wait until the question of size
> >> >> >> is resolved some more, right? =A0Or, take this in any event
> >> >> >> as "without a type indicator they are all 32-bit values"?
> >> >> >
> >> >> > No this patch is fine to take without changing the cell size
> >> >> > semantics. =A0It's just that it becomes a lot more useful when we=
 do get
> >> >> > those.
> >> >>
> >> >> Yup, I'm working on a size patch by the way. =A0Any comments on my
> >> >> previous post about it would be helpful. =A0But in the mean time I'm
> >> >> going ahead with a solution where the current cell size is stored in
> >> >> the "struct data" type references are not allowed in cell lists of
> >> >> size other than 32 bits.
> >> >
> >> > Ah, sorry, I meant to give comments on that earlier but got
> >> > sidetracked.
> >> >
> >> > Storing the cell size in struct data doesn't really work - a single
> >> > property could be assembled from several cell lists of different
> >> > sizes. =A0By the time the reference substitution happens, they will =
have
> >> > been all merged into a single struct data.
> >> >
> >> > I think prohibiting cell references anywhere but 32-bit cell lists is
> >> > the right approach, but we need to work out a way to do the check
> >> > during the parse phase.
> >>
> >> Yes absolutely. =A0My intent with storing the current cell size in the
> >> data struct was to use that to do the parse time rejection of
> >> references in all but 32-bit cell lists. =A0That is the current cell
> >> size would not be used past parsing, for exactly the reason you
> >> mention. =A0My thought was that every creation of a cell list would set
> >> the current cell size to 32 or the value defined by /size/ and the
> >> closing '>' would set it back to 0. =A0The empty_data initializer would
> >> set the current cell size to 0, even though it should never be used
> >> outside of the <...> context. =A0Then when a reference or literal are =
to
> >> be appended to the current data struct we can check for the value 32
> >> if it's a reference, and otherwise use the current cell size to
> >> validate (ensure it fits in the current cell size) and pad (add
> >> leading zero's) the literal. =A0Padding won't actually be required if
> >> the literal parsing routine always returns a 64-bit value.
> >
> > Oh, I see. =A0I guess that would work, but it's a really nasty misuse of
> > a long-term data structure to store some short-term information. =A0No,
> > I'm pretty sure we can rearrange the grammer to handle this more
> > cleanly.
> >
> > Maybe something like this:
> >
> > cellarrayprefix =3D DT_SIZE DT_LITERAL '<'
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| cellarrayprefix cellval
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| cellarrayprefix DT_REF
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| cellarrayprefix DT_LABEL
> >
> > The semantic type of cellarray prefix would need to contain both a
> > struct data and a int for the cell size, which is a bit fiddly, but
> > should be doable. =A0The DT_REF case can check the cell size part of $1
> > and error if it's no 32-bit.
> =

> I like this more than my solution.  I've written it up along with some
> tests.  I'm now working on the dts format doc.
> =

> Should I submit this assuming that the character literal support in
> cell lists will be accepted shortly?

I'm in favour of applying the char literals in cell lists patch
immediately.  Jon?

>  Or should I remove the use of
> character literals from my test case?  It would be simpler for me to
> leave the patches based on top of the character literal in cell list
> patch that has been acked but not submitted.  I won't base them on top
> of the character literals in bytestring patch since that is not going
> in without more discussion.  Also, would you prefer that I squash the
> test cases into the commit with the variable sized cell support and
> documentation changes?

Yes, I generally prefer not to have tests patches segregated from the
things they test.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
