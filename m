From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH] usb: dwc3: Enable the USB snooping
Date: Tue, 28 May 2019 10:02:45 +0000
Message-ID: <AM5PR0402MB28654EBE2D431CC2F8061CF8F11E0@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20171115060459.45375-1-ran.wang_1@nxp.com>
 <87ineb9b5v.fsf@linux.intel.com>
 <VI1PR04MB1504776EF3D4D8C374F0C069F1290@VI1PR04MB1504.eurprd04.prod.outlook.com>
 <87shdfet90.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87shdfet90.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Felipe,

    Sorry for the late reply:

On Wednesday, November 15, 2017 18:23, Felipe Balbi wrote:
>=20
> Hi,
>=20
> Ran Wang <ran.wang_1@nxp.com> writes:
> >> Ran Wang <ran.wang_1@nxp.com> writes:
> >> > Add support for USB3 snooping by asserting bits in register
> >> > DWC3_GSBUSCFG0 for data and descriptor.
> >>
> >> we know *how* to enable a feature :-) It's always the same, you
> >> fiddle with some registers and it works. What you failed to tell us is=
:
> >>
> >> a) WHY do you need this?
> >> b) WHY do we need another DT property for this?
> >> c) WHAT does this mean for PCI devices?
> >
> > So far I cannot have the answer for you, will get you back after some
> > discussion with my colleagues.
>=20
> IOW, you have no idea why you need this, right? We're not patching things=
 for
> the sake of patching things. We need to understand what these changes mea=
n
> to the HW before we send out a patch publicly.
>=20
> Remember that the moment a patch like this is accepted, it has the potent=
ial of
> changing behavior for *ALL* users.
>=20
> >> > +	}
> >> > +
> >> > +	dwc3_writel(dwc->regs, DWC3_GSBUSCFG0, cfg);
> >>
> >> this will *always* read and write GSBUSCFG0 even for those platforms
> >> which don't need to change anything on this register. You should just
> >> bail out early if !dwc->dma_coherent
> >>
> >> Also, I think dma_coherent is likely not the best name for this proper=
ty.
> >>
> >> Another question is: Why wasn't this setup properly during
> >> coreConsultant instantiation of the RTL? Do you have devices on the
> >> market already that need this or is this some early FPGA model or test=
-only
> ASIC?
> >
> > Yes, you are right. Actually I thought that all dwc3 IP  will have
> > this register, and it can be controlled by DTS property.
>=20
> they all *have* the register, however, it's sort of expected that RTL eng=
ineer will
> setup good defaults when instantiating the RTL using SNPS'
> coreConsultant tool.
>=20
> Does your platform work without this patch?

On Layerscape SoC (such as LS1088A, LS1046A, LS1043A) When I add 'dma-coher=
ent'
to USB nodes without this patch, dwc3 will fail on device enumeration as be=
low:
[    3.610620] xhci-hcd xhci-hcd.2.auto: WARNING: Host System Error
[    3.630609] usb usb2-port1: couldn't allocate usb_device

> >> > +
> >> >  /* Global Debug Queue/FIFO Space Available Register */
> >> >  #define DWC3_GDBGFIFOSPACE_NUM(n)	((n) & 0x1f)
> >> >  #define DWC3_GDBGFIFOSPACE_TYPE(n)	(((n) << 5) & 0x1e0)
> >> > @@ -859,6 +867,7 @@ struct dwc3_scratchpad_array {
> >> >   * 	3	- Reserved
> >> >   * @imod_interval: set the interrupt moderation interval in 250ns
> >> >   *                 increments or 0 to disable.
> >> > + * @dma_coherent: set if enable dma-coherent.
> >>
> >> you're not enabling dma coherency, you're enabling cache snooping.
> >> And this property should describe that. Also, keep in mind that
> >> different devices may want different cache types for each of those
> >> fields, so your property would have to be a lot more complex. Somethin=
g like:
> >>
> >> 	snps,cache-type =3D <foobar "cacheable">, <baz "cacheable">, ...
> >>
> >> Then driver would have to parse this properly to setup GSBUSCFG0.

According to the DesignWare Cores SuperSpeed USB 3.0 Controller Databook (v=
2.60a),
it has described Type Bit Assignments for all supported master bus type:
AHB, AXI3, AXI4 and Native. I found the bit definition are different among =
them.
So, for the example you gave above, feel a little bit confused.=20
Did you mean:
    snps,cache-type =3D <DATA_RD  "write allocate">, <DESC_RD "cacheable">,=
 <DATA_WR  "bufferable">, <DESC_WR  "read allocate">

> > Got it, learn a lot, need more time to digest and test, thanks for
> > your patiently explanation.
>=20
> no problem, please figure out the answers to my previous questions, witho=
ut
> which I can't accept your patch.
>=20
> >> In any
> >> case, I still want to know why do you really need this? What's the rea=
son?
> >> What happens if you don't fix GSBUSCFG0? What's the value you have
> >> there by default? Why isn't that default good enough?
> >
> > So far the Layerscape SoC (such as LS1088A) has enabled this feature
> > and I have tested it. Once we add dma-coherent on DTS without this
> > Patch, dwc3 will fail on device enumeration as below:
> > [   15.124031] xhci-hcd xhci-hcd.0.auto: Error while assigning device s=
lot ID
> > [   15.130912] xhci-hcd xhci-hcd.0.auto: Max number of devices this xHC=
I host
> supports is 127.
> > [   15.139268] usb usb1-port1: couldn't allocate usb_device
>=20
> okay, so without these changes, your host doesn't work. What is the defau=
lt
> value on your platform without these changes? (revert patch, boot platfor=
m, let
> it fail, get register output from our regdump in debugfs)

The register I dumped is as below (partial register):
root@ls1046ardb:/sys/kernel/debug/2f00000.usb# cat regdump    =20
GSBUSCFG0 =3D 0x00100080
GSBUSCFG1 =3D 0x00000700
GTXTHRCFG =3D 0x00000000
GRXTHRCFG =3D 0x00000000
GCTL =3D 0x30c11004
GEVTEN =3D 0x00000000
GSTS =3D 0x3e800001
GUCTL1 =3D 0x0000018a
GSNPSID =3D 0x5533280a
GGPIO =3D 0x00000000
GUID =3D 0x00050100
 GUCTL =3D 0x0200c010
GBUSERRADDR0 =3D 0x00000000
GBUSERRADDR1 =3D 0x00000000
GPRTBIMAP0 =3D 0x00000000
GPRTBIMAP1 =3D 0x00000000
...

The value of GSBUSCFG0 is the same to what I dump in bootloader(U-boot)
Which mean that's the default value.

Regards,
Ran
