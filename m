Return-Path: <SRS0=6bsq=OQ=brainfault.org=anup@kernel.org>
MIME-Version: 1.0
References: <1543870651-16669-5-git-send-email-atish.patra@wdc.com> <mhng-4a071ea7-ddf5-4204-8343-790f9bbb3a09@palmer-si-x1c4>
In-Reply-To: <mhng-4a071ea7-ddf5-4204-8343-790f9bbb3a09@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Dec 2018 22:50:57 +0530
Message-ID: <CAAhSdy1gNB0sMAq4mtGSNJ96BND4tMxHShq==3B1hzL9ebs=oQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] RISC-V: Fix non-smp kernel boot on SMP systems
Content-Type: multipart/alternative; boundary="000000000000572ee4057c71d76e"
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Atish Patra <atish.patra@wdc.com>, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, aou@eecs.berkeley.edu, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, dmitriy@oss-tech.org, linux-riscv@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, tglx@linutronix.de, Damien.LeMoal@wdc.com
List-ID: <devicetree@vger.kernel.org>

--000000000000572ee4057c71d76e
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Dec, 2018, 10:30 PM Palmer Dabbelt <palmer@sifive.com wrote:

> On Mon, 03 Dec 2018 12:57:31 PST (-0800), atish.patra@wdc.com wrote:
> > Currently, clocksource registration happens for an invalid cpu
> > for non-smp kernels. This lead to kernel panic as cpu hotplug
> > registration will fail for those cpus.
> >
> > Do not proceed if hartid is invalid. Take this opprtunity to
> > print appropriate error strings for different failure cases.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  drivers/clocksource/riscv_timer.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clocksource/riscv_timer.c
> b/drivers/clocksource/riscv_timer.c
> > index 39de6e49..4af4af47 100644
> > --- a/drivers/clocksource/riscv_timer.c
> > +++ b/drivers/clocksource/riscv_timer.c
> > @@ -108,6 +108,8 @@ static int __init riscv_timer_init_dt(struct
> device_node *n)
> >       int cpuid, hartid, error;
> >
> >       hartid = riscv_of_processor_hartid(n);
> > +     if (hartid < 0)
> > +             return hartid;
>
> This seems like it's just hiding a bug somewhere else.  We should at least
> put
> out a WARN here, as I'm not sure the error will propagate anywhere useful.
>

We need separate DT node for riscv_timer. The riscv_timer is nothing but
SOC timer accessed via rdtime and SBI calls. It can be viewed as one
device. In fact, this is how it's done in ARM/ARM64.


> >       cpuid = riscv_hartid_to_cpuid(hartid);
> >
> >       if (cpuid != smp_processor_id())
> > @@ -115,14 +117,19 @@ static int __init riscv_timer_init_dt(struct
> device_node *n)
> >
> >       /* This should be called only for boot cpu */
> >       riscv_timebase = riscv_timebase_frequency(n);
> > -     clocksource_register_hz(&riscv_clocksource, riscv_timebase);
> > +     error = clocksource_register_hz(&riscv_clocksource,
> riscv_timebase);
> >
> > +     if (error) {
> > +             pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
> > +                    error, cpuid);
> > +             return error;
> > +     }
> >       error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
> >                        "clockevents/riscv/timer:starting",
> >                        riscv_timer_starting_cpu, riscv_timer_dying_cpu);
> >       if (error)
> > -             pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
> > -                    error, cpuid);
> > +             pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
> > +                    error);
> >       return error;
> >  }
>

Regards,
Anup

>

--000000000000572ee4057c71d76e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Fri, 7 Dec, 2018, 10:30 PM Palmer Dabbelt &lt;<a href=3D"mailto:palmer@s=
ifive.com">palmer@sifive.com</a> wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Mon, 03 Dec 2018 12:57:31 PST (-0800), <a href=3D"mailto:atish.patr=
a@wdc.com" target=3D"_blank" rel=3D"noreferrer">atish.patra@wdc.com</a> wro=
te:<br>
&gt; Currently, clocksource registration happens for an invalid cpu<br>
&gt; for non-smp kernels. This lead to kernel panic as cpu hotplug<br>
&gt; registration will fail for those cpus.<br>
&gt;<br>
&gt; Do not proceed if hartid is invalid. Take this opprtunity to<br>
&gt; print appropriate error strings for different failure cases.<br>
&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" =
target=3D"_blank" rel=3D"noreferrer">atish.patra@wdc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/clocksource/riscv_timer.c | 13 ++++++++++---<br>
&gt;=C2=A0 1 file changed, 10 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/r=
iscv_timer.c<br>
&gt; index 39de6e49..4af4af47 100644<br>
&gt; --- a/drivers/clocksource/riscv_timer.c<br>
&gt; +++ b/drivers/clocksource/riscv_timer.c<br>
&gt; @@ -108,6 +108,8 @@ static int __init riscv_timer_init_dt(struct devic=
e_node *n)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int cpuid, hartid, error;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hartid =3D riscv_of_processor_hartid(n);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (hartid &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return hartid;<br>
<br>
This seems like it&#39;s just hiding a bug somewhere else.=C2=A0 We should =
at least put <br>
out a WARN here, as I&#39;m not sure the error will propagate anywhere usef=
ul.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">We need separate DT node for riscv_timer. The riscv_timer is nothing but=
 SOC timer accessed via rdtime and SBI calls. It can be viewed as one devic=
e. In fact, this is how it&#39;s done in ARM/ARM64.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cpuid =3D riscv_hartid_to_cpuid(hartid);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpuid !=3D smp_processor_id())<br>
&gt; @@ -115,14 +117,19 @@ static int __init riscv_timer_init_dt(struct dev=
ice_node *n)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* This should be called only for boot cpu *=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_timebase =3D riscv_timebase_frequency(=
n);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0clocksource_register_hz(&amp;riscv_clocksource, r=
iscv_timebase);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D clocksource_register_hz(&amp;riscv_cloc=
ksource, riscv_timebase);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;RISCV ti=
mer register failed [%d] for cpu =3D [%d]\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 error, cpuid);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D cpuhp_setup_state(CPUHP_AP_RISCV_T=
IMER_STARTING,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;clockevents/riscv/timer:starting&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 riscv_timer_starting_cpu, riscv_timer_dying_cpu);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;RISCV ti=
mer register failed [%d] for cpu =3D [%d]\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 error, cpuid);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;cpu hp s=
etup state failed for RISCV timer [%d]\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 error);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt;=C2=A0 }<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Regards,</div><div dir=3D"auto">Anup</div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000572ee4057c71d76e--
