From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 06/11] memory: atmel-ebi: add DT bindings
 documentation
Date: Thu, 4 Dec 2014 11:47:57 +0100
Message-ID: <20141204114757.1fa5cd9a@bbrezillon>
References: <1417639455-17410-1-git-send-email-boris.brezillon@free-electrons.com>
	<1417639455-17410-7-git-send-email-boris.brezillon@free-electrons.com>
	<548037CF.7090500@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <548037CF.7090500-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 4 Dec 2014 11:30:39 +0100
Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:

> Le 03/12/2014 21:44, Boris Brezillon a =C3=A9crit :
> > The EBI (External Bus Interface) is used to access external periphe=
rals
> > (NOR, SRAM, NAND, and other specific devices like ethernet controll=
ers).
> > Each device is assigned a CS line and an address range and can have=
 its
> > own configuration (timings, access mode, bus width, ...).
> > This driver provides a generic DT binding to configure a device acc=
ording
> > to its requirements.
> > For specific device controllers (like the NAND one) the SMC timings
> > should be configured by the controller driver through the matrix an=
d smc
> > syscon regmaps.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  .../bindings/memory-controllers/atmel-ebi.txt      | 155 +++++++++=
++++++++++++
> >  1 file changed, 155 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/memory-contro=
llers/atmel-ebi.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/a=
tmel-ebi.txt b/Documentation/devicetree/bindings/memory-controllers/atm=
el-ebi.txt
> > new file mode 100644
> > index 0000000..3749ea1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/memory-controllers/atmel-eb=
i.txt
> > @@ -0,0 +1,155 @@
> > +* Device tree bindings for Atmel EBI
> > +
> > +The External Bus Interface (EBI) controller is a bus where you can=
 connect
> > +asynchronous (NAND, NOR, SRAM, ....) and synchronous memories (SDR=
/DDR SDRAMs).
> > +The EBI provides a glue-less interface to asynchronous memories th=
ough the SMC
> > +(Static Memory Controller).
> > +Synchronous memories (and some asynchronous memories like NANDs) c=
an be
> > +attached to specialized controllers which are responsible for conf=
iguring the
> > +bus appropriately according to the connected device.
> > +In the other hand, the bus interface can be automated for simple a=
synchronous
> > +devices.
> > +
> > +Required properties:
> > +
> > +- compatible:		"atmel,at91sam9260-ebi"
> > +			"atmel,at91sam9261-ebi"
> > +			"atmel,at91sam9263-ebi0"
> > +			"atmel,at91sam9263-ebi1"
> > +			"atmel,at91sam9g45-ebi"
> > +			"atmel,at91sam9x5-ebi"
> > +			"atmel,sama5d3-ebi"
> > +
> > +- reg:			Contains offset/length value for EBI memory mapping.
> > +			This property might contain several entries if the EBI
> > +			memory range is not contiguous
> > +
> > +- #address-cells:	Must be 2.
> > +			The first cell encodes the CS.
> > +			The second cell encode the offset into the CS memory
> > +			range.
> > +
> > +- #size-cells:		Must be set to 1.
> > +
> > +- ranges:		Encodes CS to memory region association.
> > +
> > +- clocks:		Clock feeding the EBI controller.
> > +			See clock-bindings.txt
> > +
> > +Child chip-select (cs) nodes contain the memory devices nodes conn=
ected to
> > +such as NOR (e.g. cfi-flash) and NAND.
> > +There might be board specific devices like FPGAs.
> > +You'll define you device requirements in these child nodes.
> > +
> > +Required child cs node properties:
> > +
> > +- #address-cells:	Must be 2.
> > +
> > +- #size-cells:		Must be 1.
> > +
> > +- ranges:		Empty property indicating that child nodes can inherit
> > +			memory layout.
> > +
> > +Optional child cs node properties:
> > +- atmel,generic-dev		boolean property specifying if the device is
> > +				a generic device.
>=20
> Here, you mean: "atmel,specialized-logic" and the corresponding text.=
=2E.
>=20

Yep, apparently I squashed the doc fixes in the wrong commit :-(.
I'll fix that.

Thanks,

Boris


--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
