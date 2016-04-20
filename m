From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2 2/2] dmaengine: vdma: Add clock support
Date: Wed, 20 Apr 2016 09:12:01 -0700
Message-ID: <20160420161201.GS7128@xsjsorenbubuntu>
References: <1461152599-28858-1-git-send-email-appanad@xilinx.com>
 <1461152599-28858-2-git-send-email-appanad@xilinx.com>
 <20160420143622.GP7128@xsjsorenbubuntu>
 <C246CAC1457055469EF09E3A7AC4E11A4A57930F@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <C246CAC1457055469EF09E3A7AC4E11A4A57930F@XAP-PVEXMBX01.xlnx.xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Appana Durga Kedareswara Rao <appanad@xilinx.com>
Cc: Soren Brinkmann <sorenb@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Michal Simek <michals@xilinx.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, Anirudha Sarangi <anirudh@xilinx.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, Shubhrajyoti Datta <shubhraj@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-ker
List-Id: devicetree@vger.kernel.org

On Wed, 2016-04-20 at 07:55:27 -0700, Appana Durga Kedareswara Rao wrot=
e:
> Hi Soren,
>=20
> > -----Original Message-----
> > From: S=C3=B6ren Brinkmann [mailto:soren.brinkmann@xilinx.com]
> > Sent: Wednesday, April 20, 2016 8:06 PM
> > To: Appana Durga Kedareswara Rao <appanad@xilinx.com>
> > Cc: robh+dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com;
> > ijc+devicetree@hellion.org.uk; galak@codeaurora.org; Michal Simek
> > <michals@xilinx.com>; vinod.koul@intel.com; dan.j.williams@intel.co=
m;
> > Appana Durga Kedareswara Rao <appanad@xilinx.com>;
> > moritz.fischer@ettus.com; laurent.pinchart@ideasonboard.com;
> > luis@debethencourt.com; Anirudha Sarangi <anirudh@xilinx.com>; Punn=
aiah
> > Choudary Kalluri <punnaia@xilinx.com>; Shubhrajyoti Datta
> > <shubhraj@xilinx.com>; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > dmaengine@vger.kernel.org
> > Subject: Re: [PATCH v2 2/2] dmaengine: vdma: Add clock support
> >=20
> > On Wed, 2016-04-20 at 17:13:19 +0530, Kedareswara rao Appana wrote:
> > > Added basic clock support. The clocks are requested at probe and
> > > released at remove.
> > >
> > > Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> > > ---
> > > Changes for v2:
> > > --> None.
> > >
> > >  drivers/dma/xilinx/xilinx_vdma.c | 56
> > > ++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 56 insertions(+)
> > >
> > > diff --git a/drivers/dma/xilinx/xilinx_vdma.c
> > > b/drivers/dma/xilinx/xilinx_vdma.c
> > > index 70caea6..d526029 100644
> > > --- a/drivers/dma/xilinx/xilinx_vdma.c
> > > +++ b/drivers/dma/xilinx/xilinx_vdma.c
> > > @@ -44,6 +44,7 @@
> > >  #include <linux/of_platform.h>
> > >  #include <linux/of_irq.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/clk.h>
> > >
> > >  #include "../dmaengine.h"
> > >
> > > @@ -352,6 +353,8 @@ struct xilinx_dma_chan {
> > >   * @flush_on_fsync: Flush on frame sync
> > >   * @ext_addr: Indicates 64 bit addressing is supported by dma de=
vice
> > >   * @dmatype: DMA ip type
> > > + * @clks:	pointer to array of clocks
> > > + * @numclks:	number of clocks available
> > >   */
> > >  struct xilinx_dma_device {
> > >  	void __iomem *regs;
> > > @@ -362,6 +365,8 @@ struct xilinx_dma_device {
> > >  	u32 flush_on_fsync;
> > >  	bool ext_addr;
> > >  	enum xdma_ip_type dmatype;
> > > +	struct clk **clks;
> > > +	int numclks;
> > >  };
> > >
> > >  /* Macros */
> > > @@ -1731,6 +1736,26 @@ int xilinx_vdma_channel_set_config(struct
> > > dma_chan *dchan,  }  EXPORT_SYMBOL(xilinx_vdma_channel_set_config=
);
> > >
> > > +static int xdma_clk_init(struct xilinx_dma_device *xdev, bool en=
able)
> > > +{
> > > +	int i =3D 0, ret;
> > > +
> > > +	for (i =3D 0; i < xdev->numclks; i++) {
> > > +		if (enable) {
> > > +			ret =3D clk_prepare_enable(xdev->clks[i]);
> > > +			if (ret) {
> > > +				dev_err(xdev->dev,
> > > +					"failed to enable the axidma clock\n");
> > > +				return ret;
> > > +			}
> > > +		} else {
> > > +			clk_disable_unprepare(xdev->clks[i]);
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /* -------------------------------------------------------------=
----------------
> > >   * Probe and remove
> > >   */
> > > @@ -1919,6 +1944,7 @@ static int xilinx_dma_probe(struct platform=
_device
> > *pdev)
> > >  	struct resource *io;
> > >  	u32 num_frames, addr_width;
> > >  	int i, err;
> > > +	const char *str;
> > >
> > >  	/* Allocate and initialize the DMA engine structure */
> > >  	xdev =3D devm_kzalloc(&pdev->dev, sizeof(*xdev), GFP_KERNEL); @=
@
> > > -1965,6 +1991,32 @@ static int xilinx_dma_probe(struct platform_d=
evice
> > *pdev)
> > >  	/* Set the dma mask bits */
> > >  	dma_set_mask(xdev->dev, DMA_BIT_MASK(addr_width));
> > >
> > > +	xdev->numclks =3D of_property_count_strings(pdev->dev.of_node,
> > > +						  "clock-names");
> > > +	if (xdev->numclks > 0) {
> > > +		xdev->clks =3D devm_kmalloc_array(&pdev->dev, xdev->numclks,
> > > +						sizeof(struct clk *),
> > > +						GFP_KERNEL);
> > > +		if (!xdev->clks)
> > > +			return -ENOMEM;
> > > +
> > > +		for (i =3D 0; i < xdev->numclks; i++) {
> > > +			of_property_read_string_index(pdev->dev.of_node,
> > > +						      "clock-names", i, &str);
> > > +			xdev->clks[i] =3D devm_clk_get(xdev->dev, str);
> > > +			if (IS_ERR(xdev->clks[i])) {
> > > +				if (PTR_ERR(xdev->clks[i]) =3D=3D -ENOENT)
> > > +					xdev->clks[i] =3D NULL;
> > > +				else
> > > +					return PTR_ERR(xdev->clks[i]);
> > > +			}
> > > +		}
> > > +
> > > +		err =3D xdma_clk_init(xdev, true);
> > > +		if (err)
> > > +			return err;
> > > +	}
> >=20
> > I guess this works, but the relation to the binding is a little loo=
se, IMHO. Instead
> > of using the clock names from the binding this is just using whatev=
er is provided
> > in DT and enabling it. Also, all the clocks here are handled as opt=
ional feature,
> > while binding - and I guess reality too - have them as mandatory.
> > It would be nicer if the driver specifically asks for the clocks it=
 needs and return
> > an error if a mandatory clock is missing.
>=20
> Here DMA channels are configurable I mean if user select only mm2s ch=
annel then we will have
> Only 3 clocks. If user selects both mm2s and s2mm channels we will ha=
ve 5 clocks.
> That=E2=80=99s why reading the number of clocks from the clock-names =
property.
>=20
> And also the AXI DMA/CDMA Ip support also getting added to this drive=
r for those IP's also the clocks are configurable
> For AXI DMA it is either 3 or 4 clocks and for AXI CDMA it is 2 clock=
s.
>=20
> That's why I thought it is the proper solution.
>=20
> If you have any better idea please let me know will try in that way..=
=2E

I guess the driver know all these things: whether it controls vdma or
cdma, what interfaces it has and how many channels? Based on that, I
guess it should be possible to derive what clocks are required for
correct operation.

	S=C3=B6ren
