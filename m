From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Some slightly random musings on device tree expression syntax
Date: Thu, 15 Mar 2012 01:42:26 +1100
Message-ID: <20120314144226.GY24916@truffala.fritz.box>
References: <4F580005.403@wwwdotorg.org>
 <20120313044631.GJ24916@truffala.fritz.box>
 <4F5FA653.90802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F5FA653.90802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2012 at 01:56:03PM -0600, Stephen Warren wrote:
> On 03/12/2012 10:46 PM, David Gibson wrote:
> > On Wed, Mar 07, 2012 at 05:40:37PM -0700, Stephen Warren wrote:
> >> I was thinking some more about how to expand the device tree syntax to
> >> allow expressions. I wondered if we should use a concept/syntax more
> >> inspired by template processors.
> ...
> >> Whether this pre-processing phase is implemented as:
> >> * A separate executable, manually invoked by the user.
> >> * A separate executable, automatically invoked by dtc itself.
> >> * Something built into dtc itself.
> >> ... is not addressed by this proposal.
> >>
> >> One potential issue here: if the pre-processing and regular compilation
> >> phases are completely separate, do we need to pay attention that the
> >> int, literal, byte-sequence literal syntax stays the same between the
> >> two phases to reduce confusion, or not?
> > 
> > I'm not sure quite what you're getting at here.
> 
> Well, it's the point you make right below. Namely that if expression
> evaluation happens during pre-processing (either only there, or both
> there and during the separate final "compilation" phase), that the
> pre-processor must be able to parse and manipulate literals of all
> types, so the expressions it calculates can use values of those
> types.

Um.. if you insist on doing the sort of very fancy stuff in the
pre-processor that you're talking about.  A lot of that becomes
unnecessary with sufficient expression support in dtc.  Especially
remembering that if you have really fancy needs, you can always
generate dts output from a real programming language.

Or rather, put it this way.  My preferred option is still a (simple!)
pre-processor with reasonably rich constant expression support in dtc
proper.  But I prefer Jon's full-language-in-dtc approach to this
full-language-in-preprocessor with very simple dtc hybrid approach -
it's really the worst of both worlds.

> ...
> > Hrm.  I'm pretty dubious about doing the expression evaluation (as
> > opposed to macro/constant expansion) within the preprocessor, then
> > resubstituting as a string.
> > 
> > It would work ok for integer expressions, but for bytestring
> > expressions, it seems likely we'd have to duplicate the
> > lexical/grammar constructs for [...], <...> and basic literals between
> > preproc and dtc, which seems a bit horrible.
> 
> Don't we have to allow the pre-processor to parse and manipulate
> constants of all types (both scalars and perhaps even complete nodes)?
> If we don't, then how would you do something like:
> 
> var = [00 11 aa 55]
> for byte in var:
>     do_something_with(byte)
> 
> or:
> 
> var = "Some long string"
> for word in var.split():
>     do_something_with(word)

Um, yeah, if you want Python, generate your dts from Python, we're not
going to recreate Python within dtc, let alone within a dtc
preprocessor.  A pre-processor should do at most, textual macro
substitution (#define), with maybe a (still textual / call-by-name)
foreach construct (though even that may not be necessary if we have
iteration functions).  Anything that involves type awareness and it's
a full language, not a pre-processor which means we should either (1)
generate the dts from an existing language or (2) write the language
into dtc proper so its syntax is properly merged with dtc.

> > In addition this approach means that an expression can never express a
> > value which a literal couldn't.  No problem in most cases, but one
> > thing I had in mind is that an expression syntax could be used to
> > specify a node or property name with illegal characters in it (mostly
> > relevant for ensuring that doing -I dtb -O dts then -I dts -O will
> > always end up exactly where you started, even when the original dtb is
> > corrupted or otherwise contains things it shouldn't.
> 
> Well, one might imagine:
> 
> s = "Some text" + chr(128)
> 
> That's an expression that expresses something that I think can't
> currently be a literal string.

So the expression preprocessor can generate such a thing, but in your
scheme it has no way to output it back to dtc except as a literal.
Oops.

Well, except the problem actually only arises for node and property
names, for quoted strings in property values that can be expressed as
a literal - "Some text\x80".

> ...
> >> !defint usbbase 0x6000000
> >> !defstr usb "usb"
> >> !defbytes somebytes [de ad be ef]
> >>
> >> // or perhaps implicitly set variable type based on type of the RHS?
> >> !define usbbase 0x6000000
> >> !define usb "usb"
> > 
> > Hrm.  If using defines is based on textual substitution, then type
> > should be irrelevant.  If they're not based on textual substitution,
> > then the "preprocessor" is doing something rather more involved than
> > something with that name normally would.
> 
> True. I was more leaning to describing this as a template processor than
> a pre-processor. Related, my thoughts started out simpler, but became
> more complex and raised a lot of open questions when thinking through
> some of the details, so became a lot less clear!

Trickier than it seems, isn't it.  There's a reason this has been
discussed on and off for several years now.

> >> // A more complex example:
> >>
> >> (usb)3@(usb3base) {
> >>     reg = <(usb3base) (usbsize)>;
> >>     name = "(usb)3";
> >> };
> > 
> > Oh. You *intended* for expression substitution within strings.  Nack,
> > nack nackity nack.  That violates least surprise seven ways to
> > sunday. If the user wants something like this they can do:
> > 	name = (usb + "3");
> 
> That works for the name property, but what about the node's name:
> 
>     (usb)3@(usb3base) {

> Even if we required that the whole thing be calculated elsewhere and
> placed into a variable, how do we know whether:
> 
>     foo {
> 
> is meant to expand variable foo or be literal "foo"? That seemed to be
> one of your main objections to Jon's implementation. I proposed solving
> that by explicitly marking the source to indicate where expansion was
> desired:
> 
>   (foo) {
> 
> or not:
> 
>   foo {
> 
> So, () act as "start and end of expression".

Yes.  So, my thinking was that for the case of node property names,
when it's given as an expression, it's a normal string expression,
with quoted literals and the rest, rather than using bare strings -
bare strings are seen as just a shortcut for the simple case.  This
is, again, incompatible with your idea of a separate expression
pre-processor, because it requires awareness of the context.  So:
	foo {
and
	("foo") {
would be equivalent.  And for the constructed example above you'd use:
	(usb + "3@" + usb3base) {


> Given that, why not allow complete expressions with () rather than just
> a single variable or macro call?

Never suggested we shouldn't.  But we absolutely shouldn't be using
bare strings in expressions the way we do in non-expression node
property names.

> This is pretty much the core point of why I was referring to a
> templating engine rather than a pre-processor. Of course, templating
> engines often use e.g. <%= %> instead of ( ) or a wide variety of other
> syntaxes.
> 
> ...
> > Ugh.  Well, I think you've pretty much proved the case that attempting
> > to put all the expression evaluation into the preprocessor is a really
> > bad idea.  It requires the preproc to be at least somewhat type aware
> > which (a) is likely to lead to grammar duplication and (b) is
> > absolutely not what someone familiar with cpp will expect.
> 
> Well, I don't necessarily agree that people would be by default
> expecting the syntax/... must match cpp specifically; there are many
> many other pre-processors, macro-processors, template languages etc. out
> there.

Not perfectly, no.  But the target audience of dtc are largely C
programmers, the existing core syntax is C-like, and the
least-surprise principle should be applied in that context.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
