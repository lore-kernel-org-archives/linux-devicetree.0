Return-Path: <SRS0=bBJo=ZE=rock-chips.com=eddie.cai@kernel.org>
MIME-Version: 1.0
Reply-To: eddie.cai@rock-chips.com
In-Reply-To: <20170121204217.y54lup7wkm7y7iwp@rob-hp-laptop>
References: <1484791919-4665-1-git-send-email-eddie.cai@rock-chips.com>
 <1484791919-4665-2-git-send-email-eddie.cai@rock-chips.com> <20170121204217.y54lup7wkm7y7iwp@rob-hp-laptop>
From: =?UTF-8?B?RWRkaWUgQ2FpKOiUoeaeqyk=?= <eddie.cai@rock-chips.com>
Date: Sun, 22 Jan 2017 09:06:20 +0800
Message-ID: <CAEYML7Kt-VJ7zgPE1DdWZVYtUHeLM=t9hERFF-_8sdcEqj9v2g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: add Asus Tinker board
Content-Type: multipart/alternative; boundary=001a114906a4e0edfb0546a47e87
To: Rob Herring <robh@kernel.org>
Cc: Eddie Cai <eddie.cai.linux@gmail.com>, "Mark.Rutland" <mark.rutland@arm.com>, =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>, linux@armlinux.org.uk, devicetree <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-rockchip <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a114906a4e0edfb0546a47e87
Content-Type: text/plain; charset=UTF-8

2017-01-22 4:42 GMT+08:00 Rob Herring <robh@kernel.org>:

> On Thu, Jan 19, 2017 at 10:11:58AM +0800, Eddie Cai wrote:
> > Tinker board is a credit card size develop board designed by Asus.
> > Powered by RK3288.
> >
> > Signed-off-by: Eddie Cai <eddie.cai@rock-chips.com>
> > ---
> >  Documentation/devicetree/bindings/arm/rockchip.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt
> b/Documentation/devicetree/bindings/arm/rockchip.txt
> > index cc4ace6..ce1f04a 100644
> > --- a/Documentation/devicetree/bindings/arm/rockchip.txt
> > +++ b/Documentation/devicetree/bindings/arm/rockchip.txt
> > @@ -1,5 +1,8 @@
> >  Rockchip platforms device tree bindings
> >  ---------------------------------------
> > +- Asus Tinker board
> > +    Required root node properties:
> > +      - compatible = "rockchip,rk3288-tinker", "rockchip,rk3288";
>
> This should be asus,tinker if that's specific enough. At least the board
> manufacturer should be the vendor.
>
OK, i will modify it in next version

>
> >
> >  - Kylin RK3036 board:
> >      Required root node properties:
> > --
> > 2.7.4
> >
>
>
>


-- 
Eddie

--001a114906a4e0edfb0546a47e87
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2017-01-22 4:42 GMT+08:00 Rob Herring <span dir=3D"ltr">&lt;<a href=3D"=
mailto:robh@kernel.org" target=3D"_blank">robh@kernel.org</a>&gt;</span>:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, Jan 19, 2017 at 1=
0:11:58AM +0800, Eddie Cai wrote:<br>
&gt; Tinker board is a credit card size develop board designed by Asus.<br>
&gt; Powered by RK3288.<br>
&gt;<br>
&gt; Signed-off-by: Eddie Cai &lt;<a href=3D"mailto:eddie.cai@rock-chips.co=
m">eddie.cai@rock-chips.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/devicetree/<wbr>bindings/arm/rockchip.txt | 3 +++<=
br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/arm/rockchip.txt b=
/Documentation/devicetree/<wbr>bindings/arm/rockchip.txt<br>
&gt; index cc4ace6..ce1f04a 100644<br>
&gt; --- a/Documentation/devicetree/<wbr>bindings/arm/rockchip.txt<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/arm/rockchip.txt<br>
&gt; @@ -1,5 +1,8 @@<br>
&gt;=C2=A0 Rockchip platforms device tree bindings<br>
&gt;=C2=A0 ------------------------------<wbr>---------<br>
&gt; +- Asus Tinker board<br>
&gt; +=C2=A0 =C2=A0 Required root node properties:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - compatible =3D &quot;rockchip,rk3288-tinker&qu=
ot;, &quot;rockchip,rk3288&quot;;<br>
<br>
</span>This should be asus,tinker if that&#39;s specific enough. At least t=
he board<br>
manufacturer should be the vendor.<br></blockquote><div>OK, i will modify i=
t in next version=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt;=C2=A0 - Kylin RK3036 board:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Required root node properties:<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr">Eddie</div></div>
</div></div>

--001a114906a4e0edfb0546a47e87--
