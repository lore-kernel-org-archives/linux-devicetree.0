From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 0/7] Add clock config and pm support to bcm iProc mdio
 mux
Date: Sat, 28 Jul 2018 23:32:33 +0200
Message-ID: <20180728213233.GH4792@lunn.ch>
References: <1532726613-6483-1-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532726613-6483-1-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 27, 2018 at 02:23:26PM -0700, Arun Parameswaran wrote:
> Hi,
> The patchset is based on David Miller's "net-next" repo.
> 
> The patchset extends the Broadcom iProc mdio mux to add support for
> suspend/resume and the ability to configure the internal clock
> divider. The patchset also sets the scan control register to
> disable external master access.

Hi Arun

It would be good to modify the .dtsi files to make use of the new
clock properties.

      Andrew
