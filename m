From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Date: Thu, 25 Jul 2019 23:02:11 +0300
Message-ID: <20190725200211.GK1263@valkosipuli.retiisi.org.uk>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
 <20190628141326.swgl3kg4fj5pmlqx@valkosipuli.retiisi.org.uk>
 <MN2PR12MB37109D7AADCE4823CB458CB9CBF60@MN2PR12MB3710.namprd12.prod.outlook.com>
 <20190709182500.3x544axnrgy72aje@valkosipuli.retiisi.org.uk>
 <MN2PR12MB371026A6547B449EEC0439B1CBF00@MN2PR12MB3710.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <MN2PR12MB371026A6547B449EEC0439B1CBF00@MN2PR12MB3710.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Luis de Oliveira <Luis.Oliveira@synopsys.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "robh@kernel.org" <robh@kernel.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "kishon@ti.com" <kishon@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
List-Id: devicetree@vger.kernel.org

Hi Luis,

On Wed, Jul 10, 2019 at 10:20:55AM +0000, Luis de Oliveira wrote:
> Hi Sakari,
> 
> From: Sakari Ailus <sakari.ailus@iki.fi>
> Date: Tue, Jul 09, 2019 at 19:25:00
> 
> > Hi Luis,
> > 
> > On Mon, Jul 08, 2019 at 03:21:50PM +0000, Luis de Oliveira wrote:
> > > Hi Sakari,
> > > 
> > > Thank you for your feedback.
> > > I have my comments inline.
> > > 
> > > From: Sakari Ailus <sakari.ailus@iki.fi>
> > > Date: Fri, Jun 28, 2019 at 15:13:26
> > > 
> > > > Hi Luis,
> > > > 
> > > > Thank you for the patchset.
> > > > 
> > > > On Tue, Jun 11, 2019 at 09:20:50PM +0200, Luis Oliveira wrote:
> > > > > From: Luis Oliveira <lolivei@synopsys.com>
> > > > > 
> > > > > Add bindings for Synopsys DesignWare MIPI CSI-2 host.
> > > > > 
> > > > > Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> > > > > ---
> > > > > Changelog
> > > > > v3-v4
> > > > > - remove "plat" from the block name @rob @laurent
> > > > > - remove "phy-names" when single-entry @rob
> > > > > - remove "snps,output-type" -> went to the driver config @laurent
> > > > > 
> > > > >  .../devicetree/bindings/media/snps,dw-csi.txt      | 41 ++++++++++++++++++++++
> > > > >  1 file changed, 41 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-csi.txt
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-csi.txt b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
> > > > > new file mode 100644
> > > > > index 0000000..613b7f9
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
> > > > > @@ -0,0 +1,41 @@
> > > > > +Synopsys DesignWare CSI-2 Host controller
> > > > > +
> > > > > +Description
> > > > > +-----------
> > > > > +
> > > > > +This HW block is used to receive image coming from an MIPI CSI-2 compatible
> > > > > +camera.
> > > > > +
> > > > > +Required properties:
> > > > > +- compatible		: shall be "snps,dw-csi"
> > > > > +- reg			: physical base address and size of the device memory
> > > > > +			  mapped registers;
> > > > > +- interrupts		: DW CSI-2 Host interrupts
> > > > > +- phys			: List of one PHY specifier (as defined in
> > > > > +			  Documentation/devicetree/bindings/phy/phy-bindings.txt).
> > > > > +			  This PHY is a MIPI DPHY working in RX mode.
> > > > > +- resets		: Reference to a reset controller (optional)
> > > > > +
> > > > > +The per-board settings:
> > > > > + - port sub-node describing a single endpoint connected to the camera as
> > > > > +   described in video-interfaces.txt[1].
> > > > 
> > > > Which endpoint properties in video-interfaces.txt are relevant for the
> > > > hardware? Which values may they have?
> > > > 
> > > 
> > > Currently I'm using only two properties "data-lanes" and "bus-width", but 
> > > I have plans to add blanking info also.
> > > I will add more info.
> > 
> > Isn't blanking defined by what the transmitter seneds? Or do you have
> > hardware limitations on the receiver side?
> > 
> 
> When we use this IP in prototyping we configure blanking at the receiver 
> side.
> Some cameras don't have blanking configuration capabilities so we 
> configure it on the RX side.

I haven't come across a CSI-2 connected camera without some kind of
blanking configuration capabilities. Even if there was one, you couldn't
configure blanking from the receiver side.

Please document that the data-lanes property is required, and which values
are possible.

> 
> > I've only heard of one such case before, and it was a very old parallel
> > receiver.
> > 
> > If you have a CSI-2 receiver, bus-width isn't relevant --- it's for paralle
> > interfaces only. Please add data-lanes to required endpoint properties.
> > 
> 
> I used bus-width property in the Synopsys IPI (Image Pixel Interface) 
> that enables direct video stream access.
> This interface is an output that can be 16-bit or 48-bit, that's why I 
> used bus-width property.

Does this device write the image data to system memory, or is it another
device? If there's another one, then you should probably have another port
to describe that connection.

-- 
Kind regards,

Sakari Ailus
