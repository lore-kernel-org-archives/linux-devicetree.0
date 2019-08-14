From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 06/14] net: phy: adin: make RGMII internal delays
 configurable
Date: Wed, 14 Aug 2019 10:52:36 -0700
Message-ID: <b591cc5b-9511-2223-ae34-088eaec0ba03@gmail.com>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-7-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190812112350.15242-7-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, hkallweit1@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org



On 8/12/2019 4:23 AM, Alexandru Ardelean wrote:
> The internal delays for the RGMII are configurable for both RX & TX. This
> change adds support for configuring them via device-tree (or ACPI).
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
