From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Some slightly random musings on device tree expression syntax
Date: Tue, 13 Mar 2012 15:46:31 +1100
Message-ID: <20120313044631.GJ24916@truffala.fritz.box>
References: <4F580005.403@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F580005.403-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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

On Wed, Mar 07, 2012 at 05:40:37PM -0700, Stephen Warren wrote:
> I was thinking some more about how to expand the device tree syntax to
> allow expressions. I wondered if we should use a concept/syntax more
> inspired by template processors. Playing with jinja2 and gpp led me
> towards (...) being an inline expression syntax that can calculate
> integers or strings and get replaced by the string representation of the
> expression, and ! at the start of a line introducing a statement
> context. So, below are my somewhat wandering thoughts on the matter.
> However, the idea still raises a lot of questions that'd need to be
> resolved.
> 
> I note a few things:
> 
> * Using the (...) syntax to indicate which parts of the file should be
> evaluated and the substituted solves the issue that David had with Jon's
> proposal re: how do you know when a node name is literal text vs.
> concatenated to some expression.

Yeah, I've been thinking for quite some time that using (...) to
disambiguate expressions in the necessary places was te way to go.  It
works for cell lists, for node and property names and syntactically
required parens have precedent in C if statements.

I was only thinking of requireing (...) only in places where it's
otherwise ambiguous.  This works fairly naturally in the grammar,
since C-like expression grammars usually bottom out at something like:
      primitive_expr := literal | identifier | '(' expr ')' ;
So instead of replacing literal with expr in the celllist grammar, for
example, we replace it with primitive_expr.

> * Separating the device tree syntax and pre-processor/... phase allows
> them to be decoupled and the pre-processor potentially optional, or even
> replaced if things don't work out, or different people could use their
> own thing.

Ok, so, I've been leaninng towards a preprocessor for constant/macro
support for some time (on the basis of the ratio of flexibility to
conceptual complexity).  However, I was envisaging that stage
outputting (constant) expressions that were still actually evaluated
by dtc.  Still, if you can make a good case for expression evaluation
in the pre-processor...

> * As an aside, I wonder if we couldn't transparently allow <1 2 3> or
> <1, 2, 3> for cell list syntax, thus not requiring the brackets in
> previously proposed <(1 + 0) (1 + 1) (4 - 1)> syntax, but rather <1 + 0,
> 1 + 1, 4 - 1>?

As I said in another reply, I don't like this idea.  It creates
potentially confusing variations of the syntax for no benefit that I
can see.

> Concept
> ========================================
> 
> The .dts syntax that dtc reads is unchanged.
> 
> A pre-processing phase occurs on .dts files that handles all aspects of
> expressions; all definitions, macro processing, expression process, etc.
> are evaluated and fully expanded to strings during the pre-processing
> phase. The result of the pre-processing phase should be a source file or
> stream that can be handled by the existing dtc.
> 
> Whether this pre-processing phase is implemented as:
> * A separate executable, manually invoked by the user.
> * A separate executable, automatically invoked by dtc itself.
> * Something built into dtc itself.
> ... is not addressed by this proposal.
> 
> One potential issue here: if the pre-processing and regular compilation
> phases are completely separate, do we need to pay attention that the
> int, literal, byte-sequence literal syntax stays the same between the
> two phases to reduce confusion, or not?

I'm not sure quite what you're getting at here.

> 
> Pre-processing
> ========================================
> 
> Contexts:
> 
>   Pass-through:
> 
>     By default, the pass-through context is active.
> 
>     Data is passed from input to output without modification, except
>     that data is searched for markers that begin other contexts.
> 
>   Expression:
> 
>     Introduced by: (
>     Terminated by: a matching )
> 
>     The text within this context is interpreted as an expression. That
>     expression is evaluated, the result formatting as a string, and that
>     string written to the output stream in place of the ( ) markers and
>     the expression between them.
> 
>     Expression context can being anywhere within the source stream; no
>     note is taken of the tokens that the device tree language

Hrm.  I'm pretty dubious about doing the expression evaluation (as
opposed to macro/constant expansion) within the preprocessor, then
resubstituting as a string.

It would work ok for integer expressions, but for bytestring
expressions, it seems likely we'd have to duplicate the
lexical/grammar constructs for [...], <...> and basic literals between
preproc and dtc, which seems a bit horrible.

In addition this approach means that an expression can never express a
value which a literal couldn't.  No problem in most cases, but one
thing I had in mind is that an expression syntax could be used to
specify a node or property name with illegal characters in it (mostly
relevant for ensuring that doing -I dtb -O dts then -I dts -O will
always end up exactly where you started, even when the original dtb is
corrupted or otherwise contains things it shouldn't.

>   Statement:
> 
>     Introduced by: !
>       Notes: Or some other suitable character; # conflicts with property
>       names unless we require it to be in the first column, and also
>       sounds too much much like regular cpp, so people might get
>       confused. @ might work. This is probably bike-shedding at this
>       point...
>     Terminated by: End of line

These three states aren't quite sufficient.  At the very least you
need a string state, so that expressions are not expanded within " ".
And we probably shouldn't be expanding them within comments, either.

> Example:
> 
> Note: // comments are used below as comments in this document, not
> necessarily comments in the actual proposed syntax.
> 
> // Simple constant definitions
> // Syntax of RHS matches existing .dts syntax
> 
> !defint usbbase 0x6000000
> !defint usbsize 0x100
> !defint usbstride 0x1000
> !defstr usb "usb"
> !defbytes somebytes [de ad be ef]
> 
> // or perhaps implicitly set variable type based on type of the RHS?
> !define usbbase 0x6000000
> !define usb "usb"

Hrm.  If using defines is based on textual substitution, then type
should be irrelevant.  If they're not based on textual substitution,
then the "preprocessor" is doing something rather more involved than
something with that name normally would.

> or !assign or !let ...
> 
> // RHS may also use expression syntax
> // and references to previously defined variables
> 
> !defint usb3base usbbase + (2 * usbstride)
> !defstr catenated usb + "2"
> 
> // Simple use of some variables:
> 
> (usbbase) (usbsize) (catenated)
> 
> // which yields:
> // 0x6000000 0x100 usb2
> 
> // A more complex example:
> 
> (usb)3@(usb3base) {
>     reg = <(usb3base) (usbsize)>;
>     name = "(usb)3";
> };

Oh. You *intended* for expression substitution within strings.  Nack,
nack nackity nack.  That violates least surprise seven ways to
sunday. If the user wants something like this they can do:
	name = (usb + "3");

> // which yields:
> // usb3@0x60002000 {
> //     reg = <0x60002000 0x100>;
> //     name = "usb3";
> // };
> 
> // Question: Do ints always format as 0x%x since that's the most common,
> // or do we need explicit control over the base etc.?

The user certainly shouldn't have to care what base two apparently
internal parts of dtc use to talk to each other.

> // Question: How do we know when to format strings with "" around them,
> // e.g. for use as property values, and when not to, e.g. for use in
> // arbitrary contexts? For example above, it'd be nice if when defining
> // the name property, we could write 'name = usb3name;' and have it
> // expand to 'name = "usb3";' given a str variable with value "usb3",
> // yet we don't want the quotes when using variable usb in the node
> // name in the example earlier.

Yeah.  This is another reason I don't think splitting the expression
evaluation from the surrounding grammatical context is a good idea.

> // Question: What if we actually wanted the property value "(usb3)". How
> // do we stop the expansion; how to escape?
> //
> // I suppose the solution for the latter 2 questions is that the
> // expansion has to actually be sensitive to context in the underlying
> // language, and include "" in property value context, but not
> // elsewhere. But, what if you write:

Well, yeah, which would mean duplicating large amounts of the grammar
between the expression evaluator and the rest of dtc.

> !defstr nasty "usb@0x6000000 { name =";
> (nasty) (foo);
> 
> // Additional statements could include if, for, while, ...:
> 
> !ifdef somevar
> foo bar
> !else
> baz qux
> !endif
> 
> // I think we don't need e.g.:
> 
> foo !ifdef somevar! bar !else! baz !endif! qux
> 
> // ... since I think that we can line-break in the middle of any
> // property or node definition, so we could just do this instead:
> 
> foo
> !ifdef somevar
> bar
> !else
> baz
> !endif
> qux
> 
> // If we need to actually concatenate the strings into one, we can do
> // that as an expression somehow, assign the result to a variable, and
> // expand just that.
> 
> !defstr xxx "foo"
> !ifdef somevar
> !defstr xxx xxx + "bar"
> !else
> !defstr xxx xxx + "baz"
> !endif
> !defstr xxx xxx + "qux"
> (xxx)
> 
> // Perhaps we can delimit large blocks of statements in a way that
> // doesn't need a lot of !s:
> 
> !!
> xxx = "foo"
> if somevar:
>     xxx += "bar"
> else:
>     xxx += "baz"
> xxx += "qux"
> !!
> (xxx)
> 
> // Then, we can start allowing complex things like macro or function
> // definitions within the !! block; a full regular language, and
> // perhaps we could even borrow an existing one here.
> 
> // About functions: Perhaps cpp-style macros:
> 
> !define func(a, b, c) a + b + c
> 
> // where the RHS is an expression that can use variables in the
> // parameter list
> //
> // Or, is the RHS/body raw text, so something more like:
> 
> !macro func(a, b, c)
>    foo {
>       prop = (a + b + c);
>    }
> !end
> 
> // Perhaps we need both; one with text RHS accepting escapes into
> // expressions, one with an expression on the RHS.
> 
> // I wondered if !define's RHS should always be an expression, or
> // instead always be raw text with the same (...) escape to expressions
> // as in regular text:
> 
> // (assuming a, b, c are extant variables)
> 
> // all variables are strings?
> !define foo (a) + (b) + (c)
> 
> or:
> 
> // yields an integer variable
> !defint foo a + b + c

Ugh.  Well, I think you've pretty much proved the case that attempting
to put all the expression evaluation into the preprocessor is a really
bad idea.  It requires the preproc to be at least somewhat type aware
which (a) is likely to lead to grammar duplication and (b) is
absolutely not what someone familiar with cpp will expect.

Note that evaluating *constant* expressions in dtc works very
naturally into the existing structure and grammar.  I certainly have
no objection to that, and I don't know of anyone that did.  It's
storing and evaluating functions or macros in dtc proper that I'm
dubious about because it requires storing partial parse trees or some
other intermediate representation in a way we have never needed to
before.  That means a whole bunch of extra code and data structures.

Now, implementing a preprocessor with (initially) similar features to
cpp, but using ! instead of #, might have legs.  In fact even using
#-in-column-0 might be ok, but we'd want our own cpp implementation
because there's no portable way of ensuring that a system cpp will
only recognize # in column 0 and not elsewhere.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
