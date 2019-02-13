From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 3/3] enetc: Add ENETC PF level external MDIO
 support
Date: Wed, 13 Feb 2019 19:13:23 +0100
Message-ID: <20190213181323.GA708@lunn.ch>
References: <1550055743-15542-1-git-send-email-claudiu.manoil@nxp.com>
 <1550055743-15542-4-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550055743-15542-4-git-send-email-claudiu.manoil@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, alexandru.marginean@nxp.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2019 at 01:02:23PM +0200, Claudiu Manoil wrote:
> Each ENETC PF has its own MDIO interface, the corresponding
> MDIO registers are mapped in the ENETC's Port register block.
> The current patch adds a driver for these PF level MDIO buses,
> so that each PF can manage directly its own external link.
> 
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/Makefile     |   3 +-
>  drivers/net/ethernet/freescale/enetc/enetc_mdio.c | 196 ++++++++++++++++++++++
>  drivers/net/ethernet/freescale/enetc/enetc_pf.c   |  13 ++
>  drivers/net/ethernet/freescale/enetc/enetc_pf.h   |   6 +
>  4 files changed, 217 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/Makefile b/drivers/net/ethernet/freescale/enetc/Makefile
> index 6976602..7139e41 100644
> --- a/drivers/net/ethernet/freescale/enetc/Makefile
> +++ b/drivers/net/ethernet/freescale/enetc/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_FSL_ENETC) += fsl-enetc.o
> -fsl-enetc-$(CONFIG_FSL_ENETC) += enetc.o enetc_cbdr.o enetc_ethtool.o
> +fsl-enetc-$(CONFIG_FSL_ENETC) += enetc.o enetc_cbdr.o enetc_ethtool.o \
> +				 enetc_mdio.o
>  fsl-enetc-$(CONFIG_PCI_IOV) += enetc_msg.o
>  fsl-enetc-objs := enetc_pf.o $(fsl-enetc-y)
>  
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> new file mode 100644
> index 0000000..e71b4fd
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/* Copyright 2019 NXP */
> +
> +#include <linux/mdio.h>
> +#include <linux/of_mdio.h>
> +
> +#include "enetc_pf.h"
> +
> +struct enetc_mdio_regs {
> +	u32	mdio_cfg;	/* MDIO configuration and status */
> +	u32	mdio_ctl;	/* MDIO control */
> +	u32	mdio_data;	/* MDIO data */
> +	u32	mdio_addr;	/* MDIO address */
> +};
> +
> +#define bus_to_enetc_regs(bus)	(struct enetc_mdio_regs __iomem *)((bus)->priv)
> +
> +#define ENETC_MDIO_REG_OFFSET	0x1c00
> +#define ENETC_MDC_DIV		258
> +#define MDIO_CFG_CLKDIV(x)	((((x) >> 1) & 0xff) << 8)
> +#define MDIO_CFG_BSY		BIT(0)
> +#define MDIO_CFG_RD_ER		BIT(1)
> +#define MDIO_CFG_ENC		BIT(6)
> +#define MDIO_CFG_NEG		BIT(23)
> +#define MDIO_CTL_DEV_ADDR(x)	((x) & 0x1f)
> +#define MDIO_CTL_PORT_ADDR(x)	(((x) & 0x1f) << 5)
> +#define MDIO_CTL_READ		BIT(15)
> +#define MDIO_DATA(x)		((x) & 0xffff)
> +
> +#define TIMEOUT	1000
> +static int enetc_wait_complete(struct device *dev,
> +			       struct enetc_mdio_regs __iomem *regs)
> +{
> +	unsigned int timeout;
> +
> +	timeout = TIMEOUT;
> +	while ((enetc_rd_reg(&regs->mdio_cfg) & MDIO_CFG_BSY) && timeout) {
> +		cpu_relax();
> +		timeout--;
> +	}
> +
> +	if (!timeout) {
> +		dev_err(dev, "timeout waiting for bus to be free\n");
> +		return -ETIMEDOUT;
> +	}

Hi Claudiu

readx_poll_timeout()

> +
> +	return 0;
> +}
> +
> +static int enetc_mdio_write(struct mii_bus *bus, int phy_id, int regnum,
> +			    u16 value)
> +{
> +	struct enetc_mdio_regs __iomem *regs = bus_to_enetc_regs(bus);
> +	u32 mdio_ctl, mdio_cfg;
> +	u16 dev_addr;
> +	int ret;
> +
> +	mdio_cfg = MDIO_CFG_CLKDIV(ENETC_MDC_DIV) | MDIO_CFG_NEG;

What does MDIO_CFG_NEG mean?

> +	if (regnum & MII_ADDR_C45) {
> +		/* clause 45 */

Does the comment add anything useful?

> +		dev_addr = (regnum >> 16) & 0x1f;
> +		mdio_cfg |= MDIO_CFG_ENC;

Maybe MDIO_CFG_ENC could be called MDIO_CFG_C45? Assuming that is what
it actually means?

> +int enetc_mdio_probe(struct enetc_pf *pf)
> +{
> +	struct device *dev = &pf->si->pdev->dev;
> +	struct enetc_mdio_regs __iomem *regs;
> +	struct mii_bus *bus;
> +	int ret;
> +
> +	bus = mdiobus_alloc_size(sizeof(regs));
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	bus->name = "Freescale ENETC MDIO Bus";
> +	bus->read = enetc_mdio_read;
> +	bus->write = enetc_mdio_write;
> +	bus->parent = dev;
> +	snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
> +
> +	/* store the enetc mdio base address for this bus */
> +	regs = pf->si->hw.port + ENETC_MDIO_REG_OFFSET;
> +	bus->priv = regs;
> +
> +	ret = of_mdiobus_register(bus, dev->of_node);

It is a good idea to have an mdio node which contains the list of
PHYs. You can get into odd situations if you don't do that.

>  
> @@ -770,12 +771,23 @@ static int enetc_of_get_phy(struct enetc_ndev_priv *priv)
>  		priv->phy_node = of_node_get(np);
>  	}
>  
> +	if (!of_phy_is_fixed_link(np)) {
> +		err = enetc_mdio_probe(pf);
> +		if (err) {
> +			dev_err(priv->dev, "MDIO bus registration failed\n");

enetc_mdio_probe() already prints an error message. You don't really
need both.

     Andrew
