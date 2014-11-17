Return-Path: <amstan@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20141117193902.25314.97687@quantum>
References: <1416009604-31545-1-git-send-email-amstan@chromium.org>
 <1416009604-31545-2-git-send-email-amstan@chromium.org> <20141117193902.25314.97687@quantum>
From: Alexandru Stan <amstan@chromium.org>
Date: Mon, 17 Nov 2014 11:47:16 -0800
Message-ID: <CAHNYxRxTaRY=+wi_TgfO35U_NDXmyeGtzPQZXDsYMRA5fyd3eg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: rockchip: add bindings for the mmc clock phases
Content-Type: multipart/alternative; boundary=001a113defd81a39e10508134075
To: Mike Turquette <mturquette@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>, addy ke <addy.ke@rock-chips.com>, Sonny Rao <sonnyrao@chromium.org>, Kever Yang <kever.yang@rock-chips.com>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.yao@rock-chips.com, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a113defd81a39e10508134075
Content-Type: text/plain; charset=UTF-8

I actually need to control 2 phases, one of them is used when outputting
data, the other when sampling. Sunxi does something similar:
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/273273.html

Another reason it wouldn't work is because the upstream clock(eg SCLK_SDMMC)
is twice as fast as the real clock(see RK3288_CLKGEN_DIV in
drivers/mmc/host/dw_mmc-rockchip.c), since that clock goes to a /2 divider
to be able to do the 90 degree clock phases.

Alexandru Stan (amstan)

On Mon, Nov 17, 2014 at 11:39 AM, Mike Turquette <mturquette@linaro.org>
wrote:

> Quoting Alexandru M Stan (2014-11-14 16:00:03)
> > This will be used in a later patch for clock phase tuning.
> >
> > Suggested-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Alexandru M Stan <amstan@chromium.org>
> > ---
> > Changes in v2: None
> >
> >  include/dt-bindings/clock/rk3288-cru.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/include/dt-bindings/clock/rk3288-cru.h
> b/include/dt-bindings/clock/rk3288-cru.h
> > index 100a08c..465d0f6 100644
> > --- a/include/dt-bindings/clock/rk3288-cru.h
> > +++ b/include/dt-bindings/clock/rk3288-cru.h
> > @@ -72,6 +72,16 @@
> >  #define SCLK_HEVC_CABAC                111
> >  #define SCLK_HEVC_CORE         112
> >
> > +#define SCLK_SDMMC_DRV_PHASE   113
> > +#define SCLK_SDIO0_DRV_PHASE   114
> > +#define SCLK_SDIO1_DRV_PHASE   115
> > +#define SCLK_EMMC_DRV_PHASE    116
> > +
> > +#define SCLK_SDMMC_SAMPLE_PHASE        117
> > +#define SCLK_SDIO0_SAMPLE_PHASE        118
> > +#define SCLK_SDIO1_SAMPLE_PHASE        119
> > +#define SCLK_EMMC_SAMPLE_PHASE 120
>
> It looks like you are adding new clocks to handle the phase requirement.
> Is that the right thing to do? Don't these clks already exist (e.g.
> SCLK_SDMMC)?
>
> Regards,
> Mike
>
> > +
> >  #define DCLK_VOP0              190
> >  #define DCLK_VOP1              191
> >
> > --
> > 2.1.0.rc2.206.gedb03e5
> >
>

--001a113defd81a39e10508134075
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"arial, sans-serif"><span style=3D"font-size:=
12.8000001907349px">I actually need to control 2 phases, one of them is use=
d when outputting data, the other when sampling. Sunxi does something simil=
ar:=C2=A0<a href=3D"http://lists.infradead.org/pipermail/linux-arm-kernel/2=
014-July/273273.html">http://lists.infradead.org/pipermail/linux-arm-kernel=
/2014-July/273273.html</a></span></font><div><br></div><div>Another reason =
it wouldn&#39;t work is because the upstream clock(eg=C2=A0<span style=3D"f=
ont-family:arial,sans-serif;font-size:12.8000001907349px">SCLK_SDMMC</span>=
) is twice as fast as the real clock(see RK3288_CLKGEN_DIV in drivers/mmc/h=
ost/dw_mmc-rockchip.c), since that clock goes to a /2 divider to be able to=
 do the 90 degree clock phases.</div><div class=3D"gmail_extra"><br clear=
=3D"all"><div><div class=3D"gmail_signature"><div dir=3D"ltr"><div style=3D=
"font-family:arial;font-size:small">Alexandru Stan (amstan)<br></div></div>=
</div></div>
<br><div class=3D"gmail_quote">On Mon, Nov 17, 2014 at 11:39 AM, Mike Turqu=
ette <span dir=3D"ltr">&lt;<a href=3D"mailto:mturquette@linaro.org" target=
=3D"_blank">mturquette@linaro.org</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"=
>Quoting Alexandru M Stan (2014-11-14 16:00:03)<br>
<div><div class=3D"h5">&gt; This will be used in a later patch for clock ph=
ase tuning.<br>
&gt;<br>
&gt; Suggested-by: Heiko Stuebner &lt;<a href=3D"mailto:heiko@sntech.de">he=
iko@sntech.de</a>&gt;<br>
&gt; Signed-off-by: Alexandru M Stan &lt;<a href=3D"mailto:amstan@chromium.=
org">amstan@chromium.org</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v2: None<br>
&gt;<br>
&gt;=C2=A0 include/dt-bindings/clock/rk3288-cru.h | 10 ++++++++++<br>
&gt;=C2=A0 1 file changed, 10 insertions(+)<br>
&gt;<br>
&gt; diff --git a/include/dt-bindings/clock/rk3288-cru.h b/include/dt-bindi=
ngs/clock/rk3288-cru.h<br>
&gt; index 100a08c..465d0f6 100644<br>
&gt; --- a/include/dt-bindings/clock/rk3288-cru.h<br>
&gt; +++ b/include/dt-bindings/clock/rk3288-cru.h<br>
&gt; @@ -72,6 +72,16 @@<br>
&gt;=C2=A0 #define SCLK_HEVC_CABAC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 111<br>
&gt;=C2=A0 #define SCLK_HEVC_CORE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0112<br>
&gt;<br>
&gt; +#define SCLK_SDMMC_DRV_PHASE=C2=A0 =C2=A0113<br>
&gt; +#define SCLK_SDIO0_DRV_PHASE=C2=A0 =C2=A0114<br>
&gt; +#define SCLK_SDIO1_DRV_PHASE=C2=A0 =C2=A0115<br>
&gt; +#define SCLK_EMMC_DRV_PHASE=C2=A0 =C2=A0 116<br>
&gt; +<br>
&gt; +#define SCLK_SDMMC_SAMPLE_PHASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 117<br>
&gt; +#define SCLK_SDIO0_SAMPLE_PHASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 118<br>
&gt; +#define SCLK_SDIO1_SAMPLE_PHASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 119<br>
&gt; +#define SCLK_EMMC_SAMPLE_PHASE 120<br>
<br>
</div></div>It looks like you are adding new clocks to handle the phase req=
uirement.<br>
Is that the right thing to do? Don&#39;t these clks already exist (e.g.<br>
SCLK_SDMMC)?<br>
<br>
Regards,<br>
Mike<br>
<div class=3D""><div class=3D"h5"><br>
&gt; +<br>
&gt;=C2=A0 #define DCLK_VOP0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 190<br>
&gt;=C2=A0 #define DCLK_VOP1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 191<br>
&gt;<br>
&gt; --<br>
&gt; 2.1.0.rc2.206.gedb03e5<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a113defd81a39e10508134075--
