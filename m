Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1f2f43c7-2672-e448-eddb-2d613bb8dc48@rock-chips.com>
References: <1462527648-24443-1-git-send-email-shawn.lin@rock-chips.com>
	<1462527673-24711-1-git-send-email-shawn.lin@rock-chips.com>
	<CAD=FV=WSkBwBjVsRoDsfjD+sNfR70mKGRA0khjPKKW0zS2=PTw@mail.gmail.com>
	<b15dcb4f-1584-8219-2fe0-97eecb0c64a6@rock-chips.com>
	<CAD=FV=XToSzqSh=SShHuQU9W_m7gfyQn8wRXkLy79t+tnqZknA@mail.gmail.com>
	<1f2f43c7-2672-e448-eddb-2d613bb8dc48@rock-chips.com>
Date: Tue, 10 May 2016 08:52:13 -0700
Message-ID: <CAD=FV=X4h9sEeiEchbT-Qy2EmdLnKy27RFr=nfbq2yQj8hWK1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: rockchip-dw-mshc: add rockchip,default-drv-phase
From: Doug Anderson <dianders@chromium.org>
Content-Type: multipart/alternative; boundary=001a114e1ff49ac31205327ee803
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a114e1ff49ac31205327ee803
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Shawn,

On Tue, May 10, 2016 at 3:19 AM, Shawn Lin <shawn.lin@rock-chips.com> wrote=
:
> =E5=9C=A8 2016/5/10 0:31, Doug Anderson =E5=86=99=E9=81=93:
>>
>> Hi,
>>
>> On Mon, May 9, 2016 at 4:12 AM, Shawn Lin <shawn.lin@rock-chips.com>
>> wrote:
>>>>
>>>> 1. Specifying a single number for this property in terms of "degrees"
>>>> is probably not right.  The whole point of setting the "drive phase"
>>>> is to meet hold times, which are specified in the spec in terms of ns
>>>> in the spec and also specified differently for different SD/MMC speed
>>>> modes.  Note also that "phase" translates to very different delays (in
>>>> terms of ns) depending on the clock rate:
>>>>
>>>> At 400 kHz, period is 2.5 us, so 90 degree phase offset is a delay of
>>>> 625
>>>> ns
>>>> At 25 MHz, period is 40 ns, so a 90 degree phase offset represents a
>>>> delay of 10 ns.
>>>> At 50 MHz, period is 20 ns, so a 90 degree phase offset represents a
>>>> delay of 5 ns.
>>>> At 200 MHz, period is period is 5 ns, so a 90 degree phase offset
>>>> represents a delay of 1.25 ns.
>>>
>>>
>>>
>>> yes, if we use degrees only(0/90/180/270), the timing is always right.
>>> But considering the delay number, we need to do some crazy calculation
>>> in the set_ios callback.
>>
>>
>> Great, so let's limit it to 0/90/180/270 for the drive phase offset.
>> We don't need lots of precision for the drive phase offset (right?)
>> and accuracy is more important.
>
>
> yes.
>
>>
>>
>>>> 2. As I understand it, the value needed for the drive phase is not
>>>> board specific unless you've got super crazy layout on a board (where
>>>> the clock line takes a very different path than everything else).
>>>> It's also not even terribly SoC-specific unless you've got some very
>>>> strange incarnation of dw_mmc that has very different internal delays
>>>> than everyone else.  Said another way, until we see an instance of an
>>>> SoC/board that really needs to do things special I'd say that we
>>>> should just implement this all in code (no device tree bindings).
>>>>
>>>
>>> I'm prone to think it should be Soc specific if making sure the layout
>>> for data lines is in equal length.
>>
>>
>> Sure, it can be SoC specific.  ...though at the moment, I'd bet that
>> you can come up with a single rule for the drive phase offset that
>> will work for every Rockchip SoC produced so far, especially if you
>> are using only 0/90/180/270.  I'd imagine that they all have similar
>> enough internal delays.
>
>
> For a specific Soc, it's the basic rule to make sure the internal delays
> is the same(nearly the same) for all of the lines.

Right.  I was saying that not only are all lines within a given SoC similar
in terms of delay, but I was suggesting that perhaps the internal delay for
rk3188, rk3288, rk3228, ... is probably fairly similar.  That's only a
guess, though.


>>>> 3. If this property was actually board specific and actually needed to
>>>> be tuned board-by-board, you'd have a bug because your new device tree
>>>> bindings are not backward compatible and you'd probably be breaking
>>>> old boards.  Specifically you're changing the definition of what
>>>> happens when "rockchip,default-drv-phase" is not specified.  Old
>>>> behavior was to leave the value that was setup by the firmware (or
>>>> perhaps the hardware default if the firmware didn't touch this).
>>>
>>>
>>>
>>> drv_phase is for all the data lines instead of tuning the lines
>>> one-by-one. So this patch can't save the terrible board layout.
>>> But I agree that it will break the compatibility backward if firware
>>> touch this value.
>>>
>>>>
>>>> ---
>>>>
>>>> OK, so what should we do?
>>>>
>>>> We could certainly do lots of crazy math to come up with the ideal
>>>> hold time for all different speed modes and all different types of
>>>> cards.  With my reading of the Designware Databook this would mean
>>>> that somewhere we'd want to specify which delay method we're using
>>>> (phase shift vs. delay line) and how long all the delays timings all
>>>> are on your particular SoC.  That all sounds quite difficult, though.
>>>
>>>
>>>
>>> delay line is diff from chip to chip, soc-to-soc, board-to-board. For
>>> sample-phase we have tuning process and re-tune, but not for drv-phase.
>>> So We bascially should avoid to use it for drv-phase. Another
>>> consideration is the temperature drift of delay line.
>>>
>>> Maybe we should do some tricky limitation on clk-mmc-phase to only
>>> support fixed degrees?
>>
>>
>> As per above, let's not use delay line for drive delay.  On all
>> Rockchip SoCs that I have seen it's possible to make 0/90/180/270 very
>> accurately.  That means no board-to-board differences.  Current
>> mainline Linux kernel source code will always make 0/90/180/270 using
>> phase offset (not delay line).
>
>
> yes, 0/90/180/270 is very accurate and mainline kernel use phase offset
> for these four phase.
>
>>
>> For sampling we use tuning and using the delay elements makes some
>> sense (since 90 degrees is not quite accurate enough to fully tune
>> UHS).  ...but for driving where the only requirement is hold times we
>> don't need delay elements.
>
>
> Right. We care hold time here.
>
>>
>>
>>>> Probably you could just add a simple function that looked at the clock
>>>> and speed mode and always chose an offset of 90 or 180 degrees.  At
>>>> least on Rockchip devices you can be certain that you can make 90 and
>>>> 180 degrees using phase shifts and thus the timings should be
>>>> consistent.  By default you could just always choose 180.  The
>>>> Designware databook has some examples where it picked 90 degrees
>>>> (SDR50, DDR50, SDR25, MMC High Speed), but I'm not enough of an MMC
>>>> expert to know if there is some benefit to choosing 90.  Would we
>>>> violate any specs if we just chose 180 degrees all the time everywhere
>>>> on all Rockchip devices?
>>>
>>>
>>>
>>> It needs more waveform test to see how things going. But most of
>>> rockchip platforms in the pass years didn't touch drv-phase stuff not
>>> only in kernel but also in firmware, then we still cannot see the
>>> violation against the spec when using defalut reset value, namely 180,
>>> for
>>> drv-phase.
>>
>>
>> Right, most Rockchip platforms simply don't touch this and it works
>> OK.  ...but I don't think it defaults to 180.  Grepping through on my
>> veyron (rk3288) device shows
>>
>>        sdio1_drv - 90
>>        sdio0_drv - 90
>>        sdmmc_drv - 90
>>        emmc_drv -180
>>
>> ...and, as we've seen, these values appear to be 270 on some other SoCs.
>>
>
> Have your code touched them? I check the TRM and find it should be 180
> always.
>
> Also for rk3036/3368/3399/3228.... the reset vaule is 180...

I have less faith than you in the TRM.  The TRM is full of minor errors and
is often wrong about the default state of things.  IMHO the only true way
to find out is to boot up some SoCs and check.

As far as whether code touches these values:

   - I'm 100% certain that the kernel on rk3288 I tested doesn't touch.
   - I'm 100% certain that the kernel on rk3399 I tested doesn't touch.
   - I'm 95% certain that the BIOS (coreboot/depthcharge) on rk3288 I
   tested doesn't touch.
   - I'm 95% certain that the BIOS (coreboot/depthcharge) on rk3399 I
   tested doesn't touch.  Note that the TRM on rk3399 does say 180 degrees =
is
   the default, but I believe you have also verified that it comes up as 27=
0.
   Have you found any reason for this?

Also note that I look at V1.1 of the rk3288 TRM in the CRU section and I
see:

* CRU_SDMMC_CON0: drive degree defaults to 0x1
* CRU_SDIO0_CON0: drive degree defaults to 0x1
* CRU_SDIO1_CON0: drive degree defaults to 0x1
* CRU_EMMC_CON0: drive degree defaults to 0x1

That actually means that they default to 90.  Of course you can also see
that the TRM is probably flawed because it claims that all the bits here
are "WO" (write only).  They are clearly not.

The TRM is also internally inconsistent.  When I then go into the Mobile
Storage Host section (Variable Delay/Clock Generation), I see that it does
in fact claim that the default is 180.


>> The claim from the Designware Databook says that SDR104 and SDR12, and
>> identification mode need 180 degrees to work properly.  It would be
>> interesting to hook up rk3288 to a signal analyzer and see hold times
>> are OK or if we need to move up to 180 degrees for those modes.
>>
>> Note that the Designware Databook assumes "Delay_O" of 1.4ns.  If
>> yours is shorter then maybe 90 degrees is OK for those modes?
>>
>
> maybe. But I think 180(downside) is the better.

I'm OK with using 180 always as long as SD cards continue to work OK.  Best
would be if someone could actually run a protocol analyzer for all the
different speed modes.


>> Also: I still haven't heard whether there is any downside to using 180
>> degrees for modes that only require 90 degrees.  Does it cause
>> problems to just always use 180 degrees?  If not, we could possibly
>> use 180 degrees everywhere and just hardcode it?
>
>
> From tons of test on rockchip products which always use 180, I didn't
> see failure. Hardcoding it doesn't look so decent maybe... but anyway
> it works.

Hardcoding in this case is much better than putting in a device tree
binding.  I'm nearly certain that having a device tree binding that doesn't
account for different clock rates / speed modes is not a good idea, and
device tree bindings are supposed to be "set in stone".  Let's just
hardcode it for now.

I can post up a CL.


>> ...but if 180 is ideal everywhere, can you answer:
>>
>> * Why does dw_mmc manual spend so much time talking about it?  It
>> could just say "set to 180 degrees".
>
>
> I'm sure all the rockchip Socs defaultly use 180 for drv_phase if I got
> the right TRMs these years.
>
> Anyway let me check it with my ASIC team and I will let you know
> the result.

You probably have the right TRMs.  The TRMs are just not accurate.  ;)

--001a114e1ff49ac31205327ee803
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Shawn,<br><br>On Tue, May 10, 2016 at 3:19 AM, Shawn Lin &=
lt;<a href=3D"mailto:shawn.lin@rock-chips.com">shawn.lin@rock-chips.com</a>=
&gt; wrote:<br>&gt; =E5=9C=A8 2016/5/10 0:31, Doug Anderson =E5=86=99=E9=81=
=93:<br>&gt;&gt;<br>&gt;&gt; Hi,<br>&gt;&gt;<br>&gt;&gt; On Mon, May 9, 201=
6 at 4:12 AM, Shawn Lin &lt;<a href=3D"mailto:shawn.lin@rock-chips.com">sha=
wn.lin@rock-chips.com</a>&gt;<br>&gt;&gt; wrote:<br>&gt;&gt;&gt;&gt;<br>&gt=
;&gt;&gt;&gt; 1. Specifying a single number for this property in terms of &=
quot;degrees&quot;<br>&gt;&gt;&gt;&gt; is probably not right.=C2=A0 The who=
le point of setting the &quot;drive phase&quot;<br>&gt;&gt;&gt;&gt; is to m=
eet hold times, which are specified in the spec in terms of ns<br>&gt;&gt;&=
gt;&gt; in the spec and also specified differently for different SD/MMC spe=
ed<br>&gt;&gt;&gt;&gt; modes.=C2=A0 Note also that &quot;phase&quot; transl=
ates to very different delays (in<br>&gt;&gt;&gt;&gt; terms of ns) dependin=
g on the clock rate:<br>&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt; At 400 kHz, pe=
riod is 2.5 us, so 90 degree phase offset is a delay of<br>&gt;&gt;&gt;&gt;=
 625<br>&gt;&gt;&gt;&gt; ns<br>&gt;&gt;&gt;&gt; At 25 MHz, period is 40 ns,=
 so a 90 degree phase offset represents a<br>&gt;&gt;&gt;&gt; delay of 10 n=
s.<br>&gt;&gt;&gt;&gt; At 50 MHz, period is 20 ns, so a 90 degree phase off=
set represents a<br>&gt;&gt;&gt;&gt; delay of 5 ns.<br>&gt;&gt;&gt;&gt; At =
200 MHz, period is period is 5 ns, so a 90 degree phase offset<br>&gt;&gt;&=
gt;&gt; represents a delay of 1.25 ns.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;<br>&=
gt;&gt;&gt;<br>&gt;&gt;&gt; yes, if we use degrees only(0/90/180/270), the =
timing is always right.<br>&gt;&gt;&gt; But considering the delay number, w=
e need to do some crazy calculation<br>&gt;&gt;&gt; in the set_ios callback=
.<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; Great, so let&#39;s limit it to 0/90/=
180/270 for the drive phase offset.<br>&gt;&gt; We don&#39;t need lots of p=
recision for the drive phase offset (right?)<br>&gt;&gt; and accuracy is mo=
re important.<br>&gt;<br>&gt;<br>&gt; yes.<br>&gt;<br>&gt;&gt;<br>&gt;&gt;<=
br>&gt;&gt;&gt;&gt; 2. As I understand it, the value needed for the drive p=
hase is not<br>&gt;&gt;&gt;&gt; board specific unless you&#39;ve got super =
crazy layout on a board (where<br>&gt;&gt;&gt;&gt; the clock line takes a v=
ery different path than everything else).<br>&gt;&gt;&gt;&gt; It&#39;s also=
 not even terribly SoC-specific unless you&#39;ve got some very<br>&gt;&gt;=
&gt;&gt; strange incarnation of dw_mmc that has very different internal del=
ays<br>&gt;&gt;&gt;&gt; than everyone else.=C2=A0 Said another way, until w=
e see an instance of an<br>&gt;&gt;&gt;&gt; SoC/board that really needs to =
do things special I&#39;d say that we<br>&gt;&gt;&gt;&gt; should just imple=
ment this all in code (no device tree bindings).<br>&gt;&gt;&gt;&gt;<br>&gt=
;&gt;&gt;<br>&gt;&gt;&gt; I&#39;m prone to think it should be Soc specific =
if making sure the layout<br>&gt;&gt;&gt; for data lines is in equal length=
.<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; Sure, it can be SoC specific. =C2=A0.=
..though at the moment, I&#39;d bet that<br>&gt;&gt; you can come up with a=
 single rule for the drive phase offset that<br>&gt;&gt; will work for ever=
y Rockchip SoC produced so far, especially if you<br>&gt;&gt; are using onl=
y 0/90/180/270.=C2=A0 I&#39;d imagine that they all have similar<br>&gt;&gt=
; enough internal delays.<br>&gt;<br>&gt;<br>&gt; For a specific Soc, it&#3=
9;s the basic rule to make sure the internal delays<br>&gt; is the same(nea=
rly the same) for all of the lines.<div><br></div><div>Right.=C2=A0 I was s=
aying that not only are all lines within a given SoC similar in terms of de=
lay, but I was suggesting that perhaps the internal delay for rk3188, rk328=
8, rk3228, ... is probably fairly similar.=C2=A0 That&#39;s only a guess, t=
hough.</div><div><br><br></div><div>&gt;&gt;&gt;&gt; 3. If this property wa=
s actually board specific and actually needed to<br>&gt;&gt;&gt;&gt; be tun=
ed board-by-board, you&#39;d have a bug because your new device tree<br>&gt=
;&gt;&gt;&gt; bindings are not backward compatible and you&#39;d probably b=
e breaking<br>&gt;&gt;&gt;&gt; old boards.=C2=A0 Specifically you&#39;re ch=
anging the definition of what<br>&gt;&gt;&gt;&gt; happens when &quot;rockch=
ip,default-drv-phase&quot; is not specified.=C2=A0 Old<br>&gt;&gt;&gt;&gt; =
behavior was to leave the value that was setup by the firmware (or<br>&gt;&=
gt;&gt;&gt; perhaps the hardware default if the firmware didn&#39;t touch t=
his).<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; drv_p=
hase is for all the data lines instead of tuning the lines<br>&gt;&gt;&gt; =
one-by-one. So this patch can&#39;t save the terrible board layout.<br>&gt;=
&gt;&gt; But I agree that it will break the compatibility backward if firwa=
re<br>&gt;&gt;&gt; touch this value.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;<br=
>&gt;&gt;&gt;&gt; ---<br>&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt; OK, so what s=
hould we do?<br>&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt; We could certainly do =
lots of crazy math to come up with the ideal<br>&gt;&gt;&gt;&gt; hold time =
for all different speed modes and all different types of<br>&gt;&gt;&gt;&gt=
; cards.=C2=A0 With my reading of the Designware Databook this would mean<b=
r>&gt;&gt;&gt;&gt; that somewhere we&#39;d want to specify which delay meth=
od we&#39;re using<br>&gt;&gt;&gt;&gt; (phase shift vs. delay line) and how=
 long all the delays timings all<br>&gt;&gt;&gt;&gt; are on your particular=
 SoC.=C2=A0 That all sounds quite difficult, though.<br>&gt;&gt;&gt;<br>&gt=
;&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; delay line is diff from chip to c=
hip, soc-to-soc, board-to-board. For<br>&gt;&gt;&gt; sample-phase we have t=
uning process and re-tune, but not for drv-phase.<br>&gt;&gt;&gt; So We bas=
cially should avoid to use it for drv-phase. Another<br>&gt;&gt;&gt; consid=
eration is the temperature drift of delay line.<br>&gt;&gt;&gt;<br>&gt;&gt;=
&gt; Maybe we should do some tricky limitation on clk-mmc-phase to only<br>=
&gt;&gt;&gt; support fixed degrees?<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; As =
per above, let&#39;s not use delay line for drive delay.=C2=A0 On all<br>&g=
t;&gt; Rockchip SoCs that I have seen it&#39;s possible to make 0/90/180/27=
0 very<br>&gt;&gt; accurately.=C2=A0 That means no board-to-board differenc=
es.=C2=A0 Current<br>&gt;&gt; mainline Linux kernel source code will always=
 make 0/90/180/270 using<br>&gt;&gt; phase offset (not delay line).<br>&gt;=
<br>&gt;<br>&gt; yes, 0/90/180/270 is very accurate and mainline kernel use=
 phase offset<br>&gt; for these four phase.<br>&gt;<br>&gt;&gt;<br>&gt;&gt;=
 For sampling we use tuning and using the delay elements makes some<br>&gt;=
&gt; sense (since 90 degrees is not quite accurate enough to fully tune<br>=
&gt;&gt; UHS). =C2=A0...but for driving where the only requirement is hold =
times we<br>&gt;&gt; don&#39;t need delay elements.<br>&gt;<br>&gt;<br>&gt;=
 Right. We care hold time here.<br>&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt;=
&gt;&gt; Probably you could just add a simple function that looked at the c=
lock<br>&gt;&gt;&gt;&gt; and speed mode and always chose an offset of 90 or=
 180 degrees.=C2=A0 At<br>&gt;&gt;&gt;&gt; least on Rockchip devices you ca=
n be certain that you can make 90 and<br>&gt;&gt;&gt;&gt; 180 degrees using=
 phase shifts and thus the timings should be<br>&gt;&gt;&gt;&gt; consistent=
.=C2=A0 By default you could just always choose 180.=C2=A0 The<br>&gt;&gt;&=
gt;&gt; Designware databook has some examples where it picked 90 degrees<br=
>&gt;&gt;&gt;&gt; (SDR50, DDR50, SDR25, MMC High Speed), but I&#39;m not en=
ough of an MMC<br>&gt;&gt;&gt;&gt; expert to know if there is some benefit =
to choosing 90.=C2=A0 Would we<br>&gt;&gt;&gt;&gt; violate any specs if we =
just chose 180 degrees all the time everywhere<br>&gt;&gt;&gt;&gt; on all R=
ockchip devices?<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt=
;&gt; It needs more waveform test to see how things going. But most of<br>&=
gt;&gt;&gt; rockchip platforms in the pass years didn&#39;t touch drv-phase=
 stuff not<br>&gt;&gt;&gt; only in kernel but also in firmware, then we sti=
ll cannot see the<br>&gt;&gt;&gt; violation against the spec when using def=
alut reset value, namely 180,<br>&gt;&gt;&gt; for<br>&gt;&gt;&gt; drv-phase=
.<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; Right, most Rockchip platforms simply=
 don&#39;t touch this and it works<br>&gt;&gt; OK. =C2=A0...but I don&#39;t=
 think it defaults to 180.=C2=A0 Grepping through on my<br>&gt;&gt; veyron =
(rk3288) device shows<br>&gt;&gt;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0sd=
io1_drv - 90<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0sdio0_drv - 90<br>&gt;&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0sdmmc_drv - 90<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0emmc_drv -180<br>&gt;&gt;<br>&gt;&gt; ...and, as we&#39;ve seen, =
these values appear to be 270 on some other SoCs.<br>&gt;&gt;<br>&gt;<br>&g=
t; Have your code touched them? I check the TRM and find it should be 180<b=
r>&gt; always.<br>&gt;<br>&gt; Also for rk3036/3368/3399/3228.... the reset=
 vaule is 180...</div><div><br></div><div>I have less faith than you in the=
 TRM.=C2=A0 The TRM is full of minor errors and is often wrong about the de=
fault state of things.=C2=A0 IMHO the only true way to find out is to boot =
up some SoCs and check.</div><div><br></div><div>As far as whether code tou=
ches these values:</div><div><ul><li>I&#39;m 100% certain that the kernel o=
n rk3288 I tested doesn&#39;t touch.</li><li>I&#39;m 100% certain that the =
kernel on rk3399=C2=A0I tested=C2=A0doesn&#39;t touch.</li><li>I&#39;m 95% =
certain that the BIOS (coreboot/depthcharge) on rk3288=C2=A0I tested=C2=A0d=
oesn&#39;t touch.</li><li>I&#39;m 95% certain that the BIOS (coreboot/depth=
charge) on rk3399=C2=A0I tested=C2=A0doesn&#39;t touch.=C2=A0 Note that the=
 TRM on rk3399 does say 180 degrees is the default, but I believe you have =
also verified that it comes up as 270.=C2=A0 Have you found any reason for =
this?</li></ul><div>Also note that I look at V1.1 of the rk3288 TRM in the =
CRU section and I see:<br></div></div><div><br></div><div>*=C2=A0CRU_SDMMC_=
CON0: drive degree defaults to 0x1</div><div>*=C2=A0CRU_SDIO0_CON0: drive d=
egree defaults to 0x1</div><div>* CRU_SDIO1_CON0:=C2=A0drive degree default=
s to 0x1</div><div>*=C2=A0CRU_EMMC_CON0: drive degree defaults to 0x1</div>=
<div><br></div><div>That actually means that they default to 90.=C2=A0 Of c=
ourse you can also see that the TRM is probably flawed because it claims th=
at all the bits here are &quot;WO&quot; (write only).=C2=A0 They are clearl=
y not.</div><div><br></div><div>The TRM is also internally inconsistent.=C2=
=A0 When I then go into the Mobile Storage Host section (Variable Delay/Clo=
ck Generation), I see that it does in fact claim that the default is 180.</=
div><div><br></div><div><br></div><div>&gt;&gt; The claim from the Designwa=
re Databook says that SDR104 and SDR12, and<br></div><div>&gt;&gt; identifi=
cation mode need 180 degrees to work properly.=C2=A0 It would be<br>&gt;&gt=
; interesting to hook up rk3288 to a signal analyzer and see hold times<br>=
&gt;&gt; are OK or if we need to move up to 180 degrees for those modes.<br=
>&gt;&gt;<br>&gt;&gt; Note that the Designware Databook assumes &quot;Delay=
_O&quot; of 1.4ns.=C2=A0 If<br>&gt;&gt; yours is shorter then maybe 90 degr=
ees is OK for those modes?<br>&gt;&gt;<br>&gt;<br>&gt; maybe. But I think 1=
80(downside) is the better.</div><div><br></div><div>I&#39;m OK with using =
180 always as long as SD cards continue to work OK.=C2=A0 Best would be if =
someone could actually run a protocol analyzer for all the different speed =
modes.</div><div><br></div><div><br></div><div>&gt;&gt; Also: I still haven=
&#39;t heard whether there is any downside to using 180<br>&gt;&gt; degrees=
 for modes that only require 90 degrees.=C2=A0 Does it cause<br>&gt;&gt; pr=
oblems to just always use 180 degrees?=C2=A0 If not, we could possibly<br>&=
gt;&gt; use 180 degrees everywhere and just hardcode it?<br>&gt;<br>&gt;<br=
>&gt; From tons of test on rockchip products which always use 180, I didn&#=
39;t<br>&gt; see failure. Hardcoding it doesn&#39;t look so decent maybe...=
 but anyway<br>&gt; it works.</div><div><br></div><div>Hardcoding in this c=
ase is much better than putting in a device tree binding.=C2=A0 I&#39;m nea=
rly certain that having a device tree binding that doesn&#39;t account for =
different clock rates / speed modes is not a good idea, and device tree bin=
dings are supposed to be &quot;set in stone&quot;.=C2=A0 Let&#39;s just har=
dcode it for now.</div><div><br></div><div>I can post up a CL.</div><div><b=
r></div><div><br>&gt;&gt; ...but if 180 is ideal everywhere, can you answer=
:<br>&gt;&gt;<br>&gt;&gt; * Why does dw_mmc manual spend so much time talki=
ng about it?=C2=A0 It<br>&gt;&gt; could just say &quot;set to 180 degrees&q=
uot;.<br>&gt;<br>&gt;<br>&gt; I&#39;m sure all the rockchip Socs defaultly =
use 180 for drv_phase if I got<br>&gt; the right TRMs these years.<br>&gt;<=
br>&gt; Anyway let me check it with my ASIC team and I will let you know<br=
>&gt; the result.<br><br></div><div>You probably have the right TRMs.=C2=A0=
 The TRMs are just not accurate. =C2=A0;)</div></div>

--001a114e1ff49ac31205327ee803--
