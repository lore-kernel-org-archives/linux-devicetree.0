From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 11/14] net: phy: adin: implement Energy Detect
 Powerdown mode
Date: Wed, 14 Aug 2019 10:57:19 -0700
Message-ID: <f13feaee-0bad-a774-5527-296b6f74c91b@gmail.com>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-12-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812112350.15242-12-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, hkallweit1@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org



On 8/12/2019 4:23 AM, Alexandru Ardelean wrote:
> The ADIN PHYs support Energy Detect Powerdown mode, which puts the PHY into
> a low power mode when there is no signal on the wire (typically cable
> unplugged).
> This behavior is enabled by default, but can be disabled via device
> property.

We could consider adding a PHY tunable, having this as a Device Tree
property amounts to putting a policy inside DT, which is frowned upon.

> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Other than that, the code looks fine:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
