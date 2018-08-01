From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 7/8] net: phy: Add support to configure clock in
 Broadcom iProc mdio mux
Date: Wed, 1 Aug 2018 21:23:14 +0100
Message-ID: <20180801202313.GH30658@n2100.armlinux.org.uk>
References: <1533146186-8374-1-git-send-email-arun.parameswaran@broadcom.com>
 <1533146186-8374-8-git-send-email-arun.parameswaran@broadcom.com>
 <0cc6db4f-7008-0ad3-58d7-9e93060f152f@gmail.com>
 <20180801184659.GG30658@n2100.armlinux.org.uk>
 <9af7e7a3-54d4-8802-f64a-fc4f9c49c8b9@broadcom.com>
 <20180801200712.GD19257@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180801200712.GD19257@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Arun Parameswaran <arun.parameswaran@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 01, 2018 at 10:07:12PM +0200, Andrew Lunn wrote:
> You might want to consider adding clk_optional_get() and
> devm_clk_optional_get().

I think there's attempts to add such APIs but I don't think it's
trivial - it seems to require a _lot_ of discussion.

I think part of that is because of the quirky use of error codes.
If you look at clk_get(), it calls __of_clk_get_by_name() which
returns:

 -ENOENT if DT is disabled
 -ENOENT if the device has no DT node
 -EPROBE_DEFER if the lookup in DT succeeds but there's no registered
   clock
 -EINVAL if the device has a DT node but the lookup of the name
   failed (in otherwords, the optional clock was omitted)
 -ENOENT if the clocks = property has not enough clocks for the
    clock-names property
 -ENOMEM if we fail to allocate the clk
 -ENOENT if __clk_get() fails

or any other error code returned via of_clk_provider's ->get() method.

The use of -EINVAL, one of the most common error codes, makes it
difficult to be sure that the clock is not specified in DT.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 13.8Mbps down 630kbps up
According to speedtest.net: 13Mbps down 490kbps up
