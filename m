From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 04/14] net: phy: adin: add {write,read}_mmd hooks
Date: Mon, 12 Aug 2019 16:06:48 +0200
Message-ID: <20190812140648.GN14290@lunn.ch>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-5-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812112350.15242-5-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 02:23:40PM +0300, Alexandru Ardelean wrote:
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
