Return-Path: <SRS0=W0ze=OA=verge.net.au=horms@kernel.org>
Date: Wed, 21 Nov 2018 11:09:43 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH  1/4] dt-bindings: rtc: pcf85363: Document pcf85263
 real-time clock
Message-ID: <20181121100937.7savcuxtlxzjm6ld@verge.net.au>
References: <1542626108-61344-1-git-send-email-biju.das@bp.renesas.com>
 <1542626108-61344-2-git-send-email-biju.das@bp.renesas.com>
 <20181121100452.f4vyzuol2r6bozza@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181121100452.f4vyzuol2r6bozza@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 21, 2018 at 11:04:52AM +0100, Simon Horman wrote:
> On Mon, Nov 19, 2018 at 11:15:05AM +0000, Biju Das wrote:
> > This patch adds binding for NXP pcf85263 real-time clock. pcf85263 rtc is
> > compatible with pcf85363 rtc except that pcf85363 has 64 bytes additional
> > RAM.
> 
> How about this:
> 
> This patch adds binding for the NXP pcf85263 real-time clock.
> 
> The pcf85263 RTC is compatible with the pcf85363 RTC. The difference
> between the parts is except that the pcf85363 has 64 bytes more RAM.

The pcf85263 anRTC is compatible with the pcf85363 RTC.

The difference between the pcf85263 and pcf85363 RTS is that the latter has
64 bytes more RAM. This renders them incompatible from a DT point of view.

> 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/rtc/pcf85363.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > index 76fdabc..94adc1c 100644
> > --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > @@ -1,8 +1,8 @@
> > -NXP PCF85363 Real Time Clock
> > +NXP PCF85263/PCF85363 Real Time Clock
> >  ============================
> >  
> >  Required properties:
> > -- compatible: Should contain "nxp,pcf85363".
> > +- compatible: Should contain "nxp,pcf85263" or "nxp,pcf85363".
> >  - reg: I2C address for chip.
> >  
> >  Optional properties:
> > -- 
> > 2.7.4
> > 
> 
