Return-Path: <noamca@mellanox.com>
From: Noam Camus <noamca@mellanox.com>
Subject: Re: [PATCH v4 0/3] Add clockevet for timer-nps driver to NPS400 SoC
Date: Fri, 11 Nov 2016 03:28:05 +0000
Message-ID: <DB6PR0501MB251895F6D59CC9EB09CED516AABB0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
References: <1478454298-381-1-git-send-email-noamca@mellanox.com>
In-Reply-To: <1478454298-381-1-git-send-email-noamca@mellanox.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB6PR0501MB251895F6D59CC9EB09CED516AABB0DB6PR0501MB2518_"
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--_000_DB6PR0501MB251895F6D59CC9EB09CED516AABB0DB6PR0501MB2518_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please comment on this series


Noam

________________________________
From: Noam Camus <noamca@mellanox.com>
Sent: Sunday, November 6, 2016 7:44:55 PM
To: robh+dt@kernel.org; mark.rutland@arm.com; daniel.lezcano@linaro.org
Cc: tglx@linutronix.de; devicetree@vger.kernel.org; linux-kernel@vger.kerne=
l.org; Noam Camus
Subject: [PATCH v4 0/3] Add clockevet for timer-nps driver to NPS400 SoC

From: Noam Camus <noamca@mellanox.com>

Change log
---
V3 --> V4
Main changes are [Thanks for the review]:
Fix many typos at log [Daniel]
Add handling for bad return values [Daniel and Thomas]
Replace use of internal irqchip pointers with existing IRQ API [Thomas]
Provide interrupt handler (percpu) with dev_id equal to evt [Thomas]
Fix passing *clk by reference to nps_get_timer_clk() [Daniel]

V2 --> V3
Apply Rob Herring comment about backword compatibility

V1 --> V2
Apply Daniel Lezcano comments:
        CLOCKSOURCE_OF_DECLARE return value
        update hotplug callbacks usage
        squash of 2 first commits.
In this version I created new commit to serve as preperation for adding clo=
ckevents.
This way the last patch is more readable with clockevent content.
---

In first version of this driver we supported clocksource for the NPS400.
The support for clockevent was taken from Synopsys ARC timer driver.
This was good for working with our simulator of NPS400.
However in NPS400 ASIC the timers behave differently than simulation.
The timers in ASIC are shared between all threads whithin a core
and hence need different driver to support this behaviour.

The idea of this design is that we got 16 HW threads per core
each represented at bimask in a shared register in this core.
So when thread wants that next clockevent expiration will produce
timer interrupt to itself the correspondance bit in this register
should be set.
So theoretically if all 16 bits are set then all HW threads will get
timer interrupt on next expiration of timer 0.

Note that we use Synopsys ARC design naming convention for the timers
where:
timer0 is used for clockevents
timer1 is used for clocksource.

Noam Camus (3):
  soc: Support for NPS HW scheduling
  clocksource: update "fn" at CLOCKSOURCE_OF_DECLARE() of nps400 timer
  clocksource: Add clockevent support to NPS400 driver

 .../bindings/timer/ezchip,nps400-timer.txt         |   15 --
 .../bindings/timer/ezchip,nps400-timer0.txt        |   17 ++
 .../bindings/timer/ezchip,nps400-timer1.txt        |   15 ++
 arch/arc/plat-eznps/include/plat/ctop.h            |    2 -
 drivers/clocksource/timer-nps.c                    |  264 ++++++++++++++++=
++--
 include/soc/nps/mtm.h                              |   59 +++++
 6 files changed, 335 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-t=
imer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-t=
imer0.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-t=
imer1.txt
 create mode 100644 include/soc/nps/mtm.h


--_000_DB6PR0501MB251895F6D59CC9EB09CED516AABB0DB6PR0501MB2518_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" style=3D"font-size:12pt; color:#000000; =
font-family:Calibri,Arial,Helvetica,sans-serif">
<p>Please comment on this series</p>
<p><br>
</p>
<p>Noam</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Noam Camus &lt;noam=
ca@mellanox.com&gt;<br>
<b>Sent:</b> Sunday, November 6, 2016 7:44:55 PM<br>
<b>To:</b> robh&#43;dt@kernel.org; mark.rutland@arm.com; daniel.lezcano@lin=
aro.org<br>
<b>Cc:</b> tglx@linutronix.de; devicetree@vger.kernel.org; linux-kernel@vge=
r.kernel.org; Noam Camus<br>
<b>Subject:</b> [PATCH v4 0/3] Add clockevet for timer-nps driver to NPS400=
 SoC</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">From: Noam Camus &lt;noamca@mellanox.com&gt;<br>
<br>
Change log<br>
---<br>
V3 --&gt; V4<br>
Main changes are [Thanks for the review]:<br>
Fix many typos at log [Daniel]<br>
Add handling for bad return values [Daniel and Thomas]<br>
Replace use of internal irqchip pointers with existing IRQ API [Thomas]<br>
Provide interrupt handler (percpu) with dev_id equal to evt [Thomas]<br>
Fix passing *clk by reference to nps_get_timer_clk() [Daniel]<br>
<br>
V2 --&gt; V3<br>
Apply Rob Herring comment about backword compatibility<br>
<br>
V1 --&gt; V2<br>
Apply Daniel Lezcano comments:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CLOCKSOURCE_OF_DECLARE return va=
lue<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update hotplug callbacks usage<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; squash of 2 first commits.<br>
In this version I created new commit to serve as preperation for adding clo=
ckevents.<br>
This way the last patch is more readable with clockevent content.<br>
---<br>
<br>
In first version of this driver we supported clocksource for the NPS400.<br=
>
The support for clockevent was taken from Synopsys ARC timer driver.<br>
This was good for working with our simulator of NPS400.<br>
However in NPS400 ASIC the timers behave differently than simulation.<br>
The timers in ASIC are shared between all threads whithin a core<br>
and hence need different driver to support this behaviour.<br>
<br>
The idea of this design is that we got 16 HW threads per core<br>
each represented at bimask in a shared register in this core.<br>
So when thread wants that next clockevent expiration will produce<br>
timer interrupt to itself the correspondance bit in this register<br>
should be set.<br>
So theoretically if all 16 bits are set then all HW threads will get<br>
timer interrupt on next expiration of timer 0.<br>
<br>
Note that we use Synopsys ARC design naming convention for the timers<br>
where:<br>
timer0 is used for clockevents<br>
timer1 is used for clocksource.<br>
<br>
Noam Camus (3):<br>
&nbsp; soc: Support for NPS HW scheduling<br>
&nbsp; clocksource: update &quot;fn&quot; at CLOCKSOURCE_OF_DECLARE() of np=
s400 timer<br>
&nbsp; clocksource: Add clockevent support to NPS400 driver<br>
<br>
&nbsp;.../bindings/timer/ezchip,nps400-timer.txt&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 15 --<br>
&nbsp;.../bindings/timer/ezchip,nps400-timer0.txt&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 17 &#43;&#43;<br>
&nbsp;.../bindings/timer/ezchip,nps400-timer1.txt&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 15 &#43;&#43;<br>
&nbsp;arch/arc/plat-eznps/include/plat/ctop.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 2 -<br>
&nbsp;drivers/clocksource/timer-nps.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 264 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;--<br>
&nbsp;include/soc/nps/mtm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 59 &#43;&=
#43;&#43;&#43;&#43;<br>
&nbsp;6 files changed, 335 insertions(&#43;), 37 deletions(-)<br>
&nbsp;delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps=
400-timer.txt<br>
&nbsp;create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps=
400-timer0.txt<br>
&nbsp;create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps=
400-timer1.txt<br>
&nbsp;create mode 100644 include/soc/nps/mtm.h<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_DB6PR0501MB251895F6D59CC9EB09CED516AABB0DB6PR0501MB2518_--
