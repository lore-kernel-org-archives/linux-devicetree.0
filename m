From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 0/7] Add clock config and pm support to bcm iProc mdio mux
Date: Thu, 26 Jul 2018 20:52:46 +0200
Message-ID: <20180726185246.GE10686@lunn.ch>
References: <1532630184-29450-1-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532630184-29450-1-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 11:36:17AM -0700, Arun Parameswaran wrote:
> Hi,
> The patchset is based on David Miller's "net" repo.

Hi Arun

"net" is intended for bug fixes. This looks like new features, so
should be against net-next". Please read the netdev FAQ.

       Andrew
