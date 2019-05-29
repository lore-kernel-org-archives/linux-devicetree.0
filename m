From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH] usb: dwc3: Enable the USB snooping
Date: Wed, 29 May 2019 10:12:19 +0000
Message-ID: <AM5PR0402MB2865AB6C2A50851B7EA4E653F11F0@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20171115060459.45375-1-ran.wang_1@nxp.com>
 <87ineb9b5v.fsf@linux.intel.com>
 <VI1PR04MB1504776EF3D4D8C374F0C069F1290@VI1PR04MB1504.eurprd04.prod.outlook.com>
 <87shdfet90.fsf@linux.intel.com>
 <AM5PR0402MB28654EBE2D431CC2F8061CF8F11E0@AM5PR0402MB2865.eurprd04.prod.outlook.com>
 <87k1eaanjw.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87k1eaanjw.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

HI Felipe,

On Tuesday, May 28, 2019 18:20, Felipe Balbi wrote:
>=20
> Hi,
>=20
> Ran Wang <ran.wang_1@nxp.com> writes:
>=20
> > Hi Felipe,
> >
> >     Sorry for the late reply:
> >
> > On Wednesday, November 15, 2017 18:23, Felipe Balbi wrote:
>=20
> that's 1.5 year ago. I really don't remember the details of this conversa=
tion
>=20
> >> Ran Wang <ran.wang_1@nxp.com> writes:
> >> >> Ran Wang <ran.wang_1@nxp.com> writes:
> >> >> > Add support for USB3 snooping by asserting bits in register
> >> >> > DWC3_GSBUSCFG0 for data and descriptor.
> >> >>
> >> >> we know *how* to enable a feature :-) It's always the same, you
> >> >> fiddle with some registers and it works. What you failed to tell us=
 is:
> >> >>
> >> >> a) WHY do you need this?

I think I have answered this as blow: to fix issue we found.

> >> >> b) WHY do we need another DT property for this?

I agreed with your suggestion of using ' snps,cache-type =3D <foobar "cache=
able">, ...'

> >> >> c) WHAT does this mean for PCI devices?

According to DWC3 data book, I think this (PCI) mean to the case of 'master=
 bus type =3D Native'
The data book describes this feature as 'system bus DMA option for the mast=
er bus,
which may be configured as AHB, AXI, or Native.' On Table 6-5, it says when=
 MBUS_TYPE
is Native, the definition of 4 transfer types control bits [3-0] is 'Same a=
s AXI'.

However, as to the code implementation to be generic to both PCI and AXI,
I admit I don't have a perfect solution so far, only 2 proposals with conce=
rns:

a. Create another module driver like dwc3-exynos.c (arch/arm/boot/dts/wxyno=
s54xx.dtsi)
    to contain above programming code. However, it will touch the same reg =
range of DWC3
    I think this is not good.

b. Add #ifdef CONFIG_ARCH_LAYERSCAPE in drivers/usb/dwc3/core.c to constrai=
n hacking code
   can only take effect for Layerscape (AXI case). I know it look ugly.

Do you have any better advice on this (besides changed power on default val=
ue from HW perspective)?

> >> >
> >> > So far I cannot have the answer for you, will get you back after
> >> > some discussion with my colleagues.
> >>
> >> IOW, you have no idea why you need this, right? We're not patching
> >> things for the sake of patching things. We need to understand what
> >> these changes mean to the HW before we send out a patch publicly.
> >>
> >> Remember that the moment a patch like this is accepted, it has the
> >> potential of changing behavior for *ALL* users.
> >>
> >> >> > +	}
> >> >> > +
> >> >> > +	dwc3_writel(dwc->regs, DWC3_GSBUSCFG0, cfg);
> >> >>
> >> >> this will *always* read and write GSBUSCFG0 even for those
> >> >> platforms which don't need to change anything on this register.
> >> >> You should just bail out early if !dwc->dma_coherent

Yes, noted.

> >> >>
> >> >> Also, I think dma_coherent is likely not the best name for this pro=
perty.

OK

> >> >>
> >> >> Another question is: Why wasn't this setup properly during
> >> >> coreConsultant instantiation of the RTL? Do you have devices on
> >> >> the market already that need this or is this some early FPGA model
> >> >> or test-only
> >> ASIC?

Several Layerscape platforms like LS1043ARDB, LS1046ARDB, etc. are already =
on
the market and have this issue. So I have to work out a SW patch to fix the=
m.

> >> >
> >> > Yes, you are right. Actually I thought that all dwc3 IP  will have
> >> > this register, and it can be controlled by DTS property.
> >>
> >> they all *have* the register, however, it's sort of expected that RTL
> >> engineer will setup good defaults when instantiating the RTL using SNP=
S'
> >> coreConsultant tool.
> >>
> >> Does your platform work without this patch?
> >
> > On Layerscape SoC (such as LS1088A, LS1046A, LS1043A) When I add 'dma-
> coherent'
> > to USB nodes without this patch, dwc3 will fail on device enumeration a=
s
> below:
> > [    3.610620] xhci-hcd xhci-hcd.2.auto: WARNING: Host System Error
> > [    3.630609] usb usb2-port1: couldn't allocate usb_device
>=20
> Right, and same as before: are these devices in the market or are you dea=
ling
> with pre-silicon prototypes?

Already in the market, need SW fix.

> >> >> >  /* Global Debug Queue/FIFO Space Available Register */
> >> >> >  #define DWC3_GDBGFIFOSPACE_NUM(n)	((n) & 0x1f)
> >> >> >  #define DWC3_GDBGFIFOSPACE_TYPE(n)	(((n) << 5) & 0x1e0)
> >> >> > @@ -859,6 +867,7 @@ struct dwc3_scratchpad_array {
> >> >> >   * 	3	- Reserved
> >> >> >   * @imod_interval: set the interrupt moderation interval in 250n=
s
> >> >> >   *                 increments or 0 to disable.
> >> >> > + * @dma_coherent: set if enable dma-coherent.
> >> >>
> >> >> you're not enabling dma coherency, you're enabling cache snooping.
> >> >> And this property should describe that. Also, keep in mind that
> >> >> different devices may want different cache types for each of those
> >> >> fields, so your property would have to be a lot more complex. Somet=
hing
> like:
> >> >>
> >> >> 	snps,cache-type =3D <foobar "cacheable">, <baz "cacheable">, ...
> >> >>
> >> >> Then driver would have to parse this properly to setup GSBUSCFG0.
> >
> > According to the DesignWare Cores SuperSpeed USB 3.0 Controller
> > Databook (v2.60a), it has described Type Bit Assignments for all suppor=
ted
> master bus type:
> > AHB, AXI3, AXI4 and Native. I found the bit definition are different am=
ong
> them.
> > So, for the example you gave above, feel a little bit confused.
> > Did you mean:
> >     snps,cache-type =3D <DATA_RD  "write allocate">, <DESC_RD
> > "cacheable">, <DATA_WR  "bufferable">, <DESC_WR  "read allocate">
>=20
> yeah, something like that.
>=20
> >> > Got it, learn a lot, need more time to digest and test, thanks for
> >> > your patiently explanation.
> >>
> >> no problem, please figure out the answers to my previous questions,
> >> without which I can't accept your patch.
>=20
> ^^^
>=20
> I still don't have all the answers

If I still missed any question, please let me know, thanks for your time.

Regards,
Ran
