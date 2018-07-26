From: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver
Date: Thu, 26 Jul 2018 03:01:52 +0300
Message-ID: <CAP6Zq1h5TXBcfvxDA5Ae9XuW65s_zQd_JrM3vRWR6KBRYCHRrg@mail.gmail.com>
References: <20180712214203.114844-1-tmaimon77@gmail.com> <20180712214203.114844-3-tmaimon77@gmail.com>
 <CACRpkdYOQMkA6BHtY3-NSXhyhoG7KzDg8SkqL2B6M8GQrvXgMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="000000000000de351b0571dbb316"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYOQMkA6BHtY3-NSXhyhoG7KzDg8SkqL2B6M8GQrvXgMA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Avi Fishman <avifishman70@gmail.com>, Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

--000000000000de351b0571dbb316
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Thanks a lot for your comments.

Sorry for my late reply, I was on vacation.

The last days I have been working to move NPCM pinctrl GPIO to GENERIC
GPIO, most of the work have been done but I had the some issue.

I initialize bgpio as follow:

                        ret = bgpio_init(&pctrl->gpio_bank[id].gc,
                                         pctrl->dev, 4,
                                         pctrl->gpio_bank[id].base +
                                         NPCM7XX_GP_N_DIN,
                                         pctrl->gpio_bank[id].base +
                                         NPCM7XX_GP_N_DOUT,
                                         NULL,
                                         NULL,
                                         pctrl->gpio_bank[id].base +
                                         NPCM7XX_GP_N_IEM,
                                         BGPIOF_READ_OUTPUT_REG_SET);

After doing it, the directions functions I used are:
bgpio_dir_out_inv, bgpio_dir_in_inv, bgpio_get_dir_inv

and the I/O get function is bgpio_get_set

By using inv directions:

direction out = 0 (gc->bgpio_dir &= ~bgpio_line2mask(gc, gpio))

direction in = 1 (gc->bgpio_dir |= bgpio_line2mask(gc, gpio))

The problem occur when reading the GPIO value from bgpio_get_set
function, because the directions value are inverse it reading the
wrong I/O registers

For direction out it reading dat register (instead of set register)

For direction in it calling set register (instead of dat register)

	if (gc->bgpio_dir & pinmask)
		return !!(gc->read_reg(gc->reg_set) & pinmask);
	else
		return !!(gc->read_reg(gc->reg_dat) & pinmask);
the same issue occur at bgpio_get_set_multiple function.

Maybe in bgpio_dir parameter direction out should be in both cases 1
and direction in = 0.

for now i did a local fix in the npcm pinctrl driver by setting
bgpio_dir parameters as direction out = 1 and direction in = 0.

Thanks a lot,

Tomer









On 13 July 2018 at 11:51, Linus Walleij <linus.walleij@linaro.org> wrote:

> On Thu, Jul 12, 2018 at 11:42 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > Add Nuvoton BMC NPCM750/730/715/705 Pinmux and
> > GPIO controller driver.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> (...)
> > +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> > @@ -0,0 +1,2089 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2016-2018 Nuvoton Technology corporation.
> > +// Copyright (c) 2016, Dell Inc
> > +
> > +#include <linux/device.h>
> > +#include <linux/gpio.h>
>
> As this is a driver you should only include <linux/gpio/driver.h>
>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/mfd/syscon.h>
>
> If you need syscon then the driver should select or depend
> on MFD_SYSCON in Kconfig.
>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
>
> Do you really need this include?
>
> > +/* Structure for register banks */
> > +struct NPCM7XX_GPIO {
>
> Can we have this lowercase? Please?
>
> > +       void __iomem            *base;
> > +       struct gpio_chip        gc;
> > +       int                     irqbase;
> > +       int                     irq;
> > +       spinlock_t              lock;
> > +       void                    *priv;
> > +       struct irq_chip         irq_chip;
> > +       u32                     pinctrl_id;
> > +};
>
> So each GPIO bank has its own gpio chip and register
> base, that is NICE! Because then it looks like you can
> select GPIO_GENERIC and use the MMIO GPIO helper
> library to handle the registers. Let's look into that
> option!
>
> > +struct NPCM7xx_pinctrl {
> > +       struct pinctrl_dev      *pctldev;
> > +       struct device           *dev;
> > +       struct NPCM7XX_GPIO     gpio_bank[NPCM7XX_GPIO_BANK_NUM];
> > +       struct irq_domain       *domain;
>
> I wonder why the pin controller needs and IRQ domain but
> I keep reading the code and I might find out...
>
> > +enum operand {
> > +       op_set,
> > +       op_getbit,
> > +       op_setbit,
> > +       op_clrbit,
> > +};
>
> This looks complicated. I suspect you can use GPIO_GENERIC
> to set/get and clear bits in the register(s).
>
> > +/* Perform locked bit operations on GPIO registers */
> > +static int gpio_bitop(struct NPCM7XX_GPIO *bank, int op, unsigned int
> offset,
> > +                     int reg)
> > +{
> > +       unsigned long flags;
> > +       u32 mask, val;
> > +
> > +       mask = (1L << offset);
> > +       spin_lock_irqsave(&bank->lock, flags);
> > +       switch (op) {
> > +       case op_set:
> > +               iowrite32(mask, bank->base + reg);
> > +               break;
> > +       case op_getbit:
> > +               mask &= ioread32(bank->base + reg);
> > +               break;
> > +       case op_setbit:
> > +               val = ioread32(bank->base + reg);
> > +               iowrite32(val | mask, bank->base + reg);
> > +               break;
> > +       case op_clrbit:
> > +               val = ioread32(bank->base + reg);
> > +               iowrite32(val & (~mask), bank->base + reg);
> > +               break;
> > +       }
> > +       spin_unlock_irqrestore(&bank->lock, flags);
> > +       return !!mask;
> > +}
>
> This is essentially a reimplementation of drivers/gpio/gpio-mmio.c
> (GPIO_GENERIC, also using a spinlock to protect the registers)
> so let's use that instead :)
>
> There are drivers already that reuse the spinlock inside the
> generic GPIO chip to protect their other registers like for
> IRQ registers.
>
> > +static int npcmgpio_get_direction(struct gpio_chip *chip, unsigned int
> offset)
> > +{
> > +       struct NPCM7XX_GPIO *bank = gpiochip_get_data(chip);
> > +       u32 oe, ie;
> > +
> > +       /* Get Input & Output state */
> > +       ie = gpio_bitop(bank, op_getbit, offset, NPCM7XX_GP_N_IEM);
> > +       oe = gpio_bitop(bank, op_getbit, offset, NPCM7XX_GP_N_OE);
> > +       if (ie && !oe)
> > +               return GPIOF_DIR_IN;
> > +       else if (oe && !ie)
> > +               return GPIOF_DIR_OUT;
>
> These are consumer flags and should not be used in drivers.
> Use plain 0/1 instead.
>
> Anyways the problem goes away with GPIO_GENERIC.
>
> > +static int npcmgpio_direction_input(struct gpio_chip *chip, unsigned
> int offset)
> > +{
> > +       return pinctrl_gpio_direction_input(offset + chip->base);
> > +}
>
> It's a bit tricksy to get this to work with GPIO_GENERIC.
>
> After calling bgpio_init() you need to overwrite the assigned
> .direction_input handler with this and then direct back to the
> one assigned by GPIO_GENERIC.
>
> Something like this:
>
> 1. Add two indirection pointers to the npcm7xx_gpio state container:
>
> struct npcm7xx_gpio {
>      (...)
>       int (*direction_input)(struct gpio_chip *chip, unsigned offset);
>       int (*direction_output)(struct gpio_chip *chip, unsigned offset,
> int value);
>      (...)
> };
>
> 2. Save the pointers
>
> struct npcm7xx_gpio *npcm;
>
> bgpio_init( ... register setup ...)
> npcm->direction_input = npcm->gc.direction_input;
> npcm->direction_output = npcm->gc.direction_output;
> npcm->gc.direction_input = npcmgpio_direction_input;
> npcm->gc.direction_output = npcmgpio_direction_output;
>
> 3. Modify the functions like that:
>
> static int npcmgpio_direction_input(struct gpio_chip *chip, unsigned int
> offset)
> {
>     struct npcm7xx_gpio *npcm = gpiochip_get_data(chip);
>     int ret;
>
>     ret = pinctrl_gpio_direction_input(offset + chip->base);
>     if (ret)
>         return ret;
>     return npcm->direction_input(chip);
> }
>
> I'm sure you get the idea... if you think we can modify gpio-mmio
> to be more helpful with this, suggestions are welcome!
>
> > +/* Set GPIO to Output with initial value */
> > +static int npcmgpio_direction_output(struct gpio_chip *chip,
> > +                                    unsigned int offset, int value)
> > +{
> > +       struct NPCM7XX_GPIO *bank = gpiochip_get_data(chip);
> > +
> > +       dev_dbg(chip->parent, "gpio_direction_output: offset%d = %x\n",
> offset,
> > +               value);
> > +
> > +       /* Check if we're enabled as an interrupt.. */
> > +       if (gpio_bitop(bank, op_getbit, offset, NPCM7XX_GP_N_EVEN) &&
> > +           gpio_bitop(bank, op_getbit, offset, NPCM7XX_GP_N_IEM)) {
> > +               dev_dbg(chip->parent,
> > +                       "gpio_direction_output: IRQ enabled on
> offset%d\n",
> > +                       offset);
> > +               return -EINVAL;
> > +       }
>
> This should not be necessary as you are using GPIOLIB_IRQCHIP,
> which locks the GPIO for interrupt and disallows this to happen.
>
> > +static int npcmgpio_gpio_request(struct gpio_chip *chip, unsigned int
> offset)
> > +{
> > +       dev_dbg(chip->parent, "gpio_request: offset%d\n", offset);
> > +       return pinctrl_gpio_request(offset + chip->base);
> > +}
> > +
> > +static void npcmgpio_gpio_free(struct gpio_chip *chip, unsigned int
> offset)
> > +{
> > +       dev_dbg(chip->parent, "gpio_free: offset%d\n", offset);
> > +       pinctrl_gpio_free(offset + chip->base);
> > +}
>
> This needs the same pattern as the direction functions above, then
> you can use GPIO_GENERIC (mmio).
>
> > +static unsigned int npcmgpio_irq_startup(struct irq_data *d)
> > +{
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +       unsigned int gpio = d->hwirq;
> > +
> > +       /* active-high, input, clear interrupt, enable interrupt */
> > +       dev_dbg(d->chip->parent_device, "startup: %u.%u\n", gpio,
> d->irq);
> > +       npcmgpio_direction_output(gc, gpio, 1);
> > +       npcmgpio_direction_input(gc, gpio);
>
> Interesting dance. So it is required to set the line to
> 1 and then switch to input?
>
> > +static struct irq_chip npcmgpio_irqchip = {
> > +       .name = "NPCM7XX-GPIO-IRQ",
> > +       .irq_ack = npcmgpio_irq_ack,
> > +       .irq_unmask = npcmgpio_irq_unmask,
> > +       .irq_mask = npcmgpio_irq_mask,
> > +       .irq_set_type = npcmgpio_set_irq_type,
> > +       .irq_startup = npcmgpio_irq_startup,
> > +};
>
> This code is looking good BTW.
>
> The patch in my inbox just ends in the middle of everything, I wonder
> why :( suspect the new gmail interface I'm using.
>
> Anyways: the pointers above should keep you busy for the next
> iteration of the patch, the pin control part seems pretty straight-forward.
>
> Yours,
> Linus Walleij
>

--000000000000de351b0571dbb316
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Linus,<div><br></div><div>Thanks a lot for your comment=
s.</div><div><br></div><div>Sorry for my late reply, I was on vacation.</di=
v><div><br></div><div>The last days I have been working to move NPCM pinctr=
l GPIO to GENERIC GPIO, most of the work have been done but I had the some =
issue.</div><div><br></div><div>I initialize bgpio as follow:</div><div>

<div style=3D"background-color:rgb(255,255,255)">
<pre style=3D"color:rgb(0,0,0);font-weight:normal;text-decoration-line:none=
;font-size:11pt;font-family:&quot;Courier New&quot;">                      =
  ret =3D <span style=3D"font-weight:bolder">bgpio_init</span>(&amp;pctrl-&=
gt;gpio_bank<span style=3D"color:rgb(128,0,0)">[</span><span style=3D"color=
:rgb(128,0,128)">id</span><span style=3D"color:rgb(128,0,0)">]</span>.gc,
                                         pctrl-&gt;dev, <span style=3D"colo=
r:rgb(0,0,128)">4</span>,
                                         pctrl-&gt;gpio_bank<span style=3D"=
color:rgb(128,0,0)">[</span><span style=3D"color:rgb(128,0,128)">id</span><=
span style=3D"color:rgb(128,0,0)">]</span>.base +
                                         NPCM7XX_GP_N_DIN,
                                         pctrl-&gt;gpio_bank<span style=3D"=
color:rgb(128,0,0)">[</span><span style=3D"color:rgb(128,0,128)">id</span><=
span style=3D"color:rgb(128,0,0)">]</span>.base +
                                         NPCM7XX_GP_N_DOUT,
                                         <span style=3D"color:rgb(192,64,0)=
">NULL</span>,
                                         <span style=3D"color:rgb(192,64,0)=
">NULL</span>,
                                         pctrl-&gt;gpio_bank<span style=3D"=
color:rgb(128,0,0)">[</span><span style=3D"color:rgb(128,0,128)">id</span><=
span style=3D"color:rgb(128,0,0)">]</span>.base +
                                         NPCM7XX_GP_N_IEM,
                                         BGPIOF_READ_OUTPUT_REG_SET);
</pre><pre style=3D"color:rgb(0,0,0);font-weight:normal;text-decoration-lin=
e:none"><font face=3D"arial, helvetica, sans-serif">After doing it, the dir=
ections functions I used are: bgpio_dir_out_inv, bgpio_dir_in_inv, bgpio_ge=
t_dir_inv </font></pre><pre style=3D"color:rgb(0,0,0);font-weight:normal;te=
xt-decoration-line:none"><font face=3D"arial, helvetica, sans-serif"><pre s=
tyle=3D"text-decoration-style:initial;text-decoration-color:initial"><font =
face=3D"arial, helvetica, sans-serif">and the I/O get function is bgpio_get=
_set </font></pre><pre style=3D"text-decoration-style:initial;text-decorati=
on-color:initial"><font face=3D"arial, helvetica, sans-serif">By using inv =
directions:</font></pre></font></pre><pre style=3D"color:rgb(0,0,0);font-we=
ight:normal;text-decoration-line:none"><font face=3D"arial, helvetica, sans=
-serif">direction out =3D 0 (</font>gc-&gt;bgpio_dir<font face=3D"monospace=
, monospace"> </font><span style=3D"font-family:arial,sans-serif">&amp;=3D =
~</span><span style=3D"font-family:&quot;Courier New&quot;;font-size:11pt;f=
ont-weight:bolder">bgpio_line2mask</span><span style=3D"font-family:&quot;C=
ourier New&quot;;font-size:11pt">(gc, gpio))</span><br></pre><pre style=3D"=
color:rgb(0,0,0);font-weight:normal;text-decoration-line:none"><pre style=
=3D"text-decoration-style:initial;text-decoration-color:initial"><font face=
=3D"arial, helvetica, sans-serif">direction in =3D 1 (</font>gc-&gt;bgpio_d=
ir |=3D <span style=3D"font-family:&quot;Courier New&quot;;font-size:11pt;f=
ont-weight:bolder">bgpio_line2mask</span><span style=3D"font-family:&quot;C=
ourier New&quot;;font-size:11pt">(gc, gpio)</span><span style=3D"font-famil=
y:&quot;Courier New&quot;;font-size:11pt">)</span><font face=3D"arial, helv=
etica, sans-serif"><br></font></pre></pre><pre style=3D"color:rgb(0,0,0);fo=
nt-weight:normal;text-decoration-line:none"><font face=3D"arial, helvetica,=
 sans-serif">The problem occur when reading the GPIO value from bgpio_get_s=
et function, because the directions value are inverse it reading the wrong =
I/O registers</font></pre><pre style=3D"color:rgb(0,0,0);font-weight:normal=
;text-decoration-line:none"><font face=3D"arial, helvetica, sans-serif">For=
 direction out it reading dat register (instead of set register)</font></pr=
e><pre style=3D"color:rgb(0,0,0);font-weight:normal;text-decoration-line:no=
ne"><font face=3D"arial, helvetica, sans-serif">For direction in it calling=
 set register (instead of dat register)</font></pre><pre><font color=3D"#00=
0000">	if (gc-&gt;bgpio_dir &amp; pinmask)
		return !!(gc-&gt;read_reg(gc-&gt;reg_set) &amp; pinmask);
	else
		return !!(gc-&gt;read_reg(gc-&gt;reg_dat) &amp; pinmask);

<font face=3D"arial, helvetica, sans-serif">the same issue occur at </font>=
</font><font face=3D"arial, helvetica, sans-serif">bgpio_get_set_multiple f=
unction.</font></pre><pre><font face=3D"arial, helvetica, sans-serif">Maybe=
 in bgpio_dir parameter<font style=3D"color:rgb(0,0,0)"> </font>direction o=
ut should be in both cases 1 and direction in =3D 0.</font></pre><pre><font=
 face=3D"arial, helvetica, sans-serif">for now i did a local fix in the npc=
m pinctrl driver by setting bgpio_dir<font style=3D"color:rgb(0,0,0)"> </fo=
nt></font><font style=3D"font-family:arial,helvetica,sans-serif;color:rgb(0=
,0,0)">parameters as </font><span style=3D"font-family:arial,helvetica,sans=
-serif">direction out =3D 1 and direction in =3D 0.</span></pre><pre><font =
face=3D"arial, helvetica, sans-serif">Thanks a lot,</font></pre><pre><font =
face=3D"arial, helvetica, sans-serif">Tomer</font></pre><pre><pre style=3D"=
text-decoration-style:initial;text-decoration-color:initial"><font face=3D"=
arial, helvetica, sans-serif">
</font>
<font face=3D"arial, helvetica, sans-serif"><font style=3D"color:rgb(0,0,0)=
"><br>

</font></font></pre>

</pre><pre><font style=3D""><font face=3D"monospace, monospace" style=3D"co=
lor:rgb(0,0,0)">

</font></font><br>

</pre><pre><font color=3D"#000000">


</font></pre></div></div></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 13 July 2018 at 11:51, Linus Walleij <span dir=3D"ltr">&lt=
;<a href=3D"mailto:linus.walleij@linaro.org" target=3D"_blank">linus.wallei=
j@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span =
class=3D"">On Thu, Jul 12, 2018 at 11:42 PM Tomer Maimon &lt;<a href=3D"mai=
lto:tmaimon77@gmail.com">tmaimon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Add Nuvoton BMC NPCM750/730/715/705 Pinmux and<br>
&gt; GPIO controller driver.<br>
&gt;<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
>tmaimon77@gmail.com</a>&gt;<br>
<br>
</span>(...)<br>
<span class=3D"">&gt; +++ b/drivers/pinctrl/nuvoton/<wbr>pinctrl-npcm7xx.c<=
br>
&gt; @@ -0,0 +1,2089 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +// Copyright (c) 2016-2018 Nuvoton Technology corporation.<br>
&gt; +// Copyright (c) 2016, Dell Inc<br>
&gt; +<br>
&gt; +#include &lt;linux/device.h&gt;<br>
&gt; +#include &lt;linux/gpio.h&gt;<br>
<br>
</span>As this is a driver you should only include &lt;linux/gpio/driver.h&=
gt;<br>
<span class=3D""><br>
&gt; +#include &lt;linux/interrupt.h&gt;<br>
&gt; +#include &lt;linux/irq.h&gt;<br>
&gt; +#include &lt;linux/mfd/syscon.h&gt;<br>
<br>
</span>If you need syscon then the driver should select or depend<br>
on MFD_SYSCON in Kconfig.<br>
<span class=3D""><br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/of_address.h&gt;<br>
&gt; +#include &lt;linux/of_irq.h&gt;<br>
<br>
</span>Do you really need this include?<br>
<span class=3D""><br>
&gt; +/* Structure for register banks */<br>
&gt; +struct NPCM7XX_GPIO {<br>
<br>
</span>Can we have this lowercase? Please?<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_chip=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irqbase;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spinlock_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 lock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct irq_chip=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0irq_chip;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl_id;<br>
&gt; +};<br>
<br>
</span>So each GPIO bank has its own gpio chip and register<br>
base, that is NICE! Because then it looks like you can<br>
select GPIO_GENERIC and use the MMIO GPIO helper<br>
library to handle the registers. Let&#39;s look into that<br>
option!<br>
<span class=3D""><br>
&gt; +struct NPCM7xx_pinctrl {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pinctrl_dev=C2=A0 =C2=A0 =C2=A0 *pc=
tldev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct NPCM7XX_GPIO=C2=A0 =C2=A0 =C2=A0gpi=
o_bank[NPCM7XX_GPIO_BANK_<wbr>NUM];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct irq_domain=C2=A0 =C2=A0 =C2=A0 =C2=
=A0*domain;<br>
<br>
</span>I wonder why the pin controller needs and IRQ domain but<br>
I keep reading the code and I might find out...<br>
<span class=3D""><br>
&gt; +enum operand {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0op_set,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0op_getbit,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0op_setbit,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0op_clrbit,<br>
&gt; +};<br>
<br>
</span>This looks complicated. I suspect you can use GPIO_GENERIC<br>
to set/get and clear bits in the register(s).<br>
<div><div class=3D"h5"><br>
&gt; +/* Perform locked bit operations on GPIO registers */<br>
&gt; +static int gpio_bitop(struct NPCM7XX_GPIO *bank, int op, unsigned int=
 offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0int reg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask, val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D (1L &lt;&lt; offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;bank-&gt;lock, flag=
s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (op) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case op_set:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(mask=
, bank-&gt;base + reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case op_getbit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask &amp;=3D =
ioread32(bank-&gt;base + reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case op_setbit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D ioread=
32(bank-&gt;base + reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(val =
| mask, bank-&gt;base + reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case op_clrbit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D ioread=
32(bank-&gt;base + reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(val =
&amp; (~mask), bank-&gt;base + reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;bank-&gt;<wbr>=
lock, flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return !!mask;<br>
&gt; +}<br>
<br>
</div></div>This is essentially a reimplementation of drivers/gpio/gpio-mmi=
o.c<br>
(GPIO_GENERIC, also using a spinlock to protect the registers)<br>
so let&#39;s use that instead :)<br>
<br>
There are drivers already that reuse the spinlock inside the<br>
generic GPIO chip to protect their other registers like for<br>
IRQ registers.<br>
<span class=3D""><br>
&gt; +static int npcmgpio_get_direction(struct gpio_chip *chip, unsigned in=
t offset)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct NPCM7XX_GPIO *bank =3D gpiochip_get=
_data(chip);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 oe, ie;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get Input &amp; Output state */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ie =3D gpio_bitop(bank, op_getbit, offset,=
 NPCM7XX_GP_N_IEM);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0oe =3D gpio_bitop(bank, op_getbit, offset,=
 NPCM7XX_GP_N_OE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ie &amp;&amp; !oe)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return GPIOF_D=
IR_IN;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (oe &amp;&amp; !ie)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return GPIOF_D=
IR_OUT;<br>
<br>
</span>These are consumer flags and should not be used in drivers.<br>
Use plain 0/1 instead.<br>
<br>
Anyways the problem goes away with GPIO_GENERIC.<br>
<span class=3D""><br>
&gt; +static int npcmgpio_direction_input(<wbr>struct gpio_chip *chip, unsi=
gned int offset)<br>
&gt; +{<br>
</span>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return pinctrl_gpio_direction_input=
(<wbr>offset + chip-&gt;base);<br>
&gt; +}<br>
<br>
It&#39;s a bit tricksy to get this to work with GPIO_GENERIC.<br>
<br>
After calling bgpio_init() you need to overwrite the assigned<br>
.direction_input handler with this and then direct back to the<br>
one assigned by GPIO_GENERIC.<br>
<br>
Something like this:<br>
<br>
1. Add two indirection pointers to the npcm7xx_gpio state container:<br>
<br>
struct npcm7xx_gpio {<br>
=C2=A0 =C2=A0 =C2=A0(...)<br>
=C2=A0 =C2=A0 =C2=A0 int (*direction_input)(struct gpio_chip *chip, unsigne=
d offset);<br>
=C2=A0 =C2=A0 =C2=A0 int (*direction_output)(struct gpio_chip *chip, unsign=
ed offset,<br>
int value);<br>
=C2=A0 =C2=A0 =C2=A0(...)<br>
};<br>
<br>
2. Save the pointers<br>
<br>
struct npcm7xx_gpio *npcm;<br>
<br>
bgpio_init( ... register setup ...)<br>
npcm-&gt;direction_input =3D npcm-&gt;gc.direction_input;<br>
npcm-&gt;direction_output =3D npcm-&gt;gc.direction_output;<br>
npcm-&gt;gc.direction_input =3D npcmgpio_direction_input;<br>
npcm-&gt;gc.direction_output =3D npcmgpio_direction_output;<br>
<br>
3. Modify the functions like that:<br>
<span class=3D""><br>
static int npcmgpio_direction_input(<wbr>struct gpio_chip *chip, unsigned i=
nt offset)<br>
</span>{<br>
=C2=A0 =C2=A0 struct npcm7xx_gpio *npcm =3D gpiochip_get_data(chip);<br>
=C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0 =C2=A0 ret =3D pinctrl_gpio_direction_input(<wbr>offset + chip-&gt;b=
ase);<br>
=C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 return npcm-&gt;direction_input(chip);<br>
}<br>
<br>
I&#39;m sure you get the idea... if you think we can modify gpio-mmio<br>
to be more helpful with this, suggestions are welcome!<br>
<span class=3D""><br>
&gt; +/* Set GPIO to Output with initial value */<br>
&gt; +static int npcmgpio_direction_output(<wbr>struct gpio_chip *chip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int offse=
t, int value)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct NPCM7XX_GPIO *bank =3D gpiochip_get=
_data(chip);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(chip-&gt;parent, &quot;gpio_direct=
ion_output: offset%d =3D %x\n&quot;, offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check if we&#39;re enabled as an interr=
upt.. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gpio_bitop(bank, op_getbit, offset, NP=
CM7XX_GP_N_EVEN) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio_bitop(bank, op_getbit, =
offset, NPCM7XX_GP_N_IEM)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(chip-&=
gt;parent,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;gpio_direction_output: IRQ enabled on offset%d\n&quot;,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
</span>This should not be necessary as you are using GPIOLIB_IRQCHIP,<br>
which locks the GPIO for interrupt and disallows this to happen.<br>
<span class=3D""><br>
&gt; +static int npcmgpio_gpio_request(struct gpio_chip *chip, unsigned int=
 offset)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(chip-&gt;parent, &quot;gpio_reques=
t: offset%d\n&quot;, offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return pinctrl_gpio_request(offset + chip-=
&gt;base);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcmgpio_gpio_free(struct gpio_chip *chip, unsigned int o=
ffset)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(chip-&gt;parent, &quot;gpio_free: =
offset%d\n&quot;, offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl_gpio_free(offset + chip-&gt;base);=
<br>
&gt; +}<br>
<br>
</span>This needs the same pattern as the direction functions above, then<b=
r>
you can use GPIO_GENERIC (mmio).<br>
<span class=3D""><br>
&gt; +static unsigned int npcmgpio_irq_startup(struct irq_data *d)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_chip *gc =3D irq_data_get_irq_=
chip_data(d);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int gpio =3D d-&gt;hwirq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* active-high, input, clear interrupt, en=
able interrupt */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(d-&gt;chip-&gt;parent_<wbr>device,=
 &quot;startup: %u.%u\n&quot;, gpio, d-&gt;irq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0npcmgpio_direction_output(gc, gpio, 1);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0npcmgpio_direction_input(gc, gpio);<br>
<br>
</span>Interesting dance. So it is required to set the line to<br>
1 and then switch to input?<br>
<span class=3D""><br>
&gt; +static struct irq_chip npcmgpio_irqchip =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;NPCM7XX-GPIO-IRQ&quot;,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_ack =3D npcmgpio_irq_ack,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_unmask =3D npcmgpio_irq_unmask,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_mask =3D npcmgpio_irq_mask,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_set_type =3D npcmgpio_set_irq_type,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_startup =3D npcmgpio_irq_startup,<br>
&gt; +};<br>
<br>
</span>This code is looking good BTW.<br>
<br>
The patch in my inbox just ends in the middle of everything, I wonder<br>
why :( suspect the new gmail interface I&#39;m using.<br>
<br>
Anyways: the pointers above should keep you busy for the next<br>
iteration of the patch, the pin control part seems pretty straight-forward.=
<br>
<br>
Yours,<br>
Linus Walleij<br>
</blockquote></div><br></div>

--000000000000de351b0571dbb316--
