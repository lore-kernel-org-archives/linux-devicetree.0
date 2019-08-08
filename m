From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 13/15] net: phy: adin: configure downshift on
 config_init
Date: Thu, 8 Aug 2019 21:38:40 +0200
Message-ID: <420c8e15-3361-a722-4ad1-3c448b1d3bc1@gmail.com>
References: <20190808123026.17382-1-alexandru.ardelean@analog.com>
 <20190808123026.17382-14-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808123026.17382-14-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On 08.08.2019 14:30, Alexandru Ardelean wrote:
> Down-speed auto-negotiation may not always be enabled, in which case the
> PHY won't down-shift to 100 or 10 during auto-negotiation.
> 
> This change enables downshift and configures the number of retries to
> default 8 (maximum supported value).
> 
> The change has been adapted from the Marvell PHY driver.
> 
Instead of a fixed downshift setting (like in the Marvell driver) you
may consider to implement the ethtool phy-tunable ETHTOOL_PHY_DOWNSHIFT.
See the Aquantia PHY driver for an example.
Then the user can configure whether he wants downshift and if yes after
how many retries.

> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  drivers/net/phy/adin.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
[...]

Heiner
