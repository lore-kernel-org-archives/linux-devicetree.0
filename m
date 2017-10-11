Return-Path: <SRS0=cgma=BK=gmail.com=hao5781286@kernel.org>
MIME-Version: 1.0
In-Reply-To: <511e01ae-6083-13c8-a486-40e01bf753be@hisilicon.com>
References: <20161017120705.3726-1-wenpan@hisilicon.com> <20161017120705.3726-2-wenpan@hisilicon.com>
 <5893354.6MrIxqzRoI@wuerfel> <e78a288b-8bab-9441-2edb-6ec08e5103d7@hisilicon.com>
 <582C2785.2010804@hisilicon.com> <114569cb-79ab-a46d-8582-6169f182a32c@hisilicon.com>
 <511e01ae-6083-13c8-a486-40e01bf753be@hisilicon.com>
From: Hao Zhang <hao5781286@gmail.com>
Date: Wed, 11 Oct 2017 13:35:30 +0800
Message-ID: <CAJeuY78eZqOo3vaGBC-NKZr1nexm9SA0Rmc5vVxqn9K5vQqp9w@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm: hisi: add ARCH_MULTI_V5 support
Content-Type: multipart/alternative; boundary="f40304379aa0b8334c055b3ecab2"
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: Marty Plummer <netz.kernel@gmail.com>, Wei Xu <xuwei5@hisilicon.com>, wenpan <wenpan@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "howell.yang@hisilicon.com" <howell.yang@hisilicon.com>, "jalen.hsu@hisilicon.com" <jalen.hsu@hisilicon.com>, "lvkuanliang@hisilicon.com" <lvkuanliang@hisilicon.com>, "suwenping@hisilicon.com" <suwenping@hisilicon.com>, "raojun@hisilicon.com" <raojun@hisilicon.com>, "kevin.lixu@hisilicon.com" <kevin.lixu@hisilicon.com>, "qinxiaojun@huawei.com" <qinxiaojun@huawei.com>
List-ID: <devicetree@vger.kernel.org>

--f40304379aa0b8334c055b3ecab2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,
Is there any one working on hi3520dv200 or hi3520dv300?

2016=E5=B9=B411=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94=EF=BC=8CJian=
cheng Xue <xuejiancheng@hisilicon.com> =E5=86=99=E9=81=93=EF=BC=9A

> Hi Marty,
>
> On 2016/11/17 11:03, Jiancheng Xue wrote:
> > Hi Wei=EF=BC=8C
> >
> > On 2016/11/16 17:31, Wei Xu wrote:
> >> Hi Pan,
> >>
> >> On 2016/11/16 8:56, wenpan wrote:
> >>> Hi Marty=EF=BC=8C
> >>> Does this confict with your patch=EF=BC=9F If not=EF=BC=8CI hope this=
 could be merged
> first.  Besides could you tell me the link to your related patch?
> >>
> >> This is the link: https://patchwork.kernel.org/patch/9334743/
> >>
>
> Could you give your comments on this patch?
> If you have any objections to it, please let us know.
>
> >
> > Thank you for offering this.If I want to give some comments on Marty's
> patch,
> > what should I do?
> >
> > For Marty's patch, I think there's no need to add specific config item
> ARCH_HIxxxx
> > for every chipset. Some existing chipsets depend on ARCH_HISI directly
> like Hi3519
> > and Hi3798CV200. If some options like ARM_GIC is removed from ARCH_HISI=
,
> this kind
> > of chipsets will must choose other place to select it. I suggest we
> should keep selecting
> > ARM_GIC under ARCH_HISI as Pan's patch do.
> >
> > The code may be like this:
> >
> > config ARCH_HISI
> >       bool "Hisilicon SoC Support"
> > -     depends on ARCH_MULTI_V7
> > +     depends on ARCH_MULTI_V5 || ARCH_MULTI_V6 || ARCH_MULTI_V7
> >       select ARM_AMBA
> > -     select ARM_GIC
> > +     select ARM_GIC if ARCH_MULTI_V7
> > +     select ARM_VIC if ARCH_MULTI_V5 || depends on ARCH_MULTI_V6
> >       select ARM_TIMER_SP804
> >       select POWER_RESET
> >       select POWER_RESET_HISI
> >       select POWER_SUPPLY
> >
>
> What's your opinion about this?
>
> Best Regards,
> Jiancheng
>
> >>> On 2016/10/17 21:48, Arnd Bergmann wrote:
> >>>> On Monday, October 17, 2016 8:07:03 PM CEST Pan Wen wrote:
> >>>>> Add support for some HiSilicon SoCs which depend on ARCH_MULTI_V5.
> >>>>>
> >>>>> Signed-off-by: Pan Wen <wenpan@hisilicon.com <javascript:;>>
> >>>>>
> >>>>
> >>>> Looks ok. I've added Marty Plummer to Cc, he was recently proposing
> >>>> patches for Hi3520, which I think is closely related to this one.
> >>>> Please try to work together so the patches don't conflict. It should
> >>>> be fairly straightforward since you are basically doing the same
> >>>> change here.
> >>>>
> >
> >
> >
> > .
> >
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org <javascript:;>
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--f40304379aa0b8334c055b3ecab2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,<div>Is there any one working on hi3520dv200 or hi3520dv300? <br><br=
>2016=E5=B9=B411=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94=EF=BC=8CJia=
ncheng Xue &lt;<a href=3D"mailto:xuejiancheng@hisilicon.com">xuejiancheng@h=
isilicon.com</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Hi Marty,<br>
<br>
On 2016/11/17 11:03, Jiancheng Xue wrote:<br>
&gt; Hi Wei=EF=BC=8C<br>
&gt;<br>
&gt; On 2016/11/16 17:31, Wei Xu wrote:<br>
&gt;&gt; Hi Pan,<br>
&gt;&gt;<br>
&gt;&gt; On 2016/11/16 8:56, wenpan wrote:<br>
&gt;&gt;&gt; Hi Marty=EF=BC=8C<br>
&gt;&gt;&gt; Does this confict with your patch=EF=BC=9F If not=EF=BC=8CI ho=
pe this could be merged first.=C2=A0 Besides could you tell me the link to =
your related patch?<br>
&gt;&gt;<br>
&gt;&gt; This is the link: <a href=3D"https://patchwork.kernel.org/patch/93=
34743/" target=3D"_blank">https://patchwork.kernel.org/<wbr>patch/9334743/<=
/a><br>
&gt;&gt;<br>
<br>
Could you give your comments on this patch?<br>
If you have any objections to it, please let us know.<br>
<br>
&gt;<br>
&gt; Thank you for offering this.If I want to give some comments on Marty&#=
39;s patch,<br>
&gt; what should I do?<br>
&gt;<br>
&gt; For Marty&#39;s patch, I think there&#39;s no need to add specific con=
fig item ARCH_HIxxxx<br>
&gt; for every chipset. Some existing chipsets depend on ARCH_HISI directly=
 like Hi3519<br>
&gt; and Hi3798CV200. If some options like ARM_GIC is removed from ARCH_HIS=
I, this kind<br>
&gt; of chipsets will must choose other place to select it. I suggest we sh=
ould keep selecting<br>
&gt; ARM_GIC under ARCH_HISI as Pan&#39;s patch do.<br>
&gt;<br>
&gt; The code may be like this:<br>
&gt;<br>
&gt; config ARCH_HISI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Hisilicon SoC Support&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0depends on ARCH_MULTI_V7<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_MULTI_V5 || ARCH_MULTI_V6 || ARCH=
_MULTI_V7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select ARM_AMBA<br>
&gt; -=C2=A0 =C2=A0 =C2=A0select ARM_GIC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select ARM_GIC if ARCH_MULTI_V7<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select ARM_VIC if ARCH_MULTI_V5 || depends on ARC=
H_MULTI_V6<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select ARM_TIMER_SP804<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select POWER_RESET<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select POWER_RESET_HISI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select POWER_SUPPLY<br>
&gt;<br>
<br>
What&#39;s your opinion about this?<br>
<br>
Best Regards,<br>
Jiancheng<br>
<br>
&gt;&gt;&gt; On 2016/10/17 21:48, Arnd Bergmann wrote:<br>
&gt;&gt;&gt;&gt; On Monday, October 17, 2016 8:07:03 PM CEST Pan Wen wrote:=
<br>
&gt;&gt;&gt;&gt;&gt; Add support for some HiSilicon SoCs which depend on AR=
CH_MULTI_V5.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Pan Wen &lt;<a href=3D"javascript:;" on=
click=3D"_e(event, &#39;cvml&#39;, &#39;wenpan@hisilicon.com&#39;)">wenpan@=
hisilicon.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Looks ok. I&#39;ve added Marty Plummer to Cc, he was recen=
tly proposing<br>
&gt;&gt;&gt;&gt; patches for Hi3520, which I think is closely related to th=
is one.<br>
&gt;&gt;&gt;&gt; Please try to work together so the patches don&#39;t confl=
ict. It should<br>
&gt;&gt;&gt;&gt; be fairly straightforward since you are basically doing th=
e same<br>
&gt;&gt;&gt;&gt; change here.<br>
&gt;&gt;&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; .<br>
&gt;<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe devicetree&q=
uot; in<br>
the body of a message to <a href=3D"javascript:;" onclick=3D"_e(event, &#39=
;cvml&#39;, &#39;majordomo@vger.kernel.org&#39;)">majordomo@vger.kernel.org=
</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" target=3D"_blank">http://vger.kernel.org/<wbr>majordomo-info.html<=
/a><br>
</blockquote></div>

--f40304379aa0b8334c055b3ecab2--
