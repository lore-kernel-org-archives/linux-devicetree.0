From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] dt-bindings: document renesas-ostm timer
Date: Mon, 16 Jan 2017 11:20:40 +0100
Message-ID: <20170116102039.GA2104@verge.net.au>
References: <20170112185952.2780-1-chris.brandt@renesas.com>
 <20170112185952.2780-2-chris.brandt@renesas.com>
 <CAMuHMdX_hx2M8Q4y7gptJvad4cbb+M54DZVCmbhunKuk4esbGA@mail.gmail.com>
 <SG2PR06MB1165BA49D82D9C0835DC0FB38A7B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165BA49D82D9C0835DC0FB38A7B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 14, 2017 at 03:30:36AM +0000, Chris Brandt wrote:
> Hi Geert,
> 
> Thank you for your review.
> 
> 
> On Friday, January 13, 2017, Geert Uytterhoeven wrote:
> > > +The OSTM comes with 2 independent channels.
> > > +We will use the first channel (OSTM0) as a free running clocksource
> > > +and the second channel (OSTM1) as a interrupt driven clock event.
> > > +
> > > +Additionally we will use the clocksource channel (OTSM0) for the
> > > +system schedule timer sched_clock().
> > 
> > The above two sentences are software policy, not hardware description.
> > Hence they do not belong in the DT bindings document.
> > You can move them to the commit description, though.
> 
> OK.
> 
> 
> > > +Required Properties:
> > > +
> > > +  - compatible: must be one or more of the following:
> > > +    - "renesas,ostm-r7s72100" for the r7s72100 OSTM
> > 
> > Please use "renesas,r7s72100-ostm" instead, to match current practices.
> 
> If I look at the current r7s72100.dtsi:
> 
> compatible = "renesas,r7s72100-cpg-clocks", "renesas,rz-cpg-clocks";
> compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
> compatible = "renesas,scif-r7s72100", "renesas,scif";
> compatible = "renesas,rspi-r7s72100", "renesas,rspi-rz";
> compatible = "renesas,riic-r7s72100", "renesas,riic-rz";
> compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
> compatible = "renesas,mmcif-r7s72100", "renesas,sh-mmcif";
> compatible = "renesas,sdhi-r7s72100";
> 
> Is "renesas,xxx-r7s7210" the old way, and "renesas,r7s72100-xxx" is the new way??

Yes. Early on things were done in a somewhat ad-hoc manner.
We have now settled on renesas,r7s72100-xxx as requested by the DT
maintainers.

...
