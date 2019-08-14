From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 05/14] net: phy: adin: configure RGMII/RMII/MII modes
 on config
Date: Wed, 14 Aug 2019 10:50:23 -0700
Message-ID: <ef79d47f-9d93-1c95-4359-cbd9a95b8964@gmail.com>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-6-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812112350.15242-6-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, hkallweit1@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org



On 8/12/2019 4:23 AM, Alexandru Ardelean wrote:
> The ADIN1300 chip supports RGMII, RMII & MII modes. Default (if
> unconfigured) is RGMII.
> This change adds support for configuring these modes via the device
> registers.
> 
> For RGMII with internal delays (modes RGMII_ID,RGMII_TXID, RGMII_RXID),
> the default delay is 2 ns. This can be configurable and will be done in
> a subsequent change.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
