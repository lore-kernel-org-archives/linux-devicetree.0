From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 08/15] net: phy: adin: make RMII fifo depth
 configurable
Date: Thu, 8 Aug 2019 17:42:53 +0200
Message-ID: <20190808154253.GH27917@lunn.ch>
References: <20190808123026.17382-1-alexandru.ardelean@analog.com>
 <20190808123026.17382-9-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190808123026.17382-9-alexandru.ardelean@analog.com>
Sender: netdev-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 08, 2019 at 03:30:19PM +0300, Alexandru Ardelean wrote:
> The FIFO depth can be configured for the RMII mode. This change adds
> support for doing this via device-tree (or ACPI).
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
