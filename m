From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 07/15] net: phy: adin: make RGMII internal delays
 configurable
Date: Thu, 8 Aug 2019 17:40:55 +0200
Message-ID: <20190808154055.GG27917@lunn.ch>
References: <20190808123026.17382-1-alexandru.ardelean@analog.com>
 <20190808123026.17382-8-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190808123026.17382-8-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 08, 2019 at 03:30:18PM +0300, Alexandru Ardelean wrote:
> The internal delays for the RGMII are configurable for both RX & TX. This
> change adds support for configuring them via device-tree (or ACPI).
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
