From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 7/8] net: phy: Add support to configure clock in
 Broadcom iProc mdio mux
Date: Wed, 1 Aug 2018 22:07:12 +0200
Message-ID: <20180801200712.GD19257@lunn.ch>
References: <1533146186-8374-1-git-send-email-arun.parameswaran@broadcom.com>
 <1533146186-8374-8-git-send-email-arun.parameswaran@broadcom.com>
 <0cc6db4f-7008-0ad3-58d7-9e93060f152f@gmail.com>
 <20180801184659.GG30658@n2100.armlinux.org.uk>
 <9af7e7a3-54d4-8802-f64a-fc4f9c49c8b9@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9af7e7a3-54d4-8802-f64a-fc4f9c49c8b9@broadcom.com>
Sender: netdev-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> My intention was to proceed with probe if the clock is not found in the DT.
> If the clock is specified in the DT, make use of it.

You might want to look at what phy_optional_get() does.  If the phy
does not exist in DT, it does not return an error, but a NULL phy.
You can pass NULL to all the other calls generic phy_ calls. If there
is a real error, it returns it. That makes the driver code much
simpler.

You might want to consider adding clk_optional_get() and
devm_clk_optional_get().

	Andrew
