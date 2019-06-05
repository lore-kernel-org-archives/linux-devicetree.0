From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx7d-sdb: Make SW2's voltage fixed
Date: Wed, 5 Jun 2019 17:17:01 +0800
Message-ID: <20190605091659.GM29853@dragon>
References: <20190529065056.27516-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190529065056.27516-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Wed, May 29, 2019 at 02:50:56PM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> On i.MX7D SDB board, SW2 supplies a lot of peripheral devices,
> its voltage should be fixed at 1.8V. The commit 43967d9b5a7c
> ("ARM: dts: imx7d-sdb: Assign corresponding power supply for LDOs")
> assigns SW2 as the supplier of vdd1p0d, and when its comsumers
> pcie-phy/mipi-phy try to set the vdd1p0d to 1.0V, regulator core
> will also set SW2 to its best(min) voltage to 1.5V, and it will
> lead to board reset.
> 
> This patch makes SW2's voltage fixed at 1.8V to avoid this issue.
> 
> Fixes: 43967d9b5a7c ("ARM: dts: imx7d-sdb: Assign corresponding power supply for LDOs")
> Reported-by: Leonard Crestez <leonard.crestez@nxp.com>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
