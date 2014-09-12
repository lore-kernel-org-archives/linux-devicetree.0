Return-Path: <sonnyrao@google.com>
MIME-Version: 1.0
Sender: sonnyrao@google.com
In-Reply-To: <54123697.4070804@codeaurora.org>
References: <1410452204-7277-1-git-send-email-dianders@chromium.org>
 <20140911164710.GW6158@arm.com> <5411D528.4050605@arm.com>
 <CAD=FV=XMmizxJFPj0FEhJ7Gk4ZcQaUJDxf_Qq5kGKSvxDFVmzg@mail.gmail.com>
 <5411DA67.2040402@arm.com> <CAD=FV=UQfo4J3P4wGjOhQZQ5KXKgYAdjPsi1ykKZxQw-FwJz8w@mail.gmail.com>
 <5411DF5D.8060906@arm.com> <54123697.4070804@codeaurora.org>
From: Sonny Rao <sonnyrao@chromium.org>
Date: Thu, 11 Sep 2014 17:14:22 -0700
Message-ID: <CAPz6YkUTXU9_b2BU5QghKTHVTJ3ngVX9EOzsMWnjigtV9TioHw@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource: arch_timer: Allow the device tree to
 specify the physical timer
Content-Type: multipart/alternative; boundary=001a11c14792fbe3c20502d32b09
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Doug Anderson <dianders@chromium.org>, Will Deacon <Will.Deacon@arm.com>, "olof@lixom.net" <olof@lixom.net>, Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Christopher Covington <cov@codeaurora.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nathan Lynch <Nathan_Lynch@mentor.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a11c14792fbe3c20502d32b09
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 11, 2014 at 4:56 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> On 09/11/14 10:43, Marc Zyngier wrote:
> >>> If I was suicidal, I'd suggest you could pass a parameter to the
> command
> >>> line, interpreted by the timer code... But I since I'm not, let's
> >>> pretend I haven't said anything... ;-)
> >> I did this in the past (again, see Sonny's thread), but didn't
> >> consider myself knowledgeable to know if that was truly a good test:
> >>
> >>        asm volatile("mrc p15, 0, %0, c1, c1, 0" : "=r" (val));
> >>        pr_info("DOUG: val is %#010x", val);
> >>        val |= (1 << 2);
> >>        asm volatile("mcr p15, 0, %0, c1, c1, 0" : : "r" (val));
> >>        val = 0xffffffff;
> >>        asm volatile("mrc p15, 0, %0, c1, c1, 0" : "=r" (val));
> >>        pr_info("DOUG: val is %#010x", val);
> >>
> >> The idea being that if you can make modifications to the SCR register
> >> (and see your changes take effect) then you must be in secure mode.
> >> In my case the first printout was 0x0 and the second was 0x4.
> > The main issue is when you're *not* in secure mode. It is likely that
> > this will explode badly. This is why I suggested something that is set
> > by the bootloader (after all. it knows which mode it is booted in), and
> > that the timer driver can use when the CPU comes up.
>
> Where does this platform jump to when a CPU comes up? Is it
> rockchip_secondary_startup()? I wonder if that path could have this
> little bit of assembly to poke the cntvoff in monitor mode and then jump
> to secondary_startup()? Before we boot any secondary CPUs we could also
> read the cntvoff for CPU0 in the platform specific layer (where we know
> we're running in secure mode) and then use that value as the "reset"
> value for the secondaries. Or does this platform boot up in secure mode
> some times and non-secure mode other times?
>

Yes, In our case, with our firmware, we will go through some internal Rom
code and then jump to rockchip_secondary_startup, but I don't think it's
correct to force all users of this SoC to do it that way.  If there were a
reasonable way to determine for sure that we are in secure mode, then yes
we could do what you're suggesting, and I'd be happy to code that up.

I think the problem is that there isn't a great way to determine whether
we're in secure mode or not, and this is maybe by design?  I don't
particularly understand that design choice.  It would be nice to hear some
rationale from ARM folks.



>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> hosted by The Linux Foundation
>
>

--001a11c14792fbe3c20502d32b09
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Sep 11, 2014 at 4:56 PM, Stephen Boyd <span dir=3D"ltr">&lt;<a href=3D"=
mailto:sboyd@codeaurora.org" target=3D"_blank">sboyd@codeaurora.org</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 09/11/=
14 10:43, Marc Zyngier wrote:<br>
&gt;&gt;&gt; If I was suicidal, I&#39;d suggest you could pass a parameter =
to the command<br>
&gt;&gt;&gt; line, interpreted by the timer code... But I since I&#39;m not=
, let&#39;s<br>
&gt;&gt;&gt; pretend I haven&#39;t said anything... ;-)<br>
&gt;&gt; I did this in the past (again, see Sonny&#39;s thread), but didn&#=
39;t<br>
&gt;&gt; consider myself knowledgeable to know if that was truly a good tes=
t:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 asm volatile(&quot;mrc p15, 0, %0, c1, =
c1, 0&quot; : &quot;=3Dr&quot; (val));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info(&quot;DOUG: val is %#010x&quot;=
, val);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 val |=3D (1 &lt;&lt; 2);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 asm volatile(&quot;mcr p15, 0, %0, c1, =
c1, 0&quot; : : &quot;r&quot; (val));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0xffffffff;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 asm volatile(&quot;mrc p15, 0, %0, c1, =
c1, 0&quot; : &quot;=3Dr&quot; (val));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info(&quot;DOUG: val is %#010x&quot;=
, val);<br>
&gt;&gt;<br>
&gt;&gt; The idea being that if you can make modifications to the SCR regis=
ter<br>
&gt;&gt; (and see your changes take effect) then you must be in secure mode=
.<br>
&gt;&gt; In my case the first printout was 0x0 and the second was 0x4.<br>
&gt; The main issue is when you&#39;re *not* in secure mode. It is likely t=
hat<br>
&gt; this will explode badly. This is why I suggested something that is set=
<br>
&gt; by the bootloader (after all. it knows which mode it is booted in), an=
d<br>
&gt; that the timer driver can use when the CPU comes up.<br>
<br>
</span>Where does this platform jump to when a CPU comes up? Is it<br>
rockchip_secondary_startup()? I wonder if that path could have this<br>
little bit of assembly to poke the cntvoff in monitor mode and then jump<br=
>
to secondary_startup()? Before we boot any secondary CPUs we could also<br>
read the cntvoff for CPU0 in the platform specific layer (where we know<br>
we&#39;re running in secure mode) and then use that value as the &quot;rese=
t&quot;<br>
value for the secondaries. Or does this platform boot up in secure mode<br>
some times and non-secure mode other times?<br></blockquote><div><br></div>=
<div>Yes, In our case, with our firmware, we will go through some internal =
Rom code and then jump to rockchip_secondary_startup, but I don&#39;t think=
 it&#39;s correct to force all users of this SoC to do it that way. =C2=A0I=
f there were a reasonable way to determine for sure that we are in secure m=
ode, then yes we could do what you&#39;re suggesting, and I&#39;d be happy =
to code that up.</div><div><br></div><div>I think the problem is that there=
 isn&#39;t a great way to determine whether we&#39;re in secure mode or not=
, and this is maybe by design? =C2=A0I don&#39;t particularly understand th=
at design choice. =C2=A0It would be nice to hear some rationale from ARM fo=
lks.</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,<br>
hosted by The Linux Foundation<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11c14792fbe3c20502d32b09--
