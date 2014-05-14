Return-Path: <matthias.bgg@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2fe960fd-b145-42a8-ace2-e2cd3aaf0cdc@BN1AFFO11FD010.protection.gbl>
References: <1400087579-4250-1-git-send-email-matthias.bgg@gmail.com>
	<1400087579-4250-2-git-send-email-matthias.bgg@gmail.com>
	<2fe960fd-b145-42a8-ace2-e2cd3aaf0cdc@BN1AFFO11FD010.protection.gbl>
Date: Wed, 14 May 2014 20:03:13 +0200
Message-ID: <CABuKBeLarykODc1RbDY0RB_idJXRUCfgU6BfWqrxQnmChW1Czg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] clocksource: Add support for the Mediatek SoCs
From: Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: multipart/alternative; boundary=001a11355070802f9804f95ffee3
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Florian Vaussard <florian.vaussard@epfl.ch>, Kumar Gala <galak@codeaurora.org>, mark.rutland@arm.com, thierry.reding@gmail.com, linux-doc@vger.kernel.org, andrew@lunn.ch, tglx@linutronix.de, linux@arm.linux.org.uk, sboyd@codeaurora.org, ijc+devicetree@hellion.org.uk, daniel.lezcano@linaro.org, maxime.ripard@free-electrons.com, rdunlap@infradead.org, olof@lixom.net, robherring2@gmail.com, pawel.moll@arm.com, devicetree@vger.kernel.org, jason@lakedaemon.net, robh+dt@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org, sebastian.hesselbarth@gmail.com, silvio.fricke@gmail.com, linux-arm-kernel@lists.infradead.org, heiko.stuebner@bq.com, jic23@kernel.org, gregory.clement@free-electrons.com, marc.zyngier@arm.com
List-ID: <devicetree@vger.kernel.org>

--001a11355070802f9804f95ffee3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

El dia 14/05/2014 19:31, "S=C3=B6ren Brinkmann" <soren.brinkmann@xilinx.com=
> va
escriure:
>
> Hi Matthias,
>
> just a few suggestions below. Nothing serious.
>
> On Wed, 2014-05-14 at 07:12PM +0200, Matthias Brugger wrote:
> > This patch adds a clock source and clock event for the timer found
> > on the Mediatek SoCs.
> >
> > The Mediatek General Porpose Timer block provides five 32 bit timers an=
d
> > one 64 bit timer.
> >
> > Two 32 bit timers are used:
> > TIMER1: clock events supporting periodic and oneshot events
> > TIMER2: clock source configured as a free running counter
>
> It is pretty common, I think, to use the free running counter also as
> sched_clock. You probably want to look into this, but that's just a
> possible enhancement.

The timer block has also a 64 bit timer. I plan to have a look on this one
to use it as sched_clock.

But for now my priority is to get the serial console driver done.

>
> [...]
> > +static void __init mtk_timer_init(struct device_node *node)
> > +{
> > +     struct mtk_clock_event_device *evt;
> > +     struct resource res;
> > +     unsigned long rate =3D 0;
> > +     struct clk *clk;
> > +     int ret;
> > +     u32 val;
> > +
> > +     evt =3D kzalloc(sizeof(*evt), GFP_KERNEL);
> > +     if (!evt)
> > +             panic("Can't allocate mtk clock event driver struct");
>
> I'm not that sure about the A7s, but on Cortex-A9 there is also a global
> timer which can be used for timing. And there might be other timing
> options for this SOC too. Do you really want to panic?

Yes A7 has a arm local timer, but the problem is, that it is not working
with the SoC. It seems like a chip design error as I tried for quite a time
to get it working.

Thanks for your comments anyway.
>
>         S=C3=B6ren

--001a11355070802f9804f95ffee3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
El dia 14/05/2014 19:31, &quot;S=C3=B6ren Brinkmann&quot; &lt;<a href=3D"ma=
ilto:soren.brinkmann@xilinx.com">soren.brinkmann@xilinx.com</a>&gt; va escr=
iure:<br>
&gt;<br>
&gt; Hi Matthias,<br>
&gt;<br>
&gt; just a few suggestions below. Nothing serious.<br>
&gt;<br>
&gt; On Wed, 2014-05-14 at 07:12PM +0200, Matthias Brugger wrote:<br>
&gt; &gt; This patch adds a clock source and clock event for the timer foun=
d<br>
&gt; &gt; on the Mediatek SoCs.<br>
&gt; &gt;<br>
&gt; &gt; The Mediatek General Porpose Timer block provides five 32 bit tim=
ers and<br>
&gt; &gt; one 64 bit timer.<br>
&gt; &gt;<br>
&gt; &gt; Two 32 bit timers are used:<br>
&gt; &gt; TIMER1: clock events supporting periodic and oneshot events<br>
&gt; &gt; TIMER2: clock source configured as a free running counter<br>
&gt;<br>
&gt; It is pretty common, I think, to use the free running counter also as<=
br>
&gt; sched_clock. You probably want to look into this, but that&#39;s just =
a<br>
&gt; possible enhancement.</p>
<p dir=3D"ltr">The timer block has also a 64 bit timer. I plan to have a lo=
ok on this one to use it as sched_clock.</p>
<p dir=3D"ltr">But for now my priority is to get the serial console driver =
done.</p>
<p dir=3D"ltr">&gt;<br>
&gt; [...]<br>
&gt; &gt; +static void __init mtk_timer_init(struct device_node *node)<br>
&gt; &gt; +{<br>
&gt; &gt; + =C2=A0 =C2=A0 struct mtk_clock_event_device *evt;<br>
&gt; &gt; + =C2=A0 =C2=A0 struct resource res;<br>
&gt; &gt; + =C2=A0 =C2=A0 unsigned long rate =3D 0;<br>
&gt; &gt; + =C2=A0 =C2=A0 struct clk *clk;<br>
&gt; &gt; + =C2=A0 =C2=A0 int ret;<br>
&gt; &gt; + =C2=A0 =C2=A0 u32 val;<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 evt =3D kzalloc(sizeof(*evt), GFP_KERNEL);<br>
&gt; &gt; + =C2=A0 =C2=A0 if (!evt)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&quot;Can&#39;t=
 allocate mtk clock event driver struct&quot;);<br>
&gt;<br>
&gt; I&#39;m not that sure about the A7s, but on Cortex-A9 there is also a =
global<br>
&gt; timer which can be used for timing. And there might be other timing<br=
>
&gt; options for this SOC too. Do you really want to panic?</p>
<p dir=3D"ltr">Yes A7 has a arm local timer, but the problem is, that it is=
 not working with the SoC. It seems like a chip design error as I tried for=
 quite a time to get it working. </p>
<p dir=3D"ltr">Thanks for your comments anyway.<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 S=C3=B6ren<br>
</p>

--001a11355070802f9804f95ffee3--
