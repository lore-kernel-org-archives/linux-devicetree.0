From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 09/14] net: phy: adin: add EEE translation layer from
 Clause 45 to Clause 22
Date: Wed, 14 Aug 2019 10:55:17 -0700
Message-ID: <14ef4f7c-74d9-f8ce-a146-5c5f8777d5ed@gmail.com>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-10-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812112350.15242-10-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, hkallweit1@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org



On 8/12/2019 4:23 AM, Alexandru Ardelean wrote:
> The ADIN1200 & ADIN1300 PHYs support EEE by using standard Clause 45 access
> to access MMD registers for EEE.
> 
> The EEE register addresses (when using Clause 22) are available at
> different addresses (than Clause 45), and since accessing these regs (via
> Clause 22) needs a special mechanism, a translation table is required to
> convert these addresses.
> 
> For Clause 45, this is not needed since the driver will likely never use
> this access mode.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
