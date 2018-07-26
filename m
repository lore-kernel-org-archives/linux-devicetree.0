From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/7] net: phy: Fix the register offsets in Broadcom iProc
 mdio mux driver
Date: Thu, 26 Jul 2018 21:29:23 +0200
Message-ID: <20180726192923.GL10686@lunn.ch>
References: <1532630184-29450-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532630184-29450-3-git-send-email-arun.parameswaran@broadcom.com>
 <20180726190636.GG10686@lunn.ch>
 <6188441f-670d-7644-361b-7a5e8e06c9c2@broadcom.com>
 <eeaf777f-e0ea-fb41-5a5e-4ab42a35e10f@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <eeaf777f-e0ea-fb41-5a5e-4ab42a35e10f@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Arun Parameswaran <arun.parameswaran@broadcom.com>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 12:25:24PM -0700, Ray Jui wrote:
> 
> 
> On 7/26/2018 12:16 PM, Arun Parameswaran wrote:
> >
> >
> >On 18-07-26 12:06 PM, Andrew Lunn wrote:
> >>On Thu, Jul 26, 2018 at 11:36:19AM -0700, Arun Parameswaran wrote:
> >>>Modify the register offsets in the Broadcom iProc mdio mux to start
> >>>from the top of the register address space.
> >>>
> >>>Earlier the base address specified was from the middle of the block's
> >>>register space. The base address will now point to the start of the
> >>>mdio's address space. The offsets have been fixed to match this.
> >>
> >>Hi Arun
> >>
> >>Did you consider a change something like:
> >That looks good. I will make this change to the patch.
> >
> >Thanks
> >Arun
> 
> To make it backward compatible, then length of the resource also needs to be
> adjusted from 0x14 to 0x250 in the driver?
> 
> Otherwise you will end up accessing areas out of 0x14 defined in old DT that
> is not mapped?

struct resource {
       resource_size_t start;
       resource_size_t end;
       const char *name;
       unsigned long flags;
       unsigned long desc;
       struct resource *parent, *sibling, *child;
};

"end" suggests an address, not a length. But it would be good to look
deeper into the code to be sure.

       Andrew
