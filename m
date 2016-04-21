From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v3 3/3] dmaengine: vdma: Add clock support
Date: Thu, 21 Apr 2016 10:02:15 -0700
Message-ID: <20160421170215.GB7128@xsjsorenbubuntu>
References: <1461235118-800-1-git-send-email-appanad@xilinx.com>
 <1461235118-800-4-git-send-email-appanad@xilinx.com>
 <20160421162153.GZ7128@xsjsorenbubuntu>
 <C246CAC1457055469EF09E3A7AC4E11A4A5799D9@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <C246CAC1457055469EF09E3A7AC4E11A4A5799D9@XAP-PVEXMBX01.xlnx.xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Appana Durga Kedareswara Rao <appanad@xilinx.com>
Cc: Soren Brinkmann <sorenb@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Michal Simek <michals@xilinx.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, Anirudha Sarangi <anirudh@xilinx.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, Shubhrajyoti Datta <shubhraj@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-ker
List-Id: devicetree@vger.kernel.org

On Thu, 2016-04-21 at 09:32:44 -0700, Appana Durga Kedareswara Rao wrot=
e:
> Hi Soren,
>=20
> > -----Original Message-----
> > From: S=C3=B6ren Brinkmann [mailto:soren.brinkmann@xilinx.com]
> > Sent: Thursday, April 21, 2016 9:52 PM
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
> > Subject: Re: [PATCH v3 3/3] dmaengine: vdma: Add clock support
> >=20
> > On Thu, 2016-04-21 at 16:08:38 +0530, Kedareswara rao Appana wrote:
[...]
> > > @@ -1757,6 +1767,200 @@ static void xilinx_dma_chan_remove(struct
> > xilinx_dma_chan *chan)
> > >  	list_del(&chan->common.device_node);
> > >  }
> > >
> > > +static int axidma_clk_init(struct platform_device *pdev, struct =
clk **axi_clk,
> > > +			    struct clk **tx_clk, struct clk **rx_clk,
> > > +			    struct clk **sg_clk, struct clk **tmp_clk) {
> > > +	int err;
> > > +
> > > +	*tmp_clk =3D NULL;
> > > +
> > > +	*axi_clk =3D devm_clk_get(&pdev->dev, "s_axi_lite_aclk");
> > > +	if (IS_ERR(*axi_clk)) {
> > > +		err =3D PTR_ERR(*axi_clk);
> > > +		dev_err(&pdev->dev, "failed to get axi_aclk (%u)\n", err);
> > > +		return err;
> > > +	}
> > > +
> > > +	*tx_clk =3D devm_clk_get(&pdev->dev, "m_axi_mm2s_aclk");
> > > +	if (IS_ERR(*tx_clk))
> > > +		*tx_clk =3D NULL;
> > > +
> > > +	*rx_clk =3D devm_clk_get(&pdev->dev, "m_axi_s2mm_aclk");
> > > +	if (IS_ERR(*rx_clk))
> > > +		*rx_clk =3D NULL;
> > > +
> > > +	*sg_clk =3D devm_clk_get(&pdev->dev, "m_axi_sg_aclk");
> > > +	if (IS_ERR(*sg_clk))
> > > +		*sg_clk =3D NULL;
> > > +
> > > +
> > > +	err =3D clk_prepare_enable(*axi_clk);
> >=20
> > Should this be called if you know that the pointer might be NULL?
>=20
> It is a mandatory clock and if this clk is not there in DT I am alrea=
dy returning error...
> I didn't get your question could you please elaborate???

But for all the optional clocks. They could all be NULL and you're call=
ing
clk_prepare_enable with a NULL pointer. That function is nice enough to
do a NULL check for you, but I wonder whether these calls should happen=
 at
all when you already know that the pointer is not a valid clock.

	S=C3=B6ren
