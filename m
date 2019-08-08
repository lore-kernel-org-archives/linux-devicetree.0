From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 05/15] net: phy: adin: add {write,read}_mmd hooks
Date: Thu, 8 Aug 2019 17:35:14 +0200
Message-ID: <20190808153514.GE27917@lunn.ch>
References: <20190808123026.17382-1-alexandru.ardelean@analog.com>
 <20190808123026.17382-6-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190808123026.17382-6-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 08, 2019 at 03:30:16PM +0300, Alexandru Ardelean wrote:
> Both ADIN1200 & ADIN1300 support Clause 45 access.
> The Extended Management Interface (EMI) registers are accessible via both
> Clause 45 (at register MDIO_MMD_VEND1) and using Clause 22.
> 
> However, the Clause 22 MMD access operations differ from the implementation
> in the kernel, in the sense that it uses registers ExtRegPtr (0x10) &
> ExtRegData (0x11) to access Clause 45 & EMI registers.

It is not that they differ from what the kernel supports. Its that
they differ from what the Standard says they should use. These
registers are defined in 802.3, part of C22, and this hardware
implements the standard incorrectly.

	   Andrew
