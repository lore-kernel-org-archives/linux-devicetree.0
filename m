From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 12/14] net: phy: adin: implement downshift
 configuration via phy-tunable
Date: Wed, 14 Aug 2019 10:58:10 -0700
Message-ID: <081d5898-40c5-54d8-f543-942a3518f36e@gmail.com>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-13-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812112350.15242-13-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, hkallweit1@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org



On 8/12/2019 4:23 AM, Alexandru Ardelean wrote:
> Down-speed auto-negotiation may not always be enabled, in which case the
> PHY won't down-shift to 100 or 10 during auto-negotiation.
> 
> This change enables downshift and configures the number of retries to
> default 4 (which is also in the datasheet
> 
> The downshift control mechanism can also be controlled via the phy-tunable
> interface (ETHTOOL_PHY_DOWNSHIFT control).
> 
> The change has been adapted from the Aquantia PHY driver.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
