From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 6/7] net: phy: Add support to configure clock in
 Broadcom iProc mdio mux
Date: Mon, 30 Jul 2018 20:04:04 +0200
Message-ID: <20180730180404.GH2983@lunn.ch>
References: <1532726613-6483-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532726613-6483-7-git-send-email-arun.parameswaran@broadcom.com>
 <20180728212224.GF4792@lunn.ch>
 <d19bb673-9088-bbee-ce9f-f2a4d8f404bf@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d19bb673-9088-bbee-ce9f-f2a4d8f404bf@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

> > Hi Arun
> > 
> > There is a devm_mdiobus_alloc() which could make the cleanup on error
> > simple.
> > 
> Should I do this as a separate patch ?

A separate patch is easier to review. And if something breaks, a git
bisect gives you a better idea what actually broke it, if you have
lots of small patches.

     Andrew
