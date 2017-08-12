From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: Re: [PATCH v6 1/6] clk: sunxi-ng: div: Add support
 for fixed post-divider
Date: Sat, 12 Aug 2017 12:49:46 +0800
Message-ID: <1c52cfe1ac634f01ea386fef6b1b525b@aosc.io>
References: <cover.ba2aaaa405a7ec685034e34926b8855fd6c9ab86.1500043741.git-series.plaes@plaes.org>
 <946794e97ae2c36cd67c272099e8236a589efc28.1500043741.git-series.plaes@plaes.org>
 <20170717085235.i7pwwql5dgmnf6kk@flea>
 <d3ca32de91e857a8933fd570600cda17@aosc.io>
 <CAGb2v675Y3AAa747-3VqsPN64YOk11v5Gm3_yq5ZeJ=YPz596g@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB3MRXLGAKGQE74WQMWQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v675Y3AAa747-3VqsPN64YOk11v5Gm3_yq5ZeJ=YPz596g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-08-12 12:13=EF=BC=8CChen-Yu Tsai =E5=86=99=E9=81=93=EF=BC=9A
> On Sat, Aug 12, 2017 at 11:07 AM,  <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>> =E5=9C=A8 2017-07-17 16:52=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=
=BC=9A
>>>=20
>>> On Fri, Jul 14, 2017 at 05:49:23PM +0300, Priit Laes wrote:
>>>>=20
>>>> SATA clock on sun4i/sun7i is of type (parent) / M / 6 where
>>>> 6 is fixed post-divider.
>>>>=20
>>>> Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
>>>> ---
>>>>  drivers/clk/sunxi-ng/ccu_div.c | 15 +++++++++++++--
>>>>  drivers/clk/sunxi-ng/ccu_div.h |  3 ++-
>>>>  2 files changed, 15 insertions(+), 3 deletions(-)
>>>>=20
>>>> diff --git a/drivers/clk/sunxi-ng/ccu_div.c
>>>> b/drivers/clk/sunxi-ng/ccu_div.c
>>>> index c0e5c10..744502a 100644
>>>> --- a/drivers/clk/sunxi-ng/ccu_div.c
>>>> +++ b/drivers/clk/sunxi-ng/ccu_div.c
>>>> @@ -21,6 +21,9 @@ static unsigned long ccu_div_round_rate(struct
>>>> ccu_mux_internal *mux,
>>>>  {
>>>>         struct ccu_div *cd =3D data;
>>>>=20
>>>> +       if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
>>>> +               rate *=3D cd->fixed_post_div;
>>>> +
>>>>         return divider_round_rate_parent(&cd->common.hw, parent,
>>>>                                          rate, parent_rate,
>>>>                                          cd->div.table,=20
>>>> cd->div.width,
>>>=20
>>>=20
>>>=20
>>> You still haven't addressed the biggest issue with this patch, see:
>>> https://patchwork.kernel.org/patch/9825565/
>>=20
>>=20
>> I think he has already did the changes suggested in the review.
>=20
> Nope. Only half of it is fixed. First you "unapply" the post-divider,
> i.e. multiply the rate by the divider. Then you pass it to
> divider_round_rate_parent. You still have to reapply the divider
> to the result. This last part is missing. This means the clock
> rate returned by ccu_div_round_rate is going to be off.
>=20
> Instead the return statement should be
>=20
>     return divider_round_rate_parent(...) / cd->fixed_post_div

Oh, got it by reading other CCU clock types that has fixed postdiv.

Thanks!

>=20
> ChenYu
>=20
>>=20
>> (P.S. during developing R40 CCU driver I found that pll-periph0-sata
>> also needs this patch, so I'm rechecking it)
>>=20
>>>=20
>>> Maxime
>>>=20
>>> _______________________________________________
>>> linux-arm-kernel mailing list
>>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>=20
>>=20
>> --
>> You received this message because you are subscribed to the Google=20
>> Groups
>> "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it, send=
=20
>> an
>> email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
