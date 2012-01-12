From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC v2 4/9] of: add clock providers
Date: Wed, 11 Jan 2012 21:46:58 -0700
Message-ID: <CACxGe6vqb8AZcZb5WMvfmLsUZH7=SEtBrJCSfsFmDYpKX42MzA@mail.gmail.com>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-4-git-send-email-grant.likely@secretlab.ca>
 <20120110213338.GD3226@page>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120110213338.GD3226@page>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 10, 2012 at 2:33 PM, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:
> Hi Grant,
>
> On Mon, Dec 12, 2011 at 03:02:04PM -0700, Grant Likely wrote:
>> Based on work by Ben Herrenschmidt and Jeremy Kerr, this patch adds an
>> of_clk_get function to allow platforms to retrieve clock data from the
>> device tree.
>>
>> Platform register a provider through of_clk_add_provider, which will be
>> called when a device references the provider's OF node for a clock
>> reference.
> [...]
>> diff --git a/Documentation/devicetree/bindings/clock/fixed-clock.txt b/D=
ocumentation/devicetree/bindings/clock/fixed-clock.txt
>> new file mode 100644
>> index 0000000..9a75342
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/fixed-clock.txt
>> @@ -0,0 +1,21 @@
>> +Binding for simple fixed-rate clock sources.
>> +
>> +This binding uses the common clock binding[1].
>> +
>> +[1] Documentation/devicetree/bindings/clock/fixed-clock.txt
>
> This appears to reference itself?

Heh, oops.

>
>> +
>> +Required properties:
>> +- compatible : shall be "fixed-clock".
>> +- #clock-cells : from common clock binding; shall be set to 0.
>> +- clock-frequency : frequency of clock in Hz. May be multiple cells.
>> +
>> +Optional properties:
>> +- gpios : From common gpio binding; gpio connection to clock enable pin.
>
> This seems a little odd to me to have in the common binding, but I'm not
> that familiar with too many platforms.
>
>> +- clock-output-names : From common clock binding
>> +
>> +Example:
>> + =A0 =A0 clock {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <1000000000>;
>> + =A0 =A0 };
>
> I wonder if this should have an optional clock consumer with a standard
> name for parenting? =A0For example, on picoxcell there is a fixed 200MHz
> APB clock that is really a PLL from a 20MHz reference input and I'd like
> to represent that in the clock tree.

If it depends on a parent clock, then it really isn't a fixed clock,
is it (from the perspective of the OS).  The point of this binding is
a trivial way to describe clocks that don't change.  If that
assumption doesn't hold true, then this binding isn't suitable for
that clock.  As you point out, even the gpio enable feature is pushing
things a bit.

That said, I'm open to extending this binding if something can be
defined that will have a lot of use cases.

> I'm about to start trying to get this and Mike's common struct clk
> patches working on picoxcell, and the one thing I'm not understanding at
> the moment is how to handle the tree itself. =A0Currently I was planning
> on iterating over all clocks and finding a named input clock "ref" or
> "input" perhaps. =A0This would be fine for picoxcell, but I guess more
> complicated chips may need something else.

It might be useful to have something like of_irq_init() for setting up
initial clocks, but the solution feels inelegant to me.  I suspect
that there will be end up being intertwined init order dependencies
between clocks and irqs and other early setup stuff that could be
handled better.  Again, I need to think about this some more.  There
might need to be something like an of_early_probe() call that accepts
a match table of compatible values and setup functions with some logic
or data to resolve dependencies.  The trick will be to not end up with
something complex.  I'll need to think about this more...

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
