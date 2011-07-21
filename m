From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] Add character literal parsing in bytestrings
Date: Thu, 21 Jul 2011 15:19:03 +1000
Message-ID: <20110721051903.GO6399@yookeroo.fritz.box>
References: <1308871239-32683-1-git-send-email-robotboy@chromium.org>
	<1308871239-32683-2-git-send-email-robotboy@chromium.org>
	<20110720134006.GJ6399@yookeroo.fritz.box>
	<CAF6FioX-yYwd3FN106yCwJQD7N27J9XSiUseFHuhTWJGeq3pvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6FioX-yYwd3FN106yCwJQD7N27J9XSiUseFHuhTWJGeq3pvw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Wed, Jul 20, 2011 at 09:50:43AM -0700, Anton Staaf wrote:
> On Wed, Jul 20, 2011 at 6:40 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Thu, Jun 23, 2011 at 04:20:38PM -0700, Anton Staaf wrote:
> >> This adds support for parsing simple (non-escaped) 'x' character
> >> literal syntax in bytestrings. =A0For example:
> >>
> >> =A0 =A0 property =3D ['a' 2b 'c'];
> >>
> >> is equivalent to:
> >>
> >> =A0 =A0 property =3D [61 2b 62];
> >
> > Hrm. =A0I like the idea of being able to encode character literals.
> > However I'm dubious as to whether the bytestring syntax is the right
> > place to encode them.
> >
> > Bytestrings are quite lexically strange, they are quite different from
> > the < ... > cell syntax: the things inside default to hex, and spacing
> > is irrelevant ([abcd] is equivalent to [ab cd], [a bc] is a syntax
> > error and *not* equivalent to [0a bc]). =A0This makes me worry about
> > possible ambiguities or other parsing problems if we put something
> > other than exactly 2 digit hex bytes in there - not that I can see any
> > definite ambiguities in this proposal.
> =

> As you point out below, the < ... > syntax doesn't permit byte values
> (a cell is 32 bits).  So using the cell list syntax would create a lot
> of wasted space.  Especially in my use where I need to create four 128
> byte tables for keyboard scan code mapping.  It would end up wasting
> >1KB.

I certainly wasn't suggesting using padding.  Apart from the wasted
space, it wouldn't let you use it for an already defined binding which
lacks the padding.

>  Adding cell size control syntax would certainly solve that
> problem.  Is this something your interested in pursuing at this time,
> I'd be happy to help with that instead of continuing to push this.

Well, to be honest I'd love to have this syntax several years ago :).
The implementation should be almost trivial, really the only stumbling
block is finding a syntax which is unambiguous, won't cause parsing
oddities and obeys the principle least surprise as best we can.

> Alternatively, I think it is clear that there are no problems parsing
> out the character literals.  Mainly because the ' character is unique
> and will never otherwise occur as a character in a byte literal
> declaration.  The occurrence or lack there of of white space should
> also not be a problem, since the character literal parsing is of a
> fixed length, thus there is no possibility for an ambiguous use such
> as ' ab '.  Also, the invalid use [a bc] is still invalid with
> character literals added, for example [a 'b'] or [a'b'] are both
> invalid because the existing bytestring regex only matches two hex
> characters in a row, and the new character literal regex only matches
> a single character bounded by single quotes.  So neither regex will
> match the lone a character and parsing will fail there.

That's true.  Consider me about 40% persuaded :).

Ok, here's what I suggest.  For now, can you create a patch which
recognizes the character construct syntax in the lexer (including
escapes), and allows its use in cell context.  That won't actually do
what you want, but it gets a fair chunk of the code in a testable,
upstreamable form without making syntax changes I'm uncomfortable
with.

While we're getting that merged we can debate which/how to proceed
with either variable size cell syntax or allowing the character
literals in bytestring context.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
