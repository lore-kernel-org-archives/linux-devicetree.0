From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 1/4] irqchip, gicv3-its: Add device tree binding for
 hisilicon 161010801 erratum
Date: Tue, 24 Jan 2017 14:00:30 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8174AC371@lhreml504-mbs>
References: <588625E3.9040703@huawei.com> <588759E0.1010804@huawei.com>
 <20170124135224.GB7572@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170124135224.GB7572@leverpostej>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "marc.zyngier-5wv7dgnIgG8@public.gmane.org" <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linuxarm <linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Garry <john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "Guohanjun (Hanjun Guo)" <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland-5wv7dgnIgG8@public.gmane.org]
> Sent: Tuesday, January 24, 2017 1:52 PM
> To: Shameerali Kolothum Thodi
> Cc: marc.zyngier-5wv7dgnIgG8@public.gmane.org; will.deacon-5wv7dgnIgG8@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Linuxarm; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; John
> Garry; Guohanjun (Hanjun Guo)
> Subject: Re: [RFC 1/4] irqchip, gicv3-its: Add device tree binding for
> hisilicon 161010801 erratum
> 
> Hi,
> 
> I see this wasn't Cc'd to LAKML, unlike the cover letter, and patch 3
> (which isn't threaded against the cover letter).
> 
> Please use a consistent Cc list, with patches in-reply to the cover
> letter.

Apologies for the inconsistencies. 

> On Tue, Jan 24, 2017 at 01:42:56PM +0000, Shameerali Kolothum Thodi
> wrote:
> > This erratum describes the limitation of certain HiSilicon platforms
> > to support the SMMU mappings for MSI transactions and on those
> > platforms the MSI transactions has to be bypassed by SMMU. The IIDR
> > register of the
> > GICv3 ITS on these platforms are not properly populated to
> > differentiate the hardware, hence describe it in device tree.
> >
> > Signed-off-by: shameer <shameerali.kolothum.thodi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-
> v3.tx
> > t
> > b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-
> v3.tx
> > t
> > index 4c29cda..84af301 100644
> > ---
> > a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-
> v3.tx
> > t
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-
> v
> > +++ 3.txt
> > @@ -75,6 +75,12 @@ These nodes must have the following properties:
> >  - reg: Specifies the base physical address and size of the ITS
> >    registers.
> >
> > +Optional
> > +- hisilicon,erratum-161010801 : A boolean property. Indicates the
> > +presence of
> > +  erratum 161010801, which says that these platforms doesn't support
> > +SMMU
> > +  mapping for MSI transactions and those transactions has to be
> > +bypassed
> > +  by SMMU.
> 
> What exactly is meant by "doesn't support SMMU mapping" here? What
> precisely is the problem in HW?

On this platforms the ITS doorbell deviceID information is embedded in the MSI 
payload. To do this, the PCIe controller differentiates the MSI payload and 
DMA payload and modifies the MSI payload to add the deviceID information.
The way it modifies this is by comparing against a SYS_CTRL register which
is configured by UEFI with the ITS doorbell phys address.

Hence if EP is configured with a SMMU translated Doorbell address, the PCIe
RC cannot differentiate the MSI payload and ITS will fail to generate the 
Interrupt.

Hope I am clear.

Thanks,
Shameer

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
