From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 0/3] Add Broadcom Omega SoC internal switch and phy
Date: Tue, 7 Aug 2018 20:08:27 +0200
Message-ID: <20180807180827.GH18350@lunn.ch>
References: <1533661364-15381-1-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1533661364-15381-1-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 07, 2018 at 10:02:41AM -0700, Arun Parameswaran wrote:
> Hi,
> 
> The patchset is based on David Miller's "net-next" repo.
> 
> The patches add support for the Broadcom Omega SoC's internal ethernet
> switch and the internal gphy.
> 
> The internal ethernet switch in the Omega is a b53 srab based switch.
> The support for the switch is added to the b53 driver in the dsa
> framework.
> 
> The gphy support is added to the bcm7xxx driver.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
