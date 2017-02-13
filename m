Return-Path: <SRS0=CrIa=Z2=linaro.org=mike.leach@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1486966298-16767-1-git-send-email-leo.yan@linaro.org>
References: <1486966298-16767-1-git-send-email-leo.yan@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 13 Feb 2017 15:58:47 +0000
Message-ID: <CAJ9a7VjiEwUEQVvuecYS9aLbe+4-eN-waEWirdv_ctsHPaXxWw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] coresight: enable debug module
Content-Type: multipart/alternative; boundary=001a1146d146d866c905486b85ba
To: Leo Yan <leo.yan@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>
List-ID: <devicetree@vger.kernel.org>

--001a1146d146d866c905486b85ba
Content-Type: text/plain; charset=UTF-8

Hi Leo,

A few comments about your driver RFC.

i) As it stands this looks like it will work for v8 cores, but would need
refining for v7. There are subtle differences in the PC sampling between
the two architectures.

ii) the routine that dumps the PCSR register values across all the
available cores, appears to assume that all the cores are powered and as
such the registers are accessible.
I think it would be useful in the Kconfig help to point this out.

At ARM we have encountered systems that have quite aggressive power
management policies which will disable both the core power domain and debug
power domain for unused cores / clusters. On such a system I think that
there would be an slave error return provided by the memory access to
unpowered elements, resulting in undesirable behavior, or even a bus
lockup. These are both errors we have seen using the external debug
registers via an external debugger.

At the very least the user needs to be warned so he can adjust his system
accordingly (e.g. when we are debugging a Juno based Linux system using the
external debug registers / debugger. we will often disable power management
using a script to ensure that cores stay up and debuggable.)

iii) I would recommend that you take note of the relevant bits in EDPRSR
which may indicate that reading EDPCSR will cause an access error.
Specifically DLK, PU would gate valid access to OSLAR -> the state of which
you can also determine using EDPRSR.

iv) When running in higher EL levels, such as might be the case with
trusted firmware, then PC sampling may not be permitted by the OS, when the
EDPCSR value will return 0xFFFFFFFF. The PCSR dump message should reflect
this.

v) EDVIDSR - which is sampled at the same time as EDPCSR_lo contains
interesting information regarding the validity of the EDPCSR_hi registers
and current EL and security state.
I think it would be worth reading and interpreting this register in
addition to the PC sample.

vi) The set of registers you are using are the "PC sample-based profiling
extension". (ARM v8 manual section H7.) It might be more accurate to
describe the driver as implementing support for this rather than full debug.

Best Regards

Mike Leach



On 13 February 2017 at 06:11, Leo Yan <leo.yan@linaro.org> wrote:

> This patch series is to enable coresight debug module. With debug
> module we can check CPU state and PC value, etc. So this is helpful for
> CPU lockup bugs, e.g. if one CPU has run into infinite loop with IRQ
> disabled. The hang CPU cannot switch context and handle any interrupt,
> so it cannot handle SMP call for stack dump, etc.
>
> Furthermore, now ARMv8 introduces some runtime firmwares like ARM
> trusted firmware BL31, so sometime CPU lockup may happen in the
> firmware and cannot return back to kernel.
>
> This initial patch series enable debug module and registers call back
> notifier for PCSR register dumping when panic happens, so we can see
> below dumping info for panic:
>
> [   13.751777] Coresight debug module:
> [   13.755275] CPU[0]: PSCR=0xffff000008090cbc
> [   13.759469] CPU[1]: PSCR=0xffff0000088bf9e4
> [   13.763662] CPU[2]: PSCR=0xffff000008090cc0
> [   13.767856] CPU[3]: PSCR=0xffff000008090cb8
> [   13.772049] CPU[4]: PSCR=0xffff000008090cc0
> [   13.776243] CPU[5]: PSCR=0xffff000008090cbc
> [   13.780436] CPU[6]: PSCR=0xffff000008090cc0
> [   13.784630] CPU[7]: PSCR=0xffff000008090cbc
>
> This patch series has been verified on 96boards Hikey.
>
>
> Leo Yan (3):
>   coresight: binding for coresight debug driver
>   coresight: add support for debug module
>   arm64: dts: register Hi6220's coresight debug module
>
>  .../devicetree/bindings/arm/coresight.txt          |   9 +-
>  .../boot/dts/hisilicon/hikey_6220_coresight.dtsi   |  73 +++++++++
>  drivers/hwtracing/coresight/Kconfig                |   8 +
>  drivers/hwtracing/coresight/Makefile               |   1 +
>  drivers/hwtracing/coresight/coresight-debug.c      | 169
> +++++++++++++++++++++
>  5 files changed, 258 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/hwtracing/coresight/coresight-debug.c
>
> --
> 2.7.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Blackburn Design Centre. UK

--001a1146d146d866c905486b85ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi Leo,<br><br></div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif">A few comments about your drive=
r RFC.<br><br></div><div class=3D"gmail_default" style=3D"font-family:arial=
,helvetica,sans-serif">i) As it stands this looks like it will work for v8 =
cores, but would need refining for v7. There are subtle differences in the =
PC sampling between the two architectures.<br><br></div><div class=3D"gmail=
_default" style=3D"font-family:arial,helvetica,sans-serif">ii) the routine =
that dumps the PCSR register values across all the available cores, appears=
 to assume that all the cores are powered and as such the registers are acc=
essible.<br></div><div class=3D"gmail_default" style=3D"font-family:arial,h=
elvetica,sans-serif">I think it would be useful in the Kconfig help to poin=
t this out. <br><br>At ARM we have encountered systems that have quite aggr=
essive power management policies which will disable both the core power dom=
ain and debug power domain for unused cores / clusters. On such a system I =
think that there would be an slave error return provided by the memory acce=
ss to unpowered elements, resulting in undesirable behavior, or even a bus =
lockup. These are both errors we have seen using the external debug registe=
rs via an external debugger.<br><br>At the very least the user needs to be =
warned so he can adjust his system accordingly (e.g. when we are debugging =
a Juno based Linux system using the external debug registers / debugger. we=
 will often disable power management using a script to ensure that cores st=
ay up and debuggable.)<br><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:arial,helvetica,sans-serif">iii) I would recommend that you take=
 note of the relevant bits in EDPRSR which may indicate that reading EDPCSR=
 will cause an access error. Specifically DLK, PU would gate valid access t=
o OSLAR -&gt; the state of which you can also determine using EDPRSR.<br><b=
r></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,s=
ans-serif">iv) When running in higher EL levels, such as might be the case =
with trusted firmware, then PC sampling may not be permitted by the OS, whe=
n the EDPCSR value will return 0xFFFFFFFF. The PCSR dump message should ref=
lect this. <br></div><div class=3D"gmail_default" style=3D"font-family:aria=
l,helvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif">v) EDVIDSR - which is sampled at the s=
ame time as EDPCSR_lo contains interesting information regarding the validi=
ty of the EDPCSR_hi registers and current EL and security state.<br></div><=
div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif=
">I think it would be worth reading and interpreting this register in addit=
ion to the PC sample.<br><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,helvetica,sans-serif">vi) The set of registers you are usin=
g are the &quot;PC sample-based profiling extension&quot;. (ARM v8 manual s=
ection H7.) It might be more accurate to describe the driver as implementin=
g support for this rather than full debug.<br></div><div class=3D"gmail_def=
ault" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Best Re=
gards<br><br></div><div class=3D"gmail_default" style=3D"font-family:arial,=
helvetica,sans-serif">Mike Leach<br><br><br></div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On 13 February 2017 at 06:11, Leo Ya=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:leo.yan@linaro.org" target=3D"_bl=
ank">leo.yan@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">This patch series is to enable coresight debug module. With debug<br>
module we can check CPU state and PC value, etc. So this is helpful for<br>
CPU lockup bugs, e.g. if one CPU has run into infinite loop with IRQ<br>
disabled. The hang CPU cannot switch context and handle any interrupt,<br>
so it cannot handle SMP call for stack dump, etc.<br>
<br>
Furthermore, now ARMv8 introduces some runtime firmwares like ARM<br>
trusted firmware BL31, so sometime CPU lockup may happen in the<br>
firmware and cannot return back to kernel.<br>
<br>
This initial patch series enable debug module and registers call back<br>
notifier for PCSR register dumping when panic happens, so we can see<br>
below dumping info for panic:<br>
<br>
[=C2=A0 =C2=A013.751777] Coresight debug module:<br>
[=C2=A0 =C2=A013.755275] CPU[0]: PSCR=3D0xffff000008090cbc<br>
[=C2=A0 =C2=A013.759469] CPU[1]: PSCR=3D0xffff0000088bf9e4<br>
[=C2=A0 =C2=A013.763662] CPU[2]: PSCR=3D0xffff000008090cc0<br>
[=C2=A0 =C2=A013.767856] CPU[3]: PSCR=3D0xffff000008090cb8<br>
[=C2=A0 =C2=A013.772049] CPU[4]: PSCR=3D0xffff000008090cc0<br>
[=C2=A0 =C2=A013.776243] CPU[5]: PSCR=3D0xffff000008090cbc<br>
[=C2=A0 =C2=A013.780436] CPU[6]: PSCR=3D0xffff000008090cc0<br>
[=C2=A0 =C2=A013.784630] CPU[7]: PSCR=3D0xffff000008090cbc<br>
<br>
This patch series has been verified on 96boards Hikey.<br>
<br>
<br>
Leo Yan (3):<br>
=C2=A0 coresight: binding for coresight debug driver<br>
=C2=A0 coresight: add support for debug module<br>
=C2=A0 arm64: dts: register Hi6220&#39;s coresight debug module<br>
<br>
=C2=A0.../devicetree/bindings/arm/<wbr>coresight.txt=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
=C2=A0.../boot/dts/hisilicon/hikey_<wbr>6220_coresight.dtsi=C2=A0 =C2=A0|=
=C2=A0 73 +++++++++<br>
=C2=A0drivers/hwtracing/coresight/<wbr>Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<br>
=C2=A0drivers/hwtracing/coresight/<wbr>Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0drivers/hwtracing/coresight/<wbr>coresight-debug.c=C2=A0 =C2=A0 =C2=
=A0 | 169 +++++++++++++++++++++<br>
=C2=A05 files changed, 258 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 drivers/hwtracing/coresight/<wbr>coresight-debug.c=
<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
<br>
______________________________<wbr>_________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@li=
sts.<wbr>infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" re=
l=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/<wbr>mailman/=
listinfo/linux-arm-<wbr>kernel</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div>Mike Leach</div><div>Principal Engineer, ARM Ltd.</div><div>Blackburn D=
esign Centre. UK</div></div></div>
</div>

--001a1146d146d866c905486b85ba--
