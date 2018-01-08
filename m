From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH 01/11] clk: sunxi-ng: Don't set k if
 width is 0 for nkmp plls
Date: Mon, 8 Jan 2018 17:19:47 +0800
Message-ID: <CAGb2v6463B-JVw5A9C39iiuo7Xzj3Bq06m6VzdAUqr0b-S91MQ@mail.gmail.com>
References: <20171230210203.24115-1-jernej.skrabec@siol.net>
 <20171230210203.24115-2-jernej.skrabec@siol.net> <CAGb2v67B23yUdACijKxosfFG_os5WndiBKX02DGA4PFUkxDx9g@mail.gmail.com>
 <3625461.aU9oqMdpo3@jernej-laptop>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBS7PZTJAKGQEAVBEDDY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3625461.aU9oqMdpo3@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 5, 2018 at 3:28 AM, Jernej =C5=A0krabec <jernej.skrabec-ix9DCk4F938@public.gmane.org=
t> wrote:
> Hi,
>
> Dne =C4=8Detrtek, 04. januar 2018 ob 15:45:18 CET je Chen-Yu Tsai napisal=
(a):
>> On Sun, Dec 31, 2017 at 5:01 AM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org=
>
> wrote:
>> > For example, A83T have nmp plls which are modelled as nkmp plls. Since=
 k
>> > is not specified, it has offset 0, shift 0 and lowest value 1. This
>> > means that LSB bit is always set to 1, which may change clock rate.
>> >
>> > Fix that by applying k factor only if k width is greater than 0.
>> >
>> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
>> > ---
>> >
>> >  drivers/clk/sunxi-ng/ccu_nkmp.c | 21 +++++++++++++--------
>> >  1 file changed, 13 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c
>> > b/drivers/clk/sunxi-ng/ccu_nkmp.c index e58c95787f94..709f528af2b3 100=
644
>> > --- a/drivers/clk/sunxi-ng/ccu_nkmp.c
>> > +++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
>> > @@ -81,7 +81,7 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk=
_hw
>> > *hw,>
>> >                                         unsigned long parent_rate)
>> >
>> >  {
>> >
>> >         struct ccu_nkmp *nkmp =3D hw_to_ccu_nkmp(hw);
>> >
>> > -       unsigned long n, m, k, p;
>> > +       unsigned long n, m, k =3D 1, p;
>> >
>> >         u32 reg;
>> >
>> >         reg =3D readl(nkmp->common.base + nkmp->common.reg);
>> >
>> > @@ -92,11 +92,13 @@ static unsigned long ccu_nkmp_recalc_rate(struct
>> > clk_hw *hw,>
>> >         if (!n)
>> >
>> >                 n++;
>> >
>> > -       k =3D reg >> nkmp->k.shift;
>> > -       k &=3D (1 << nkmp->k.width) - 1;
>> > -       k +=3D nkmp->k.offset;
>> > -       if (!k)
>> > -               k++;
>> > +       if (nkmp->k.width) {
>> > +               k =3D reg >> nkmp->k.shift;
>> > +               k &=3D (1 << nkmp->k.width) - 1;
>> > +               k +=3D nkmp->k.offset;
>> > +               if (!k)
>> > +                       k++;
>> > +       }
>>
>> The conditional shouldn't be necessary. With nkmp->k.width =3D 0,
>> you'd simply get k & 0, which is 0, which then gets bumped up to 1,
>> unless k.offset > 1, which would be a bug.
>>
>> >         m =3D reg >> nkmp->m.shift;
>> >         m &=3D (1 << nkmp->m.width) - 1;
>> >
>> > @@ -153,12 +155,15 @@ static int ccu_nkmp_set_rate(struct clk_hw *hw,
>> > unsigned long rate,>
>> >         reg =3D readl(nkmp->common.base + nkmp->common.reg);
>> >         reg &=3D ~GENMASK(nkmp->n.width + nkmp->n.shift - 1, nkmp->n.s=
hift);
>> >
>> > -       reg &=3D ~GENMASK(nkmp->k.width + nkmp->k.shift - 1, nkmp->k.s=
hift);
>> > +       if (nkmp->k.width)
>> > +               reg &=3D ~GENMASK(nkmp->k.width + nkmp->k.shift - 1,
>> > +                               nkmp->k.shift);
>> >
>> >         reg &=3D ~GENMASK(nkmp->m.width + nkmp->m.shift - 1, nkmp->m.s=
hift);
>> >         reg &=3D ~GENMASK(nkmp->p.width + nkmp->p.shift - 1, nkmp->p.s=
hift);
>> >
>> >         reg |=3D (_nkmp.n - nkmp->n.offset) << nkmp->n.shift;
>> >
>> > -       reg |=3D (_nkmp.k - nkmp->k.offset) << nkmp->k.shift;
>> > +       if (nkmp->k.width)
>> > +               reg |=3D (_nkmp.k - nkmp->k.offset) << nkmp->k.shift;
>>
>> I think a better way would be
>>
>>         reg |=3D ((_nkmp.k - nkmp->k.offset) << nkmp->k.shift) &
>>                GENMASK(nkmp->k.width + nkmp->k.shift - 1, nkmp->k.shift)=
;
>>
>> And do this for all the factors, not just k. This pattern is what
>> regmap_update_bits does, which seems much safer. I wonder what
>> GENMASK() with a negative value would do though...
>
> You're right, GENMASK(-1, 0) equals 0 (calculated by hand, not tested). T=
his
> seems much more elegant solution.
>
> Semi-related question: All nmp PLLs have much wider N range than real nkm=
p
> PLLs. This causes integer overflow when using nkmp formula from datasheet=
.
> Usually, N is 1-256 for nmp PLLs, which means that for very high N factor=
s, it
> overflows. This also causes issue that M factor is never higher than 1.

Sounds like we can't use u8 for storing the factors. At least the
intermediate values we use to calculate the rates.

>
> I was wondering, if patch would be acceptable which would change this for=
mula:
>
> RATE =3D (24MHz * N * K) / (M * P)
>
> to this:
>
> RATE ((24MHz / M) * N * K) / P
>
> I checked all M factors and are all in 1-4 or 1-2 range, which means it
> wouldn't have any impact for real nkmp PLLs when parent is 24 MHz clock w=
hich
> is probably always.
>
> What do you think?

I think this is acceptable. M is normally the pre-divider, so this
actually fits how the hardware works, including possible rounding
errors.

ChenYu

> I discovered that when I tried to set A83T PLL_VIDEO to 346.5 MHz which i=
s
> possible only when above formula is changed.
>
> Best regards,
> Jernej
>
>>
>> ChenYu
>>
>> >         reg |=3D (_nkmp.m - nkmp->m.offset) << nkmp->m.shift;
>> >         reg |=3D ilog2(_nkmp.p) << nkmp->p.shift;
>> >
>> > --
>> > 2.15.1
>
>
>
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
