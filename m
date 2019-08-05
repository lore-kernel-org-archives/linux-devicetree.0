From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 02/16] net: phy: adin: hook genphy_{suspend,resume} into
 the driver
Date: Mon, 5 Aug 2019 16:17:07 +0200
Message-ID: <20190805141707.GI24275@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-3-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805165453.3989-3-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 07:54:39PM +0300, Alexandru Ardelean wrote:
> The chip supports standard suspend/resume via BMCR reg.
> Hook these functions into the `adin` driver.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
