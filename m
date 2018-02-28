Return-Path: <SRS0=xkOi=FW=davemloft.net=davem@kernel.org>
Date: Wed, 28 Feb 2018 11:07:27 -0500 (EST)
Message-Id: <20180228.110727.2284257632086916194.davem@davemloft.net>
Subject: Re: [PATCH net-next 0/4] SFP updates
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180227155218.GT9418@n2100.armlinux.org.uk>
References: <20180227155218.GT9418@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
To: linux@armlinux.org.uk
Cc: andrew@lunn.ch, f.fainelli@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Russell King - ARM Linux <linux@armlinux.org.uk>
Date: Tue, 27 Feb 2018 15:52:18 +0000

> Included in this series are a further few updates for SFP support:
> 
> - Adding support for Fiberstore's non-standard BiDi modules operating
>   at 1310nm/1550nm wavelengths rather than the 1000BASE-BX standard of
>   1310nm/1490nm.
> - Adding support for negotiating the PHY interface mode with the MAC,
>   so that modules supporting faster speeds and Gigabit ethernet work
>   with Gigabit-only MACs.
> - Adding support for high power (>1W) SFP modules.

Series applied, thanks Russell.
