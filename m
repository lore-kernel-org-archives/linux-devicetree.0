From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 08/14] net: phy: adin: add support MDI/MDIX/Auto-MDI
 selection
Date: Wed, 14 Aug 2019 10:54:25 -0700
Message-ID: <ff2c2af9-fc13-e10a-896c-3ede55346203@gmail.com>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-9-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812112350.15242-9-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, hkallweit1@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org



On 8/12/2019 4:23 AM, Alexandru Ardelean wrote:
> The ADIN PHYs support automatic MDI/MDIX negotiation. By default this is
> disabled, so this is enabled at `config_init`.
> 
> This is controlled via the PHY Control 1 register.
> The supported modes are:
>   1. Manual MDI
>   2. Manual MDIX
>   3. Auto MDIX - prefer MDIX
>   4. Auto MDIX - prefer MDI
> 
> The phydev mdix & mdix_ctrl fields include modes 3 & 4 into a single
> auto-mode. So, the default mode this driver enables is 4 when Auto-MDI mode
> is used.
> 
> When detecting MDI/MDIX mode, a combination of the PHY Control 1 register
> and PHY Status 1 register is used to determine the correct MDI/MDIX mode.
> 
> If Auto-MDI mode is not set, then the manual MDI/MDIX mode is returned.
> If Auto-MDI mode is set, then MDIX mode is returned differs from the
> preferred MDI/MDIX mode.
> This covers all cases where:
>   1. MDI preferred  & Pair01Swapped   == MDIX
>   2. MDIX preferred & Pair01Swapped   == MDI
>   3. MDI preferred  & ! Pair01Swapped == MDIX
>   4. MDIX preferred & ! Pair01Swapped == MDI
> 
> The preferred MDI/MDIX mode is not configured via SW, but can be configured
> via HW pins. Note that the `Pair01Swapped` is the Green-Yellow physical
> pairs.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
