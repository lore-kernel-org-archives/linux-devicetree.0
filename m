Return-Path: <SRS0=juJA=ET=ayufan.eu=ayufan@kernel.org>
MIME-Version: 1.0
In-Reply-To: <26154377.eZ6VsJ1LtB@diego>
References: <20180122174628.15613-1-ayufan@ayufan.eu> <26154377.eZ6VsJ1LtB@diego>
From: =?UTF-8?Q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>
Date: Wed, 24 Jan 2018 16:34:58 +0100
Message-ID: <CAJ-Uff=OdhUpouNk2_reF_mjBuHaUZu4q2vasX0u7Yw8bcNHLQ@mail.gmail.com>
Subject: Re: [PATCH] rock64: dts: fix gmac2io stability issues
Content-Type: multipart/alternative; boundary="f4f5e8075f34f435a6056387676a"
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Wu <david.wu@rock-chips.com>, "David S. Miller" <davem@davemloft.net>, Joseph Chen <chenjh@rock-chips.com>, Liang Chen <cl@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--f4f5e8075f34f435a6056387676a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. This is my first ever patch send to Kernel :)

Kamil


On Tue, Jan 23, 2018 at 1:52 PM, Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:

> Hi Kamil,
>
> Thanks for figuring out the source of the gmac instability :-) .
>
> I've applied the patch as fix for 4.16 but corrected some small issues
> while
> doing so:
> - The subject should be something like
>         "arm64: dts: rockchip: fix rock64 gmac2io stability issues"
>   The prefixes to use vary per subsystem, so it's best to use git log to
>   look at previous commits
>
> Am Montag, 22. Januar 2018, 18:46:22 CET schrieb Kamil Trzci=C5=84ski:
> > This commit enables thresh dma mode as this forces to disable
> checksuming,
> > and chooses delay values which make the interface stable.
> >
> > These changes are needed, because ROCK64 is faced with two problems:
> > 1. tx checksuming does not work with packets larger than 1498,
> > 2. the default delays for tx/rx are not stable when using 1Gbps
> connection.
> >
> > Delays were found out with:
> > https://github.com/ayufan-rock64/linux-build/tree/
> master/recipes/gmac-delays
> > -test
> >
> > Change-Id: Ie894df4b52122988da683c02e3a05d635a5c7b84
>
> That is some gerrit thingy which should not be part when sending patches
> upstream.
>
> > Signed-off-by: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
> > b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts index
> > 5602ec01fed9..bcc0bb35d840 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
> > @@ -132,8 +132,6 @@
> >       assigned-clocks =3D <&cru SCLK_MAC2IO>, <&cru SCLK_MAC2IO_EXT>;
> >       assigned-clock-parents =3D <&gmac_clkin>, <&gmac_clkin>;
> >       clock_in_out =3D "input";
> > -     /* shows instability at 1GBit right now */
> > -     max-speed =3D <100>;
> >       phy-supply =3D <&vcc_io>;
> >       phy-mode =3D "rgmii";
> >       pinctrl-names =3D "default";
> > @@ -141,8 +139,9 @@
> >       snps,reset-gpio =3D <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
> >       snps,reset-active-low;
> >       snps,reset-delays-us =3D <0 10000 50000>;
> > -     tx_delay =3D <0x26>;
> > -     rx_delay =3D <0x11>;
> > +     snps,force_thresh_dma_mode;
>
> With the exception of compatible, reg, interrupts and status, I try to ke=
ep
> other properties alphabetically sorted in Rockchip dts, so I've moved the
> snps,force_thres_dma_mode up between pinctrl-0 and snps-reset-gpio.
>
>
> Heiko
>

--f4f5e8075f34f435a6056387676a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks. This is my first ever patch send to Kernel :)<div>=
<br></div><div>Kamil</div><div><br></div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On Tue, Jan 23, 2018 at 1:52 PM, Heiko St=C3=
=BCbner <span dir=3D"ltr">&lt;<a href=3D"mailto:heiko@sntech.de" target=3D"=
_blank">heiko@sntech.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Hi Kamil,<br>
<br>
Thanks for figuring out the source of the gmac instability :-) .<br>
<br>
I&#39;ve applied the patch as fix for 4.16 but corrected some small issues =
while<br>
doing so:<br>
- The subject should be something like<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;arm64: dts: rockchip: fix rock64 gmac2io =
stability issues&quot;<br>
=C2=A0 The prefixes to use vary per subsystem, so it&#39;s best to use git =
log to<br>
=C2=A0 look at previous commits<br>
<span class=3D""><br>
Am Montag, 22. Januar 2018, 18:46:22 CET schrieb Kamil Trzci=C5=84ski:<br>
&gt; This commit enables thresh dma mode as this forces to disable checksum=
ing,<br>
&gt; and chooses delay values which make the interface stable.<br>
&gt;<br>
&gt; These changes are needed, because ROCK64 is faced with two problems:<b=
r>
&gt; 1. tx checksuming does not work with packets larger than 1498,<br>
&gt; 2. the default delays for tx/rx are not stable when using 1Gbps connec=
tion.<br>
&gt;<br>
&gt; Delays were found out with:<br>
&gt; <a href=3D"https://github.com/ayufan-rock64/linux-build/tree/master/re=
cipes/gmac-delays" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
ayufan-<wbr>rock64/linux-build/tree/<wbr>master/recipes/gmac-delays</a><br>
&gt; -test<br>
&gt;<br>
&gt; Change-Id: Ie894df4b52122988da683c02e3a05<wbr>d635a5c7b84<br>
<br>
</span>That is some gerrit thingy which should not be part when sending pat=
ches<br>
upstream.<br>
<div><div class=3D"h5"><br>
&gt; Signed-off-by: Kamil Trzci=C5=84ski &lt;<a href=3D"mailto:ayufan@ayufa=
n.eu">ayufan@ayufan.eu</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm64/boot/dts/rockchip/<wbr>rk3328-rock64.dts | 7 +++----<=
br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm64/boot/dts/<wbr>rockchip/rk3328-rock64.dts<br>
&gt; b/arch/arm64/boot/dts/<wbr>rockchip/rk3328-rock64.dts index<br>
&gt; 5602ec01fed9..bcc0bb35d840 100644<br>
&gt; --- a/arch/arm64/boot/dts/<wbr>rockchip/rk3328-rock64.dts<br>
&gt; +++ b/arch/arm64/boot/dts/<wbr>rockchip/rk3328-rock64.dts<br>
&gt; @@ -132,8 +132,6 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0assigned-clocks =3D &lt;&amp;cru SCLK_MAC2IO=
&gt;, &lt;&amp;cru SCLK_MAC2IO_EXT&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0assigned-clock-parents =3D &lt;&amp;gmac_clk=
in&gt;, &lt;&amp;gmac_clkin&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clock_in_out =3D &quot;input&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* shows instability at 1GBit right now */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0max-speed =3D &lt;100&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-supply =3D &lt;&amp;vcc_io&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;rgmii&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; @@ -141,8 +139,9 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0snps,reset-gpio =3D &lt;&amp;gpio1 RK_PC2 GP=
IO_ACTIVE_LOW&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0snps,reset-active-low;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0snps,reset-delays-us =3D &lt;0 10000 50000&g=
t;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0tx_delay =3D &lt;0x26&gt;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rx_delay =3D &lt;0x11&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snps,force_thresh_dma_mode;<br>
<br>
</div></div>With the exception of compatible, reg, interrupts and status, I=
 try to keep<br>
other properties alphabetically sorted in Rockchip dts, so I&#39;ve moved t=
he<br>
snps,force_thres_dma_mode up between pinctrl-0 and snps-reset-gpio.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
Heiko<br>
</font></span></blockquote></div><br></div>

--f4f5e8075f34f435a6056387676a--
