From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PFC PATCH] xtensa: standardize devicetree compatible strings
Date: Sun, 1 Dec 2013 09:14:21 +0200
Message-ID: <20131201071421.GE4302@tarshish>
References: <c1b7541980d0e58fc09f3be04b960d3e6037a207.1384889248.git.baruch@tkos.co.il>
 <CAMo8BfLCQeDtPXBJ+VX8cj503sBYPM8L7p9h32r7yfgZv_99nA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMo8BfLCQeDtPXBJ+VX8cj503sBYPM8L7p9h32r7yfgZv_99nA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, "linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org" <linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Max,

On Sun, Dec 01, 2013 at 10:43:27AM +0400, Max Filippov wrote:
> On Tue, Nov 19, 2013 at 11:29 PM, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:
> > The recommended compatible string format, according to the ePAPR v1.1 standard,
> > is "manufacturer,model". Change the xtensa cpu and pic compatible strings to
> > "cdns,xtensa-cpu" and "cdns,xtensa-pic" respectively. Also, change the boards
> > compatible strings in a similar way. Accept older non-standard compatible
> > strings for now, to not break existing installations.
> >
> > Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> 
> I agree with the changes. irq.c part doesn't apply after the SMP series,
> I can take the rest and add a separate patch for irqchips. OK?

No problem.

> > ---
> > Should we just remove support for the old compatible strings?
> 
> I'm pretty sure there are no DTBs in the field yet, so we can do it unless
> anyone objects.

OK. I'll respin the patch without the pic change, and remove support for the 
old compatible strings.

baruch

> > ---
> >  arch/xtensa/boot/dts/lx60.dts        | 2 +-
> >  arch/xtensa/boot/dts/ml605.dts       | 2 +-
> >  arch/xtensa/boot/dts/xtfpga.dtsi     | 6 +++---
> >  arch/xtensa/kernel/irq.c             | 5 ++++-
> >  arch/xtensa/platforms/xtfpga/setup.c | 3 +++
> >  5 files changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/xtensa/boot/dts/lx60.dts b/arch/xtensa/boot/dts/lx60.dts
> > index 2eab365..a0f8b8a 100644
> > --- a/arch/xtensa/boot/dts/lx60.dts
> > +++ b/arch/xtensa/boot/dts/lx60.dts
> > @@ -3,7 +3,7 @@
> >  /include/ "xtfpga-flash-4m.dtsi"
> >
> >  / {
> > -       compatible = "xtensa,lx60";
> > +       compatible = "cdns,xtensa-lx60";
> >         memory@0 {
> >                 device_type = "memory";
> >                 reg = <0x00000000 0x04000000>;
> > diff --git a/arch/xtensa/boot/dts/ml605.dts b/arch/xtensa/boot/dts/ml605.dts
> > index 6ed51d6..905c3a5 100644
> > --- a/arch/xtensa/boot/dts/ml605.dts
> > +++ b/arch/xtensa/boot/dts/ml605.dts
> > @@ -3,7 +3,7 @@
> >  /include/ "xtfpga-flash-16m.dtsi"
> >
> >  / {
> > -       compatible = "xtensa,ml605";
> > +       compatible = "cdns,xtensa-ml605";
> >         memory@0 {
> >                 device_type = "memory";
> >                 reg = <0x00000000 0x08000000>;
> > diff --git a/arch/xtensa/boot/dts/xtfpga.dtsi b/arch/xtensa/boot/dts/xtfpga.dtsi
> > index 7eda6ec..46b4f5e 100644
> > --- a/arch/xtensa/boot/dts/xtfpga.dtsi
> > +++ b/arch/xtensa/boot/dts/xtfpga.dtsi
> > @@ -1,5 +1,5 @@
> >  / {
> > -       compatible = "xtensa,xtfpga";
> > +       compatible = "cdns,xtensa-xtfpga";
> >         #address-cells = <1>;
> >         #size-cells = <1>;
> >         interrupt-parent = <&pic>;
> > @@ -17,7 +17,7 @@
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> >                 cpu@0 {
> > -                       compatible = "xtensa,cpu";
> > +                       compatible = "cdns,xtensa-cpu";
> >                         reg = <0>;
> >                         /* Filled in by platform_setup from FPGA register
> >                          * clock-frequency = <100000000>;
> > @@ -26,7 +26,7 @@
> >         };
> >
> >         pic: pic {
> > -               compatible = "xtensa,pic";
> > +               compatible = "cdns,xtensa-pic";
> >                 /* one cell: internal irq number,
> >                  * two cells: second cell == 0: internal irq number
> >                  *            second cell == 1: external irq number
> > diff --git a/arch/xtensa/kernel/irq.c b/arch/xtensa/kernel/irq.c
> > index 6f4f974..7b64a9d 100644
> > --- a/arch/xtensa/kernel/irq.c
> > +++ b/arch/xtensa/kernel/irq.c
> > @@ -202,7 +202,10 @@ void __init init_IRQ(void)
> >
> >  #ifdef CONFIG_OF
> >         /* The interrupt controller device node is mandatory */
> > -       intc = of_find_compatible_node(NULL, NULL, "xtensa,pic");
> > +       intc = of_find_compatible_node(NULL, NULL, "cdns,xtensa-pic");
> > +       /* Try the deprecated compatible string */
> > +       if (!intc)
> > +               intc = of_find_compatible_node(NULL, NULL, "xtensa,pic");
> >         BUG_ON(!intc);
> >
> >         root_domain = irq_domain_add_linear(intc, NR_IRQS,
> > diff --git a/arch/xtensa/platforms/xtfpga/setup.c b/arch/xtensa/platforms/xtfpga/setup.c
> > index 74bb74f..288af60 100644
> > --- a/arch/xtensa/platforms/xtfpga/setup.c
> > +++ b/arch/xtensa/platforms/xtfpga/setup.c
> > @@ -168,6 +168,9 @@ void __init platform_calibrate_ccount(void)
> >         long clk_freq = 0;
> >  #ifdef CONFIG_OF
> >         struct device_node *cpu =
> > +               of_find_compatible_node(NULL, NULL, "cdns,xtensa-cpu");
> > +       /* Try the deprecated compatible string */
> > +       if (!cpu)
> >                 of_find_compatible_node(NULL, NULL, "xtensa,cpu");
> >         if (cpu) {
> >                 u32 freq;
> > --
> > 1.8.4.2

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.2.679.5364, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
