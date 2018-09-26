From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: fsl: Fix SPI bus warnings
Date: Wed, 26 Sep 2018 17:00:37 +0800
Message-ID: <20180926090036.GB26692@dragon>
References: <20180913181245.25484-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180913181245.25484-5-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 13, 2018 at 01:12:29PM -0500, Rob Herring wrote:
> dtc has new checks for SPI buses. Fix the warnings in node names and
> unit-addresses.
> 
> There's over 100 warnings for FSL boards, a few examples:
> 
> arch/arm/boot/dts/imx28-duckbill-2-spi.dtb: Warning (spi_bus_bridge): /apb@80000000/apbh@80000000/ssp@80014000: node name for SPI buses should be 'spi'
> arch/arm/boot/dts/imx53-ppd.dtb: Warning (spi_bus_bridge): /soc/aips@50000000/spba@50000000/ecspi@50010000: node name for SPI buses should be 'spi'
> arch/arm/boot/dts/imx6dl-colibri-eval-v3.dtb: Warning (spi_bus_reg): /soc/aips-bus@2000000/spba-bus@2000000/spi@2014000/mcp251x@1: SPI bus unit address format error, expected "0"
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Li Yang <leoyang.li@nxp.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, thanks.
