Return-Path: <eddie.cai8848@gmail.com>
MIME-Version: 1.0
Reply-To: eddie.cai@rock-chips.com
In-Reply-To: <54503C19.9060607@rock-chips.com>
References: <1414135761-3406-1-git-send-email-jinkun.hong@rock-chips.com>
	<1414135761-3406-2-git-send-email-jinkun.hong@rock-chips.com>
	<20141024164431.GE19933@dtor-ws>
	<20141027233904.GD7594@dtor-ws>
	<54503C19.9060607@rock-chips.com>
Date: Wed, 29 Oct 2014 18:26:26 +0800
Message-ID: <CAO3aYco7R+hip-=SGdxwCfJsEoLtmXuCboZonPbqz9w902LJTA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] power-domain: add power domain drivers for
 Rockchip platform
From: =?UTF-8?B?RWRkaWUgQ2FpKOiUoeaeqyk=?= <eddie.cai8848@gmail.com>
Content-Type: multipart/alternative; boundary=001a11394eac383bb105068d32fd
To: Hong jinkun <jinkun.hong@rock-chips.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Russell King <linux@arm.linux.org.uk>, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Jack Dai <jack.dai@rock-chips.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--001a11394eac383bb105068d32fd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jinkun

Please refer to https://lkml.org/lkml/2014/10/22/95

2014-10-29 9:00 GMT+08:00 Hong jinkun <jinkun.hong@rock-chips.com>:

>
> =E5=9C=A8 2014/10/28 7:39, Dmitry Torokhov =E5=86=99=E9=81=93:
>
>  On Fri, Oct 24, 2014 at 09:44:31AM -0700, Dmitry Torokhov wrote:
>>
>>> Hi Jinkun,
>>>
>>> On Fri, Oct 24, 2014 at 12:29:19AM -0700, jinkun.hong wrote:
>>>
>>>> +static int rockchip_pd_power(struct rockchip_domain *pd, bool power_o=
n)
>>>> +{
>>>> +       int ret =3D 0;
>>>> +       struct rockchip_dev_entry *de;
>>>> +
>>>> +       mutex_lock(&pd->dev_lock);
>>>> +       /* no clk, set power domain will fail */
>>>> +       if (list_empty(&pd->dev_list)) {
>>>> +               pr_err("%s: no devices in %s power domain\n", __func__=
,
>>>> +                       pd->base.name);
>>>> +               goto out;
>>>> +       }
>>>> +
>>>> +       list_for_each_entry(de, &pd->dev_list, node) {
>>>> +               pm_clk_resume(de->dev);
>>>> +       }
>>>> +
>>>> +       ret =3D rockchip_pmu_set_power_domain(pd, power_on);
>>>> +
>>>> +       list_for_each_entry(de, &pd->dev_list, node) {
>>>> +               pm_clk_suspend(de->dev);
>>>> +       }
>>>> +out:
>>>> +       mutex_unlock(&pd->dev_lock);
>>>> +       return ret;
>>>> +}
>>>>
>>> For my education, could you please tell me why we need to enable all
>>> clocks of all devices in a power domain when we are talking to the PMU
>>> and then turn them immediately off?
>>>
>> Sorry for late reply.RK3288 reset circuit are first asynchronous reset
> and then sync revoked.
> All reset revocation actions are needed to synchronize the clocks.
> If there is no clock open, power_up reset will cause the corresponding
> reset can not be undone, there will be risks.
>
>> Would not we want to enable clocks
>>> in start()) callbacks, like Ulf mentioned?
>>>
>> Can you tell me which one patch it. Thank you!
>
>> Jinkun, any update on this question?
>>
>> Thanks.
>>
>>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>



--=20

Eddie.Cai
=E8=94=A1=E6=9E=AB
Fuzhou Rockchip Electronics Co.Ltd
=E7=A6=8F=E5=B7=9E=E7=91=9E=E8=8A=AF=E5=BE=AE=E7=94=B5=E5=AD=90=E6=9C=89=E9=
=99=90=E5=85=AC=E5=8F=B8
No. 18 Building, A District, No.89,software Boulevard Fuzhou,Fujian,PR
China(350003)
=E7=A6=8F=E5=BB=BA=E7=9C=81=E7=A6=8F=E5=B7=9E=E5=B8=82=E9=93=9C=E7=9B=98=E8=
=B7=AF=E8=BD=AF=E4=BB=B6=E5=A4=A7=E9=81=93 89 =E5=8F=B7=E8=BD=AF=E4=BB=B6=
=E5=9B=AD A =E5=8C=BA 18 =E5=8F=B7=E6=A5=BC (350003)
cell phone:+86 13459443244
phone of Fuzhou =EF=BC=9A 0591 =EF=BC=8D 83991906/07 -8108
21th Floor, Malata Building, Ke ji zhong yi Avenue, Nanshan District,
Shenzheng, Guangdong, PR China (518000)
=E6=B7=B1=E5=9C=B3=E5=8A=9E=E5=85=AC=E5=AE=A4=E5=9C=B0=E5=9D=80=EF=BC=9A=E6=
=B7=B1=E5=9C=B3=E5=B8=82=E5=8D=97=E5=B1=B1=E5=8C=BA=E7=A7=91=E6=8A=80=E4=B8=
=AD=E4=B8=80=E8=B7=AF=E4=B8=87=E5=88=A9=E8=BE=BE=E5=A4=A7=E5=8E=A621=E5=B1=
=82  (518000)
phone of Shenzhen =EF=BC=9A 0755 =EF=BC=8D 86690899
mail: cf@rock-chips.com

--001a11394eac383bb105068d32fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:14px=
">Hi Jinkun</span><div style=3D"font-family:arial,sans-serif;font-size:14px=
"><br></div><div style=3D"font-family:arial,sans-serif;font-size:14px">Plea=
se refer to=C2=A0<a href=3D"https://lkml.org/lkml/2014/10/22/95" target=3D"=
_blank">https://lkml.org/lkml/2014/10/22/95</a></div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">2014-10-29 9:00 GMT+08:00 Hong ji=
nkun <span dir=3D"ltr">&lt;<a href=3D"mailto:jinkun.hong@rock-chips.com" ta=
rget=3D"_blank">jinkun.hong@rock-chips.com</a>&gt;</span>:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><br>
=E5=9C=A8 2014/10/28 7:39, Dmitry Torokhov =E5=86=99=E9=81=93:<div><div cla=
ss=3D"h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Fri, Oct 24, 2014 at 09:44:31AM -0700, Dmitry Torokhov wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Jinkun,<br>
<br>
On Fri, Oct 24, 2014 at 12:29:19AM -0700, jinkun.hong wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+static int rockchip_pd_power(struct rockchip_domain *pd, bool power_on)<br=
>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rockchip_dev_entry *de;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;pd-&gt;dev_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* no clk, set power domain will fail */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (list_empty(&amp;pd-&gt;dev_list)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;%s: no=
 devices in %s power domain\n&quot;, __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pd-&gt;<a href=3D"http://base.name" target=3D"_blank">base.name</=
a>);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(de, &amp;pd-&gt;dev_list, n=
ode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_clk_resume(de-&g=
t;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D rockchip_pmu_set_power_domain(<u></u>pd=
, power_on);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(de, &amp;pd-&gt;dev_list, n=
ode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_clk_suspend(de-&=
gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+out:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;pd-&gt;dev_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
</blockquote>
For my education, could you please tell me why we need to enable all<br>
clocks of all devices in a power domain when we are talking to the PMU<br>
and then turn them immediately off?<br>
</blockquote></blockquote></div></div>
Sorry for late reply.RK3288 reset circuit are first asynchronous reset and =
then sync revoked.<br>
All reset revocation actions are needed to synchronize the clocks.<br>
If there is no clock open, power_up reset will cause the corresponding rese=
t can not be undone, there will be risks.<span class=3D""><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Would not we want to enable clocks<br>
in start()) callbacks, like Ulf mentioned?<br>
</blockquote></blockquote></span>
Can you tell me which one patch it. Thank you!<span class=3D"im HOEnZb"><br=
>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Jinkun, any update on this question?<br>
<br>
Thanks.<br>
<br>
</blockquote>
<br>
<br>
<br></span><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<u></u>_________________<br>
Linux-rockchip mailing list<br>
<a href=3D"mailto:Linux-rockchip@lists.infradead.org" target=3D"_blank">Lin=
ux-rockchip@lists.<u></u>infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-rockchip" targ=
et=3D"_blank">http://lists.infradead.org/<u></u>mailman/listinfo/linux-<u><=
/u>rockchip</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div dir=3D"ltr"><div><br></div>Eddie.Cai=C2=A0<br>=E8=94=A1=E6=9E=AB=C2=A0=
<br>Fuzhou Rockchip Electronics Co.Ltd=C2=A0<br>=E7=A6=8F=E5=B7=9E=E7=91=9E=
=E8=8A=AF=E5=BE=AE=E7=94=B5=E5=AD=90=E6=9C=89=E9=99=90=E5=85=AC=E5=8F=B8=C2=
=A0<br>No. 18 Building, A District, No.89,software Boulevard Fuzhou,Fujian,=
PR China(350003)<br>=E7=A6=8F=E5=BB=BA=E7=9C=81=E7=A6=8F=E5=B7=9E=E5=B8=82=
=E9=93=9C=E7=9B=98=E8=B7=AF=E8=BD=AF=E4=BB=B6=E5=A4=A7=E9=81=93 89 =E5=8F=
=B7=E8=BD=AF=E4=BB=B6=E5=9B=AD A =E5=8C=BA 18 =E5=8F=B7=E6=A5=BC (350003)=
=C2=A0<br>cell phone:+86 13459443244<div>phone of Fuzhou =EF=BC=9A 0591 =EF=
=BC=8D 83991906/07 -8108=C2=A0<div>21th Floor, Malata Building, Ke ji zhong=
 yi Avenue, Nanshan District, Shenzheng, Guangdong, PR China (518000)<br>=
=E6=B7=B1=E5=9C=B3=E5=8A=9E=E5=85=AC=E5=AE=A4=E5=9C=B0=E5=9D=80=EF=BC=9A=E6=
=B7=B1=E5=9C=B3=E5=B8=82=E5=8D=97=E5=B1=B1=E5=8C=BA=E7=A7=91=E6=8A=80=E4=B8=
=AD=E4=B8=80=E8=B7=AF=E4=B8=87=E5=88=A9=E8=BE=BE=E5=A4=A7=E5=8E=A621=E5=B1=
=82=C2=A0=C2=A0(518000)<br>phone of Shenzhen =EF=BC=9A 0755 =EF=BC=8D 86690=
899=C2=A0<br>mail:=C2=A0<a href=3D"mailto:cf@rock-chips.com" target=3D"_bla=
nk">cf@rock-chips.com</a>=C2=A0</div></div></div>
</div>

--001a11394eac383bb105068d32fd--
