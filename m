From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc symbolic constants - not in the preprocessor?
Date: Thu, 19 Apr 2012 22:11:51 +1000
Message-ID: <20120419121151.GF5387@truffala.fritz.box>
References: <4F8E2A87.6000805@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F8E2A87.6000805-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 17, 2012 at 08:44:23PM -0600, Stephen Warren wrote:
> So, David has been leaning towards a simple text-based preprocessor as
> the means to add symbolic constants to dtc. Depending on exactly how
> much advanced expression support the dtc language ends up gaining, I'm
> not so sure a text-based preprocessor is the right approach.
> 
> So, a text-based preprocessor is fine for basic stuff like:
> 
> #define FOO 5
> 
> / {
>     prop = <(FOO)>;
> };

Note also that this will work nicely:

#define FOO(x)	(/* something */)

	prop = <FOO(1)  FOO(2)  FOO(17)>;

> However, if the dtc language itself gains functions, iteration, etc., I
> think this breaks down.

Well, for starters I think gaining functions and gaining iteration are
quite different cases.  I see using a preprocessor as a way of
avoiding gaining functions in the core language (and particularly
avoiding the necessity of storing expression trees that that would
require).

> Using cpp, we could do something like:
> 
> #define TEGRA_USB1_INT_STATUS 0x7000000
> #define POS(chip, reg, field) chip##_##reg##_##field##_POS
> 
> / {
>     prop1 = <(POS(TEGRA, USB1, INT_STATUS))>;
> };
> 
> where you can imagine that the POS macro is calculating the name of a
> symbolic constant, then reading the value of the name.
> 
> However, what if instead of hard-coding USB1 in the above example, we
> want to iterate over 1, 2, 3? Expressing this iteration as a set of
> functions in the dtc grammar (as in functional programming) has been
> floated as an idea. In other words generate a result like:
> 
> / {
>     prop1 = <(POS(TEGRA, USB, 1, INT_STATUS))>;
>     prop2 = <(POS(TEGRA, USB, 2, INT_STATUS))>;
>     prop3 = <(POS(TEGRA, USB, 3, INT_STATUS))>;
> };
> 
> ... but using iteration in the dtc language instead of cut/paste.

Um.. this seems a contrived example - combining iteration with
construction of property names and symbol names.  The sorts of
iteration I had in mind were more things like generating:
	prop = <0 0x1000 0x2000 0x3000>;
programmatically.  That example could be built using an iterator
built-in "function", which could in turn be generated from a macro.

Do you have a real use case for something more like the example above?

I can also see uses for some sort of foreach construct, which is
conceivable both at the language and preprocessor level, and there are
several possible variants.

> If this iteration happens in the dtc language phase rather than the
> preprocessing phase, then all the named constants known to the
> preprocessing phase have been thrown away, and hence could never be
> accessed by any functions/macros/... executing in the dtc language phase.
> 
> For this reason, I think that symbolic constants should probably be
> something at the dtc language level rather than there being a separate
> preprocessing phase, if we envisage dtc ever gaining anything more
> complex than simple expression and symbolic constant support.

Well.. if we have defined functions at the language level, then we
certainly want constants at that level as well (and it will be
trivial, since that's basically just a 0 argument function).  But as
yet I haven't seen a really convincing argument that we do need such a
thing - I still lean towards preprocessor macros as giving us a good
flexibility to syntactic complexity ration.

And in fact, because of this I really only want to implement either
*both* functions and constants in dtc, or neither - not one without
the other.  So far, I'm still hoping to avoid it.

> Do people agree with this?
> 
> 
> 
> If so, the simplest symbolic constant syntax might be:
> 
> /define/ FOO 5;
> 
> / {
>     prop = <(FOO)>;
> };
> 
> (this is roughly what was in my somewhat recent /define/ patch proposal).
> 
> 
> 
> As an equivalent of the cpp ## operator, we could imagine something like:
> 
> /define/ TEGRA_USB1_INT_STATUS 0x7000000;
> /function/ POS(chip, reg, field)
>     readvar(chip + "_" + reg + "_" + field + "_POS");
> 
> / {
>     prop = <(POS("TEGRA", "USB1", "INT_STATUS"))>;
> };
> 
> where readvar() is a built-in function that reads from the symbol
> table.

Urg.  If you want symbol name construction (and pass by name) it
really seems more like you want macro preprocessing rather than
language constructs.

I could see an argument here for not using cpp but our own macro
language that was similar but with a few extensions (a call-by-name
foreach construct is the most obvious one to me).

> Following on from this, I've been envisaging symbolic constants holding
> single integer values (perhaps strings too), as in the "FOO" example a
> little above.
> 
> Simon Glass was thinking (admittedly I believe more in the context of
> plain text-expansion) of allowing symbolic constants to be more than
> just single integers, perhaps:
> 
> /define/ GDB_BASE 0x00e08000;
> /define/ CHROME_OS_BOOT_DEVICES "emmc", "spi";
> /define/ UART_BAUD_OPTIONS <115200 57600 19200>;

If we have language level constants, I think they should be able to
contain any "type" that we can have an expression for, including
strings and bytestrings at least.  And as I said I don't really want
to do that without having functions as well.

> / {
>     prop1 = <GDB_BASE>;
>     prop2 = <CHROME_OS_BOOT_DEVICES>;
>     prop3 = <UART_BAUD_OPTIONS>;
> };
> 
> (The syntax re: where <> appear might need some development in this
> example.)

> The idea here was that (some) variables might contain a sequence of
> bytes just would just be dumped directly into the property data without
> much interpretation.
> 
> This would presumably require symbolic constants to be typed somehow, so
> that dtc would know that (GDB_BASE + 0x100) made sense, whereas
> (UART_BAUD_OPTIONS + 0x100) didn't.

And this involves a considerable bunch of infrastructure.  Which is
why I'm still hoping we can do what we need with textually expanded
macros rather than adding all the complexity of tracking types and
expression trees.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
