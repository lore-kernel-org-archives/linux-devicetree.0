Return-Path: <andyshrk@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3977796.F76XlXnDRQ@diego>
References: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com>
	<1450775812-24244-1-git-send-email-andy.yan@rock-chips.com>
	<3977796.F76XlXnDRQ@diego>
Date: Tue, 22 Dec 2015 21:37:23 +0800
Message-ID: <CANbgqATGsg0ZsYrMpQ1+8AGVgc88n_y_S19y1r+R237=WKS=og@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] ARM: dts: rockchip: add reboot-mode node
From: Andy Yan <andyshrk@gmail.com>
Content-Type: multipart/alternative; boundary=001a113fe08aa4663605277cb4ac
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, robh+dt@kernel.org, arnd@arndb.de, john.stultz@linaro.org, Simon Glass <sjg@chromium.org>, alexandre.belloni@free-electrons.com, Thierry Reding <treding@nvidia.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Caesar Wang <wxt@rock-chips.com>, catalin.marinas@arm.com, olof@lixom.net, geert+renesas@glider.be, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, dbaryshkov@gmail.com, sre@kernel.org, jun.nie@linaro.org, Pawel Moll <pawel.moll@arm.com>, will.deacon@arm.com, akpm@linux-foundation.org, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, gregkh@linuxfoundation.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org, lorenzo.pieralisi@arm.com, Kevin Hilman <khilman@linaro.org>, moritz.fischer@ettus.com, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

--001a113fe08aa4663605277cb4ac
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Heiko:

2015-12-22 19:23 GMT+08:00 Heiko St=C3=BCbner <heiko@sntech.de>:

> Hi Andy,
>
> Am Dienstag, 22. Dezember 2015, 17:16:52 schrieb Andy Yan:
> > Add reboot mode driver DT node for rk3xxx,rk3288 platform
>
> in general, I like that concept a lot :-) . Below some small issues.
>
>
> > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> >
> > ---
> >
> > Changes in v1:
> > - correct the maskrom magic number
> > - use macro defined in rockchip_boot-mode.h for reboot-mode DT node
> >
> >  arch/arm/boot/dts/rk3288.dtsi | 26 ++++++++++++++++++++++++++
> >  arch/arm/boot/dts/rk3xxx.dtsi | 26 ++++++++++++++++++++++++++
> >  2 files changed, 52 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/rk3288.dtsi
> b/arch/arm/boot/dts/rk3288.dtsi
> > index 04ea209..c6ea207 100644
> > --- a/arch/arm/boot/dts/rk3288.dtsi
> > +++ b/arch/arm/boot/dts/rk3288.dtsi
> > @@ -45,6 +45,7 @@
> >  #include <dt-bindings/clock/rk3288-cru.h>
> >  #include <dt-bindings/thermal/thermal.h>
> >  #include <dt-bindings/power/rk3288-power.h>
> > +#include <dt-bindings/soc/rockchip_boot-mode.h>
> >  #include "skeleton.dtsi"
> >
> >  / {
> > @@ -170,6 +171,31 @@
> >               };
> >       };
> >
> > +     reboot_mode {
>
> nodes are commonly written with a dash "-" instead of an underscore "_".
>

    okay, I will use dash "-" in next version.

>
>
> > +             compatible =3D "rockchip,reboot-mode";
> > +             rockchip,regmap =3D <&pmu>;
>
> I do believe this should be a sub-node of the pmu, similar to the power-
> domains. Due to the "simple-mfd" compatible of the pmu, it will get probe=
d
> automatically and the driver can than get the regmap via
>
>         parent =3D dev->parent;
>         regmap =3D syscon_node_to_regmap(parent->of_node);
>
> as the power-domains do and therefore also doesn't need the rockchip,regm=
ap
> property.
>
>
>     okay, got it.

> > +             offset =3D <0x94>;
> > +             loader {
> > +                     linux,mode =3D "loader";
> > +                     linux,magic =3D <BOOT_LOADER>;
>
> linux,mode seems correct, but the magic value is actually not
> linux-specific
> but instead firmware-specific, so I'm not sure about that linux-prefix
> there
>
> But I guess that would be for the dt-people :-)
>
>
>     Hope the dt-people will give some advices

> +             };
> > +
> > +             maskrom {
> > +                     linux,mode =3D "maskrom";
> > +                     linux,magic =3D <BOOT_MASKROM>;
> > +             };
>
> Just for my understanding, while I expect the bootloader to interpret the
> other values, does the maskrom read and handle this one?
>

 actually, this is also handled by the bootloader, this will be handled
before
 the DDR  initialization.

>
>
> > +
> > +             recovery {
> > +                     linux,mode =3D "recovery";
> > +                     linux,magic =3D <BOOT_RECOVERY>;
> > +             };
> > +
> > +             fastboot {
> > +                     linux,mode =3D "fastboot";
> > +                     linux,magic =3D <BOOT_FASTBOOT>;
> > +             };
> > +     };
> > +
> >       reserved-memory {
> >               #address-cells =3D <1>;
> >               #size-cells =3D <1>;
>
> I do believe rk3288-veyron.dtsi would need some sort of special handling.
> I don't think coreboot interprets most of those handles, but I guess only
> the
> maskrom one would be handled by the maskrom?
>

   yes, these depends on the bootloader.

>
>
> Heiko
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>

--001a113fe08aa4663605277cb4ac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Heiko:<br><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">2015-12-22 19:23 GMT+08:00 Heiko St=C3=BCbner <span dir=3D"ltr=
">&lt;<a href=3D"mailto:heiko@sntech.de" target=3D"_blank">heiko@sntech.de<=
/a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left=
-width:1px;border-left-style:solid">Hi Andy,<br>
<span><br>
Am Dienstag, 22. Dezember 2015, 17:16:52 schrieb Andy Yan:<br>
&gt; Add reboot mode driver DT node for rk3xxx,rk3288 platform<br>
<br>
</span>in general, I like that concept a lot :-) . Below some small issues.=
<br>
<span><br>
<br>
&gt; Signed-off-by: Andy Yan &lt;<a href=3D"mailto:andy.yan@rock-chips.com"=
>andy.yan@rock-chips.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Changes in v1:<br>
&gt; - correct the maskrom magic number<br>
&gt; - use macro defined in rockchip_boot-mode.h for reboot-mode DT node<br=
>
&gt;<br>
&gt;=C2=A0 arch/arm/boot/dts/rk3288.dtsi | 26 ++++++++++++++++++++++++++<br=
>
&gt;=C2=A0 arch/arm/boot/dts/rk3xxx.dtsi | 26 ++++++++++++++++++++++++++<br=
>
&gt;=C2=A0 2 files changed, 52 insertions(+)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.=
dtsi<br>
&gt; index 04ea209..c6ea207 100644<br>
&gt; --- a/arch/arm/boot/dts/rk3288.dtsi<br>
&gt; +++ b/arch/arm/boot/dts/rk3288.dtsi<br>
&gt; @@ -45,6 +45,7 @@<br>
&gt;=C2=A0 #include &lt;dt-bindings/clock/rk3288-cru.h&gt;<br>
&gt;=C2=A0 #include &lt;dt-bindings/thermal/thermal.h&gt;<br>
&gt;=C2=A0 #include &lt;dt-bindings/power/rk3288-power.h&gt;<br>
&gt; +#include &lt;dt-bindings/soc/rockchip_boot-mode.h&gt;<br>
&gt;=C2=A0 #include &quot;skeleton.dtsi&quot;<br>
&gt;<br>
&gt;=C2=A0 / {<br>
&gt; @@ -170,6 +171,31 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reboot_mode {<br>
<br>
</span>nodes are commonly written with a dash &quot;-&quot; instead of an u=
nderscore &quot;_&quot;.<br></blockquote><div><br></div><div>=C2=A0=C2=A0=
=C2=A0 okay, I will use dash &quot;-&quot; in next=C2=A0version.=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;paddin=
g-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-=
left-style:solid">
<span><br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
rockchip,reboot-mode&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rockchip,regmap =3D &=
lt;&amp;pmu&gt;;<br>
<br>
</span>I do believe this should be a sub-node of the pmu, similar to the po=
wer-<br>
domains. Due to the &quot;simple-mfd&quot; compatible of the pmu, it will g=
et probed<br>
automatically and the driver can than get the regmap via<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 parent =3D dev-&gt;parent;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap =3D syscon_node_to_regmap(parent-&gt;of_=
node);<br>
<br>
as the power-domains do and therefore also doesn&#39;t need the rockchip,re=
gmap<br>
property.<br>
<span><br>
<br></span></blockquote><div>=C2=A0=C2=A0=C2=A0 okay, got it.=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding-l=
eft:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-lef=
t-style:solid"><span>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D &lt;0x94&g=
t;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loader {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,mode =3D &quot;loader&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,magic =3D &lt;BOOT_LOADER&gt;;<br>
<br>
</span>linux,mode seems correct, but the magic value is actually not linux-=
specific<br>
but instead firmware-specific, so I&#39;m not sure about that linux-prefix =
there<br>
<br>
But I guess that would be for the dt-people :-)<br>
<span><br>
<br></span></blockquote><div>=C2=A0=C2=A0=C2=A0 Hope the dt-people will giv=
e some advices</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204=
,204);border-left-width:1px;border-left-style:solid"><span>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maskrom {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,mode =3D &quot;maskrom&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,magic =3D &lt;BOOT_MASKROM&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
<br>
</span>Just for my understanding, while I expect the bootloader to interpre=
t the<br>
other values, does the maskrom read and handle this one?<br></blockquote><d=
iv><br></div><div>=C2=A0actually, this is also handled by the bootloader,=
=C2=A0this will be handled before</div><div>=C2=A0the DDR=C2=A0=C2=A0<span>=
initialization.</span></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);bo=
rder-left-width:1px;border-left-style:solid">
<span><br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recovery {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,mode =3D &quot;recovery&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,magic =3D &lt;BOOT_RECOVERY&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fastboot {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,mode =3D &quot;fastboot&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,magic =3D &lt;BOOT_FASTBOOT&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0reserved-memory {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =
=3D &lt;1&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D =
&lt;1&gt;;<br>
<br>
</span>I do believe rk3288-veyron.dtsi would need some sort of special hand=
ling.<br>
I don&#39;t think coreboot interprets most of those handles, but I guess on=
ly the<br>
maskrom one would be handled by the maskrom?<br></blockquote><div><br></div=
><div>=C2=A0=C2=A0 yes, these depends on the bootloader.=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding-left:1=
ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-left-sty=
le:solid">
<span><font color=3D"#888888"><br>
<br>
Heiko<br>
</font></span><div><div class=3D"h5"><br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-kernel=
&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" target=3D"_blank" rel=3D"noreferrer">http://vger.kernel.org/majord=
omo-info.html</a><br>
Please read the FAQ at=C2=A0 <a href=3D"http://www.tux.org/lkml/" target=3D=
"_blank" rel=3D"noreferrer">http://www.tux.org/lkml/</a><br>
</div></div></blockquote></div><br></div></div>

--001a113fe08aa4663605277cb4ac--
