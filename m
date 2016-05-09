Return-Path: <noltari@gmail.com>
Date: Mon, 9 May 2016 12:01:21 +0000 (UTC)
From: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <256BE4660FB03085.33070B6A-E0AC-4643-92B8-4FD874210CD9@mail.outlook.com>
In-Reply-To: <565CE85A.3080904@roeck-us.net>
References: <5650BFD6.5030700@simon.arlott.org.uk>
 <CAOiHx=k0Aa+qrBT1J7_cQaQRxndBmwsgSgi3x0eJOYTAy6Zq7Q@mail.gmail.com>
 <5653612A.4050309@simon.arlott.org.uk> <565361AF.20400@simon.arlott.org.uk>
 <70d031ae4c3aa29888d77b64686c39e7e7eaae92@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <5654E67A.9060800@gmail.com> <5657886F.3090908@simon.arlott.org.uk>
 <alpine.DEB.2.11.1511270926580.3572@nanos>
 <56599D73.7040801@simon.arlott.org.uk> <565CE85A.3080904@roeck-us.net>
Subject: Re: [PATCH (v5) 3/11] MIPS: bmips: Add bcm6345-l2-timer interrupt
 controller
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_6478_1867642369.1462795281243"
To: Guenter Roeck <linux@roeck-us.net>, Simon Arlott <simon@fire.lp0.eu>, Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Kumar Gala <galak@codeaurora.org>, Kevin Cernekee <cernekee@gmail.com>, MIPS Mailing List <linux-mips@linux-mips.org>, Wim Van Sebroeck <wim@iguana.be>, Miguel Gaio <miguel.gaio@efixo.com>, Marc Zyngier <marc.zyngier@arm.com>, Jonas Gorski <jogo@openwrt.org>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Maxime Bizon <mbizon@freebox.fr>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-watchdog@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>
List-ID: <devicetree@vger.kernel.org>

------=_Part_6478_1867642369.1462795281243
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Guenter,
Are there any other issues preventing this patches from being merged?
Regards,=C3=81lvaro.
    _____________________________
From: Guenter Roeck <linux@roeck-us.net>
Sent: martes, diciembre 1, 2015 1:23 a. m.
Subject: Re: [PATCH (v5) 3/11] MIPS: bmips: Add bcm6345-l2-timer interrupt =
controller
To: Simon Arlott <simon@fire.lp0.eu>, Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux Kernel Mailing List <linux-ke=
rnel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainell=
i <f.fainelli@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kev=
in Cernekee <cernekee@gmail.com>, MIPS Mailing List <linux-mips@linux-mips.=
org>, Kumar Gala <galak@codeaurora.org>, Miguel Gaio <miguel.gaio@efixo.com=
>, Jonas Gorski <jogo@openwrt.org>, Marc Zyngier <marc.zyngier@arm.com>, Pa=
wel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>,  <devicetr=
ee@vger.kernel.org>, Maxime Bizon <mbizon@freebox.fr>, Wim Van Sebroeck <wi=
m@iguana.be>,  <linux-watchdog@vger.kernel.org>, Jason Cooper <jason@lakeda=
emon.net>


On 11/28/2015 04:26 AM, Simon Arlott wrote:
> Add the BCM6345/BCM6318 timer as an interrupt controller so that it can b=
e
> used by the watchdog to warn that its timer will expire soon.
>
> Support for clocksource/clockevents is not implemented as the timer
> interrupt is not per CPU (except on the BCM6318) and the MIPS clock is
> better. This could be added later if required without changing the device
> tree binding.
>
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>

Hi Simon,

can you please re-send the entire series, with all Acked-by:/Reviewed-by:
tags as appropriate ?

Thanks,
Guenter





 =20
------=_Part_6478_1867642369.1462795281243
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable


    <div id=3D"compose" contenteditable=3D"true" aria-label=3D"Cuerpo del m=
ensaje" style=3D"padding-left: 16px; padding-right: 16px; padding-bottom: 8=
px;"><div>Hello Guenter,</div><div><br></div><div>Are there any other issue=
s preventing this patches from being merged?</div><div><br></div><div>Regar=
ds,</div><div>=C3=81lvaro.</div></div>
    <div class=3D"gmail_quote">_____________________________<br>From: Guent=
er Roeck &lt;<a dir=3D"ltr" href=3D"mailto:linux@roeck-us.net" x-apple-data=
-detectors=3D"true" x-apple-data-detectors-type=3D"link" x-apple-data-detec=
tors-result=3D"0">linux@roeck-us.net</a>&gt;<br>Sent: martes, diciembre 1, =
2015 1:23 a. m.<br>Subject: Re: [PATCH (v5) 3/11] MIPS: bmips: Add bcm6345-=
l2-timer interrupt controller<br>To: Simon Arlott &lt;<a dir=3D"ltr" href=
=3D"mailto:simon@fire.lp0.eu" x-apple-data-detectors=3D"true" x-apple-data-=
detectors-type=3D"link" x-apple-data-detectors-result=3D"5">simon@fire.lp0.=
eu</a>&gt;, Thomas Gleixner &lt;<a dir=3D"ltr" href=3D"mailto:tglx@linutron=
ix.de" x-apple-data-detectors=3D"true" x-apple-data-detectors-type=3D"link"=
 x-apple-data-detectors-result=3D"6">tglx@linutronix.de</a>&gt;<br>Cc: Ralf=
 Baechle &lt;<a dir=3D"ltr" href=3D"mailto:ralf@linux-mips.org" x-apple-dat=
a-detectors=3D"true" x-apple-data-detectors-type=3D"link" x-apple-data-dete=
ctors-result=3D"8">ralf@linux-mips.org</a>&gt;, Linux Kernel Mailing List &=
lt;<a dir=3D"ltr" href=3D"mailto:linux-kernel@vger.kernel.org" x-apple-data=
-detectors=3D"true" x-apple-data-detectors-type=3D"link" x-apple-data-detec=
tors-result=3D"9">linux-kernel@vger.kernel.org</a>&gt;, Mark Rutland &lt;<a=
 dir=3D"ltr" href=3D"mailto:mark.rutland@arm.com" x-apple-data-detectors=3D=
"true" x-apple-data-detectors-type=3D"link" x-apple-data-detectors-result=
=3D"10">mark.rutland@arm.com</a>&gt;, Florian Fainelli &lt;<a dir=3D"ltr" h=
ref=3D"mailto:f.fainelli@gmail.com" x-apple-data-detectors=3D"true" x-apple=
-data-detectors-type=3D"link" x-apple-data-detectors-result=3D"11">f.fainel=
li@gmail.com</a>&gt;, Ian Campbell &lt;<a dir=3D"ltr" href=3D"mailto:ijc+de=
vicetree@hellion.org.uk" x-apple-data-detectors=3D"true" x-apple-data-detec=
tors-type=3D"link" x-apple-data-detectors-result=3D"12">ijc+devicetree@hell=
ion.org.uk</a>&gt;, Kevin Cernekee &lt;<a dir=3D"ltr" href=3D"mailto:cernek=
ee@gmail.com" x-apple-data-detectors=3D"true" x-apple-data-detectors-type=
=3D"link" x-apple-data-detectors-result=3D"13">cernekee@gmail.com</a>&gt;, =
MIPS Mailing List &lt;<a dir=3D"ltr" href=3D"mailto:linux-mips@linux-mips.o=
rg" x-apple-data-detectors=3D"true" x-apple-data-detectors-type=3D"link" x-=
apple-data-detectors-result=3D"14">linux-mips@linux-mips.org</a>&gt;, Kumar=
 Gala &lt;<a dir=3D"ltr" href=3D"mailto:galak@codeaurora.org" x-apple-data-=
detectors=3D"true" x-apple-data-detectors-type=3D"link" x-apple-data-detect=
ors-result=3D"15">galak@codeaurora.org</a>&gt;, Miguel Gaio &lt;<a dir=3D"l=
tr" href=3D"mailto:miguel.gaio@efixo.com" x-apple-data-detectors=3D"true" x=
-apple-data-detectors-type=3D"link" x-apple-data-detectors-result=3D"16">mi=
guel.gaio@efixo.com</a>&gt;, Jonas Gorski &lt;<a dir=3D"ltr" href=3D"mailto=
:jogo@openwrt.org" x-apple-data-detectors=3D"true" x-apple-data-detectors-t=
ype=3D"link" x-apple-data-detectors-result=3D"17">jogo@openwrt.org</a>&gt;,=
 Marc Zyngier &lt;<a dir=3D"ltr" href=3D"mailto:marc.zyngier@arm.com" x-app=
le-data-detectors=3D"true" x-apple-data-detectors-type=3D"link" x-apple-dat=
a-detectors-result=3D"18">marc.zyngier@arm.com</a>&gt;, Pawel Moll &lt;<a d=
ir=3D"ltr" href=3D"mailto:pawel.moll@arm.com" x-apple-data-detectors=3D"tru=
e" x-apple-data-detectors-type=3D"link" x-apple-data-detectors-result=3D"19=
">pawel.moll@arm.com</a>&gt;, Rob Herring &lt;<a dir=3D"ltr" href=3D"mailto=
:robh+dt@kernel.org" x-apple-data-detectors=3D"true" x-apple-data-detectors=
-type=3D"link" x-apple-data-detectors-result=3D"20">robh+dt@kernel.org</a>&=
gt;,  &lt;<a dir=3D"ltr" href=3D"mailto:devicetree@vger.kernel.org" x-apple=
-data-detectors=3D"true" x-apple-data-detectors-type=3D"link" x-apple-data-=
detectors-result=3D"21">devicetree@vger.kernel.org</a>&gt;, Maxime Bizon &l=
t;<a dir=3D"ltr" href=3D"mailto:mbizon@freebox.fr" x-apple-data-detectors=
=3D"true" x-apple-data-detectors-type=3D"link" x-apple-data-detectors-resul=
t=3D"22">mbizon@freebox.fr</a>&gt;, Wim Van Sebroeck &lt;<a dir=3D"ltr" hre=
f=3D"mailto:wim@iguana.be" x-apple-data-detectors=3D"true" x-apple-data-det=
ectors-type=3D"link" x-apple-data-detectors-result=3D"23">wim@iguana.be</a>=
&gt;,  &lt;<a dir=3D"ltr" href=3D"mailto:linux-watchdog@vger.kernel.org" x-=
apple-data-detectors=3D"true" x-apple-data-detectors-type=3D"link" x-apple-=
data-detectors-result=3D"24">linux-watchdog@vger.kernel.org</a>&gt;, Jason =
Cooper &lt;<a dir=3D"ltr" href=3D"mailto:jason@lakedaemon.net" x-apple-data=
-detectors=3D"true" x-apple-data-detectors-type=3D"link" x-apple-data-detec=
tors-result=3D"25">jason@lakedaemon.net</a>&gt;<br><br><br>On 11/28/2015 04=
:26 AM, Simon Arlott wrote:<br>&gt; Add the BCM6345/BCM6318 timer as an int=
errupt controller so that it can be<br>&gt; used by the watchdog to warn th=
at its timer will expire soon.<br>&gt;<br>&gt; Support for clocksource/cloc=
kevents is not implemented as the timer<br>&gt; interrupt is not per CPU (e=
xcept on the BCM6318) and the MIPS clock is<br>&gt; better. This could be a=
dded later if required without changing the device<br>&gt; tree binding.<br=
>&gt;<br>&gt; Signed-off-by: Simon Arlott &lt;<a dir=3D"ltr" href=3D"mailto=
:simon@fire.lp0.eu" x-apple-data-detectors=3D"true" x-apple-data-detectors-=
type=3D"link" x-apple-data-detectors-result=3D"28">simon@fire.lp0.eu</a>&gt=
;<br><br>Hi Simon,<br><br>can you please re-send the entire series, with al=
l Acked-by:/Reviewed-by:<br>tags as appropriate ?<br><br>Thanks,<br>Guenter=
<br><br><br><br><br></div>
 =20
------=_Part_6478_1867642369.1462795281243--
