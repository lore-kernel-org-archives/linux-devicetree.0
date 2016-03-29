From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH v2 5/6] Documentation: DT: vdma: update binding doc for
 AXI CDMA
Date: Tue, 29 Mar 2016 05:48:50 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A570B51@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1459101966-9932-1-git-send-email-appanad@xilinx.com>
 <1459101966-9932-2-git-send-email-appanad@xilinx.com>
 <20160327192742.GJ19212@xsjsorenbubuntu>
 <C246CAC1457055469EF09E3A7AC4E11A4A570609@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20160328205542.GA17273@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160328205542.GA17273@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Soren Brinkmann <sorenb@xilinx.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Michal Simek <michals@xilinx.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, Anurag Kumar Vulisha <anuragku@xilinx.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, Srikanth Vemula <svemula@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, March 29, 2016 2:26 AM
> To: Appana Durga Kedareswara Rao
> Cc: Soren Brinkmann; pawel.moll@arm.com; mark.rutland@arm.com;
> ijc+devicetree@hellion.org.uk; galak@codeaurora.org; Michal Simek;
> vinod.koul@intel.com; dan.j.williams@intel.com; Anurag Kumar Vulisha;
> moritz.fischer@ettus.com; laurent.pinchart@ideasonboard.com;
> luis@debethencourt.com; Srikanth Vemula; Anirudha Sarangi;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; lin=
ux-
> kernel@vger.kernel.org; dmaengine@vger.kernel.org
> Subject: Re: [PATCH v2 5/6] Documentation: DT: vdma: update binding d=
oc for
> AXI CDMA
>=20
> On Mon, Mar 28, 2016 at 05:27:01AM +0000, Appana Durga Kedareswara Ra=
o
> wrote:
> > Hi Soren,
> >
> > > -----Original Message-----
> > > From: S=F6ren Brinkmann [mailto:soren.brinkmann@xilinx.com]
> > > Sent: Monday, March 28, 2016 12:58 AM
> > > To: Appana Durga Kedareswara Rao
> > > Cc: robh+dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com;
> > > ijc+devicetree@hellion.org.uk; galak@codeaurora.org; Michal Simek=
;
> > > vinod.koul@intel.com; dan.j.williams@intel.com; Anurag Kumar
> > > Vulisha; Appana Durga Kedareswara Rao; moritz.fischer@ettus.com;
> > > laurent.pinchart@ideasonboard.com; luis@debethencourt.com; Srikan=
th
> > > Vemula; Anirudha Sarangi; devicetree@vger.kernel.org; linux-arm-
> > > kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > > dmaengine@vger.kernel.org
> > > Subject: Re: [PATCH v2 5/6] Documentation: DT: vdma: update bindi=
ng
> > > doc for AXI CDMA
> > >
> > > On Sun, 2016-03-27 at 23:36:06 +0530, Kedareswara rao Appana wrot=
e:
> > > > This patch updates the device-tree binding doc for adding suppo=
rt
> > > > for AXI CDMA.
> > > >
> > > > Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> > > > ---
> > > > ---> Modified commit message as suggested by Vinod.
> > > > ---> Moved the patch to forward in the series as suggested by v=
inod.
> > > >
> > > >  .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt     | 18
> > > +++++++++++++++++-
> > > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> > > > b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> > > > index 5841421..2b0c12b 100644
> > > > --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.=
txt
> > > > +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.=
txt
> > > > @@ -8,8 +8,12 @@ target devices. It can be configured to have o=
ne
> > > > channel
> > > or two channels.
> > > >  If configured as two channels, one is to transmit to the devic=
e
> > > > and another  is to receive from the device.
> > > >
> > > > +Xilinx AXI CDMA engine, it does transfers between memory-mappe=
d
> > > > +source address and a memory-mapped destination address.
> > > > +
> > > >  Required properties:
> > > > -- compatible: Should be "xlnx,axi-vdma-1.00.a" or "xlnx,axi-dm=
a-1.00.a"
> > > > +- compatible: Should be "xlnx,axi-vdma-1.00.a" or "xlnx,axi-dm=
a-1.00.a"
> or
> > > > +	      "xlnx,axi-cdma-1.00.a""
> > > >  - #dma-cells: Should be <1>, see "dmas" property below
> > > >  - reg: Should contain VDMA registers location and length.
> > > >  - xlnx,num-fstores: Should be the number of framebuffers as
> > > > configured in
> > > h/w.
> > > > @@ -80,6 +84,18 @@ axi_dma_0: axidma@40400000 {
> > > >  	} ;
> > > >  } ;
> > > >
> > > > +axi_cdma_0: axicdma@7e200000 {
> > > > +       compatible =3D "xlnx,axi-cdma-1.00.a";
> > > > +       #dma-cells =3D <1>;
> > > > +       reg =3D < 0x7e200000 0x10000 >;
> > > > +       xlnx,addrwidth =3D <0x20>;
> > > > +       dma-channel@7e200000 {
> > > > +               compatible =3D "xlnx,axi-dma-mm2s-channel";
> > > > +               interrupts =3D < 0 55 4 >;
> > > > +               xlnx,datawidth =3D <0x40>;
> > > > +       } ;
> > > > +} ;
> > >
> > > As in the other patch, the node name should be 'dma-controller@..=
=2E'
> > > and the inconsistend spacing could be fixed.
> >
> > Ok will fix...
> >
> > >
> > > Also, it seems this adds pretty much identical examples that just
> > > differ in the compat string. Is that really needed?
> >
> > Most of the properties are same across the three DMA's For AXI VDMA
> > there are few required properties that are not required for AXI DMA=
/CDMA.
> > That's why added example for the other IP's as well I mean for AXI =
DMA and
> CDMA.
>=20
> It needs to be clear what properties are required/valid for each comp=
atible
> string rather than relying on examples. I should be able to write or =
validate the
> examples based on the rest of the text.

Ok will fix it in the next version of the patch.

Regards,
Kedar.

>=20
> Rob
