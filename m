From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 5/7] dt-bindings: net: Add clock handle to Broadcom
 iProc mdio mux
Date: Sat, 28 Jul 2018 23:15:26 +0200
Message-ID: <20180728211526.GE4792@lunn.ch>
References: <1532726613-6483-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532726613-6483-6-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532726613-6483-6-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 27, 2018 at 02:23:31PM -0700, Arun Parameswaran wrote:
> Add clock phandle, of the core clock driving the mdio block, as an
> optional property to the Broadcom iProc mdio mux.
> 
> The clock, when specified, will be used to setup the rate adjust registers
> in the mdio to derrive the mdio's operating frequency.
> 
> Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
