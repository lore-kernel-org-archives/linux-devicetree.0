From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: ls1021: Fix SGMII PCS link remaining
 down after PHY disconnect
Date: Sun, 21 Apr 2019 15:59:41 +0800
Message-ID: <20190421075939.GE19962@dragon>
References: <20190411232315.19588-1-olteanv@gmail.com>
 <20190411232315.19588-2-olteanv@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190411232315.19588-2-olteanv@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Oltean <olteanv@gmail.com>
Cc: leoyang.li@nxp.com, claudiu.manoil@nxp.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 02:23:15AM +0300, Vladimir Oltean wrote:
> Each eTSEC MAC has its own TBI (SGMII) PCS and private MDIO bus.
> But due to a DTS oversight, both SGMII-compatible MACs of the LS1021 SoC
> are pointing towards the same internal PCS. Therefore nobody is
> controlling the internal PCS of eTSEC0.
> 
> Upon initial ndo_open, the SGMII link is ok by virtue of U-boot
> initialization. But upon an ifdown/ifup sequence, the code path from
> ndo_open -> init_phy -> gfar_configure_serdes does not get executed for
> the PCS of eTSEC0 (and is executed twice for MAC eTSEC1). So the SGMII
> link remains down for eTSEC0. On the LS1021A-TWR board, to signal this
> failure condition, the PHY driver keeps printing
> '803x_aneg_done: SGMII link is not ok'.
> 
> Fixes: 055223d4d22d ("ARM: dts: ls1021a: Enable the eTSEC ports on QDS and TWR")
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Claudiu Manoil <claudiu.manoil@nxp.com>

To get it land as fix a bit easier, I squashed both patches into one
(with a little edit on commit log), and applied it.

Shawn
