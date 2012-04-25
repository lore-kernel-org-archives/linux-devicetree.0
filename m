From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: dtc symbolic constants - not in the preprocessor?
Date: Tue, 24 Apr 2012 21:22:34 -0600
Message-ID: <4F976DFA.6050406@wwwdotorg.org>
References: <4F8E2A87.6000805@wwwdotorg.org>
 <20120419121151.GF5387@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120419121151.GF5387-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/19/2012 06:11 AM, David Gibson wrote:
> On Tue, Apr 17, 2012 at 08:44:23PM -0600, Stephen Warren wrote:
>> So, David has been leaning towards a simple text-based preprocessor as
>> the means to add symbolic constants to dtc. Depending on exactly how
>> much advanced expression support the dtc language ends up gaining, I'm
>> not so sure a text-based preprocessor is the right approach.
>>
>> So, a text-based preprocessor is fine for basic stuff like:
>>
>> #define FOO 5
>>
>> / {
>>     prop = <(FOO)>;
>> };
> 
> Note also that this will work nicely:
> 
> #define FOO(x)	(/* something */)
> 
> 	prop = <FOO(1)  FOO(2)  FOO(17)>;

I don't think that can be legal; there's no () around the FOO(1), so how
do you know whether it's meant to be two cells; the result of expanding
"FOO" and plain "(1)", or a call of a macro named FOO with parameter
"1"? In other words, shouldn't that be:

    prop = <(FOO(1)) (FOO(2)) (FOO(17))>;

Admittedly, the C pre-processor does appear to know whether FOO was
defined to accept arguments or not, and will differentiate between the
two cases based on that, but that seems pretty nasty to me. And this
relies on the body of FOO having () around it, which seems somewhat
implicit.

>> However, if the dtc language itself gains functions, iteration, etc., I
>> think this breaks down.
> 
> Well, for starters I think gaining functions and gaining iteration are
> quite different cases.  I see using a preprocessor as a way of
> avoiding gaining functions in the core language (and particularly
> avoiding the necessity of storing expression trees that that would
> require).
> 
>> Using cpp, we could do something like:
>>
>> #define TEGRA_USB1_INT_STATUS 0x7000000
>> #define POS(chip, reg, field) chip##_##reg##_##field##_POS
>>
>> / {
>>     prop1 = <(POS(TEGRA, USB1, INT_STATUS))>;
>> };
>>
>> where you can imagine that the POS macro is calculating the name of a
>> symbolic constant, then reading the value of the name.
>>
>> However, what if instead of hard-coding USB1 in the above example, we
>> want to iterate over 1, 2, 3? Expressing this iteration as a set of
>> functions in the dtc grammar (as in functional programming) has been
>> floated as an idea. In other words generate a result like:
>>
>> / {
>>     prop1 = <(POS(TEGRA, USB, 1, INT_STATUS))>;
>>     prop2 = <(POS(TEGRA, USB, 2, INT_STATUS))>;
>>     prop3 = <(POS(TEGRA, USB, 3, INT_STATUS))>;
>> };
>>
>> ... but using iteration in the dtc language instead of cut/paste.
> 
> Um.. this seems a contrived example - combining iteration with
> construction of property names and symbol names.  The sorts of
> iteration I had in mind were more things like generating:
> 	prop = <0 0x1000 0x2000 0x3000>;
> programmatically.  That example could be built using an iterator
> built-in "function", which could in turn be generated from a macro.
> 
> Do you have a real use case for something more like the example above?

I don't immediately foresee the need for any kind of iteration in the
device trees I'm building at the moment. Plain #define of simple
constants (integers or strings) would probably satisfy all the needs I'm
currently aware of.

But Jon's IIRC expressions patch included iteration, and you've posited
iteration functions, and I think in any case where iteration is allowed,
you will want the feature where you can define e.g. the base address of
two HW modules, and have the iteration "body" read from one of those
variables programatically rather than have the list of base addresses
passed in.

> And in fact, because of this I really only want to implement either
> *both* functions and constants in dtc, or neither - not one without
> the other.  So far, I'm still hoping to avoid it.

I don't understand the rationale behind this position. What's the root
of the problem that disallows us supporting named constants without
supporting full macros? I think plain named constants would cover the
majority of current use-cases, and I'm quite happy to stop thinking
about anything more advanced. The only reason I'm trying to drive other
stuff is because of your desire not to support constants without full
macros.
