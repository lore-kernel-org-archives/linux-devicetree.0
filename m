From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 7/7] net: phy: Add pm support for scan ctrl register to
 bcm mdio mux
Date: Thu, 26 Jul 2018 21:36:34 +0200
Message-ID: <20180726193634.GM10686@lunn.ch>
References: <1532630184-29450-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532630184-29450-8-git-send-email-arun.parameswaran@broadcom.com>
 <20180726192050.GJ10686@lunn.ch>
 <170a4731-b091-aef4-2d66-2950114e41fc@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <170a4731-b091-aef4-2d66-2950114e41fc@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 12:33:05PM -0700, Arun Parameswaran wrote:
> 
> 
> On 18-07-26 12:20 PM, Andrew Lunn wrote:
> > On Thu, Jul 26, 2018 at 11:36:24AM -0700, Arun Parameswaran wrote:
> >> Add support for saving and restoring the 'scan control' register
> >> in the Broadcom iProc mdio mux driver.
> > 
> > Hi Arun
> > 
> > I don't see anything setting this register. So why is it necessary to
> > save it over suspend/resume?
> > 
> >      Andrew
> > 
> Hi Andrew
> In the Omega SoC (only), this register was defaulted incorrectly (to use
> a test mode) by the hardware. So we added the setup of the register to
> the early bootloader (ATF).
> 
> We still need to restore this register while resuming from sleep.

Hi Arun

It is better to not rely on the bootloader and have the driver do it.
That makes it easier for people to swap to alternative bootloaders.

     Andrew
