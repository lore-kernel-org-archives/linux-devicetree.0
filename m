From: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver
Date: Mon, 30 Jul 2018 02:24:00 +0300
Message-ID: <CAP6Zq1iywxS7aMHVWT7N3HFxHR-QOvZ8OEb7hpPkmz55xV56_g@mail.gmail.com>
References: <20180712214203.114844-1-tmaimon77@gmail.com> <20180712214203.114844-3-tmaimon77@gmail.com>
 <CACRpkdYOQMkA6BHtY3-NSXhyhoG7KzDg8SkqL2B6M8GQrvXgMA@mail.gmail.com>
 <CAP6Zq1h5TXBcfvxDA5Ae9XuW65s_zQd_JrM3vRWR6KBRYCHRrg@mail.gmail.com> <CACRpkdbcqA4gBv7W2SNSFJRQ26GGCE315UsDDG9zr458GK709g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="000000000000d6878605722ba3e2"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbcqA4gBv7W2SNSFJRQ26GGCE315UsDDG9zr458GK709g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Avi Fishman <avifishman70@gmail.com>, Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

--000000000000d6878605722ba3e2
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On 30 July 2018 at 00:59, Linus Walleij <linus.walleij@linaro.org> wrote:

> On Thu, Jul 26, 2018 at 2:01 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > I initialize bgpio as follow:
> >
> >                         ret = bgpio_init(&pctrl->gpio_bank[id].gc,
> >                                          pctrl->dev, 4,
> >                                          pctrl->gpio_bank[id].base +
> >                                          NPCM7XX_GP_N_DIN,
> >                                          pctrl->gpio_bank[id].base +
> >                                          NPCM7XX_GP_N_DOUT,
> >                                          NULL,
> >                                          NULL,
> >                                          pctrl->gpio_bank[id].base +
> >                                          NPCM7XX_GP_N_IEM,
> >                                          BGPIOF_READ_OUTPUT_REG_SET);
>
> (...)
> > The problem occur when reading the GPIO value from bgpio_get_set
> function,
> > because the directions value are inverse it reading the wrong I/O
> registers
> >
> > For direction out it reading dat register (instead of set register)
> >
> > For direction in it calling set register (instead of dat register)
>
> Hm I don't quite get it... sorry. Maybe if you show your fix and what
> you expect to happen I can understand better?
>

Of course, in the last patch sent three days a go (V3 -
https://patchwork.ozlabs.org/patch/949942/) I did as follow to workaround
the issue:

       int (*get)(struct gpio_chip *chip, unsigned offset);
       int (*get_multiple)(struct gpio_chip *chip, unsigned long *mask,
                           unsigned long *bits);

......

static int npcmgpio_get_value(struct gpio_chip *chip, unsigned int offset)
{
       struct npcm7xx_gpio *bank = gpiochip_get_data(chip);
       unsigned long tmp_bgpio_dir = bank->gc.bgpio_dir;
       int val;

       /*
        * sets bgpio_dir parameter value to the opposite value
        * for calling the right registers in bgpio_get_set
        * function
        */



*       bank->gc.bgpio_dir = ~bank->gc.bgpio_dir;       val =
bank->get(chip, offset);       bank->gc.bgpio_dir = tmp_bgpio_dir;*
       return val;
}

static int npcmgpio_get_multiple_value(struct gpio_chip *chip,
                                      unsigned long *mask, unsigned long
*bits)
{
       struct npcm7xx_gpio *bank = gpiochip_get_data(chip);
       unsigned long tmp_bgpio_dir = bank->gc.bgpio_dir;
       int val;

       /*
        * sets bgpio_dir parameter value to the opposite value
        * for calling the right registers in bgpio_get_set_multiple
        * function
        */



*       bank->gc.bgpio_dir = ~bank->gc.bgpio_dir;       val =
bank->get_multiple(chip, mask, bits);       bank->gc.bgpio_dir =
tmp_bgpio_dir;*
       return val;
}

......

       pctrl->gpio_bank[id].get = pctrl->gpio_bank[id].gc.get;
       pctrl->gpio_bank[id].gc.get = npcmgpio_get_value;
       pctrl->gpio_bank[id].get_multiple = ptrl->gpio_bank[id].gc.get_mul
tiple;
       pctrl->gpio_bank[id].gc.get_multiple = npcmgpio_get_multiple_value;


but it is not that good solution, because the bold commands are not atomic
(locked) operations.


>
> Do you mean that because you write the inverse value to
> IEM this happens, and the BGPIO code assumes that
> you always write 1 to set a line as input and 0 to set it
> as output?
>

yes, because of it the bgpio_get_set and bgpio_get_set_multiple setting the
opposite data registers .


>
> I would say if this causes the problem we should just add
> a new BGPIOF_INVERTED_REG_DIR with comment in
> include/linux/gpio/driver.h and make the necessary fix to
> respect this flag in the gpio-mmio.c core so it works right.
>
> If you do this as a separate patch I would be grateful :)
>

Sure, I will send a separate patch later on to overcome it.

>
> Yours,
> Linus Walleij
>

Thanks,

Tomer

--000000000000d6878605722ba3e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Linus,<div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On 30 July 2018 at 00:59, Linus Walleij <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:linus.walleij@linaro.org" target=3D"_blank">linus.walleij@lin=
aro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><span>On Thu, Jul 26, 2018 at 2:01 AM Tomer Maimon &lt;<a href=3D"m=
ailto:tmaimon77@gmail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt; wr=
ote:<br>
<br>
&gt; I initialize bgpio as follow:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D bgpio_init(&amp;pctrl-&gt;gpio_bank[i<wbr>d].gc=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pctrl-&gt;dev, 4,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pctrl-&gt;gpio_bank[id].base +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NPCM7XX_GP_N_DIN,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pctrl-&gt;gpio_bank[id].base +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NPCM7XX_GP_N_DOUT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pctrl-&gt;gpio_bank[id].base +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NPCM7XX_GP_N_IEM,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 BGPIOF_READ_OUTPUT_REG_SET);<br>
<br>
</span>(...)<br>
<span>&gt; The problem occur when reading the GPIO value from bgpio_get_set=
 function,<br>
&gt; because the directions value are inverse it reading the wrong I/O regi=
sters<br>
&gt;<br>
&gt; For direction out it reading dat register (instead of set register)<br=
>
&gt;<br>
&gt; For direction in it calling set register (instead of dat register)<br>
<br>
</span>Hm I don&#39;t quite get it... sorry. Maybe if you show your fix and=
 what<br>
you expect to happen I can understand better?<br></blockquote><div>=C2=A0</=
div><div>Of course, in the last patch sent=C2=A0<span style=3D"font-size:sm=
all;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">three days a go</span>

 (V3 - <a href=3D"https://patchwork.ozlabs.org/patch/949942/">https://patch=
work.ozlabs.org/patch/949942/</a>) I did as follow to workaround the issue:=
</div><div><br></div><div><span style=3D"font-size:12.8px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*get)(struct g=
pio_chip *chip, unsigned offset);</span><br style=3D"font-size:12.8px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"font-size:12.8px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*get_multiple)(struct gpi=
o_chip *chip, unsigned long *mask,</span><br style=3D"font-size:12.8px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"font-size:12.8px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long *bits);</span></div>=
<div><br></div><div>......<br style=3D"font-size:12.8px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial"=
>

<br></div><div><span style=3D"font-size:12.8px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">static int npcmgpio_get_value(struct gpio_chip *chip, uns=
igned int offset)</span><br style=3D"font-size:12.8px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">{</span><br style=3D"font-size:12.8px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
font-size:12.8px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0struct npcm7xx_gpio *bank =3D gpiochip_get_data(chip);</sp=
an><br style=3D"font-size:12.8px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"font-si=
ze:12.8px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long tmp_bgpio_dir =3D bank-&gt;gc.bgpio_dir;</span><br =
style=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"font-size:12.8=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0int val;</span><br style=3D"font-size:12.8px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial"><br sty=
le=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"font-size:12.8px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
</span><br style=3D"font-size:12.8px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial"><span style=3D"fon=
t-size:12.8px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 * sets bgpio_dir parameter value to the opposite value</span>=
<br style=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"font-size:=
12.8px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 * for calling the right registers in bgpio_get_set</span><br style=
=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"font-size:12.8px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 * f=
unction</span><br style=3D"font-size:12.8px;background-color:rgb(255,255,25=
5);text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 */</span><br style=3D"font-size:12.8px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><b><span style=3D"font-size:12.8px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0bank-&gt;gc.bgpio_dir =3D ~bank-&gt;g=
c.bgpio_dir;</span><br style=3D"font-size:12.8px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial"><span =
style=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0val =3D bank-&gt;get(chip, offset);</span><br style=
=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"font-size:12.8px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0bank=
-&gt;gc.bgpio_dir =3D tmp_bgpio_dir;</span><br style=3D"font-size:12.8px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial"></b><br style=3D"font-size:12.8px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;</span><br style=3D"font-size:12.8px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial"><span style=3D"font-size:12.8px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">}</span><br style=3D"font-size:12.8px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><br style=3D"font-size:12.8px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial"><span style=3D"font=
-size:12.8px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">static int npcmg=
pio_get_multiple_value(</span><span style=3D"font-size:12.8px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">st<wbr>ruct gpio_chip *chip,</span><br sty=
le=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"font-size:12.8px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long *mask, unsigned long *bits)</=
span><br style=3D"font-size:12.8px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"font-=
size:12.8px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial;float:none;display:inline">{</span><br style=
=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"font-size:12.8px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0stru=
ct npcm7xx_gpio *bank =3D gpiochip_get_data(chip);</span><br style=3D"font-=
size:12.8px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial"><span style=3D"font-size:12.8px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long=
 tmp_bgpio_dir =3D bank-&gt;gc.bgpio_dir;</span><br style=3D"font-size:12.8=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial"><span style=3D"font-size:12.8px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0int val;</span><br sty=
le=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><br style=3D"font-size:12.8px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial"><span style=3D"font-size:12.8px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0/*</span><br style=3D"font-=
size:12.8px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial"><span style=3D"font-size:12.8px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 * sets bgpio=
_dir parameter value to the opposite value</span><br style=3D"font-size:12.=
8px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial"><span style=3D"font-size:12.8px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 * for calling the ri=
ght registers in bgpio_get_set_multiple</span><br style=3D"font-size:12.8px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"font-size:12.8px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 * function</span><br st=
yle=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"font-size:12.8px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
*/</span><br style=3D"font-size:12.8px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><b><span style=
=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0bank-&gt;gc.bgpio_dir =3D ~bank-&gt;gc.bgpio_dir;</span=
><br style=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"font-size=
:12.8px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0val =3D bank-&gt;get_multiple(chip, mask, bits);</span><br style=3D"f=
ont-size:12.8px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"font-size:12.8px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0bank-&gt;=
gc.bgpio_dir =3D tmp_bgpio_dir;</span><br style=3D"font-size:12.8px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"></b><br style=3D"font-size:12.8px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial"><span st=
yle=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0return val;</span><br style=3D"font-size:12.8px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial"><span style=3D"font-size:12.8px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">}</span>

<br></div><div>=C2=A0<br></div><div>......</div><div><br></div><div><span s=
tyle=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0pctrl-&gt;gpio_bank[id].get =3D pctrl-&gt;gpio_bank=
[id].gc.get;</span><br style=3D"font-size:12.8px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial"><span =
style=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0pctrl-&gt;gpio_bank[id].gc.get =3D npcmgpio_get_val=
ue;</span><br style=3D"font-size:12.8px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
font-size:12.8px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0pctrl-&gt;gpio_bank[id].get_</span><span style=3D"font-siz=
e:12.8px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">mult<wbr>iple =3D p<=
/span><span style=3D"font-size:12.8px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">trl-&gt;gpio_bank[id].gc.get_</span><span style=3D"font-size:12.8p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">mul<wbr>tiple;</span><br st=
yle=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"font-size:12.8px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0p=
ctrl-&gt;gpio_bank[id].gc.get_</span><span style=3D"font-size:12.8px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">m<wbr>ultiple =3D</span><span style=
=3D"font-size:12.8px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">=C2=A0np=
cmgpio_get_multiple_value;</span><br style=3D"font-size:12.8px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial">

<br></div><div><br></div><div>but it is not that good solution, because the=
 bold commands are not atomic (locked) operations.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Do you mean that because you write the inverse value to<br>
IEM this happens, and the BGPIO code assumes that<br>
you always write 1 to set a line as input and 0 to set it<br>
as output?<br></blockquote><div><br></div><div>yes,=20

<span style=3D"font-size:small;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">because of it</span>
the bgpio_get_set and bgpio_get_set_multiple setting the opposite data regi=
sters .</div><div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
I would say if this causes the problem we should just add<br>
a new BGPIOF_INVERTED_REG_DIR with comment in<br>
include/linux/gpio/driver.h and make the necessary fix to<br>
respect this flag in the gpio-mmio.c core so it works right.<br>
<br>
If you do this as a separate patch I would be grateful :)<br></blockquote><=
div><br></div><div>Sure, I will send a
<span style=3D"font-size:small;text-decoration-style:initial;text-decoratio=
n-color:initial;background-color:rgb(255,255,255);float:none;display:inline=
">separate patch<span>=C2=A0</span></span>later on <span style=3D"font-size=
:small;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">to overcome it.</span>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Yours,<br>
Linus Walleij<br>
</blockquote></div><br></div><div class=3D"gmail_extra">Thanks,</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Tomer</div></div>

--000000000000d6878605722ba3e2--
