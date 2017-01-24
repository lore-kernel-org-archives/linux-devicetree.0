From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: RE: [RFC 1/4] irqchip, gicv3-its: Add device tree binding for
 hisilicon 161010801 erratum
Date: Tue, 24 Jan 2017 15:42:27 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8174AC577@lhreml504-mbs>
References: <588625E3.9040703@huawei.com> <588759E0.1010804@huawei.com>
 <20170124135224.GB7572@leverpostej>
 <5FC3163CFD30C246ABAA99954A238FA8174AC371@lhreml504-mbs>
 <20170124142851.GE7572@leverpostej>
 <5FC3163CFD30C246ABAA99954A238FA8174AC4AB@lhreml504-mbs>
 <97734ae1-86bf-7239-ec54-2ed7a8db85fb@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <97734ae1-86bf-7239-ec54-2ed7a8db85fb@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linuxarm <linuxarm@huawei.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, John Garry <john.garry@huawei.com>, "Guohanjun (Hanjun Guo)" <guohanjun@huawei.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Marc Zyngier [mailto:marc.zyngier@arm.com]
> Sent: Tuesday, January 24, 2017 3:28 PM
> To: Shameerali Kolothum Thodi; Mark Rutland
> Cc: will.deacon@arm.com; linux-kernel@vger.kernel.org; Linuxarm;
> devicetree@vger.kernel.org; John Garry; Guohanjun (Hanjun Guo)
> Subject: Re: [RFC 1/4] irqchip, gicv3-its: Add device tree binding for
> hisilicon 161010801 erratum
> 
> On 24/01/17 15:13, Shameerali Kolothum Thodi wrote:
> >
> >
> >> -----Original Message-----
> >> From: Mark Rutland [mailto:mark.rutland@arm.com]
> >> Sent: Tuesday, January 24, 2017 2:29 PM
> >> To: Shameerali Kolothum Thodi
> >> Cc: marc.zyngier@arm.com; will.deacon@arm.com; linux-
> >> kernel@vger.kernel.org; Linuxarm; devicetree@vger.kernel.org; John
> >> Garry; Guohanjun (Hanjun Guo)
> >> Subject: Re: [RFC 1/4] irqchip, gicv3-its: Add device tree binding
> >> for hisilicon 161010801 erratum
> >>
> >> On Tue, Jan 24, 2017 at 02:00:30PM +0000, Shameerali Kolothum Thodi
> >> wrote:
> >>>> -----Original Message-----
> >>>> From: Mark Rutland [mailto:mark.rutland@arm.com]
> >>
> >>>> On Tue, Jan 24, 2017 at 01:42:56PM +0000, Shameerali Kolothum
> Thodi
> >>>> wrote:
> >>
> >>>>> +Optional
> >>>>> +- hisilicon,erratum-161010801 : A boolean property. Indicates
> >> the
> >>>>> +presence of
> >>>>> +  erratum 161010801, which says that these platforms doesn't
> >>>>> +support SMMU
> >>>>> +  mapping for MSI transactions and those transactions has to be
> >>>>> +bypassed
> >>>>> +  by SMMU.
> >>>>
> >>>> What exactly is meant by "doesn't support SMMU mapping" here? What
> >>>> precisely is the problem in HW?
> >>>
> >>> On this platforms the ITS doorbell deviceID information is embedded
> >> in
> >>> the MSI payload. To do this, the PCIe controller differentiates the
> >>> MSI payload and DMA payload and modifies the MSI payload to add the
> >> deviceID information.
> >>> The way it modifies this is by comparing against a SYS_CTRL
> register
> >>> which is configured by UEFI with the ITS doorbell phys address.
> >>
> >> Ok. Some part of this will need to go in the binding description.
> >>
> >> How does this interact with translations via the SMMU?
> >>
> >> Do writes matching this address:
> >>
> >> (a) always bypass translation.
> >> (b) get translated after modification.
> >> (c) other?
> >
> > PCIe RC has a configuration setting to enable/disable SMMU bypass for
> > PCIe MSI write and with this patch series we are using the disable
> > mode. So it bypasses SMMU always for MSI but not for DMA.
> >
> > As per our SoC engineers this implementation seems to be based on an
> > earlier version of GIC spec earlier version the GIC spec(Document
> > number:PRD03-GENC-010745 18.0) where it says:
> >
> > "Implementations may choose to transform writes to GITS_TRANSLATER by
> either:
> >  -multiplexing the device ID onto the address bus (which is what GIC-
> 500 provides
> >   a mechanism for), or
> >  -extending the data value to 64 bits, providing the device ID in the
> upper bits,
> >   and transforming the access to become a 64-bit write"
> 
> Crucially, that should be done by performing the up-scaling just as the
> write reaches the ITS translation register, and *not* when the write
> leaves the RC. If you up-scale it early, you end-up in this silly
> situation.
> 
> > Though I can't find the same in latest GIC spec.
> 
> Because that's not an architecture feature, but an implement decision.
> And whatever the implementation does, it should be invisible to SW.
> Unfortunately, bypassing the SMMU is not exactly invisible...
> 

Totally agree. Unfortunately this is the way our implementation is :(

Thanks,
Shameer
