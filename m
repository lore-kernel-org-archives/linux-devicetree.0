From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH] usb: dwc3: Enable the USB snooping
Date: Thu, 30 May 2019 02:17:50 +0000
Message-ID: <AM5PR0402MB28650ECE851C840990816C1CF1180@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20171115060459.45375-1-ran.wang_1@nxp.com>
 <87ineb9b5v.fsf@linux.intel.com>
 <VI1PR04MB1504776EF3D4D8C374F0C069F1290@VI1PR04MB1504.eurprd04.prod.outlook.com>
 <87shdfet90.fsf@linux.intel.com>
 <AM5PR0402MB28654EBE2D431CC2F8061CF8F11E0@AM5PR0402MB2865.eurprd04.prod.outlook.com>
 <87k1eaanjw.fsf@linux.intel.com>
 <AM5PR0402MB2865AB6C2A50851B7EA4E653F11F0@AM5PR0402MB2865.eurprd04.prod.outlook.com>
 <874l5dr21m.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <874l5dr21m.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Felipe,

On Wednesday, May 29, 2019 18:25, Felipe Balbi wrote:
>=20
> Hi,
>=20
> Ran Wang <ran.wang_1@nxp.com> writes:
> >> >> >> c) WHAT does this mean for PCI devices?
> >
> > According to DWC3 data book, I think this (PCI) mean to the case of 'ma=
ster
> bus type =3D Native'
> > The data book describes this feature as 'system bus DMA option for the
> > master bus, which may be configured as AHB, AXI, or Native.' On Table
> > 6-5, it says when MBUS_TYPE is Native, the definition of 4 transfer typ=
es
> control bits [3-0] is 'Same as AXI'.
> >
> > However, as to the code implementation to be generic to both PCI and
> > AXI, I admit I don't have a perfect solution so far, only 2 proposals w=
ith
> concerns:
> >
> > a. Create another module driver like dwc3-exynos.c
> (arch/arm/boot/dts/wxynos54xx.dtsi)
> >     to contain above programming code. However, it will touch the same =
reg
> range of DWC3
> >     I think this is not good.
>=20
> I'd prefer avoiding another glue :-)

Got it.
=20
> > b. Add #ifdef CONFIG_ARCH_LAYERSCAPE in drivers/usb/dwc3/core.c to
> constrain hacking code
> >    can only take effect for Layerscape (AXI case). I know it look ugly.
> >
> > Do you have any better advice on this (besides changed power on default
> value from HW perspective)?
>=20
> Maybe we don't need to care, actually. Since this property will only be n=
eeded
> for RTL instantiation that didn't configure these defaults properly durin=
g
> coreConsultant.

Ok, I think I could add information in bindings to highlight this setting m=
ight
be RTL instantiation (SoC) relevant to prevent misusing.

> >> >> >> Another question is: Why wasn't this setup properly during
> >> >> >> coreConsultant instantiation of the RTL? Do you have devices on
> >> >> >> the market already that need this or is this some early FPGA
> >> >> >> model or test-only
> >> >> ASIC?
> >
> > Several Layerscape platforms like LS1043ARDB, LS1046ARDB, etc. are
> > already on the market and have this issue. So I have to work out a SW p=
atch to
> fix them.
>=20
> Thank you, now I'm certain that this is not some temporary solution :-)
>=20
> Thanks for going through this again. Please refresh the patch so we can t=
ry to
> get it merged.

Sure, as I know all LS1043A and LS1046A relevant platforms have added 'dma-=
coherent'
to DTS node of 'soc' in mainline, which means without this fix USB function=
 will down
definitely, I will go through all update requirement we've discussed and wo=
rk out
next version patch. Thank you.

Regards,
Ran=20
