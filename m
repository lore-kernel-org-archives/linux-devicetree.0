Return-Path: <andyshrk@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20151119125643.GE21862@ulmo.nvidia.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
	<1447840410-19794-1-git-send-email-andy.yan@rock-chips.com>
	<20151118225904.GA5429@rob-hp-laptop>
	<564D2331.8070503@rock-chips.com>
	<20151119125643.GE21862@ulmo.nvidia.com>
Date: Thu, 19 Nov 2015 21:39:02 +0800
Message-ID: <CANbgqASc1fyoV6FJ1g15P27_h0iA_F9h8aP304X8tRovrKrq5A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: add document for rockchip reboot
 notifier driver
From: Andy Yan <andyshrk@gmail.com>
Content-Type: multipart/alternative; boundary=001a113f1baac19cc30524e4e18a
To: Thierry Reding <treding@nvidia.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, heiko@sntech.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, galak@codeaurora.org, linux@arm.linux.org.uk, linux-rockchip@lists.infradead.org, ijc+devicetree@hellion.org.uk, pawel.moll@arm.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, khilman@linaro.org, wxt@rock-chips.com, sjg@chromium.org, benchan@google.com
List-ID: <devicetree@vger.kernel.org>

--001a113f1baac19cc30524e4e18a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thierry:

2015-11-19 20:56 GMT+08:00 Thierry Reding <treding@nvidia.com>:

> On Thu, Nov 19, 2015 at 09:17:37AM +0800, Andy Yan wrote:
> > Hi Rob:
> >
> > On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 06:59, Rob Herring wrote:
> > >On Wed, Nov 18, 2015 at 05:53:30PM +0800, Andy Yan wrote:
> > >>Add devicetree binding document for rockchip reboot nofifier driver
> > >Just reading the subject this is way too specific to the Linux driver
> > >needs rather than a h/w description. Please don't create fake DT nodes
> > >just to bind to drivers. Whatever &pmu is is probably what should have
> > >the DT node. Let the driver for it create child devices if you need
> > >that.
> >
> >     This is note a fake DT nodes, we really need it to tell the driver
> >      which register to use to store the reboot mode. Because rockchip
> >      use different register file to store the reboot mode on different
> >      platform, on rk3066,rk3188, rk3288,it use  one of the PMU register=
,
> on
> >      the incoming RK3036, it use one of the GRF register, and it use
> one  of
> >      the PMUGRF register for arm64 platform rk3368. On the other hand,
> the
> >      PMU/GRF/PMUGRF register file are mapped as "syscon", then referenc=
ed
> >      by other DT nodes by phandle. So maybe let it as a separate DT nod=
e
> > here
> >      is better.
>
> In that case you should probably implement a reboot notifier in each of
> the drivers you list and depending on the generation of the SoC. You can
> easily parameterize this by matching on the compatible string.
>
> Thierry
>

 There is no rockchip specific driver for PMU/GRF/PMUGRF register file I
list above=EF=BC=8C they
 use the generic driver =E2=80=9Csyscon=E2=80=9D

Andy

--001a113f1baac19cc30524e4e18a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thierry:<br><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_quote">2015-11-19 20:56 GMT+08:00 Thierry Reding <span dir=3D=
"ltr">&lt;<a href=3D"mailto:treding@nvidia.com" target=3D"_blank">treding@n=
vidia.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);b=
order-left-width:1px;border-left-style:solid"><span>On Thu, Nov 19, 2015 at=
 09:17:37AM +0800, Andy Yan wrote:<br>
&gt; Hi Rob:<br>
&gt;<br>
&gt; On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 06:59, Rob Herring wrote:<br>
&gt; &gt;On Wed, Nov 18, 2015 at 05:53:30PM +0800, Andy Yan wrote:<br>
&gt; &gt;&gt;Add devicetree binding document for rockchip reboot nofifier d=
river<br>
&gt; &gt;Just reading the subject this is way too specific to the Linux dri=
ver<br>
&gt; &gt;needs rather than a h/w description. Please don&#39;t create fake =
DT nodes<br>
&gt; &gt;just to bind to drivers. Whatever &amp;pmu is is probably what sho=
uld have<br>
&gt; &gt;the DT node. Let the driver for it create child devices if you nee=
d<br>
&gt; &gt;that.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0This is note a fake DT nodes, we really need it to =
tell the driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0 which register to use to store the reboot mode. Be=
cause rockchip<br>
&gt;=C2=A0 =C2=A0 =C2=A0 use different register file to store the reboot mo=
de on different<br>
&gt;=C2=A0 =C2=A0 =C2=A0 platform, on rk3066,rk3188, rk3288,it use=C2=A0 on=
e of the PMU register, on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the incoming RK3036, it use one of the GRF registe=
r, and it use one=C2=A0 of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the PMUGRF register for arm64 platform rk3368. On =
the other hand, the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PMU/GRF/PMUGRF register file are mapped as &quot;s=
yscon&quot;, then referenced<br>
&gt;=C2=A0 =C2=A0 =C2=A0 by other DT nodes by phandle. So maybe let it as a=
 separate DT node<br>
&gt; here<br>
&gt;=C2=A0 =C2=A0 =C2=A0 is better.<br>
<br>
</span>In that case you should probably implement a reboot notifier in each=
 of<br>
the drivers you list and depending on the generation of the SoC. You can<br=
>
easily parameterize this by matching on the compatible string.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Thierry<br>
</font></span></blockquote></div><p><br></p><div>=C2=A0There is no rockchip=
 specific driver for PMU/GRF/PMUGRF register file I list above=EF=BC=8C the=
y</div><div>=C2=A0use the generic driver =E2=80=9Csyscon=E2=80=9D</div><div=
><br></div><div>Andy</div><div class=3D"gmail_extra"><br></div></div>

--001a113f1baac19cc30524e4e18a--
