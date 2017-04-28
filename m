From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v5 10/10] arm: dts: genmai: Add ethernet pin group
Date: Fri, 28 Apr 2017 07:22:09 +0200
Message-ID: <20170428052208.GF18349@verge.net.au>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-11-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdVHh_40pup1G-1qohS+wEYCFEn6jvOTCnYideQWMxSVLw@mail.gmail.com>
 <SG2PR06MB1165D46E83254B1757C790498A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165D46E83254B1757C790498A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 27, 2017 at 10:48:45AM +0000, Chris Brandt wrote:
> Hi Geert,
> 
> On Thursday, April 27, 2017, Geert Uytterhoeven wrote:
> > > +&ether {
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&ether_pins>;
> > > +
> > > +       status = "okay";
> > > +
> > > +       renesas,no-ether-link;
> > > +       phy-handle = <&phy0>;
> > > +       phy0: ethernet-phy@0 {
> > > +               reg = <0>;
> > 
> > Shouldn't the interrupt (connected to P1_15) be described?
> 
> 
> That interrupt pin from the PHY is not used. It did not need to be connected.

So things are fine as above or should I expect to see v6?
