From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/3] ARM: dts: NSP: Enable SFP on bcm958625hr
Date: Mon, 27 Aug 2018 23:31:53 +0200
Message-ID: <20180827213153.GQ27483@lunn.ch>
References: <20180827200344.16158-1-f.fainelli@gmail.com>
 <20180827200344.16158-2-f.fainelli@gmail.com>
 <20180827203500.GN27483@lunn.ch>
 <4a0e7b46-f7b6-3e9a-5f67-8160537482c8@gmail.com>
 <20180827210916.GP27483@lunn.ch>
 <cd82f8a8-ddd2-dda9-95ad-38265fa406c9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cd82f8a8-ddd2-dda9-95ad-38265fa406c9@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, rmk+kernel@armlinux.org.uk
List-Id: devicetree@vger.kernel.org

> > Hi Florian
> > 
> > I didn't need anything like this for the mv88e6xxx. I had patches
> > merged in -rc1 to make SFF work connected to the mv88e6390. The DT
> > change was not merged, but it is here:
> > 
> > https://patchwork.ozlabs.org/patch/955635/
> > 
> > +					port@9 {
> > +						reg = <9>;
> > +						label = "sff2";
> > +						phy-mode = "sgmii";
> > +						managed = "in-band-status";
> 
> 						^=====
> 
> Yes that is what I was missing, thanks Andrew! Still not 100% sure why
> having a "sfp" phandle is not enough, but I suppose there are
> problematic cases like the ZII Devel Rev. B where we have a SFF and we
> are not able to auto-negotiate the fiber connection.

ZII Devel Rev. B is actually broken, should not work, but does
somehow. The SFF 3 and 4 are connected to switch ports which cannot do
1000Base-X. They are using something like SGMII. So the link partner
needs to be very forgiving. But it happens that the link partners i'm
testing against are forgiving. SFF 1 and 2 are generally not
populated. If they are, i think you need to remove a resistor, to make
them work. But they are then connected to a switch port which does use
1000Base-X.

Now, since ZII devel B is technically broken, i would not be too
unhappy if "sfp" phandle implies managed = "in-band-status" by
default, so long as we can still use fixed-link somehow.

	 Andrew
