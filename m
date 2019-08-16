From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 12/13] net: phy: adin: add ethtool get_stats support
Date: Fri, 16 Aug 2019 15:24:34 +0200
Message-ID: <20190816132434.GB307@lunn.ch>
References: <20190816131011.23264-1-alexandru.ardelean@analog.com>
 <20190816131011.23264-13-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190816131011.23264-13-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Aug 16, 2019 at 04:10:10PM +0300, Alexandru Ardelean wrote:
> This change implements retrieving all the error counters from the PHY.
> 
> The counters require that the RxErrCnt register (0x0014) be read first,
> after which copies of the counters are latched into the registers. This
> ensures that all registers read after RxErrCnt are synchronized at the
> moment that they are read.
> 
> The counter values need to be accumulated by the driver, as each time that
> RxErrCnt is read, the values that are latched are the ones that have
> incremented from the last read.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
 
Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
