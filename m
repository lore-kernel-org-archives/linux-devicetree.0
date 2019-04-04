From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v3 4/4] net: phy: meson-gxl: clean-up gxl variant
 driver
Date: Thu, 4 Apr 2019 09:33:17 -0700
Message-ID: <e043e430-362e-1d5e-af43-a95ec2bd27d2@gmail.com>
References: <20190404131147.31156-1-jbrunet@baylibre.com>
 <20190404131147.31156-5-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404131147.31156-5-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/4/19 6:11 AM, Jerome Brunet wrote:
> The purpose of this change is to align the gxl and g12a driver
> declaration.
> 
> Like on the g12a variant, remove genphy_aneg_done() from the driver
> declaration as the net phy framework will default to it anyway.
> 
> Also, the gxl phy id should be an exact match as well, so let's change
> this and use the macro provided.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
