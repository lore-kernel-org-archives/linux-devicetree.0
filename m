From: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH] usb: dwc3: Enable the USB snooping
Date: Wed, 15 Nov 2017 09:33:12 +0000
Message-ID: <VI1PR04MB1504776EF3D4D8C374F0C069F1290@VI1PR04MB1504.eurprd04.prod.outlook.com>
References: <20171115060459.45375-1-ran.wang_1@nxp.com>
 <87ineb9b5v.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87ineb9b5v.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>, Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>, Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Balbi,

> -----Original Message-----
> From: Felipe Balbi [mailto:balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Wednesday, November 15, 2017 4:52 PM
> To: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>; open
> list:DESIGNWARE USB3 DRD IP DRIVER <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>; open
> list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>; Jerry Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>;
> Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>; Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>; Ran
> Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>; Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH] usb: dwc3: Enable the USB snooping
>=20
>=20
> Hi,
>=20
> Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org> writes:
> > Add support for USB3 snooping by asserting bits in register
> > DWC3_GSBUSCFG0 for data and descriptor.
>=20
> we know *how* to enable a feature :-) It's always the same, you fiddle wi=
th
> some registers and it works. What you failed to tell us is:
>=20
> a) WHY do you need this?
> b) WHY do we need another DT property for this?
> c) WHAT does this mean for PCI devices?

So far I cannot have the answer for you, will get you back after some discu=
ssion
with my colleagues.

> > Signed-off-by: Changming Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>
> > Signed-off-by: Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
> > Signed-off-by: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  drivers/usb/dwc3/core.c | 24 ++++++++++++++++++++++++
> > drivers/usb/dwc3/core.h | 10 ++++++++++
> >  2 files changed, 34 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c index
> > 07832509584f..ffc078ab4a1c 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -236,6 +236,26 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
> >  	return -ETIMEDOUT;
> >  }
> >
> > +/*
> > + * dwc3_enable_snooping - Enable snooping feature
> > + * @dwc3: Pointer to our controller context structure  */ static void
> > +dwc3_enable_snooping(struct dwc3 *dwc) {
> > +	u32 cfg;
> > +
> > +	cfg =3D dwc3_readl(dwc->regs, DWC3_GSBUSCFG0);
> > +	if (dwc->dma_coherent) {
> > +		cfg &=3D ~DWC3_GSBUSCFG0_SNP_MASK;
> > +		cfg |=3D (AXI3_CACHE_TYPE_SNP <<
> DWC3_GSBUSCFG0_DATARD_SHIFT) |
> > +			(AXI3_CACHE_TYPE_SNP <<
> DWC3_GSBUSCFG0_DESCRD_SHIFT) |
> > +			(AXI3_CACHE_TYPE_SNP <<
> DWC3_GSBUSCFG0_DATAWR_SHIFT) |
> > +			(AXI3_CACHE_TYPE_SNP <<
> DWC3_GSBUSCFG0_DESCWR_SHIFT);
>=20
> This "value << shift" looks super clumsy. I would rather have something a=
kin
> to:
>=20
> 	cfg |=3D DWC3_GSBUSCFG0_DATARD_CACHEABLE |
>         	DWC3_GSBUSCFG0_DESCRD_CACHEABLE ...
>=20
> and so on.

Got it.=20

> > +	}
> > +
> > +	dwc3_writel(dwc->regs, DWC3_GSBUSCFG0, cfg);
>=20
> this will *always* read and write GSBUSCFG0 even for those platforms whic=
h
> don't need to change anything on this register. You should just bail out =
early
> if !dwc->dma_coherent
>=20
> Also, I think dma_coherent is likely not the best name for this property.
>=20
> Another question is: Why wasn't this setup properly during coreConsultant
> instantiation of the RTL? Do you have devices on the market already that
> need this or is this some early FPGA model or test-only ASIC?

Yes, you are right. Actually I thought that all dwc3 IP  will have this reg=
ister, and
it can be controlled by DTS property.=20

> > @@ -776,6 +796,8 @@ static int dwc3_core_init(struct dwc3 *dwc)
> >  	/* Adjust Frame Length */
> >  	dwc3_frame_length_adjustment(dwc);
> >
> > +	dwc3_enable_snooping(dwc);
> > +
> >  	usb_phy_set_suspend(dwc->usb2_phy, 0);
> >  	usb_phy_set_suspend(dwc->usb3_phy, 0);
> >  	ret =3D phy_power_on(dwc->usb2_generic_phy);
> > @@ -1021,6 +1043,8 @@ static void dwc3_get_properties(struct dwc3
> *dwc)
> >  				&hird_threshold);
> >  	dwc->usb3_lpm_capable =3D device_property_read_bool(dev,
> >  				"snps,usb3_lpm_capable");
> > +	dwc->dma_coherent =3D device_property_read_bool(dev,
> > +				"dma-coherent");
> >
> >  	dwc->disable_scramble_quirk =3D device_property_read_bool(dev,
> >  				"snps,disable_scramble_quirk");
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h index
> > 4a4a4c98508c..6e6a66650e53 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -153,6 +153,14 @@
> >
> >  /* Bit fields */
> >
> > +/* Global SoC Bus Configuration Register 0 */
> > +#define AXI3_CACHE_TYPE_SNP		0x2 /* cacheable */
> > +#define DWC3_GSBUSCFG0_DATARD_SHIFT	28
> > +#define DWC3_GSBUSCFG0_DESCRD_SHIFT	24
> > +#define DWC3_GSBUSCFG0_DATAWR_SHIFT	20
> > +#define DWC3_GSBUSCFG0_DESCWR_SHIFT	16
> > +#define DWC3_GSBUSCFG0_SNP_MASK		0xffff0000
>=20
>=20
>=20
> > +
> >  /* Global Debug Queue/FIFO Space Available Register */
> >  #define DWC3_GDBGFIFOSPACE_NUM(n)	((n) & 0x1f)
> >  #define DWC3_GDBGFIFOSPACE_TYPE(n)	(((n) << 5) & 0x1e0)
> > @@ -859,6 +867,7 @@ struct dwc3_scratchpad_array {
> >   * 	3	- Reserved
> >   * @imod_interval: set the interrupt moderation interval in 250ns
> >   *                 increments or 0 to disable.
> > + * @dma_coherent: set if enable dma-coherent.
>=20
> you're not enabling dma coherency, you're enabling cache snooping. And
> this property should describe that. Also, keep in mind that different dev=
ices
> may want different cache types for each of those fields, so your property
> would have to be a lot more complex. Something like:
>=20
> 	snps,cache-type =3D <foobar "cacheable">, <baz "cacheable">, ...
>=20
> Then driver would have to parse this properly to setup GSBUSCFG0.

Got it, learn a lot, need more time to digest and test, thanks for your pat=
iently explanation.

> In any
> case, I still want to know why do you really need this? What's the reason=
?
> What happens if you don't fix GSBUSCFG0? What's the value you have there
> by default? Why isn't that default good enough?

So far the Layerscape SoC (such as LS1088A) has enabled this feature and I
have tested it. Once we add dma-coherent on DTS without this Patch, dwc3
will fail on device enumeration as below:
[   15.124031] xhci-hcd xhci-hcd.0.auto: Error while assigning device slot =
ID
[   15.130912] xhci-hcd xhci-hcd.0.auto: Max number of devices this xHCI ho=
st supports is 127.
[   15.139268] usb usb1-port1: couldn't allocate usb_device

>=20
> ps: since you're fiddling with DT, you should also include devicetree@vge=
r

OK

Best Regards
Ran
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
