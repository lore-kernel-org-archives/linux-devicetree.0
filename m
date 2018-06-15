From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v2 11/27] drm/sun4i: tcon: Add support
 for tcon-top gate
Date: Sat, 16 Jun 2018 01:13:17 +0800
Message-ID: <CAGb2v66UFRKRF4_zbm8nQJYoOHb-iLbiU_0iYWep=WNiQDftMQ@mail.gmail.com>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
 <20180612200036.21483-12-jernej.skrabec@siol.net> <20180615083110.laruycabvyjmesmo@flea>
 <2948115.KggauuSURZ@jernej-laptop>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBRHHR7MQKGQEDQDSI2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2948115.KggauuSURZ@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 16, 2018 at 12:41 AM, Jernej =C5=A0krabec
<jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
> Hi,
>
> Dne petek, 15. junij 2018 ob 10:31:10 CEST je Maxime Ripard napisal(a):
>> Hi,
>>
>> On Tue, Jun 12, 2018 at 10:00:20PM +0200, Jernej Skrabec wrote:
>> > TV TCONs connected to TCON TOP have to enable additional gate in order
>> > to work.
>> >
>> > Add support for such TCONs.
>> >
>> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
>> > ---
>> >
>> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 11 +++++++++++
>> >  drivers/gpu/drm/sun4i/sun4i_tcon.h |  4 ++++
>> >  2 files changed, 15 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> > b/drivers/gpu/drm/sun4i/sun4i_tcon.c index 08747fc3ee71..0afb5a94a414
>> > 100644
>> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> > @@ -688,6 +688,16 @@ static int sun4i_tcon_init_clocks(struct device *=
dev,
>> >
>> >             dev_err(dev, "Couldn't get the TCON bus clock\n");
>> >             return PTR_ERR(tcon->clk);
>> >
>> >     }
>> >
>> > +
>> > +   if (tcon->quirks->has_tcon_top_gate) {
>> > +           tcon->top_clk =3D devm_clk_get(dev, "tcon-top");
>> > +           if (IS_ERR(tcon->top_clk)) {
>> > +                   dev_err(dev, "Couldn't get the TCON TOP bus clock\=
n");
>> > +                   return PTR_ERR(tcon->top_clk);
>> > +           }
>> > +           clk_prepare_enable(tcon->top_clk);
>> > +   }
>> > +
>>
>> Is it required for the TCON itself to operate, or does the TCON
>> requires the TCON TOP, which in turn requires that clock to be
>> functional?
>>
>> I find it quite odd to have a clock that isn't meant for a particular
>> device to actually be wired to another device. I'm not saying this
>> isn't the case, but it would be a first.
>
> Documentation doesn't say much about that gate. I did few tests and TCON
> registers can be read and written even if TCON TOP TV TCON gate is disabl=
ed.
> However, there is no image, as expected.

The R40 manual does include it in the diagram, on page 504. There's also a
mux to select whether the clock comes directly from the CCU or the TV encod=
er
(a feedback mode?). I assume this is the gate you are referring to here, in
which case it is not a bus clock, but rather the TCON module or channel clo=
ck,
strangely routed.

> More interestingly, I enabled test pattern directly in TCON to eliminate
> influence of the mixer. As soon as I disabled that gate, test pattern on =
HDMI
> screen was gone, which suggest that this gate influences something inside
> TCON.
>
> Another test I did was that I moved enable/disable gate code to
> sun4i_tcon_channel_set_status() and it worked just as well.
>
> I'll ask AW engineer what that gate actually does, but from what I saw, I
> would say that most appropriate location to enable/disable TCON TOP TV TC=
ON
> gate is TCON driver. Alternatively, TCON TOP driver could check if any TV=
 TCON
> is in use and enable appropriate gate. However, that doesn't sound right =
to me
> for some reason.

If what I said above it true, then yes, the appropriate location to enable =
it
is the TCON driver, but moreover, the representation of the clock tree shou=
ld
be fixed such that the TCON takes the clock from the TCON TOP as its channe=
l/
module clock instead. That way you don't need this patch, but you'd add ano=
ther
for all the clock routing.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
