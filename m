From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 23/36] media: imx: Add MIPI CSI-2 Receiver subdev driver
Date: Fri, 17 Feb 2017 15:16:10 +0100
Message-ID: <1487340970.3107.73.camel@pengutronix.de>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-24-git-send-email-steve_longerbeam@mentor.com>
 <1487328479.3107.21.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487328479.3107.21.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, 2017-02-17 at 11:47 +0100, Philipp Zabel wrote:
> On Wed, 2017-02-15 at 18:19 -0800, Steve Longerbeam wrote:
> > Adds MIPI CSI-2 Receiver subdev driver. This subdev is required
> > for sensors with a MIPI CSI2 interface.
> > 
> > Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> > ---
> >  drivers/staging/media/imx/Makefile         |   1 +
> >  drivers/staging/media/imx/imx6-mipi-csi2.c | 573 +++++++++++++++++++++++++++++
> >  2 files changed, 574 insertions(+)
> >  create mode 100644 drivers/staging/media/imx/imx6-mipi-csi2.c
> > 
> > diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> > index 878a126..3569625 100644
> > --- a/drivers/staging/media/imx/Makefile
> > +++ b/drivers/staging/media/imx/Makefile
> > @@ -9,3 +9,4 @@ obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-vdic.o
> >  obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-ic.o
> >  
> >  obj-$(CONFIG_VIDEO_IMX_CSI) += imx-media-csi.o
> > +obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
> > diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > new file mode 100644
> > index 0000000..23dca80
> > --- /dev/null
> > +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > @@ -0,0 +1,573 @@
> > +/*
> > + * MIPI CSI-2 Receiver Subdev for Freescale i.MX6 SOC.
> > + *
> > + * Copyright (c) 2012-2017 Mentor Graphics Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + */
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/irq.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-of.h>
> > +#include <media/v4l2-subdev.h>
> > +#include "imx-media.h"
> > +
> > +/*
> > + * there must be 5 pads: 1 input pad from sensor, and
> > + * the 4 virtual channel output pads
> > + */
> > +#define CSI2_SINK_PAD       0
> > +#define CSI2_NUM_SINK_PADS  1
> > +#define CSI2_NUM_SRC_PADS   4
> > +#define CSI2_NUM_PADS       5
> > +
> > +struct csi2_dev {
> > +	struct device          *dev;
> > +	struct v4l2_subdev      sd;
> > +	struct media_pad       pad[CSI2_NUM_PADS];
> > +	struct v4l2_mbus_framefmt format_mbus;
> > +	struct clk             *dphy_clk;
> > +	struct clk             *cfg_clk;
> > +	struct clk             *pix_clk; /* what is this? */
> > +	void __iomem           *base;
> > +	struct v4l2_of_bus_mipi_csi2 bus;
> > +	bool                    on;
> > +	bool                    stream_on;
> > +	bool                    src_linked;
> > +	bool                    sink_linked[CSI2_NUM_SRC_PADS];
> > +};
> > +
> > +#define DEVICE_NAME "imx6-mipi-csi2"
> > +
> > +/* Register offsets */
> > +#define CSI2_VERSION            0x000
> > +#define CSI2_N_LANES            0x004
> > +#define CSI2_PHY_SHUTDOWNZ      0x008
> > +#define CSI2_DPHY_RSTZ          0x00c
> > +#define CSI2_RESETN             0x010
> > +#define CSI2_PHY_STATE          0x014
> > +#define PHY_STOPSTATEDATA_BIT   4
> > +#define PHY_STOPSTATEDATA(n)    BIT(PHY_STOPSTATEDATA_BIT + (n))
> > +#define PHY_RXCLKACTIVEHS       BIT(8)
> > +#define PHY_RXULPSCLKNOT        BIT(9)
> > +#define PHY_STOPSTATECLK        BIT(10)
> > +#define CSI2_DATA_IDS_1         0x018
> > +#define CSI2_DATA_IDS_2         0x01c
> > +#define CSI2_ERR1               0x020
> > +#define CSI2_ERR2               0x024
> > +#define CSI2_MSK1               0x028
> > +#define CSI2_MSK2               0x02c
> > +#define CSI2_PHY_TST_CTRL0      0x030
> > +#define PHY_TESTCLR		BIT(0)
> > +#define PHY_TESTCLK		BIT(1)
> > +#define CSI2_PHY_TST_CTRL1      0x034
> > +#define PHY_TESTEN		BIT(16)
> > +#define CSI2_SFT_RESET          0xf00
> > +
> > +static inline struct csi2_dev *sd_to_dev(struct v4l2_subdev *sdev)
> > +{
> > +	return container_of(sdev, struct csi2_dev, sd);
> > +}
> > +
> > +static void csi2_enable(struct csi2_dev *csi2, bool enable)
> > +{
> > +	if (enable) {
> > +		writel(0x1, csi2->base + CSI2_PHY_SHUTDOWNZ);
> > +		writel(0x1, csi2->base + CSI2_DPHY_RSTZ);
> > +		writel(0x1, csi2->base + CSI2_RESETN);
> > +	} else {
> > +		writel(0x0, csi2->base + CSI2_PHY_SHUTDOWNZ);
> > +		writel(0x0, csi2->base + CSI2_DPHY_RSTZ);
> > +		writel(0x0, csi2->base + CSI2_RESETN);
> > +	}
> > +}
> > +
> > +static void csi2_set_lanes(struct csi2_dev *csi2)
> > +{
> > +	int lanes = csi2->bus.num_data_lanes;
> > +
> > +	writel(lanes - 1, csi2->base + CSI2_N_LANES);
> > +}
> > +
> > +static void dw_mipi_csi2_phy_write(struct csi2_dev *csi2,
> > +				   u32 test_code, u32 test_data)
> > +{
> > +	/* Clear PHY test interface */
> > +	writel(PHY_TESTCLR, csi2->base + CSI2_PHY_TST_CTRL0);
> > +	writel(0x0, csi2->base + CSI2_PHY_TST_CTRL1);
> > +	writel(0x0, csi2->base + CSI2_PHY_TST_CTRL0);
> > +
> > +	/* Raise test interface strobe signal */
> > +	writel(PHY_TESTCLK, csi2->base + CSI2_PHY_TST_CTRL0);
> > +
> > +	/* Configure address write on falling edge and lower strobe signal */
> > +	writel(PHY_TESTEN | test_code, csi2->base + CSI2_PHY_TST_CTRL1);
> > +	writel(0x0, csi2->base + CSI2_PHY_TST_CTRL0);
> > +
> > +	/* Configure data write on rising edge and raise strobe signal */
> > +	writel(test_data, csi2->base + CSI2_PHY_TST_CTRL1);
> > +	writel(PHY_TESTCLK, csi2->base + CSI2_PHY_TST_CTRL0);
> > +
> > +	/* Clear strobe signal */
> > +	writel(0x0, csi2->base + CSI2_PHY_TST_CTRL0);
> > +}
> > +
> > +static void csi2_dphy_init(struct csi2_dev *csi2)
> > +{
> > +	/*
> > +	 * FIXME: 0x14 is derived from a fixed D-PHY reference
> > +	 * clock from the HSI_TX PLL, and a fixed target lane max
> > +	 * bandwidth of 300 Mbps. This value should be derived
> 
> If the table in https://community.nxp.com/docs/DOC-94312 is correct,
> this should be 850 Mbps. Where does this 300 Mbps value come from?

I got it, the dptdin_map value for 300 Mbps is 0x14 in the Rockchip DSI
driver. But that value is written to the register as HSFREQRANGE_SEL(x):

#define HSFREQRANGE_SEL(val)    (((val) & 0x3f) << 1) 

which is 0x28. Further, the Rockchip D-PHY probably is another version,
as its max_mbps goes up to 1500.

regards
Philipp
