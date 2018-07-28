From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 4/7] net: phy: Disable external master access in bcm
 mdio mux driver
Date: Sat, 28 Jul 2018 23:13:15 +0200
Message-ID: <20180728211315.GD4792@lunn.ch>
References: <1532726613-6483-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532726613-6483-5-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532726613-6483-5-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 27, 2018 at 02:23:30PM -0700, Arun Parameswaran wrote:
> Configure the scan control register in the Broadcom iProc
> mdio mux driver to disable access to external master.
> 
> In some SoC's, the scan control register defaults to an incorrect
> value.
> 
> Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
