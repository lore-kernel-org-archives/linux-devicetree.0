Return-Path: <SRS0=PLfz=WB=gmail.com=harinikatakamlinux@kernel.org>
MIME-Version: 1.0
Sender: harinikatakamlinux@gmail.com
In-Reply-To: <CAFcVECLUNYRC-iZbKvvq2_XMLfXg7E10yAU5J_8GaEB3ExWRxg@mail.gmail.com>
References: <1564566033-676-1-git-send-email-harini.katakam@xilinx.com>
 <1564566033-676-2-git-send-email-harini.katakam@xilinx.com>
 <20190804145633.GB6800@lunn.ch> <CAFcVECL6cvCjeo+fn1NDyMDZyZXDrWyhD9djvcVXiLVLiLgGeA@mail.gmail.com>
 <20190805132045.GC24275@lunn.ch> <CAFcVECLUNYRC-iZbKvvq2_XMLfXg7E10yAU5J_8GaEB3ExWRxg@mail.gmail.com>
From: Harini Katakam <harinik@xilinx.com>
Date: Mon, 5 Aug 2019 21:40:58 +0530
Message-ID: <CAFcVECLVHY5X=wctxVqRqDTDyG7Zavkt5ui4RtFBLP8g8MW1SA@mail.gmail.com>
Subject: [RFC PATCH 1/2] dt-bindings: net: macb: Add new property for PS SGMII only
Content-Type: multipart/alternative; boundary="00000000000028ca29058f60f42c"
To: Andrew Lunn <andrew@lunn.ch>
Cc: Harini Katakam <harini.katakam@xilinx.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, David Miller <davem@davemloft.net>, Claudiu Beznea <claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--00000000000028ca29058f60f42c
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Mon, Aug 5, 2019 at 8:06 PM Harini Katakam <harinik@xilinx.com> wrote:
>
> Hi Andrew,
>
> On Mon, Aug 5, 2019 at 7:00 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Mon, Aug 05, 2019 at 11:45:05AM +0530, Harini Katakam wrote:
> > > Hi Andrew,
> > >
> > > On Sun, Aug 4, 2019 at 8:26 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > >
> > > > On Wed, Jul 31, 2019 at 03:10:32PM +0530, Harini Katakam wrote:
> > > > > Add a new property to indicate when PS SGMII is used with NO
> > > > > external PHY on board.
> > > >
> > > > Hi Harini
> > > >
> > > > What exactly is you use case? Are you connecting to a Ethernet
switch?
> > > > To an SFP cage with a copper module?
> > >
> > > Yes, an SFP cage is the common HW target for this patch.
> >
> > Hi Harini
> >
> > So you have a copper PHY in the SFP cage. It will talk SGMII
> > signalling to your PS SGMII. When that signalling is complete i would
> > expect the MAC to raise an interrupt, just as if the SGMII PHY was
> > soldered on the board. So i don't see why you need this polling?
> >
>
> Thanks. Sorry, I overlooked this interrupt. Let me try that.

Even with the use of this interrupt, the link status actions (link print and
netif ops) will still be required. And also the need for macb_open to
proceed without phydev. Could you please let me know if that is acceptable
to patch or if there's a cleaner way to
report this link status?

Regards,
Harini

--00000000000028ca29058f60f42c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,<br><br>On Mon, Aug 5, 2019 at 8:06 PM Harini Katakam &lt;<a href=
=3D"mailto:harinik@xilinx.com">harinik@xilinx.com</a>&gt; wrote:<br>&gt;<br=
>&gt; Hi Andrew,<br>&gt;<br>&gt; On Mon, Aug 5, 2019 at 7:00 PM Andrew Lunn=
 &lt;<a href=3D"mailto:andrew@lunn.ch">andrew@lunn.ch</a>&gt; wrote:<br>&gt=
; &gt;<br>&gt; &gt; On Mon, Aug 05, 2019 at 11:45:05AM +0530, Harini Kataka=
m wrote:<br>&gt; &gt; &gt; Hi Andrew,<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; O=
n Sun, Aug 4, 2019 at 8:26 PM Andrew Lunn &lt;<a href=3D"mailto:andrew@lunn=
.ch">andrew@lunn.ch</a>&gt; wrote:<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt;=
 &gt; On Wed, Jul 31, 2019 at 03:10:32PM +0530, Harini Katakam wrote:<br>&g=
t; &gt; &gt; &gt; &gt; Add a new property to indicate when PS SGMII is used=
 with NO<br>&gt; &gt; &gt; &gt; &gt; external PHY on board.<br>&gt; &gt; &g=
t; &gt;<br>&gt; &gt; &gt; &gt; Hi Harini<br>&gt; &gt; &gt; &gt;<br>&gt; &gt=
; &gt; &gt; What exactly is you use case? Are you connecting to a Ethernet =
switch?<br>&gt; &gt; &gt; &gt; To an SFP cage with a copper module?<br>&gt;=
 &gt; &gt;<br>&gt; &gt; &gt; Yes, an SFP cage is the common HW target for t=
his patch.<br>&gt; &gt;<br>&gt; &gt; Hi Harini<br>&gt; &gt;<br>&gt; &gt; So=
 you have a copper PHY in the SFP cage. It will talk SGMII<br>&gt; &gt; sig=
nalling to your PS SGMII. When that signalling is complete i would<br>&gt; =
&gt; expect the MAC to raise an interrupt, just as if the SGMII PHY was<br>=
&gt; &gt; soldered on the board. So i don&#39;t see why you need this polli=
ng?<br>&gt; &gt;<br>&gt;<br>&gt; Thanks. Sorry, I overlooked this interrupt=
. Let me try that.<br><br>Even with the use of this interrupt, the link sta=
tus actions (link print and<br>netif ops) will still be required. And also =
the need for macb_open to<br>proceed without phydev. Could you please let m=
e know if that is acceptable<br>to patch or if there&#39;s a cleaner way to=
<br>report this link status?<br><br>Regards,<br>Harini<br>

--00000000000028ca29058f60f42c--
