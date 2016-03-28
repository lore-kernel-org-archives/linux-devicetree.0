From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/6] Documentation: DT: vdma: update binding doc for
 AXI CDMA
Date: Mon, 28 Mar 2016 15:55:42 -0500
Message-ID: <20160328205542.GA17273@rob-hp-laptop>
References: <1459101966-9932-1-git-send-email-appanad@xilinx.com>
 <1459101966-9932-2-git-send-email-appanad@xilinx.com>
 <20160327192742.GJ19212@xsjsorenbubuntu>
 <C246CAC1457055469EF09E3A7AC4E11A4A570609@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <C246CAC1457055469EF09E3A7AC4E11A4A570609-4lKfpRxZ5enZMOc0yg5rMog+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Appana Durga Kedareswara Rao <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Anurag Kumar Vulisha <anuragku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, Srikanth Vemula <svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Anirudha Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 28, 2016 at 05:27:01AM +0000, Appana Durga Kedareswara Rao =
wrote:
> Hi Soren,
>=20
> > -----Original Message-----
> > From: S=F6ren Brinkmann [mailto:soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org]
> > Sent: Monday, March 28, 2016 12:58 AM
> > To: Appana Durga Kedareswara Rao
> > Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; pawel.moll-5wv7dgnIgG8@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> > ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org; galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org; Michal Simek;
> > vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; Anurag Kumar Vulish=
a; Appana
> > Durga Kedareswara Rao; moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org;
> > laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org; luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org; Srikanth
> > Vemula; Anirudha Sarangi; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> > kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Subject: Re: [PATCH v2 5/6] Documentation: DT: vdma: update binding=
 doc for
> > AXI CDMA
> >=20
> > On Sun, 2016-03-27 at 23:36:06 +0530, Kedareswara rao Appana wrote:
> > > This patch updates the device-tree binding doc for adding support=
 for
> > > AXI CDMA.
> > >
> > > Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > ---
> > > ---> Modified commit message as suggested by Vinod.
> > > ---> Moved the patch to forward in the series as suggested by vin=
od.
> > >
> > >  .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt     | 18
> > +++++++++++++++++-
> > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> > > b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> > > index 5841421..2b0c12b 100644
> > > --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.tx=
t
> > > +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.tx=
t
> > > @@ -8,8 +8,12 @@ target devices. It can be configured to have one=
 channel
> > or two channels.
> > >  If configured as two channels, one is to transmit to the device =
and
> > > another  is to receive from the device.
> > >
> > > +Xilinx AXI CDMA engine, it does transfers between memory-mapped
> > > +source address and a memory-mapped destination address.
> > > +
> > >  Required properties:
> > > -- compatible: Should be "xlnx,axi-vdma-1.00.a" or "xlnx,axi-dma-=
1.00.a"
> > > +- compatible: Should be "xlnx,axi-vdma-1.00.a" or "xlnx,axi-dma-=
1.00.a" or
> > > +	      "xlnx,axi-cdma-1.00.a""
> > >  - #dma-cells: Should be <1>, see "dmas" property below
> > >  - reg: Should contain VDMA registers location and length.
> > >  - xlnx,num-fstores: Should be the number of framebuffers as conf=
igured in
> > h/w.
> > > @@ -80,6 +84,18 @@ axi_dma_0: axidma@40400000 {
> > >  	} ;
> > >  } ;
> > >
> > > +axi_cdma_0: axicdma@7e200000 {
> > > +       compatible =3D "xlnx,axi-cdma-1.00.a";
> > > +       #dma-cells =3D <1>;
> > > +       reg =3D < 0x7e200000 0x10000 >;
> > > +       xlnx,addrwidth =3D <0x20>;
> > > +       dma-channel@7e200000 {
> > > +               compatible =3D "xlnx,axi-dma-mm2s-channel";
> > > +               interrupts =3D < 0 55 4 >;
> > > +               xlnx,datawidth =3D <0x40>;
> > > +       } ;
> > > +} ;
> >=20
> > As in the other patch, the node name should be 'dma-controller@...'=
 and the
> > inconsistend spacing could be fixed.
>=20
> Ok will fix...
>=20
> >=20
> > Also, it seems this adds pretty much identical examples that just d=
iffer in the
> > compat string. Is that really needed?
>=20
> Most of the properties are same across the three DMA's
> For AXI VDMA there are few required properties that are not required =
for AXI DMA/CDMA.
> That's why added example for the other IP's as well I mean for AXI DM=
A and CDMA.

It needs to be clear what properties are required/valid for each=20
compatible string rather than relying on examples. I should be able to=20
write or validate the examples based on the rest of the text.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
