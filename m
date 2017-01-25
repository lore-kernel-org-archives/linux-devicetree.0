From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: RE: [RFC 2/4] irqchip, gicv3-its:Workaround for HiSilicon erratum
 161010801
Date: Wed, 25 Jan 2017 10:30:00 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8174ACF59@lhreml504-mbs>
References: <5886262C.6070108@huawei.com> <58875B0D.4080303@huawei.com>
 <20170124141505.GD7572@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170124141505.GD7572@leverpostej>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linuxarm <linuxarm@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, John Garry <john.garry@huawei.com>, "Guohanjun (Hanjun Guo)" <guohanjun@huawei.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland@arm.com]
> Sent: Tuesday, January 24, 2017 2:15 PM
> To: Shameerali Kolothum Thodi
> Cc: marc.zyngier@arm.com; will.deacon@arm.com; linux-arm-
> kernel@lists.infradead.org; Linuxarm; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; John Garry; Guohanjun (Hanjun Guo);
> robin.murphy@arm.com
> Subject: Re: [RFC 2/4] irqchip, gicv3-its:Workaround for HiSilicon
> erratum 161010801
sounds like this will have severe implications for virtualization.
> 
> > Also these platforms doesn't have a proper IIDR
> > register to use the existing IIDR based quirk mechanism.
> 
> What exactly is wrong with the IIDR on these platforms? That sounds
> like
> an erratum as of itself.
> 
> What precise value do reads of the IIDR return? Or do reads result in
> other erroneous behaviour?

As far as I know, there is no erroneous behavior while reading.  But the
IIDR JEP106 identity code is 0 on these platforms, hence not much of use.

This will be corrected in next revision of hw.

Thanks,
Shameer
