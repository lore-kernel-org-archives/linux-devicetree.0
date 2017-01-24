From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC 1/4] irqchip, gicv3-its: Add device tree binding for
 hisilicon 161010801 erratum
Date: Tue, 24 Jan 2017 14:28:51 +0000
Message-ID: <20170124142851.GE7572@leverpostej>
References: <588625E3.9040703@huawei.com>
 <588759E0.1010804@huawei.com>
 <20170124135224.GB7572@leverpostej>
 <5FC3163CFD30C246ABAA99954A238FA8174AC371@lhreml504-mbs>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8174AC371@lhreml504-mbs>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: "marc.zyngier-5wv7dgnIgG8@public.gmane.org" <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linuxarm <linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Garry <john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "Guohanjun (Hanjun Guo)" <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 02:00:30PM +0000, Shameerali Kolothum Thodi wrote:
> > -----Original Message-----
> > From: Mark Rutland [mailto:mark.rutland-5wv7dgnIgG8@public.gmane.org]

> > On Tue, Jan 24, 2017 at 01:42:56PM +0000, Shameerali Kolothum Thodi
> > wrote:

> > > +Optional
> > > +- hisilicon,erratum-161010801 : A boolean property. Indicates the
> > > +presence of
> > > +  erratum 161010801, which says that these platforms doesn't support
> > > +SMMU
> > > +  mapping for MSI transactions and those transactions has to be
> > > +bypassed
> > > +  by SMMU.
> > 
> > What exactly is meant by "doesn't support SMMU mapping" here? What
> > precisely is the problem in HW?
> 
> On this platforms the ITS doorbell deviceID information is embedded in the MSI 
> payload. To do this, the PCIe controller differentiates the MSI payload and 
> DMA payload and modifies the MSI payload to add the deviceID information.
> The way it modifies this is by comparing against a SYS_CTRL register which
> is configured by UEFI with the ITS doorbell phys address.

Ok. Some part of this will need to go in the binding description.

How does this interact with translations via the SMMU?

Do writes matching this address:

(a) always bypass translation.
(b) get translated after modification.
(c) other?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
