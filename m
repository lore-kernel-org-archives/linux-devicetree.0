Return-Path: <SRS0=LzEO=27=linaro.org=mike.leach@kernel.org>
MIME-Version: 1.0
In-Reply-To: <671a0b39-b635-6e0e-d3fa-967651f2e29c@arm.com>
References: <1488520809-31670-1-git-send-email-leo.yan@linaro.org>
 <1488520809-31670-4-git-send-email-leo.yan@linaro.org> <671a0b39-b635-6e0e-d3fa-967651f2e29c@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 22 Mar 2017 12:54:36 +0000
Message-ID: <CAJ9a7VgCjXNGC4C49PxL-nBxzhMCmA8Mb-0C_epahizA5EL2HA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] coresight: add support for debug module
Content-Type: multipart/alternative; boundary=001a113cbdd849a780054b5143de
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, John Stultz <john.stultz@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a113cbdd849a780054b5143de
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21 March 2017 at 15:39, Sudeep Holla <sudeep.holla@arm.com> wrote:

>
>
> On 03/03/17 06:00, Leo Yan wrote:
> > Coresight includes debug module and usually the module connects with CP=
U
> > debug logic. ARMv8 architecture reference manual (ARM DDI 0487A.k) has
> > description for related info in "Part H: External Debug".
> >
> > Chapter H7 "The Sample-based Profiling Extension" introduces several
> > sampling registers, e.g. we can check program counter value with
> > combined CPU exception level, secure state, etc. So this is helpful for
> > analysis CPU lockup scenarios, e.g. if one CPU has run into infinite
> > loop with IRQ disabled. In this case the CPU cannot switch context and
> > handle any interrupt (including IPIs), as the result it cannot handle
> > SMP call for stack dump.
> >
> > This patch is to enable coresight debug module, so firstly this driver
> > is to bind apb clock for debug module and this is to ensure the debug
> > module can be accessed from program or external debugger. And the drive=
r
> > uses sample-based registers for debug purpose, e.g. when system detects
> > the CPU lockup and trigger panic, the driver will dump program counter
> > and combined context registers (EDCIDSR, EDVIDSR); by parsing context
> > registers so can quickly get to know CPU secure state, exception level,
> > etc.
> >
> > Some of the debug module registers are located in CPU power domain, so
> > in the driver it has checked the power state for CPU before accessing
> > registers within CPU power domain. For most safe way to use this driver=
,
> > it's suggested to disable CPU low power states, this can simply set
> > "nohlt" in kernel command line.
> >
>
> I disagree with this approach. One of the main usefulness of such self
> hosted debug feature is to debug issues around features like cpuidle.
> Adding constraints like "cpuidle needs to be disabled" is not good IMO.
> There are ways to make it work with cpuidle enabled. Please explore
> them. In particular refer H9.2.39 EDPRCR, External Debug Power/Reset
> Control Register.
>
> So, "nohlt" option is not an option. I prefer some sysfs option like
> Suzuki suggested to enable this feature on demand if power saving in
> normal usecase is the concern. Using "nohlt" just disables idle and
> doesn't ensure the debug power domain is ON. Using the flag directly in
> this driver to enable debug power domain also sounds misuse of that flag
> for me.
>
> --
> Regards,
> Sudeep
>

I think the key issue to remember here is that experience with external
debug shows that CPU Idle means different things to different SoC designs /
power management schemes. (and we are using external debug in a self hosted
way here).

Some designs will power down an entire cluster if all CPUs on the cluster
are powered down - including the parts of the debug registers that should
remain powered in the debug power domain. The bits in EDPRCR are not
respected in these cases - these designs do not really support debug over
power down in the way that the CoreSight / Debug designers anticipated.
This means that even checking EDPRSR has the potential to cause a bus hang
if the target register is unpowered. (and if the debug power domain is
unpowered then the PC data is also lost).

In these cases, accessing to the debug registers while they are not powered
is a recipe for disaster - so preventing CPUIdle
=E2=80=8Band the subsequent cluster power down =E2=80=8B
allows investigation on this class of system -
=E2=80=8Band allowing the CPUs of interest be interrogated without hanging =
the
crash log process.=E2=80=8B


=E2=80=8BOn systems that do behave correctly with respect to debug power do=
mains,
then disabling CPUIdle is unnecessary - these can be controlled by =E2=80=
=8BEDPRCR
- perhaps; per the specification it is "implementation defined" if writing
bits to this register have an effect on the system anyway even if the debug
domain is correctly powered.

=E2=80=8BWhile it is true to say that disabling CPUIdle does not guarantee =
that the
debug power domain is on, it does in a certain class of designs prevent it
being powered off (Juno historically - not sure if that is still the case.)=
.

However, I do agree that the use of the driver should not be triggered
_only_ on the existence of /nohlt on the command line - =E2=80=8Bthere is a=
 class
of designs where this will not be required.

When enabing the driver as a kernel config the user needs to decide:-
1) do I need this to debug the issue I am seeing
2) does the power management on my system require I use /nohlt as well.

I think that the use of /nohlt as an option, and the reasons why it might
be needed should be part of the configuration help in this case.

There is also a case for considering if there should be an option to
configure it to be enabled or disabled at boot time. It is easy to imagine
cases I want to have this running from the start as a crash happens early -
and cases I can enable it on demand later.


=E2=80=8BRegards=E2=80=8B

=E2=80=8BMike=E2=80=8B

--=20
Mike Leach
Principal Engineer, ARM Ltd.
Blackburn Design Centre. UK

--001a113cbdd849a780054b5143de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 21 March 2017 at 15:39, Sudeep Holla <span dir=3D"ltr">&lt;<a href=
=3D"mailto:sudeep.holla@arm.com" target=3D"_blank">sudeep.holla@arm.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><sp=
an class=3D"gmail-"><br>
<br>
On 03/03/17 06:00, Leo Yan wrote:<br>
</span><span class=3D"gmail-">&gt; Coresight includes debug module and usua=
lly the module connects with CPU<br>
&gt; debug logic. ARMv8 architecture reference manual (ARM DDI 0487A.k) has=
<br>
&gt; description for related info in &quot;Part H: External Debug&quot;.<br=
>
&gt;<br>
&gt; Chapter H7 &quot;The Sample-based Profiling Extension&quot; introduces=
 several<br>
&gt; sampling registers, e.g. we can check program counter value with<br>
&gt; combined CPU exception level, secure state, etc. So this is helpful fo=
r<br>
&gt; analysis CPU lockup scenarios, e.g. if one CPU has run into infinite<b=
r>
&gt; loop with IRQ disabled. In this case the CPU cannot switch context and=
<br>
&gt; handle any interrupt (including IPIs), as the result it cannot handle<=
br>
&gt; SMP call for stack dump.<br>
&gt;<br>
&gt; This patch is to enable coresight debug module, so firstly this driver=
<br>
&gt; is to bind apb clock for debug module and this is to ensure the debug<=
br>
&gt; module can be accessed from program or external debugger. And the driv=
er<br>
&gt; uses sample-based registers for debug purpose, e.g. when system detect=
s<br>
&gt; the CPU lockup and trigger panic, the driver will dump program counter=
<br>
&gt; and combined context registers (EDCIDSR, EDVIDSR); by parsing context<=
br>
&gt; registers so can quickly get to know CPU secure state, exception level=
,<br>
&gt; etc.<br>
&gt;<br>
&gt; Some of the debug module registers are located in CPU power domain, so=
<br>
&gt; in the driver it has checked the power state for CPU before accessing<=
br>
&gt; registers within CPU power domain. For most safe way to use this drive=
r,<br>
&gt; it&#39;s suggested to disable CPU low power states, this can simply se=
t<br>
&gt; &quot;nohlt&quot; in kernel command line.<br>
&gt;<br>
<br>
</span>I disagree with this approach. One of the main usefulness of such se=
lf<br>
hosted debug feature is to debug issues around features like cpuidle.<br>
Adding constraints like &quot;cpuidle needs to be disabled&quot; is not goo=
d IMO.<br>
There are ways to make it work with cpuidle enabled. Please explore<br>
them. In particular refer H9.2.39 EDPRCR, External Debug Power/Reset<br>
Control Register.<br>
<br>
So, &quot;nohlt&quot; option is not an option. I prefer some sysfs option l=
ike<br>
Suzuki suggested to enable this feature on demand if power saving in<br>
normal usecase is the concern. Using &quot;nohlt&quot; just disables idle a=
nd<br>
doesn&#39;t ensure the debug power domain is ON. Using the flag directly in=
<br>
this driver to enable debug power domain also sounds misuse of that flag<br=
>
for me.<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
Regards,<br>
Sudeep<br>
</font></span></blockquote></div><br><div class=3D"gmail_default" style=3D"=
font-family:arial,helvetica,sans-serif">I
 think the key issue to remember here is that experience with external=20
debug shows that CPU Idle means different things to different SoC=20
designs / power management schemes. (and we are using external debug in a s=
elf hosted way here).<br><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,helvetica,sans-serif">Some designs will power down an entir=
e cluster if all CPUs on the cluster are=20
powered down - including the parts of the debug registers that should=20
remain powered in the debug power domain. The bits in EDPRCR are not=20
respected in these cases - these designs do not really support debug=20
over power down in the way that the CoreSight / Debug designers=20
anticipated. This means that even checking EDPRSR has the potential to caus=
e a
 bus hang if the target register is unpowered. (and if the debug power doma=
in is unpowered then the PC data is also lost).<br><br></div>In
 these cases, accessing to the debug registers while they are not=20
powered is a recipe for disaster - so preventing CPUIdle <div style=3D"font=
-family:arial,helvetica,sans-serif;display:inline" class=3D"gmail_default">=
=E2=80=8Band the subsequent cluster power down =E2=80=8B</div>allows=20
investigation on this class of system - <div style=3D"font-family:arial,hel=
vetica,sans-serif;display:inline" class=3D"gmail_default">=E2=80=8Band allo=
wing the CPUs of interest be interrogated without hanging the crash log pro=
cess.=E2=80=8B</div><br><br><div style=3D"font-family:arial,helvetica,sans-=
serif" class=3D"gmail_default">=E2=80=8BOn systems that do behave correctly=
 with respect to debug power domains, then disabling CPUIdle is unnecessary=
 - these can be controlled by =E2=80=8BEDPRCR - perhaps; per the specificat=
ion it is &quot;implementation defined&quot; if writing bits to this regist=
er have an effect on the system anyway even if the debug domain is correctl=
y powered.<br></div><br><div style=3D"font-family:arial,helvetica,sans-seri=
f" class=3D"gmail_default">=E2=80=8BWhile it is true to say that disabling =
CPUIdle does not guarantee that the debug power domain is on, it does in a =
certain class of designs prevent it being powered off (Juno historically - =
not sure if that is still the case.).<br></div><div style=3D"font-family:ar=
ial,helvetica,sans-serif" class=3D"gmail_default"><br>However, I do agree t=
hat the use of the driver should not be triggered _only_ on the existence o=
f /nohlt on the command line - =E2=80=8Bthere is a class of designs where t=
his will not be required. <br><br></div><div style=3D"font-family:arial,hel=
vetica,sans-serif" class=3D"gmail_default">When enabing the driver as a ker=
nel config the user needs to decide:-<br></div><div style=3D"font-family:ar=
ial,helvetica,sans-serif" class=3D"gmail_default">1) do I need this to debu=
g the issue I am seeing<br></div><div style=3D"font-family:arial,helvetica,=
sans-serif" class=3D"gmail_default">2) does the power management on my syst=
em require I use /nohlt as well.<br><br></div><div style=3D"font-family:ari=
al,helvetica,sans-serif" class=3D"gmail_default">I think that the use of /n=
ohlt as an option, and the reasons why it might be needed should be part of=
 the configuration help in this case.<br></div><div style=3D"font-family:ar=
ial,helvetica,sans-serif" class=3D"gmail_default"><br>There is also a case =
for considering if there should be an option to configure it to be enabled =
or disabled at boot time. It is easy to imagine cases I want to have this r=
unning from the start as a crash happens early - and cases I can enable it =
on demand later. <br></div><div style=3D"font-family:arial,helvetica,sans-s=
erif" class=3D"gmail_default"><br><br></div><div style=3D"font-family:arial=
,helvetica,sans-serif" class=3D"gmail_default">=E2=80=8BRegards=E2=80=8B</d=
iv><br><div style=3D"font-family:arial,helvetica,sans-serif" class=3D"gmail=
_default">=E2=80=8BMike=E2=80=8B</div><br>-- <br><div class=3D"gmail_signat=
ure"><div dir=3D"ltr"><div>Mike Leach</div><div>Principal Engineer, ARM Ltd=
.</div><div>Blackburn Design Centre. UK</div></div></div>
</div></div>

--001a113cbdd849a780054b5143de--
