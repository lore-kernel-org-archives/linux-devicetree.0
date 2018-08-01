From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 7/8] net: phy: Add support to configure clock in
 Broadcom iProc mdio mux
Date: Thu, 2 Aug 2018 00:18:09 +0200
Message-ID: <20180801221809.GH19257@lunn.ch>
References: <1533146186-8374-8-git-send-email-arun.parameswaran@broadcom.com>
 <0cc6db4f-7008-0ad3-58d7-9e93060f152f@gmail.com>
 <20180801184659.GG30658@n2100.armlinux.org.uk>
 <9af7e7a3-54d4-8802-f64a-fc4f9c49c8b9@broadcom.com>
 <20180801200712.GD19257@lunn.ch>
 <20180801202313.GH30658@n2100.armlinux.org.uk>
 <20180801203846.GE19257@lunn.ch>
 <8133c1f0-addc-5c48-7a6a-44b0d106c425@broadcom.com>
 <20180801215511.GG19257@lunn.ch>
 <af188f23-bbef-ed90-b42d-a680c07f3fd2@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <af188f23-bbef-ed90-b42d-a680c07f3fd2@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> > As Florian pointed out, the clk_ API is happy to take a NULL pointer
> > for a clock. So you don't need this last else.
> > 
> >     Andrew
> > 
> I do return with an error from the probe if the clk_prepare_enable() fails,
> so I was calling the prepare with a valid clock.

How many times do we need to say it?

NULL is a valid clock. 

int clk_prepare(struct clk *clk)
{
	if (!clk)
	   return 0;

	   return clk_core_prepare_lock(clk->core);
}

int clk_enable(struct clk *clk)
{
	if (!clk)
	   return 0;

	   return clk_core_enable_lock(clk->core);
}

clk_prepare_enable(NULL) returns 0, which is not an error.

	 Andrew
