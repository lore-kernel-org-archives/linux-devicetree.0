From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/4] Create a new property value that means 'undefined'.
Date: Fri, 22 Oct 2010 11:38:41 +1100
Message-ID: <20101022003841.GA5355@yookeroo>
References: <20101020214419.2985.51068.stgit@riker>
	<20101020214522.2985.97224.stgit@riker>
	<20101021052053.GF13335@angua.secretlab.ca>
	<20101021061908.GK6227@yookeroo> <1287674459.4535.1555.camel@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1287674459.4535.1555.camel@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 21, 2010 at 08:20:59AM -0700, John Bonesio wrote:
> On Thu, 2010-10-21 at 17:19 +1100, David Gibson wrote:
> > On Wed, Oct 20, 2010 at 11:20:53PM -0600, Grant Likely wrote:
> > > On Wed, Oct 20, 2010 at 02:45:22PM -0700, John Bonesio wrote:
[snip]
> > > Does /undef-prop/ really need to be using <*> to match in all start
> > > conditions?
> > 
> > It doesn't need to, but it's a good idea for it to do so, because if
> > the keyword is lexed as a keyword everywhere, it will lead to more
> > meaningful error messages if it's put somewhere it shouldn't be.
> > 
> > In fact, something I've learnt writing dtc is that in general you
> > should make your lexical tokens as wide as they can without colliding
> > with each other, then check that they have the right contents later.
> > That way you get a clear error message from the checking code
> > ("such-and-so contained an illegal character"), rather than the lexer
> > breaking it into different tokens instead and the parser generating
> > some cryptic error.
> 
> This is probably what David is saying. Generally you want the lexer to
> be context free - meaning everything gets tokenized the same way
> everywhere.

Part of what I was saying, yes.

> The fact that we're using various start conditions in the dtc, is a
> little unsettling to me. It makes me wonder if we've got functionality
> in the lexer that really should be in the parser.

Yeah, it bothered me when it went in, too.  And I've reworked the way
it was done at least once, because it was confusing me.  But I'm
pretty sure it's necessary.

It's basically all because property and node names are lexically
awkward.  They can and do contain a bunch of characters that would
usually be operators or delimiters in a language that's lexically like
C.  But being able to have those property and node names bare means we
have a syntax that's more readable and concise.  But we want the rest
of the syntax to be lexically like C, so we can use C-ish delimiters
and so forth.  So, start conditions it is.

There's also the BYTESTRING start condition.  That's one's also a
convenience / conciseness feature to allow hex blobs of data to be
entered easily.  It's well localized, so again, a reasonable tradeoff
I think.

I just noticed that the INCLUDE state is no longer used, we should
remove it.  And V1 is a hangover from when we supported both dts-v0
and dts-v1 input, which are lexically different, due to the changed
format for integer literals.  We could probably remove that too,
though it would require a bit more care.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
