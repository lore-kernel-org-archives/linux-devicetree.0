From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: add devicetree bindings for st-pwm
 regulator
Date: Wed, 17 Sep 2014 20:46:12 +0100
Message-ID: <20140917194612.GE7983@leverpostej>
References: <1410959280-29662-1-git-send-email-zyw@rock-chips.com>
 <1410959280-29662-3-git-send-email-zyw@rock-chips.com>
 <CAD=FV=WCQ4oU1O9JcZ9SuwWJ7g+GLsUiE=wmQQoWvL41o24eWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WCQ4oU1O9JcZ9SuwWJ7g+GLsUiE=wmQQoWvL41o24eWg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 17, 2014 at 07:16:23PM +0100, Doug Anderson wrote:
> Chris,
> 
> On Wed, Sep 17, 2014 at 6:08 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> > Document the st-pwm regulator
> >
> > Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >
> > ---
> >
> >  .../devicetree/bindings/regulator/st-pwm.txt       |   35 ++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/regulator/st-pwm.txt
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/st-pwm.txt b/Documentation/devicetree/bindings/regulator/st-pwm.txt
> > new file mode 100644
> > index 0000000..38fec1d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/st-pwm.txt
> > @@ -0,0 +1,35 @@
> > +st pwm regulator bindings
> > +
> > +Required properties:
> > +  - compatible: "pwm-regulator"
> 
> This compatible string doesn't include "st,b2105-pwm-regulator".
> 
> Should be something like:
> 
>   - compatible: Should be "pwm-regulator" to get voltage table / regulator
>     period from the device tree.  Deprecated: if "st,b2105-pwm-regulator" then
>     voltage table and regulator will be handled by the driver.

Do a list, with a bullet point for each string, like:

- compatible: should contain:
  * "pwm-regulator" when using voltage-table
  * "st,b2105-pwm-regulator" for .... (DEPRECATED)

That's easier to extend and it's clearer as to which strings the
comments above apply to.

> 
> Assuming that everyone is OK calling "st,b2105-pwm-regulator" the
> deprecated way of doing things.
> 
> 
> > +  - pwms: OF device-tree PWM specification (see PWM binding pwm.txt)
> > +  - voltage-table: voltage and duty table, include 2 merbers in each set of
> > +    brackets, first one is voltage(unit: uv), the next is duty(unit: percent)
> > +  - pwm-reg-period: duration (in nanoseconds) of one cycle

Perhaps just 'period-ns'? We know it applies to the PWM we're using as a
regulator.

That said, is this even needed? The pwm bindings describe that the
period would typically be described in the pwm-specifier, so duplicating
that feels wrong.

> 
> The voltage-table and pwm-reg-period should not be required if we're
> using "st,b2105-pwm-regulator".  If someone lists both
> "st,b2105-pwm-regulator" and "pwm-regulator" then I'd assume that
> you'd allow them to override via the device tree but fallback to the
> old hardcoded values.
> 
> 
> > +
> > +Any property defined as part of the core regulator binding defined in
> > +regulator.txt can also be used.
> > +
> > +Example:
> > +       pwm_regulator {
> > +                compatible = "st,b2105-pwm-regulator;
> > +                pwms = <&pwm1 0 1000000 0>;
> > +
> > +               voltage-table = <1114000 0>,
> > +                               <1095000 10>,
> > +                               <1076000 20>,
> > +                               <1056000 30>,
> > +                               <1036000 40>,
> > +                               <1016000 50>;
> > +
> > +               pwm-reg-period = <8448>;
> > +               regulators {
> > +                       vdd_logic: pwm-regulator {
> > +                               regulator-always-on;
> > +                               regulator-boot-on;
> > +                               regulator-min-microvolt = <1016000>;
> > +                               regulator-max-microvolt = <1114000>;
> > +                               regulator-name = "vdd_logic";
> > +                       };
> > +               };
> 
> I _think_ that the "regulators" subnode and the "pwm-regulator"
> subnode are not needed at all and should be removed.  Other instances
> of devices that are "just" regulators don't have it (like
> fixed-regulator, gpio-regulator, etc).

Yes. The pwm_regulator node _is_ the regulator, so the subnode is
bizarre.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
