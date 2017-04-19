Return-Path: <SRS0=r4nj=33=gmail.com=eddie.cai.linux@kernel.org>
MIME-Version: 1.0
In-Reply-To: <746291609.ssvjv54Vin@phil>
References: <20170418121527.3155-1-eddie.cai.linux@gmail.com> <746291609.ssvjv54Vin@phil>
From: Eddie Cai <eddie.cai.linux@gmail.com>
Date: Wed, 19 Apr 2017 08:40:42 +0800
Message-ID: <CAJrj+DNqA46_k5kjvyN8YQb=kmVSfF3tKYuadHQ7ojZYuFhUXQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: rockchip: reuse firefly dtsi
Content-Type: multipart/alternative; boundary=001a11430eaa3d4d2f054d7a4643
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a11430eaa3d4d2f054d7a4643
Content-Type: text/plain; charset=UTF-8

2017-04-19 6:20 GMT+08:00 Heiko Stuebner <heiko@sntech.de>:

> Hi Eddie,
>
> Am Dienstag, 18. April 2017, 20:15:27 CEST schrieb Eddie Cai:
> > firefly reload is very similar with firefly board, so reuse firefly dtsi
> >
> > Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>
> > ---
> >  arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi | 310
> ------------------
> >  arch/arm/boot/dts/rk3288-firefly-reload.dts       | 368
> ++--------------------
>
> I would disagree and remember having a similar discussion when the reload-
> support was initially submitted. Please keep in mind that the firefly-
> reload is a som+baseboard combination, so somebody could (or maybe
> already has) create a completely different baseboard for the som that
> does not have any similarities with the original firefly.
> The previous firefly being a real single board.


> We also don't combine rock2 and firefly and other boards following the
> general rk3288 design guidelines :-) and the original firefly and reload
> are
> very different boards if you look at them.
>
OK, i think the real similar part is the core board and firefly. how about
reuse the
firefly code in the core board?

>
>
> Heiko
>
>

--001a11430eaa3d4d2f054d7a4643
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2017-04-19 6:20 GMT+08:00 Heiko Stuebner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:heiko@sntech.de" target=3D"_blank">heiko@sntech.de</a>&gt;</span=
>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Eddie,<br>
<span class=3D"gmail-"><br>
Am Dienstag, 18. April 2017, 20:15:27 CEST schrieb Eddie Cai:<br>
&gt; firefly reload is very similar with firefly board, so reuse firefly dt=
si<br>
&gt;<br>
&gt; Signed-off-by: Eddie Cai &lt;<a href=3D"mailto:eddie.cai.linux@gmail.c=
om">eddie.cai.linux@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/rk3288-<wbr>firefly-reload-core.dtsi | 310 ---=
---------------<br>
&gt;=C2=A0 arch/arm/boot/dts/rk3288-<wbr>firefly-reload.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 368 ++--------------------<br>
<br>
</span>I would disagree and remember having a similar discussion when the r=
eload-<br>
support was initially submitted. Please keep in mind that the firefly-<br>
reload is a som+baseboard combination, so somebody could (or maybe<br>
already has) create a completely different baseboard for the som that<br>
does not have any similarities with the original firefly.<br>
The previous firefly being a real single board.</blockquote><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
We also don&#39;t combine rock2 and firefly and other boards following the<=
br>
general rk3288 design guidelines :-) and the original firefly and reload ar=
e<br>
very different boards if you look at them.<br></blockquote><div>OK, i think=
 the real similar part is the core board and firefly. how about reuse the=
=C2=A0</div><div>firefly code in the core board?<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
<br>
Heiko<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11430eaa3d4d2f054d7a4643--
