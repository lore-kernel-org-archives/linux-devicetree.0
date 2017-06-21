Return-Path: <SRS0=04yH=52=gmail.com=jacobchen110@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1880551.X2BOMRmHZh@diego>
References: <1497510980-23207-1-git-send-email-frank.wang@rock-chips.com>
 <25831201.s5BUplWuV7@diego> <354e6995-cc80-660b-41c4-535be85564c4@rock-chips.com>
 <1880551.X2BOMRmHZh@diego>
From: Jacob Chen <jacobchen110@gmail.com>
Date: Wed, 21 Jun 2017 12:11:42 +0800
Message-ID: <CAFLEztTZPeqbE++uRS-jXYUb7KzSik7=5v8+p07L788HWvwQqg@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: dts: rockchip: add basic dtsi file for RK3229 SoC
Content-Type: multipart/alternative; boundary="001a1144de9acca49405527090f7"
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Frank Wang <frank.wang@rock-chips.com>, robh+dt@kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, charles.chen@rock-chips.com, kevan.lan@rock-chips.com, huangtao@rock-chips.com, wmc@rock-chips.com, =?UTF-8?B?6ZmI5YGl5rSq?= <chenjh@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

--001a1144de9acca49405527090f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2017-06-20 18:48 GMT+08:00 Heiko St=C3=BCbner <heiko@sntech.de>:
> Hi Frank,
>
> Am Dienstag, 20. Juni 2017, 15:13:00 CEST schrieb Frank Wang:
>> Hi Heiko,
>>
>> On 2017/6/19 20:30, Heiko St=C3=BCbner wrote:
>> > Hi Frank,
>> >
>> > Am Montag, 19. Juni 2017, 18:34:27 CEST schrieb Frank Wang:
>> >> On 2017/6/18 2:12, Heiko Stuebner wrote:
>> >>> Am Donnerstag, 15. Juni 2017, 15:16:15 CEST schrieb Frank Wang:
>> >>>> Due to some tiny differences between RK3228 and RK3229, this patch
>> >>>> adds a basic dtsi file which includes a new CPU opp table and PSCI
>> >>>> brought up support for RK3229.
>> >>>>
>> >>>> Signed-off-by: Frank Wang<frank.wang@rock-chips.com>
>> >
>> > [...]
>> >
>> >>>> +        psci {
>> >>>> +                compatible =3D "arm,psci-1.0", "arm,psci-0.2";
>> >>>> +                method =3D "smc";
>> >>>> +        };
>> >>>> +};
>> >>>> +
>> >>>> +&cpu0 {
>> >>>> +        enable-method =3D "psci";
>> >>>> +};
>> >>>
>> >>> Hmm, I don't really understand this.
>> >>> What method of core-bringup does the rk3228 use? In the current
>> >>> rk322x.dtsi there is no enable-method at all defined.
>> >>
>> >> For non-security, the same with rk3036 SoC, we use rk3036-smp method
to
>> >> bring-up cores, and for security, we use arm-psci method.
>> >> As security become more and more important and required, we would
prefer
>> >> using arm-psci method, and it is also an easy way to use.
>> >>
>> >>> So is the rk3228 firmware using a different method than the rk3229?
>> >>
>> >> No, they are the same. How about I move these changes to rk322x.dtsi?
>> >
>> > yep, that is what I was getting at with my question ;-)
>> >
>> >>> And out of curiosity as this is a arm32 without atf, is the psci
>> >>> implementation (for uboot?) you're using available somewhere?
>> >>
>> >> Ah, it is included in op-tee :-)
>> >
>> > Is that super secret or will this be part of the official op-tee [0]
>> > at some point (Similar to the ATF stuff on arm64)?
>>
>> Hmm, the op-tee itself must keep secure, but the psci part in it can be
>> extracted to public, although it may have a bit of secure risk.
>> Due to Rockchip have amended the frame of op-tee to support psci, we can
>> try to upstream these changes to official op-tee or push them to source
>> codes of Rockchip in git-hub.
>
> I just want to make sure, people can actually create a working system
> with this, as there is mainline u-boot support for the rk3228/rk3229 in
> the works - hopefully also with SPL support later on.
> So I'm wondering how this is supposed to be setup?
>
> On arm64 we now have the SPL load the ATF, which in turn loads uboot, so =
I
> guess the mechanism for the op-tee would be somehow similar? And there al=
l
> necessary components are available to build everything from source.
>
> I really don't care about all the other super-secret stuff happening in
> that op-tee thingy, but I really want people to be able to build a
complete
> firmware on their machine, without having to rely on arbitary binary
blobs.
>
> Which is something companies adopting Rockchip socs seem to rely on
> a lot these days ;-) .
>
>
> One alternative I can think of, would be to also create a u-boot psci
> implementation for arm32, like sunxi [0] and others use for example.
> That way people could choose where their psci should come from (u-boot
> itself or the op-tee).
>
>
> Heiko
>
> [0]
http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Darch/arm/cpu/armv7/sunxi/ps=
ci.c
>
>>
>>
>> BR.
>> Frank
>>
>> > Heiko
>> >
>> > [0]https://github.com/OP-TEE/optee_os/tree/master/core/arch/arm
>
>

=F0=9F=98=80 Implement psci in upstream u-boot  sounds a good idea.

I don't like the bundled solution, like if I want  to enable  power
management in my board,  i have to use OP-TEE, then i have to use vendor
u-boot, then vendor kernel, rootfs, tools......

--001a1144de9acca49405527090f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>2017-06-20 18:48 GMT+08:00 Heiko St=C3=BCbner &=
lt;<a href=3D"mailto:heiko@sntech.de">heiko@sntech.de</a>&gt;:<br>&gt; Hi F=
rank,<br>&gt;<br>&gt; Am Dienstag, 20. Juni 2017, 15:13:00 CEST schrieb Fra=
nk Wang:<br>&gt;&gt; Hi Heiko,<br>&gt;&gt;<br>&gt;&gt; On 2017/6/19 20:30, =
Heiko St=C3=BCbner wrote:<br>&gt;&gt; &gt; Hi Frank,<br>&gt;&gt; &gt;<br>&g=
t;&gt; &gt; Am Montag, 19. Juni 2017, 18:34:27 CEST schrieb Frank Wang:<br>=
&gt;&gt; &gt;&gt; On 2017/6/18 2:12, Heiko Stuebner wrote:<br>&gt;&gt; &gt;=
&gt;&gt; Am Donnerstag, 15. Juni 2017, 15:16:15 CEST schrieb Frank Wang:<br=
>&gt;&gt; &gt;&gt;&gt;&gt; Due to some tiny differences between RK3228 and =
RK3229, this patch<br>&gt;&gt; &gt;&gt;&gt;&gt; adds a basic dtsi file whic=
h includes a new CPU opp table and PSCI<br>&gt;&gt; &gt;&gt;&gt;&gt; brough=
t up support for RK3229.<br>&gt;&gt; &gt;&gt;&gt;&gt;<br>&gt;&gt; &gt;&gt;&=
gt;&gt; Signed-off-by: Frank Wang&lt;<a href=3D"mailto:frank.wang@rock-chip=
s.com">frank.wang@rock-chips.com</a>&gt;<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; =
[...]<br>&gt;&gt; &gt;<br>&gt;&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0psci {<br>&gt;&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;arm,psci-1.0&quot;, &quot;arm,=
psci-0.2&quot;;<br>&gt;&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0method =3D &quot;smc&quot;;<br>&gt;&gt; &gt;&gt;=
&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>&gt;&gt; &gt;&gt;&gt;&gt; +};<b=
r>&gt;&gt; &gt;&gt;&gt;&gt; +<br>&gt;&gt; &gt;&gt;&gt;&gt; +&amp;cpu0 {<br>=
&gt;&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0enable-method =3D &q=
uot;psci&quot;;<br>&gt;&gt; &gt;&gt;&gt;&gt; +};<br>&gt;&gt; &gt;&gt;&gt;<b=
r>&gt;&gt; &gt;&gt;&gt; Hmm, I don&#39;t really understand this.<br>&gt;&gt=
; &gt;&gt;&gt; What method of core-bringup does the rk3228 use? In the curr=
ent<br>&gt;&gt; &gt;&gt;&gt; rk322x.dtsi there is no enable-method at all d=
efined.<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; For non-security, the sam=
e with rk3036 SoC, we use rk3036-smp method to<br>&gt;&gt; &gt;&gt; bring-u=
p cores, and for security, we use arm-psci method.<br>&gt;&gt; &gt;&gt; As =
security become more and more important and required, we would prefer<br>&g=
t;&gt; &gt;&gt; using arm-psci method, and it is also an easy way to use.<b=
r>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt;&gt; So is the rk3228 firmware usin=
g a different method than the rk3229?<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;=
&gt; No, they are the same. How about I move these changes to rk322x.dtsi?<=
br>&gt;&gt; &gt;<br>&gt;&gt; &gt; yep, that is what I was getting at with m=
y question ;-)<br>&gt;&gt; &gt;<br>&gt;&gt; &gt;&gt;&gt; And out of curiosi=
ty as this is a arm32 without atf, is the psci<br>&gt;&gt; &gt;&gt;&gt; imp=
lementation (for uboot?) you&#39;re using available somewhere?<br>&gt;&gt; =
&gt;&gt;<br>&gt;&gt; &gt;&gt; Ah, it is included in op-tee :-)<br>&gt;&gt; =
&gt;<br>&gt;&gt; &gt; Is that super secret or will this be part of the offi=
cial op-tee [0]<br>&gt;&gt; &gt; at some point (Similar to the ATF stuff on=
 arm64)?<br>&gt;&gt;<br>&gt;&gt; Hmm, the op-tee itself must keep secure, b=
ut the psci part in it can be<br>&gt;&gt; extracted to public, although it =
may have a bit of secure risk.<br>&gt;&gt; Due to Rockchip have amended the=
 frame of op-tee to support psci, we can<br>&gt;&gt; try to upstream these =
changes to official op-tee or push them to source<br>&gt;&gt; codes of Rock=
chip in git-hub.<br>&gt;<br>&gt; I just want to make sure, people can actua=
lly create a working system<br>&gt; with this, as there is mainline u-boot =
support for the rk3228/rk3229 in<br>&gt; the works - hopefully also with SP=
L support later on.<br>&gt; So I&#39;m wondering how this is supposed to be=
 setup?<br>&gt;<br>&gt; On arm64 we now have the SPL load the ATF, which in=
 turn loads uboot, so I<br>&gt; guess the mechanism for the op-tee would be=
 somehow similar? And there all<br>&gt; necessary components are available =
to build everything from source.<br>&gt;<br>&gt; I really don&#39;t care ab=
out all the other super-secret stuff happening in<br>&gt; that op-tee thing=
y, but I really want people to be able to build a complete<br>&gt; firmware=
 on their machine, without having to rely on arbitary binary blobs.<br>&gt;=
<br>&gt; Which is something companies adopting Rockchip socs seem to rely o=
n<br>&gt; a lot these days ;-) .<br>&gt;<br>&gt;<br>&gt; One alternative I =
can think of, would be to also create a u-boot psci<br>&gt; implementation =
for arm32, like sunxi [0] and others use for example.<br>&gt; That way peop=
le could choose where their psci should come from (u-boot<br>&gt; itself or=
 the op-tee).<br>&gt;<br>&gt;<br>&gt; Heiko<br>&gt;<br>&gt; [0] <a href=3D"=
http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Darch/arm/cpu/armv7/sunxi/ps=
ci.c">http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Darch/arm/cpu/armv7/su=
nxi/psci.c</a><br>&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; BR.<br>&gt;&gt; =
Frank<br>&gt;&gt;<br>&gt;&gt; &gt; Heiko<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; =
[0]<a href=3D"https://github.com/OP-TEE/optee_os/tree/master/core/arch/arm"=
>https://github.com/OP-TEE/optee_os/tree/master/core/arch/arm</a><br>&gt;<b=
r>&gt;<br><div><br></div><div>=F0=9F=98=80=C2=A0Implement psci in=C2=A0upst=
ream u-boot =C2=A0sounds a good idea.=C2=A0</div><div><br></div><div>I don&=
#39;t like the bundled solution, like if I want =C2=A0to enable=C2=A0<span =
style=3D"color:rgb(0,0,0);font-family:sans-serif;font-size:12.8px">=C2=A0</=
span><span style=3D"color:rgb(0,0,0);font-family:sans-serif;font-size:12.8p=
x">power management in my board, =C2=A0i have to use OP-TEE, then i have to=
 use vendor u-boot, then vendor kernel,=C2=A0</span><span style=3D"color:rg=
b(0,0,0);font-family:sans-serif;font-size:12.8px">rootfs, tools......</span=
></div><div><br></div><div><br></div></div>

--001a1144de9acca49405527090f7--
