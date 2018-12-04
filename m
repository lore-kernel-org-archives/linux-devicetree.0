Return-Path: <SRS0=FFRq=ON=gmail.com=tali.perry1@kernel.org>
MIME-Version: 1.0
References: <20181111134712.318321-1-tali.perry1@gmail.com>
 <20181111134712.318321-2-tali.perry1@gmail.com> <154353743563.88331.13076671872913666949@swboyd.mtv.corp.google.com>
In-Reply-To: <154353743563.88331.13076671872913666949@swboyd.mtv.corp.google.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Tue, 4 Dec 2018 17:49:27 +0200
Message-ID: <CAHb3i=ud692wC0DnOu+1Vfk8SToB_FdWx_fsJ5CKVvGOHkFzwA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] clk: npcm7xx: get fixed clocks from DT
Content-Type: multipart/alternative; boundary="000000000000c9591b057c342c5a"
To: Stephen Boyd <sboyd@kernel.org>
Cc: avifishman70@gmail.com, Brendan Higgins <brendanhiggins@google.com>, linux@armlinux.org.uk, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, raltherr@google.com, Rob Herring <robh+dt@kernel.org>, sboyd@codeaurora.org, Tomer Maimon <tmaimon77@gmail.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-clk@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>
List-ID: <devicetree@vger.kernel.org>

--000000000000c9591b057c342c5a
Content-Type: text/plain; charset="UTF-8"

Hi Stephan,

Thanks for all the comments!

This patch include one change so it's one commit.
This clock module includes 4 PLLs and then a tree of muxes and dividers.
All muxes and dividers are preset before Linux boots. The presetting can
change according to the board.
Linux drivers need to know what the frequencies are, but they can not
change it,
so this whole driver is intended as read only mechanism for clocks.

On the first version which was up-streamed the PLLs input clk value was
defined inside the driver.

After the review I was asked that the fixed clock will be on the DT. This
is this fix.


This patch was submitted, but not pushed to Linux:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1610776.html

Meanwhile first version was pushed to the Kernel, So recreate a patch that
is relative between the two patches.


More comments inline..



On Fri, Nov 30, 2018 at 2:23 AM Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting tali.perry1@gmail.com (2018-11-11 05:47:12)
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Nuvoton NPCM7XX Clock Controller
> > fix base address and of_clk_get_by_name error handling.
> >     Also update error messages to be more informative.
> >
> >     In case clk_base allocation is erronoeous the return value is null.
> >     Also fix handling of of_clk_get_by_name returns an error.
> >     Print a better error message pointing to the dt-binding documention.
> >
> > This patch is re-submitted since it was already pushed to main
> > (just the diff, without the full driver which is already in
> > master branch.)
> >
> >
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> >
>
> I don't know what's going on with this patch. Is it something new? Can
> you break it up into logical changes and submit them with proper commit
> text? The signoff chain is also odd. Can you follow
> Documentation/process/submitting-patches.rst?
>
> > ---
> >  drivers/clk/clk-npcm7xx.c | 99
> +++++++++++++++++++++++++++++++++++------------
> >  1 file changed, 75 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
> > index 740af90a9508..91a937720f4e 100644
> > --- a/drivers/clk/clk-npcm7xx.c
> > +++ b/drivers/clk/clk-npcm7xx.c
> > @@ -7,17 +7,26 @@
> >   * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com
> >   */
> >
> > -#include <linux/module.h>
> > -#include <linux/clk-provider.h>
> > -#include <linux/io.h>
> > -#include <linux/kernel.h>
> > -#include <linux/of.h>
> > -#include <linux/of_address.h>
> > -#include <linux/slab.h>
> > -#include <linux/err.h>
> > -#include <linux/bitfield.h>
> > -
> > -#include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> > +
> > +
> > +
> > + #include <linux/module.h>
> > + #include <linux/clk.h>
> > + #include <linux/clk-provider.h>
> > + #include <linux/device.h>
> > + #include <linux/io.h>
> > + #include <linux/kernel.h>
> > + #include <linux/of.h>
> > + #include <linux/of_device.h>
> > + #include <linux/of_platform.h>
> > + #include <linux/of_address.h>
> > + #include <linux/platform_device.h>
> > + #include <linux/slab.h>
> > + #include <linux/err.h>
> > + #include <linux/rational.h>
> > + #include <linux/bitfield.h>
> > + #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
>
> Is any of this hunk necessary or relevant to the subject of this patch?
>
> > +
> >
> >  struct npcm7xx_clk_pll {
> > @@ -44,7 +56,8 @@ static unsigned long
> npcm7xx_clk_pll_recalc_rate(struct clk_hw *hw,
> >         u64 ret;
> >
> >         if (parent_rate == 0) {
> > -               pr_err("%s: parent rate is zero", __func__);
> > +               pr_err("%s: parent rate is zero. reg=%x\n", __func__,
> > +                       (u32)(pll->pllcon));
>
> Maybe you should print clk name instead of register?
>

Tali: There are only 4 pllcon registers. I don't mind if it's the address
and not the name.

>
> >                 return 0;
> >         }
> >
> > @@ -61,13 +74,12 @@ static unsigned long
> npcm7xx_clk_pll_recalc_rate(struct clk_hw *hw,
> >         return ret;
> >  }
> >
> > -static const struct clk_ops npcm7xx_clk_pll_ops = {
> > +const struct clk_ops npcm7xx_clk_pll_ops = {
>
> Why?
>

Tali: I will return the static.

>
> >         .recalc_rate = npcm7xx_clk_pll_recalc_rate,
> >  };
> >
> > -static struct clk_hw *
> > -npcm7xx_clk_register_pll(void __iomem *pllcon, const char *name,
> > -                        const char *parent_name, unsigned long flags)
> > +static struct clk_hw *npcm7xx_clk_register_pll(void __iomem *pllcon,
> > +               const char *name, const char *parent_name, unsigned long
> flags)
> >  {
> >         struct npcm7xx_clk_pll *pll;
> >         struct clk_init_data init;
> > @@ -78,7 +90,8 @@ npcm7xx_clk_register_pll(void __iomem *pllcon, const
> char *name,
> >         if (!pll)
> >                 return ERR_PTR(-ENOMEM);
> >
> > -       pr_debug("%s reg, name=%s, p=%s\n", __func__, name, parent_name);
> > +       pr_debug("%s reg, reg=0x%x, name=%s, p=%s\n",
> > +               __func__, (unsigned int)pllcon, name, parent_name);
>
> What's going on here? Why cast?
>
Tali: I will remove this print all together.

>
> >
> >         init.name = name;
> >         init.ops = &npcm7xx_clk_pll_ops;
> > @@ -544,9 +557,11 @@ static void __init npcm7xx_clk_init(struct
> device_node *clk_np)
> >         void __iomem *clk_base;
> >         struct resource res;
> >         struct clk_hw *hw;
> > +       struct clk *clk;
> >         int ret;
> >         int i;
> >
> > +       clk_base = NULL;
>
> Why?
>

Tali: to init it. If DT is badly defined the value will remain NULL.


>
> >         ret = of_address_to_resource(clk_np, 0, &res);
> >         if (ret) {
> >                 pr_err("%s: failed to get resource, ret %d\n",
> clk_np->name,
> > @@ -560,14 +575,44 @@ static void __init npcm7xx_clk_init(struct
> device_node *clk_np)
> >
> >         npcm7xx_clk_data = kzalloc(sizeof(*npcm7xx_clk_data->hws) *
> >                 NPCM7XX_NUM_CLOCKS + sizeof(npcm7xx_clk_data),
> GFP_KERNEL);
> > -       if (!npcm7xx_clk_data)
> > +
> > +       npcm7xx_clk_data->num = 0;
>
> kzalloc already does that initialization to 0 for you.
>
> > +
> > +       if (!npcm7xx_clk_data->hws) {
> > +               pr_err("Can't alloc npcm7xx_clk_data\n");
>
> We don't need allocation error messages.
>
> >                 goto npcm7xx_init_np_err;
> > +       }
> >
> >         npcm7xx_clk_data->num = NPCM7XX_NUM_CLOCKS;
> >
> >         for (i = 0; i < NPCM7XX_NUM_CLOCKS; i++)
> >                 npcm7xx_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
> >
> > +       /* Read fixed clocks. These 3 clocks must be defined in DT */
> > +       clk = of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_REFCLK);
> > +       if (IS_ERR(clk)) {
> > +               pr_err("failed to find external REFCLK on device tree,
> err=%ld\n",
> > +                       PTR_ERR(clk));
> > +               clk_put(clk);
> > +               goto npcm7xx_init_fail_no_clk_on_dt;
> > +       }
> > +
> > +       clk = of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_SYSBYPCK);
> > +       if (IS_ERR(clk)) {
> > +               pr_err("failed to find external SYSBYPCK on device tree,
> err=%ld\n",
> > +                       PTR_ERR(clk));
> > +               clk_put(clk);
> > +               goto npcm7xx_init_fail_no_clk_on_dt;
> > +       }
> > +
> > +       clk = of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_MCBYPCK);
> > +       if (IS_ERR(clk)) {
> > +               pr_err("failed to find external MCBYPCK on device tree,
> err=%ld\n",
> > +                       PTR_ERR(clk));
> > +               clk_put(clk);
> > +               goto npcm7xx_init_fail_no_clk_on_dt;
> > +       }
>
> I assume the DTS is not shipped?
>

Tali: DTS for npcm is shipped in a separate patchset.

>
> > +
> >         /* Register plls */
> >         for (i = 0; i < ARRAY_SIZE(npcm7xx_plls); i++) {
> >                 const struct npcm7xx_clk_pll_data *pll_data =
> &npcm7xx_plls[i];
> > @@ -584,16 +629,16 @@ static void __init npcm7xx_clk_init(struct
> device_node *clk_np)
> >         }
> >
> >         /* Register fixed dividers */
> > -       hw = clk_hw_register_fixed_factor(NULL, NPCM7XX_CLK_S_PLL1_DIV2,
> > +       clk = clk_register_fixed_factor(NULL, NPCM7XX_CLK_S_PLL1_DIV2,
>
> This is going backwards. Please use clk_hw APIs.
>
Tali: Will fix.

>
> >                         NPCM7XX_CLK_S_PLL1, 0, 1, 2);
> > -       if (IS_ERR(hw)) {
> > +       if (IS_ERR(clk)) {
> >                 pr_err("npcm7xx_clk: Can't register fixed div\n");
> >                 goto npcm7xx_init_fail;
> >         }
> >
> > -       hw = clk_hw_register_fixed_factor(NULL, NPCM7XX_CLK_S_PLL2_DIV2,
> > +       clk = clk_register_fixed_factor(NULL, NPCM7XX_CLK_S_PLL2_DIV2,
> >                         NPCM7XX_CLK_S_PLL2, 0, 1, 2);
> > -       if (IS_ERR(hw)) {
> > +       if (IS_ERR(clk)) {
> >                 pr_err("npcm7xx_clk: Can't register div2\n");
> >                 goto npcm7xx_init_fail;
> >         }
> > @@ -646,11 +691,17 @@ static void __init npcm7xx_clk_init(struct
> device_node *clk_np)
> >
> >         return;
> >
> > +npcm7xx_init_fail_no_clk_on_dt:
> > +       pr_err("see Documentation/devicetree/bindings/clock/");
> > +       pr_err("nuvoton,npcm750-clk.txt  for details\n");
> >  npcm7xx_init_fail:
> > -       kfree(npcm7xx_clk_data->hws);
> > +       if (npcm7xx_clk_data->num)
> > +               kfree(npcm7xx_clk_data->hws);
> >  npcm7xx_init_np_err:
> > -       iounmap(clk_base);
> > +       if (clk_base != NULL)
> > +               iounmap(clk_base);
> >  npcm7xx_init_error:
> >         of_node_put(clk_np);
> > +       pr_err("clk setup fail\n");
>
> Is this hunk of changes related to the subject of this patch? I don't
> think it is, so it just leads to more confusion.
>

Tali: I added a goto option for the case that the DTS doesn't have the
reference clocks this module needs.

--000000000000c9591b057c342c5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-family:monospace,monospace">Hi Stephan,</div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace"><br></div><div=
 class=3D"gmail_default" style=3D"font-family:monospace,monospace">Thanks f=
or all the comments!</div><div class=3D"gmail_default" style=3D"font-family=
:monospace,monospace"><br></div><div class=3D"gmail_default" style=3D"font-=
family:monospace,monospace">This patch include one change so it&#39;s one c=
ommit.=C2=A0</div><div class=3D"gmail_default" style=3D"font-family:monospa=
ce,monospace">This clock module includes 4 PLLs and then a tree of muxes an=
d dividers.=C2=A0</div><div class=3D"gmail_default" style=3D"font-family:mo=
nospace,monospace">All muxes and dividers are preset before Linux boots. Th=
e presetting can change according to the board.=C2=A0</div><div class=3D"gm=
ail_default" style=3D"font-family:monospace,monospace">Linux drivers need t=
o know what the frequencies are, but they can not change it,=C2=A0</div><di=
v class=3D"gmail_default" style=3D"font-family:monospace,monospace">so this=
 whole driver is intended as read only mechanism for clocks.=C2=A0</div><di=
v class=3D"gmail_default" style=3D"font-family:monospace,monospace"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:monospace,monospace">O=
n the first version which was up-streamed the PLLs input clk value was defi=
ned inside the driver.</div><div class=3D"gmail_default" style=3D"font-fami=
ly:monospace,monospace"><br></div><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace">After the review I was asked that the fixed c=
lock will be on the DT. This is this fix.</div><div class=3D"gmail_default"=
 style=3D"font-family:monospace,monospace"><br></div><div class=3D"gmail_de=
fault"><br></div><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">This patch was submitted, but not pushed to Linux:=C2=A0</div>=
<div class=3D"gmail_default" style=3D"font-family:monospace,monospace"><div=
 class=3D"gmail_default" style=3D"font-family:Arial,Helvetica,sans-serif"><=
font face=3D"monospace, monospace"><a href=3D"https://www.mail-archive.com/=
linux-kernel@vger.kernel.org/msg1610776.html">https://www.mail-archive.com/=
linux-kernel@vger.kernel.org/msg1610776.html</a></font><br></div><div class=
=3D"gmail_default" style=3D"font-family:Arial,Helvetica,sans-serif"><font f=
ace=3D"monospace, monospace"><br></font></div><div class=3D"gmail_default" =
style=3D"font-family:Arial,Helvetica,sans-serif"><font face=3D"monospace, m=
onospace">Meanwhile first version was pushed to the Kernel, So recreate a p=
atch that is relative between the two patches.</font></div><div class=3D"gm=
ail_default" style=3D"font-family:Arial,Helvetica,sans-serif"><br></div><di=
v class=3D"gmail_default" style=3D"font-family:Arial,Helvetica,sans-serif">=
<br></div><div class=3D"gmail_default" style=3D"font-family:Arial,Helvetica=
,sans-serif">More comments inline..</div></div><div class=3D"gmail_default"=
 style=3D"font-family:monospace,monospace"><br></div><div class=3D"gmail_de=
fault" style=3D"font-family:monospace,monospace"><br></div></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Nov 30, 2018 at 2:23 AM=
 Stephen Boyd &lt;<a href=3D"mailto:sboyd@kernel.org" target=3D"_blank">sbo=
yd@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Quotin=
g <a href=3D"mailto:tali.perry1@gmail.com" target=3D"_blank">tali.perry1@gm=
ail.com</a> (2018-11-11 05:47:12)<br>
&gt; From: Tali Perry &lt;<a href=3D"mailto:tali.perry1@gmail.com" target=
=3D"_blank">tali.perry1@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Nuvoton NPCM7XX Clock Controller<br>
&gt; fix base address and of_clk_get_by_name error handling.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Also update error messages to be more informative.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0In case clk_base allocation is erronoeous the retur=
n value is null.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Also fix handling of of_clk_get_by_name returns an =
error. <br>
&gt;=C2=A0 =C2=A0 =C2=A0Print a better error message pointing to the dt-bin=
ding documention.<br>
&gt; <br>
&gt; This patch is re-submitted since it was already pushed to main <br>
&gt; (just the diff, without the full driver which is already in <br>
&gt; master branch.)<br>
&gt; <br>
&gt; <br>
&gt; Signed-off-by: Tali Perry &lt;<a href=3D"mailto:tali.perry1@gmail.com"=
 target=3D"_blank">tali.perry1@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org" target=
=3D"_blank">robh@kernel.org</a>&gt;<br>
&gt; Signed-off-by: Wei Yongjun &lt;<a href=3D"mailto:weiyongjun1@huawei.co=
m" target=3D"_blank">weiyongjun1@huawei.com</a>&gt;<br>
&gt; <br>
<br>
I don&#39;t know what&#39;s going on with this patch. Is it something new? =
Can<br>
you break it up into logical changes and submit them with proper commit<br>
text? The signoff chain is also odd. Can you follow<br>
Documentation/process/submitting-patches.rst?<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/clk/clk-npcm7xx.c | 99 +++++++++++++++++++++++++++++++++=
++------------<br>
&gt;=C2=A0 1 file changed, 75 insertions(+), 24 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c<br>
&gt; index 740af90a9508..91a937720f4e 100644<br>
&gt; --- a/drivers/clk/clk-npcm7xx.c<br>
&gt; +++ b/drivers/clk/clk-npcm7xx.c<br>
&gt; @@ -7,17 +7,26 @@<br>
&gt;=C2=A0 =C2=A0* Copyright (C) 2018 Nuvoton Technologies <a href=3D"mailt=
o:tali.perry@nuvoton.com" target=3D"_blank">tali.perry@nuvoton.com</a><br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt; -#include &lt;linux/module.h&gt;<br>
&gt; -#include &lt;linux/clk-provider.h&gt;<br>
&gt; -#include &lt;linux/io.h&gt;<br>
&gt; -#include &lt;linux/kernel.h&gt;<br>
&gt; -#include &lt;linux/of.h&gt;<br>
&gt; -#include &lt;linux/of_address.h&gt;<br>
&gt; -#include &lt;linux/slab.h&gt;<br>
&gt; -#include &lt;linux/err.h&gt;<br>
&gt; -#include &lt;linux/bitfield.h&gt;<br>
&gt; -<br>
&gt; -#include &lt;dt-bindings/clock/nuvoton,npcm7xx-clock.h&gt;<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt; + #include &lt;linux/module.h&gt;<br>
&gt; + #include &lt;linux/clk.h&gt;<br>
&gt; + #include &lt;linux/clk-provider.h&gt;<br>
&gt; + #include &lt;linux/device.h&gt;<br>
&gt; + #include &lt;linux/io.h&gt;<br>
&gt; + #include &lt;linux/kernel.h&gt;<br>
&gt; + #include &lt;linux/of.h&gt;<br>
&gt; + #include &lt;linux/of_device.h&gt;<br>
&gt; + #include &lt;linux/of_platform.h&gt;<br>
&gt; + #include &lt;linux/of_address.h&gt;<br>
&gt; + #include &lt;linux/platform_device.h&gt;<br>
&gt; + #include &lt;linux/slab.h&gt;<br>
&gt; + #include &lt;linux/err.h&gt;<br>
&gt; + #include &lt;linux/rational.h&gt;<br>
&gt; + #include &lt;linux/bitfield.h&gt;<br>
&gt; + #include &lt;dt-bindings/clock/nuvoton,npcm7xx-clock.h&gt;<br>
<br>
Is any of this hunk necessary or relevant to the subject of this patch?<br>
<br>
&gt; +<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct npcm7xx_clk_pll {<br>
&gt; @@ -44,7 +56,8 @@ static unsigned long npcm7xx_clk_pll_recalc_rate(str=
uct clk_hw *hw,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 ret;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (parent_rate =3D=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;%=
s: parent rate is zero&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;%=
s: parent rate is zero. reg=3D%x\n&quot;, __func__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(u32)(pll-&gt;pllcon));<br>
<br>
Maybe you should print clk name instead of register?<br></blockquote><div><=
br></div><div class=3D"gmail_default" style=3D"font-family:monospace,monosp=
ace">Tali: There are only 4 pllcon registers. I don&#39;t mind if it&#39;s =
the address and not the name.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; @@ -61,13 +74,12 @@ static unsigned long npcm7xx_clk_pll_recalc_rate(s=
truct clk_hw *hw,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static const struct clk_ops npcm7xx_clk_pll_ops =3D {<br>
&gt; +const struct clk_ops npcm7xx_clk_pll_ops =3D {<br>
<br>
Why?<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:monospace,monospace">Tali: I will return the static.</div><div c=
lass=3D"gmail_default" style=3D"font-family:monospace,monospace"></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.recalc_rate =3D npcm7xx_clk_pll_reca=
lc_rate,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -static struct clk_hw *<br>
&gt; -npcm7xx_clk_register_pll(void __iomem *pllcon, const char *name,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 const char *parent_name, unsigned long flags)<br>
&gt; +static struct clk_hw *npcm7xx_clk_register_pll(void __iomem *pllcon,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *na=
me, const char *parent_name, unsigned long flags)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_clk_pll *pll;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_init_data init;<br>
&gt; @@ -78,7 +90,8 @@ npcm7xx_clk_register_pll(void __iomem *pllcon, const=
 char *name,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pll)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ER=
R_PTR(-ENOMEM);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s reg, name=3D%s, p=3D%s\n=
&quot;, __func__, name, parent_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s reg, reg=3D0x%x, name=3D=
%s, p=3D%s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, (uns=
igned int)pllcon, name, parent_name);<br>
<br>
What&#39;s going on here? Why cast?<br></blockquote><div><span class=3D"gma=
il_default" style=3D"font-family:monospace,monospace">Tali: I will remove t=
his print all together.</span>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://init.name" rel=3D"n=
oreferrer" target=3D"_blank">init.name</a> =3D name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0init.ops =3D &amp;npcm7xx_clk_pll_ops=
;<br>
&gt; @@ -544,9 +557,11 @@ static void __init npcm7xx_clk_init(struct device=
_node *clk_np)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *clk_base;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_hw *hw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *clk;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_base =3D NULL;<br>
<br>
Why?<br></blockquote><div>=C2=A0</div><div><span class=3D"gmail_default" st=
yle=3D"font-family:monospace,monospace">Tali: to init it. If DT is badly de=
fined the value will remain NULL.</span></div><div><span class=3D"gmail_def=
ault" style=3D"font-family:monospace,monospace"></span>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_address_to_resource(clk_np=
, 0, &amp;res);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&q=
uot;%s: failed to get resource, ret %d\n&quot;, clk_np-&gt;name,<br>
&gt; @@ -560,14 +575,44 @@ static void __init npcm7xx_clk_init(struct devic=
e_node *clk_np)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data =3D kzalloc(sizeof(*=
npcm7xx_clk_data-&gt;hws) *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_N=
UM_CLOCKS + sizeof(npcm7xx_clk_data), GFP_KERNEL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!npcm7xx_clk_data)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data-&gt;num =3D 0;<br>
<br>
kzalloc already does that initialization to 0 for you.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!npcm7xx_clk_data-&gt;hws) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;C=
an&#39;t alloc npcm7xx_clk_data\n&quot;);<br>
<br>
We don&#39;t need allocation error messages.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm=
7xx_init_np_err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data-&gt;num =3D NPCM7XX_=
NUM_CLOCKS;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NPCM7XX_NUM_CLOC=
KS; i++)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_c=
lk_data-&gt;hws[i] =3D ERR_PTR(-EPROBE_DEFER);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Read fixed clocks. These 3 clocks must =
be defined in DT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D of_clk_get_by_name(clk_np, NPCM7XX=
_CLK_S_REFCLK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;f=
ailed to find external REFCLK on device tree, err=3D%ld\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0PTR_ERR(clk));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_put(clk);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm7xx_i=
nit_fail_no_clk_on_dt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D of_clk_get_by_name(clk_np, NPCM7XX=
_CLK_S_SYSBYPCK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;f=
ailed to find external SYSBYPCK on device tree, err=3D%ld\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0PTR_ERR(clk));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_put(clk);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm7xx_i=
nit_fail_no_clk_on_dt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D of_clk_get_by_name(clk_np, NPCM7XX=
_CLK_S_MCBYPCK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;f=
ailed to find external MCBYPCK on device tree, err=3D%ld\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0PTR_ERR(clk));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_put(clk);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm7xx_i=
nit_fail_no_clk_on_dt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
I assume the DTS is not shipped?<br></blockquote><div><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace">Tali: DTS for =
npcm is shipped in a separate patchset.</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Register plls */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(npcm7=
xx_plls); i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const str=
uct npcm7xx_clk_pll_data *pll_data =3D &amp;npcm7xx_plls[i];<br>
&gt; @@ -584,16 +629,16 @@ static void __init npcm7xx_clk_init(struct devic=
e_node *clk_np)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Register fixed dividers */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_factor(NULL, =
NPCM7XX_CLK_S_PLL1_DIV2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_factor(NULL, NP=
CM7XX_CLK_S_PLL1_DIV2,<br>
<br>
This is going backwards. Please use clk_hw APIs.<br></blockquote><div><span=
 class=3D"gmail_default" style=3D"font-family:monospace,monospace">Tali: Wi=
ll fix.</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL1, 0, 1, 2);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&q=
uot;npcm7xx_clk: Can&#39;t register fixed div\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm=
7xx_init_fail;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_factor(NULL, =
NPCM7XX_CLK_S_PLL2_DIV2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_factor(NULL, NP=
CM7XX_CLK_S_PLL2_DIV2,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2, 0, 1, 2);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&q=
uot;npcm7xx_clk: Can&#39;t register div2\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm=
7xx_init_fail;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -646,11 +691,17 @@ static void __init npcm7xx_clk_init(struct devic=
e_node *clk_np)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 <br>
&gt; +npcm7xx_init_fail_no_clk_on_dt:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;see Documentation/devicetree/=
bindings/clock/&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;nuvoton,npcm750-clk.txt=C2=A0=
 for details\n&quot;);<br>
&gt;=C2=A0 npcm7xx_init_fail:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(npcm7xx_clk_data-&gt;hws);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (npcm7xx_clk_data-&gt;num)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(npcm7xx_=
clk_data-&gt;hws);<br>
&gt;=C2=A0 npcm7xx_init_np_err:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(clk_base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (clk_base !=3D NULL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(clk_ba=
se);<br>
&gt;=C2=A0 npcm7xx_init_error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(clk_np);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;clk setup fail\n&quot;);<br>
<br>
Is this hunk of changes related to the subject of this patch? I don&#39;t<b=
r>
think it is, so it just leads to more confusion.<br></blockquote><div><br><=
/div><div class=3D"gmail_default" style=3D"font-family:monospace,monospace"=
>Tali: I added a goto option for the case that the DTS doesn&#39;t have the=
 reference clocks this module needs.</div><div class=3D"gmail_default" styl=
e=3D"font-family:monospace,monospace"><br></div><div class=3D"gmail_default=
" style=3D"font-family:monospace,monospace"></div></div></div>

--000000000000c9591b057c342c5a--
