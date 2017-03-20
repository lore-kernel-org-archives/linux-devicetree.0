From: jacopo <jacopo@jmondi.org>
Subject: Re: [PATCH 4/7] arm: dts: r7s72100: Add pin controller node
Date: Mon, 20 Mar 2017 14:47:55 +0100
Message-ID: <20170320134755.GB30223@w540>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487610788-6939-5-git-send-email-jacopo+renesas@jmondi.org>
 <3dd69ef5-e8a4-b69c-b4fa-1be6ba777cfa@jmondi.org>
 <SG2PR06MB1165DCCA724AD6A8325862668A280@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdVdiMWNq1or9JgzAKfWXsDg1VD9ehG6U=E_snes04Y1Mg@mail.gmail.com>
 <SG2PR06MB1165E8FAE15523F7D3EC83718A2B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165E8FAE15523F7D3EC83718A2B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris, Geert,

On Fri, Mar 03, 2017 at 01:24:51PM +0000, Chris Brandt wrote:
> Hi Geert,
> 
> On Friday, March 03, 2017, Geert Uytterhoeven wrote:
> > > Is it possible to change the number of port pins in the board dts file?
> > > For example:
> > >   RZ/A1H: P5_0 - P5_10
> > >   RZ/A1L: P5_0 - P5_16
> > 
> > That's 17 pins, not 16?
> 
> Oops, I meant P5_15
> 
> Looking at the parts, here are the differences:
> 
> RZ/A1H    RZ/A1L
> ------------------
> P2_0:15   P2_0:9
> P4_0:15   P4_0:7
> P5_0:10   P5_0:15
> P7_0:15   P7_0:11
> P9_0:7    P9_0:5
> P10_0:15  none
> P11_0:15  none
> 
> > > So, in a rza1l-board.dts file I would put:
> > >
> > > &port5 {
> > >         gpio-ranges = <&pinctrl 0 80 16>;
> > > }
> > >
> > > Will this work?
> > 
> > Yes, overriding should work. But the number of pins is an SoC-property,
> > not
> > a board-property?
> 
> True, but I am trying to figure out how to solve this locally and not make
> it an upstream problem.
> 
> 
> > Are the differences between RZ/A1H and RZ/A1L just the number of pins?
> 
> Yes/No.
> 
> Internally, the IP blocks are the same, and located at the same register
> addresses, but come out to different port pins due to the RZ/A1L having smaller
> packages.
> 
> Also, the L has less channels than the H.
> For example:
>  QSPI: H=2, L=1
>   LCD: H=2, L=1
>  SCIF: H=8, L=5
>   CAN: H=5, L=2
> 
> Of course there is some IP that only comes in the H.
> 
> This is why I didn't want to associate "names" with the pins in a pfc driver.
> I just wanted the board DT to assign a pin to a 'function number'.
> 
> 
> 
> > If yes, you could use a hierarchical DTS structure:
> > 
> > rza1h-<board>.dts:
> > 
> >     #include "rza1h.dtsi"
> > 
> >     // board specifics here
> > 
> > rza1l-<board>.dts:
> > 
> >     #include "rza1l.dtsi"
> > 
> >     // board specifics here
> > 
> > rza1h.dtsi:
> > 
> >     #include "rza.dtsi"  // r7s72100.dtsi?
> > 
> >     // base SoC overrides
> >     &port5 {
> >         gpio-ranges = <&pinctrl 0 80 11>;
> >     }
> > 
> > rza1l.dtsi:
> > 
> >     #include "rza.dtsi"  // r7s72100.dtsi?
> > 
> >     // base SoC overrides
> >     &port5 {
> >         gpio-ranges = <&pinctrl 0 80 16>;
> >     }
> > 
> > Actual naming of DTS files TBD.
> 
> OK, so just put the pin differences in the two files. That's a good idea. But,
> then that's 2 more files to add upstream.
> As the RZ/A series continues, they might keep doing this kind of thing, so I
> don't want to get into the habit of adding more and more DT files.
> 
> # I wish there was some type of if-else syntax in Device Tree so in the
> board file I could just say:
> 
> / {
> 	model = "RSKRZA1";
> 	compatible = "renesas,rskrza1", "renesas,r7s72100";
> 
> 	variant = "rza1l";
> 
> 
> > We could also decide to not have rza1h.dtsi, and assume the base dtsi is
> > for
> > RZ/A1H.
> 
> Honestly, I'm fine with RZ/A1H being the flagship upstream SoC since it is a
> superset of all the peripherals in RZ/A1M,/A1L,/A1LU,/A1LC. Meaning, this small
> difference can be handled in a simple board file addition.
> 
> I was thinking I was going to post some DT examples on eLinux.org anyway, so one of
> them would just be this RZ/A1L fix.
> 

If we do all agree on having RZ/A1H upstream and let differences
between SoCs to be handled in the BSP/downstream board files, I'll send
v2 targeting that specific SoC only

Thanks
   j

> Cheers
> 
> Chris
> 
