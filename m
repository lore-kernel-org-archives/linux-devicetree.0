Return-Path: <qsyousef@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20151214014057.GM22783@voom.fritz.box>
References: <561E2BE6.2090807@imgtec.com>
	<5628BE00.4020106@imgtec.com>
	<20151022115551.GI3953@io.lakedaemon.net>
	<56684877.3020708@imgtec.com>
	<CAL_Jsq+yv1UnBhrR+x+DEA41yETVANY9_-5W0DSQJVEQ4+Mx_w@mail.gmail.com>
	<56695201.2070807@imgtec.com>
	<20151211003902.GE20139@voom.fritz.box>
	<566AA9DD.6040404@imgtec.com>
	<20151214014057.GM22783@voom.fritz.box>
Date: Thu, 17 Dec 2015 11:31:14 +0000
Message-ID: <CA+mqd+6Qbp9EsvT0-A7YUBLn7TeffzqWSbM9i+ZcKVWytt9rvA@mail.gmail.com>
Subject: Re: Generic DT binding for IPIs
From: Qais Yousef <qsyousef@gmail.com>
Content-Type: multipart/alternative; boundary=089e0111c0b642f36f0527165c8d
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Qais Yousef <qais.yousef@imgtec.com>, Rob Herring <robh+dt@kernel.org>, "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lisa Parratt <Lisa.Parratt@imgtec.com>
List-ID: <devicetree@vger.kernel.org>

--089e0111c0b642f36f0527165c8d
Content-Type: text/plain; charset=UTF-8

> > Maybe it would help to look at the new IPI reservation API?
> >
> >     https://lkml.org/lkml/2015/12/8/249
>
> Hmm.. not as much as I might have hoped.
>
> From the API, it looks like you're reserving IPIs to signal between
> different CPUs all of which are in Linux.  From your description here
> it sounds like the coproc is a separate specialized thing not running
> Linux (or at least, not the same Linux instance as the host OS which
> this device tree is for).

No the CPUs aren't only Linux CPUs. It should be any CPU that the interrupt
controller can talk to.
That CPU can be one of Linux CPUs, or a coproc.

> > I'm not sure I understood you completely but no, there's no translation
> > happening. When the IPI is allocated it would be routed
> > to the coproc. When the host wants to send a signal, it'll use the
allocated
> > hwirq value (indirectly via the virq) to write to a register, which will
> > cause an interrupt to be generated at the coproc.
>
> Where is this magic register located?  In the host cpu?  In the
> coproc?  In some special IPI controller?

The IPI controller. In my use case, the IPI controller is the same as the
interrupt controller used by Linux. Generally they don't have to be the
same though.

> So as noted above, I'm now sure that 'interrupts' is not the right
> thing.  I'm trying to understand the coprocs and the ipi mechanism a
> bit better to work out if there is something existing which would make
> sense, or if we do need something entirely new.

Let me know if I can help.

Thanks,
Qais

--089e0111c0b642f36f0527165c8d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>&gt; &gt; Maybe it would help to look =
at the new IPI reservation API?<br>&gt; &gt;<br>&gt; &gt; =C2=A0 =C2=A0 <a =
href=3D"https://lkml.org/lkml/2015/12/8/249">https://lkml.org/lkml/2015/12/=
8/249</a><br>&gt;<br>&gt; Hmm.. not as much as I might have hoped.<br>&gt;<=
br>&gt; From the API, it looks like you&#39;re reserving IPIs to signal bet=
ween<br>&gt; different CPUs all of which are in Linux.=C2=A0 From your desc=
ription here<br>&gt; it sounds like the coproc is a separate specialized th=
ing not running<br>&gt; Linux (or at least, not the same Linux instance as =
the host OS which<br>&gt; this device tree is for).<br><br></div>No the CPU=
s aren&#39;t only Linux CPUs. It should be any CPU that the interrupt contr=
oller can talk to.<br></div>That CPU can be one of Linux CPUs, or a coproc.=
<br></div></div><div><div><div><div><br>&gt; &gt; I&#39;m not sure I unders=
tood you completely but no, there&#39;s no translation<br>&gt; &gt; happeni=
ng. When the IPI is allocated it would be routed<br>&gt; &gt; to the coproc=
. When the host wants to send a signal, it&#39;ll use the allocated<br>&gt;=
 &gt; hwirq value (indirectly via the virq) to write to a register, which w=
ill<br>&gt; &gt; cause an interrupt to be generated at the coproc.<br>&gt;<=
br>&gt; Where is this magic register located?=C2=A0 In the host cpu?=C2=A0 =
In the<br>&gt; coproc?=C2=A0 In some special IPI controller?<br><br></div><=
div>The IPI controller. In my use case, the IPI controller is the same as t=
he interrupt controller used by Linux. Generally they don&#39;t have to be =
the same though.<br></div><div><br>&gt; So as noted above, I&#39;m now sure=
 that &#39;interrupts&#39; is not the right<br>&gt; thing.=C2=A0 I&#39;m tr=
ying to understand the coprocs and the ipi mechanism a<br>&gt; bit better t=
o work out if there is something existing which would make<br>&gt; sense, o=
r if we do need something entirely new.<br><br></div><div>Let me know if I =
can help.<br><br></div><div>Thanks,<br></div><div>Qais<br></div></div></div=
></div></div>

--089e0111c0b642f36f0527165c8d--
