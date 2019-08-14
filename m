From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 04/14] net: phy: adin: add {write,read}_mmd hooks
Date: Wed, 14 Aug 2019 10:49:32 -0700
Message-ID: <31a0cd12-8a0e-5c50-6cc4-043cb8950352@gmail.com>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-5-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812112350.15242-5-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, hkallweit1@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org



On 8/12/2019 4:23 AM, Alexandru Ardelean wrote:
> Both ADIN1200 & ADIN1300 support Clause 45 access for some registers.
> The Extended Management Interface (EMI) registers are accessible via both
> Clause 45 (at register MDIO_MMD_VEND1) and using Clause 22.
> 
> The Clause 22 access for MMD regs differs from the standard one defined by
> 802.3. The ADIN PHYs  use registers ExtRegPtr (0x0010) and ExtRegData
> (0x0011) to access Clause 45 & EMI registers.
> 
> The indirect access is done via the following mechanism (for both R/W):
> 1. Write the address of the register in the ExtRegPtr
> 2. Read/write the value of the register via reg ExtRegData
> 
> This mechanism is needed to manage configuration of chip settings and to
> access EEE registers via Clause 22.
> 
> Since Clause 45 access will likely never be used, it is not implemented via
> this hook.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
