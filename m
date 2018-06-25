From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH v2 11/27] drm/sun4i: tcon: Add support
 for tcon-top gate
Date: Mon, 25 Jun 2018 09:58:57 +0200
Message-ID: <1797170.duyCyYzgBk@jernej-laptop>
References: <20180612200036.21483-1-jernej.skrabec@siol.net> <4758026.sMRKe6aTTs@jernej-laptop> <CAGb2v67wVpAKk-5kSpnbnBXz7DkHToPa6bwuRBnsfHovw74HVQ@mail.gmail.com>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP4JJM5QYGRBFOCYLMQKGQEKUOL64Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v67wVpAKk-5kSpnbnBXz7DkHToPa6bwuRBnsfHovw74HVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne ponedeljek, 25. junij 2018 ob 05:51:41 CEST je Chen-Yu Tsai napisal(a):
> On Mon, Jun 25, 2018 at 3:52 AM, Jernej =C5=A0krabec
>=20
> <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Dne =C4=8Detrtek, 21. junij 2018 ob 17:35:45 CEST je Jernej =C5=A0krabe=
c napisal(a):
> >> Dne =C4=8Detrtek, 21. junij 2018 ob 03:23:27 CEST je Chen-Yu Tsai napi=
sal(a):
> >> > On Thu, Jun 21, 2018 at 3:37 AM, Jernej =C5=A0krabec
> >> > <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> >>=20
> >> wrote:
> >> > > Dne sobota, 16. junij 2018 ob 07:48:38 CEST je Chen-Yu Tsai=20
napisal(a):
> >> > >> On Sat, Jun 16, 2018 at 1:33 AM, Jernej =C5=A0krabec
> >> > >> <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> >> > >=20
> >> > > wrote:
> >> > >> > Dne petek, 15. junij 2018 ob 19:13:17 CEST je Chen-Yu Tsai
> >=20
> > napisal(a):
> >> > >> >> On Sat, Jun 16, 2018 at 12:41 AM, Jernej =C5=A0krabec
> >> > >> >>=20
> >> > >> >> <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
> >> > >> >> > Hi,
> >> > >> >> >=20
> >> > >> >> > Dne petek, 15. junij 2018 ob 10:31:10 CEST je Maxime Ripard
> >>=20
> >> napisal(a):
> >> > >> >> >> Hi,
> >> > >> >> >>=20
> >> > >> >> >> On Tue, Jun 12, 2018 at 10:00:20PM +0200, Jernej Skrabec=20
wrote:
> >> > >> >> >> > TV TCONs connected to TCON TOP have to enable additional
> >> > >> >> >> > gate
> >> > >> >> >> > in
> >> > >> >> >> > order
> >> > >> >> >> > to work.
> >> > >> >> >> >=20
> >> > >> >> >> > Add support for such TCONs.
> >> > >> >> >> >=20
> >> > >> >> >> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> >> > >> >> >> > ---
> >> > >> >> >> >=20
> >> > >> >> >> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 11 +++++++++++
> >> > >> >> >> >  drivers/gpu/drm/sun4i/sun4i_tcon.h |  4 ++++
> >> > >> >> >> >  2 files changed, 15 insertions(+)
> >> > >> >> >> >=20
> >> > >> >> >> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> >> > >> >> >> > b/drivers/gpu/drm/sun4i/sun4i_tcon.c index
> >> > >> >> >> > 08747fc3ee71..0afb5a94a414
> >> > >> >> >> > 100644
> >> > >> >> >> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> >> > >> >> >> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> >> > >> >> >> > @@ -688,6 +688,16 @@ static int
> >> > >> >> >> > sun4i_tcon_init_clocks(struct
> >> > >> >> >> > device
> >> > >> >> >> > *dev,
> >> > >> >> >> >=20
> >> > >> >> >> >             dev_err(dev, "Couldn't get the TCON bus
> >> > >> >> >> >             clock\n");
> >> > >> >> >> >             return PTR_ERR(tcon->clk);
> >> > >> >> >> >    =20
> >> > >> >> >> >     }
> >> > >> >> >> >=20
> >> > >> >> >> > +
> >> > >> >> >> > +   if (tcon->quirks->has_tcon_top_gate) {
> >> > >> >> >> > +           tcon->top_clk =3D devm_clk_get(dev, "tcon-top=
");
> >> > >> >> >> > +           if (IS_ERR(tcon->top_clk)) {
> >> > >> >> >> > +                   dev_err(dev, "Couldn't get the TCON T=
OP
> >> > >> >> >> > bus
> >> > >> >> >> > clock\n");
> >> > >> >> >> > +                   return PTR_ERR(tcon->top_clk);
> >> > >> >> >> > +           }
> >> > >> >> >> > +           clk_prepare_enable(tcon->top_clk);
> >> > >> >> >> > +   }
> >> > >> >> >> > +
> >> > >> >> >>=20
> >> > >> >> >> Is it required for the TCON itself to operate, or does the
> >> > >> >> >> TCON
> >> > >> >> >> requires the TCON TOP, which in turn requires that clock to=
 be
> >> > >> >> >> functional?
> >> > >> >> >>=20
> >> > >> >> >> I find it quite odd to have a clock that isn't meant for a
> >> > >> >> >> particular
> >> > >> >> >> device to actually be wired to another device. I'm not sayi=
ng
> >> > >> >> >> this
> >> > >> >> >> isn't the case, but it would be a first.
> >> > >> >> >=20
> >> > >> >> > Documentation doesn't say much about that gate. I did few te=
sts
> >> > >> >> > and
> >> > >> >> > TCON
> >> > >> >> > registers can be read and written even if TCON TOP TV TCON g=
ate
> >> > >> >> > is
> >> > >> >> > disabled. However, there is no image, as expected.
> >> > >> >>=20
> >> > >> >> The R40 manual does include it in the diagram, on page 504.
> >> > >> >> There's
> >> > >> >> also
> >> > >> >> a
> >> > >> >> mux to select whether the clock comes directly from the CCU or
> >> > >> >> the
> >> > >> >> TV
> >> > >> >> encoder (a feedback mode?). I assume this is the gate you are
> >> > >> >> referring
> >> > >> >> to
> >> > >> >> here, in which case it is not a bus clock, but rather the TCON
> >> > >> >> module
> >> > >> >> or
> >> > >> >> channel clock, strangely routed.
> >> > >> >>=20
> >> > >> >> > More interestingly, I enabled test pattern directly in TCON =
to
> >> > >> >> > eliminate
> >> > >> >> > influence of the mixer. As soon as I disabled that gate, tes=
t
> >> > >> >> > pattern
> >> > >> >> > on
> >> > >> >> > HDMI screen was gone, which suggest that this gate influence=
s
> >> > >> >> > something
> >> > >> >> > inside TCON.
> >> > >> >> >=20
> >> > >> >> > Another test I did was that I moved enable/disable gate code=
 to
> >> > >> >> > sun4i_tcon_channel_set_status() and it worked just as well.
> >> > >> >> >=20
> >> > >> >> > I'll ask AW engineer what that gate actually does, but from
> >> > >> >> > what I
> >> > >> >> > saw,
> >> > >> >> > I
> >> > >> >> > would say that most appropriate location to enable/disable T=
CON
> >> > >> >> > TOP
> >> > >> >> > TV
> >> > >> >> > TCON
> >> > >> >> > gate is TCON driver. Alternatively, TCON TOP driver could ch=
eck
> >> > >> >> > if
> >> > >> >> > any
> >> > >> >> > TV
> >> > >> >> > TCON is in use and enable appropriate gate. However, that
> >> > >> >> > doesn't
> >> > >> >> > sound
> >> > >> >> > right to me for some reason.
> >> > >> >>=20
> >> > >> >> If what I said above it true, then yes, the appropriate locati=
on
> >> > >> >> to
> >> > >> >> enable
> >> > >> >> it is the TCON driver, but moreover, the representation of the
> >> > >> >> clock
> >> > >> >> tree
> >> > >> >> should be fixed such that the TCON takes the clock from the TC=
ON
> >> > >> >> TOP
> >> > >> >> as
> >> > >> >> its
> >> > >> >> channel/ module clock instead. That way you don't need this
> >> > >> >> patch,
> >> > >> >> but
> >> > >> >> you'd add another for all the clock routing.
> >> > >> >=20
> >> > >> > Can you be more specific? I not sure what you mean here.
> >> > >>=20
> >> > >> For clock related properties in the device tree:
> >> > >>=20
> >> > >> &tcon_top {
> >> > >>=20
> >> > >>     clocks =3D <&ccu CLK_BUS_TCON_TOP>,
> >> > >>    =20
> >> > >>              <&ccu CLK_TCON_TV0>,
> >> > >>              <&tve0>,
> >> > >>              <&ccu CLK_TCON_TV1>,
> >> > >>              <&tve1>;
> >> > >>    =20
> >> > >>     clock-names =3D "bus", "tcon-tv0", "tve0", "tcon-tv1", "tve1"=
;
> >> > >>     clock-output-names =3D "tcon-top-tv0", "tcon-top-tv1";
> >> > >>=20
> >> > >> };
> >> > >>=20
> >> > >> &tcon_tv0 {
> >> > >>=20
> >> > >>     clocks =3D <&ccu CLK_BUS_TCON_TV0>, <&tcon_top 0>'
> >> > >>     clock-names =3D "ahb", "tcon-ch1";
> >> > >>=20
> >> > >> };
> >> > >>=20
> >> > >> A diagram would look like:
> >> > >>                    | This part is TCON TOP |
> >> > >>                   =20
> >> > >>                    v                       v
> >> > >>=20
> >> > >> CCU CLK_TCON_TV0 --|----\                  |
> >> > >>=20
> >> > >>                    |     mux ---- gate ----|-- TCON_TV0
> >> > >>=20
> >> > >> TVE0 --------------|----/                  |
> >> > >>=20
> >> > >> And the same goes for TCON_TV1 and TVE1.
> >> > >>=20
> >> > >> The user manual is a bit lacking on how TVE outputs a clock thoug=
h.
> >> > >=20
> >> > > I didn't yet received any response on HW details from AW till now,
> >> > > but I
> >> > > would like to post new version of patches soon.
> >> > >=20
> >> > > While chaining like you described could be implemented easily, I
> >> > > don't
> >> > > think it really represents HW as it is. Tests showed that these tw=
o
> >> > > clocks are independent, otherwise register writes/reads wouldn't b=
e
> >> > > possible with tcon- top gate disabled. I chose tcon-top bus clock =
as
> >> > > a
> >> > > parent becase if it is not enabled, it simply won't work.
> >> >=20
> >> > AFAIK with the TCONs, even when the TCON channel clock (not the bus
> >> > clock)
> >> > is disabled, register accesses still work.
> >>=20
> >> You're right, I just tested that.
> >>=20
> >> > I'm saying that the TCON TOP
> >> > gate is downstream from the TCON channel clock in the CCU. These are
> >> > not
> >> > related to the TCON bus clock in the CCU, which affects register
> >> > access.
> >> >=20
> >> > Did Allwinner provide any information regarding the hierarchy of the
> >> > clocks?
> >>=20
> >> No reponse for now.
> >>=20
> >> > > However, if everyone feels chaining is the best way to implement i=
t,
> >> > > I'll
> >> > > do it.
> >> >=20
> >> > I would like to get it right and match actual hardware. My proposal =
is
> >> > based on my understanding from the diagrams in the user manual.
> >>=20
> >> So for now, your explanation is the most reasonable. Should we go ahea=
d
> >> and
> >> implement your idea?
> >>=20
> >> Please note that H6 has TCON-TOP too, but it has only one LCD TCON and
> >> one
> >> TV TCON instead of two of each kind. That means we will have hole in
> >> indices (tcon_lcd0 is 1, tcon_tv0 is 3, which is aligned with R40) and
> >> different TCON- TOP binding (no tcon_tv1 channel clock), but setup is
> >> exactly the same.
> >=20
> > I just noticed issue with this proposal. If we have following clock cha=
in
> > for HDMI, everythings is ok:
> >=20
> > TCON-TV0 -> TCON-TOP-TV0
> >=20
> > TCON TV sets TCON-TOP-TV0 clock rate, which in turn sets TCON-TV0 clock
> > and
> > everything works.
> >=20
> > However, when TVE will be configured, it would look like this:
> >=20
> > TVE0 -> TCON-TOP-TV0
> >=20
> > TVE driver will set TVE0 clock to 216 MHz and TCON TV would set
> > TCON-TOP-TV0 rate which in turn sets TVE0 clock to something like 13.5
> > MHz (or whatever is the right clock rate for PAL and NTSC). As you can
> > see, same clock is set to two different rates by two different drivers.
> >=20
> > It *might* still work, since encoders set clock rate after TCON (at lea=
st
> > that is my experience for HDMI pipeline), but that is still wrong.
> >=20
> > To overcome above issue, I would stick to original proposal with
> > additional
> > clock specified in TCON TV DT node. That way TCON driver would always s=
et
> > clock rate to TCON-TV0 clock. If TVE0 is enabled, TCON wouldn't interfe=
re
> > with setting clock rate, because TCON-TV0 clock would be decoupled in
> > TCON-TOP mux.
> >=20
> > What do you think?
>=20
> I think this is the wrong representation, and worse, you are trying to wo=
rk
> around software issues with it.
>=20
> So to confirm some details, the TVE expects 216 MHz clock, and it expects
> the TCON to run and output data at 216 MHz as well. Is that correct?

Yes, from my understanding. 216 MHz is correct at least for PAL and NTSC, e=
.g.=20
TV mode. TVE on R40 is also capable of RGB mode (VGA connector).

>=20
> Would any settings for the TCON differ between when HDMI or TVE is used?
>=20

Apart of clock, no, other settings would be the same.

> Does TVE and TCON run at 216 MHz regardless of resolution? I kind of doub=
t
> it. It might be expecting 297 MHz for PC resolutions.

Please check this table in BSP:
https://github.com/BPI-SINOVOIP/BPI-M2U-bsp/blob/master/linux-sunxi/drivers=
/
video/sunxi/disp2/tv/drv_tv.c#L24

216 MHz is applicable for low resolution, interlaced modes. Modes like 1080=
P,=20
1080I have expected standard timing.

>=20
> I think these kinds of quirks should be handled in the software, instead =
of
> being papered over.

Ok, that works for me too. I would just like to have such design that would=
=20
later allow implementing TVE driver without much issues.

BTW, H3 TV TCON which is connected to TVE doesn't have TCON-TV channel cloc=
k=20
at all, since it is controlled with TVE clock (same case as it would be her=
e,=20
if TCON TOP mux is switched to TVE clock source).

Maybe quirk can be added that it doesn't set clock rate at all if it is=20
connected to TVE?

Best regards,
Jernej




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
