From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 02/14] net: phy: adin: hook genphy_{suspend,resume}
 into the driver
Date: Wed, 14 Aug 2019 10:47:57 -0700
Message-ID: <0dcd91ae-16fe-ff94-0257-f5a7613c3d4a@gmail.com>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-3-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812112350.15242-3-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, hkallweit1@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org



On 8/12/2019 4:23 AM, Alexandru Ardelean wrote:
> The chip supports standard suspend/resume via BMCR reg.
> Hook these functions into the `adin` driver.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
