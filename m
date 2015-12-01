Return-Path: <andyshrk@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANbgqARHxXorh8Svuw7tHMT60=j35BEqhMnuCOB6u6-d0NPxEQ@mail.gmail.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
	<20151118225904.GA5429@rob-hp-laptop>
	<564D2331.8070503@rock-chips.com>
	<2082288.pD4oKxtaXL@phil>
	<564E7473.9080509@rock-chips.com>
	<CAL_JsqLRbTz-dNcYctXmY=E_y3MZj7XWJC3PqDU=YYek09vnmg@mail.gmail.com>
	<CANbgqARHxXorh8Svuw7tHMT60=j35BEqhMnuCOB6u6-d0NPxEQ@mail.gmail.com>
Date: Tue, 1 Dec 2015 23:10:15 +0800
Message-ID: <CANbgqARCYP0rfTPSJLNEnCdrb1+mCYYznnRVH6o8Bj5sWt9fDw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: add document for rockchip reboot
 notifier driver
From: Andy Yan <andyshrk@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bdc1c0c1dc7850525d78e1e
To: Rob Herring <robh@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@linaro.org>, Thierry Reding <treding@nvidia.com>, Caesar Wang <wxt@rock-chips.com>, Simon Glass <sjg@chromium.org>, Ben Chan <benchan@google.com>
List-ID: <devicetree@vger.kernel.org>

--047d7bdc1c0c1dc7850525d78e1e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Rob=E3=80=81Heiko=EF=BC=9A

2015-11-23 21:15 GMT+08:00 Andy Yan <andyshrk@gmail.com>:

> Hi Rob=EF=BC=9A
>
> 2015-11-20 9:58 GMT+08:00 Rob Herring <robh@kernel.org>:
>
>> On Thu, Nov 19, 2015 at 7:16 PM, Andy Yan <andy.yan@rock-chips.com>
>> wrote:
>> > On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 12:35, Heiko Stuebner wrote:
>> >> Am Donnerstag, 19. November 2015, 09:17:37 schrieb Andy Yan:
>> >>> On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 06:59, Rob Herring wrote:
>> >>>> On Wed, Nov 18, 2015 at 05:53:30PM +0800, Andy Yan wrote:
>> >>>>>
>> >>>>> Add devicetree binding document for rockchip reboot nofifier drive=
r
>> >>>>
>> >>>> Just reading the subject this is way too specific to the Linux driv=
er
>> >>>> needs rather than a h/w description. Please don't create fake DT
>> nodes
>> >>>> just to bind to drivers. Whatever &pmu is is probably what should
>> have
>> >>>> the DT node. Let the driver for it create child devices if you need
>> >>>> that.
>> >>>
>> >>>       This is note a fake DT nodes, we really need it to tell the
>> driver
>> >>>        which register to use to store the reboot mode. Because
>> rockchip
>> >>>        use different register file to store the reboot mode on
>> different
>> >>>        platform, on rk3066,rk3188, rk3288,it use  one of the PMU
>> >>> register, on
>> >>>        the incoming RK3036, it use one of the GRF register, and it u=
se
>> >>> one  of
>> >>>        the PMUGRF register for arm64 platform rk3368. On the other
>> hand,
>> >>> the
>> >>>        PMU/GRF/PMUGRF register file are mapped as "syscon", then
>> >>> referenced
>> >>>        by other DT nodes by phandle. So maybe let it as a separate D=
T
>> >>> node here
>> >>>        is better.
>> >>
>> >> or alternatively we could do something similar to what the bl-switche=
r
>> >> cupfreq-driver does. Take a look at
>> >>
>> >> drivers/cpufreq/arm_big_little.c
>> >> drivers/clk/clk-mb86s7x.c
>> >>
>> >> We already have the core restart-handler code in the clock-tree, so
>> could
>> >> maybe simply do the
>> >>         platform_device_register_simple("rockchip-reboot", -1, NULL,
>> 0);
>> >> in that common code?
>> >>
>> >> Though I'm not yet sure how to get the platform-data. I guess one
>> option
>> >> would
>> >> be to do things like the 3288 suspend code does
>> >> (arch/arm/mach-rockchip/pm.c
>> >> at the bottom), by having the per-soc-data in the driver and then
>> matching
>> >> against the pmu. Because the pmu is not part of the clock controller
>> >> binding
>> >> (and probably also shouldn't be).
>> >>
>> >    Thanks for your suggestion.
>> >     I have read the code you list above, if we implement the reboot
>> notifier
>> >     driver like this, the driver need to add much more code to find th=
e
>> > platform
>> >     data(like arch/arm/mach-rockhcip/pm.c), what's more, if we have a
>> new
>> > soc
>> >     in the future and the soc use a different register here, we need
>> modify
>> > the
>> >     driver to add a new platform data again, this will bring additiona=
l
>> > work.
>> >
>> >     Use the DT node pass the register will make the driver code simple
>> and
>> > clear.
>> >     Is there any hurt to put this information in the DT?
>>
>> Add the data you need to the PMU node. Then the PMU driver can get it
>> and pass to the child driver.
>>
>> Rob
>> --
>>
>>
>     Do you mean I should implement the DT node like this=EF=BC=9F
>
>    diff --git a/arch/arm/boot/dts/rk3xxx.dtsi
> b/arch/arm/boot/dts/rk3xxx.dtsi
> index 7b14d7a..1735d09 100644
> --- a/arch/arm/boot/dts/rk3xxx.dtsi
> +++ b/arch/arm/boot/dts/rk3xxx.dtsi
> @@ -103,12 +103,6 @@
>                 };
>         };
>
> -       reboot {
> -               compatible =3D "rockchip,reboot";
> -               rockchip,regmap =3D <&pmu>;
> -               offset =3D <0x40>;
> -       };
> -
>         xin24m: oscillator {
>                 compatible =3D "fixed-clock";
>                 clock-frequency =3D <24000000>;
> @@ -249,7 +243,11 @@
>
>         pmu: pmu@20004000 {
>                 compatible =3D "rockchip,rk3066-pmu", "syscon";
> -               reg =3D <0x20004000 0x100>;
> +              reg =3D <0x20004000 0x100>;
> +              reboot {
> +                       compatible =3D "rockchip,reboot";
> +                       offset =3D <0x40>;
> +               };
>         };
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> index cd02229..8a9837a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> @@ -202,12 +202,6 @@
>                 method =3D "smc";
>         };
>
> -       reboot {
> -               compatible =3D "rockchip,reboot";
> -               rockchip,regmap =3D <&pmugrf>;
> -               offset =3D <0x200>;
> -       };
> -
>         timer {
>                 compatible =3D "arm,armv8-timer";
>                 interrupts =3D <GIC_PPI 13
> @@ -493,6 +487,10 @@
>         pmugrf: syscon@ff738000 {
>                 compatible =3D "rockchip,rk3368-pmugrf", "syscon";
>                 reg =3D <0x0 0xff738000 0x0 0x1000>;
> +              reboot {
> +                       compatible =3D "rockchip,reboot";
> +                       offset =3D <0x200>;
> +               };
>         };
>
>

  Is there any further suggestion for this? If not, I will send the V4 with
the DT node as a subnode in PMU or PMUGRF.

Andy

--047d7bdc1c0c1dc7850525d78e1e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Rob=E3=80=81Heiko=EF=BC=9A<br></div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_quote">2015-11-23 21:15 GMT+08:0=
0 Andy Yan <span dir=3D"ltr">&lt;<a href=3D"mailto:andyshrk@gmail.com" targ=
et=3D"_blank">andyshrk@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-c=
olor:rgb(204,204,204);border-left-width:1px;border-left-style:solid"><div d=
ir=3D"ltr"><div>Hi Rob=EF=BC=9A<br></div><div><div class=3D"h5"><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_quote">2015-11-20 9:58 GMT+0=
8:00 Rob Herring <span dir=3D"ltr">&lt;<a href=3D"mailto:robh@kernel.org" t=
arget=3D"_blank">robh@kernel.org</a>&gt;</span>:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-c=
olor:rgb(204,204,204);border-left-width:1px;border-left-style:solid"><span>=
On Thu, Nov 19, 2015 at 7:16 PM, Andy Yan &lt;<a href=3D"mailto:andy.yan@ro=
ck-chips.com" target=3D"_blank">andy.yan@rock-chips.com</a>&gt; wrote:<br>
&gt; On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 12:35, Heiko Stuebner wrote:<br=
>
</span><span>&gt;&gt; Am Donnerstag, 19. November 2015, 09:17:37 schrieb An=
dy Yan:<br>
</span><div><div>&gt;&gt;&gt; On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 06:59,=
 Rob Herring wrote:<br>
&gt;&gt;&gt;&gt; On Wed, Nov 18, 2015 at 05:53:30PM +0800, Andy Yan wrote:<=
br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Add devicetree binding document for rockchip reboot no=
fifier driver<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Just reading the subject this is way too specific to the L=
inux driver<br>
&gt;&gt;&gt;&gt; needs rather than a h/w description. Please don&#39;t crea=
te fake DT nodes<br>
&gt;&gt;&gt;&gt; just to bind to drivers. Whatever &amp;pmu is is probably =
what should have<br>
&gt;&gt;&gt;&gt; the DT node. Let the driver for it create child devices if=
 you need<br>
&gt;&gt;&gt;&gt; that.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This is note a fake DT nodes, we rea=
lly need it to tell the driver<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 which register to use to store the =
reboot mode. Because rockchip<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 use different register file to stor=
e the reboot mode on different<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 platform, on rk3066,rk3188, rk3288,=
it use=C2=A0 one of the PMU<br>
&gt;&gt;&gt; register, on<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 the incoming RK3036, it use one of =
the GRF register, and it use<br>
&gt;&gt;&gt; one=C2=A0 of<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 the PMUGRF register for arm64 platf=
orm rk3368. On the other hand,<br>
&gt;&gt;&gt; the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 PMU/GRF/PMUGRF register file are ma=
pped as &quot;syscon&quot;, then<br>
&gt;&gt;&gt; referenced<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 by other DT nodes by phandle. So ma=
ybe let it as a separate DT<br>
&gt;&gt;&gt; node here<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 is better.<br>
&gt;&gt;<br>
&gt;&gt; or alternatively we could do something similar to what the bl-swit=
cher<br>
&gt;&gt; cupfreq-driver does. Take a look at<br>
&gt;&gt;<br>
&gt;&gt; drivers/cpufreq/arm_big_little.c<br>
&gt;&gt; drivers/clk/clk-mb86s7x.c<br>
&gt;&gt;<br>
&gt;&gt; We already have the core restart-handler code in the clock-tree, s=
o could<br>
&gt;&gt; maybe simply do the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_register_simple(&=
quot;rockchip-reboot&quot;, -1, NULL, 0);<br>
&gt;&gt; in that common code?<br>
&gt;&gt;<br>
&gt;&gt; Though I&#39;m not yet sure how to get the platform-data. I guess =
one option<br>
&gt;&gt; would<br>
&gt;&gt; be to do things like the 3288 suspend code does<br>
&gt;&gt; (arch/arm/mach-rockchip/pm.c<br>
&gt;&gt; at the bottom), by having the per-soc-data in the driver and then =
matching<br>
&gt;&gt; against the pmu. Because the pmu is not part of the clock controll=
er<br>
&gt;&gt; binding<br>
&gt;&gt; (and probably also shouldn&#39;t be).<br>
&gt;&gt;<br>
</div></div><span>&gt;=C2=A0 =C2=A0 Thanks for your suggestion.<br>
&gt;=C2=A0 =C2=A0 =C2=A0I have read the code you list above, if we implemen=
t the reboot notifier<br>
&gt;=C2=A0 =C2=A0 =C2=A0driver like this, the driver need to add much more =
code to find the<br>
&gt; platform<br>
&gt;=C2=A0 =C2=A0 =C2=A0data(like arch/arm/mach-rockhcip/pm.c), what&#39;s =
more, if we have a new<br>
&gt; soc<br>
&gt;=C2=A0 =C2=A0 =C2=A0in the future and the soc use a different register =
here, we need modify<br>
&gt; the<br>
&gt;=C2=A0 =C2=A0 =C2=A0driver to add a new platform data again, this will =
bring additional<br>
&gt; work.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Use the DT node pass the register will make the dri=
ver code simple and<br>
&gt; clear.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Is there any hurt to put this information in the DT=
?<br>
<br>
</span>Add the data you need to the PMU node. Then the PMU driver can get i=
t<br>
and pass to the child driver.<br>
<span><font color=3D"#888888"><br>
Rob<br>
</font></span><div><div>--<br>
<br></div></div></blockquote><div>=C2=A0</div></div></div></div><div class=
=3D"gmail_extra">=C2=A0=C2=A0=C2=A0 Do you=C2=A0mean I should implement the=
 DT node like this=EF=BC=9F</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">=C2=A0=C2=A0 diff --git a/arch/arm/boot/dts/rk3xxx.dt=
si b/arch/arm/boot/dts/rk3xxx.dtsi<br>index 7b14d7a..1735d09 100644<br>--- =
a/arch/arm/boot/dts/rk3xxx.dtsi<br>+++ b/arch/arm/boot/dts/rk3xxx.dtsi<br>@=
@ -103,12 +103,6 @@<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 };<br>=C2=A0<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reboo=
t {<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 compatible =3D &quot;rockchip,reboot&quot;;<br>-=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 rockchip,regmap =3D &lt;&amp;pmu&gt;;<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset =3D &lt;0x=
40&gt;;<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>-<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 xin24m: oscillator {<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compa=
tible =3D &quot;fixed-clock&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-frequency =3D =
&lt;24000000&gt;;<br>@@ -249,7 +243,11 @@<br>=C2=A0<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pmu: pmu@20004000 {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =
=3D &quot;rockchip,rk3066-pmu&quot;, &quot;syscon&quot;;<br>-=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
g =3D &lt;0x20004000 0x100&gt;;<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D &lt;0x20004000 0x100&g=
t;;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br><span>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reboot {<br>+=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;ro=
ckchip,reboot&quot;;<br></span>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 offset =3D &lt;0x40&gt;;<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">diff --git a/arch/arm64/boot/dts/rockchip/rk336=
8.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi<br>index cd02229..8a9837a=
 100644<br>--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi<br>+++ b/arch/arm=
64/boot/dts/rockchip/rk3368.dtsi<br>@@ -202,12 +202,6 @@<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 method =3D &quot;smc&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
};<br>=C2=A0<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reboot {<br>-=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 compatible =3D &quot;rockchip,reboot&quot;;<br>-=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rockchip,re=
gmap =3D &lt;&amp;pmugrf&gt;;<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset =3D &lt;0x200&gt;;<br>=
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>-<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 timer {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;arm,armv=
8-timer&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D &lt;GIC_PPI 13<br>@@ -493,=
6 +487,10 @@<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmugrf: syscon@f=
f738000 {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;rockchip,rk3368-pmugrf&=
quot;, &quot;syscon&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x0 0xff738000 0x=
0 0x1000&gt;;<span><br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reboot {<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;rockchip,reboot&quot;;<=
br></span>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offse=
t =3D &lt;0x200&gt;;<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 };<br>=C2=A0<br></div></div>
</blockquote></div><p><br></p><div>=C2=A0 Is there any further suggestion f=
or this? If not, I will send the V4 with the DT node as a subnode in PMU or=
 PMUGRF.</div><div><br></div><div>Andy</div><div class=3D"gmail_extra"><br>=
</div></div>

--047d7bdc1c0c1dc7850525d78e1e--
