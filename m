From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC PATCH 1/2] dt-bindings: net: macb: Add new property for PS
 SGMII only
Date: Mon, 5 Aug 2019 15:20:45 +0200
Message-ID: <20190805132045.GC24275@lunn.ch>
References: <1564566033-676-1-git-send-email-harini.katakam@xilinx.com>
 <1564566033-676-2-git-send-email-harini.katakam@xilinx.com>
 <20190804145633.GB6800@lunn.ch>
 <CAFcVECL6cvCjeo+fn1NDyMDZyZXDrWyhD9djvcVXiLVLiLgGeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFcVECL6cvCjeo+fn1NDyMDZyZXDrWyhD9djvcVXiLVLiLgGeA@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Harini Katakam <harinik@xilinx.com>
Cc: Harini Katakam <harini.katakam@xilinx.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, David Miller <davem@davemloft.net>, Claudiu Beznea <claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 11:45:05AM +0530, Harini Katakam wrote:
> Hi Andrew,
> 
> On Sun, Aug 4, 2019 at 8:26 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Wed, Jul 31, 2019 at 03:10:32PM +0530, Harini Katakam wrote:
> > > Add a new property to indicate when PS SGMII is used with NO
> > > external PHY on board.
> >
> > Hi Harini
> >
> > What exactly is you use case? Are you connecting to a Ethernet switch?
> > To an SFP cage with a copper module?
> 
> Yes, an SFP cage is the common HW target for this patch.

Hi Harini

So you have a copper PHY in the SFP cage. It will talk SGMII
signalling to your PS SGMII. When that signalling is complete i would
expect the MAC to raise an interrupt, just as if the SGMII PHY was
soldered on the board. So i don't see why you need this polling?

       Andrew
