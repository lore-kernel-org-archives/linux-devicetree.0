From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v5 3/3] dt/bindings: qcom_nandc: Add DT bindings
Date: Wed, 6 Jan 2016 17:36:13 +0100
Message-ID: <20160106173613.2de41eed@bbrezillon>
References: <1439959746-25498-1-git-send-email-architt@codeaurora.org>
	<1451971501-18160-1-git-send-email-architt@codeaurora.org>
	<1451971501-18160-4-git-send-email-architt@codeaurora.org>
	<20160106151444.GA4131@rob-hp-laptop>
	<20160106163753.68f93f67@bbrezillon>
	<CAL_JsqLwyi2jxguJbYAqBTM9+9NHPc6FJ7Nrb9kMn1rwos-f6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLwyi2jxguJbYAqBTM9+9NHPc6FJ7Nrb9kMn1rwos-f6w@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Archit Taneja <architt@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Kevin Cernekee <cernekee@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, andy.gross@linaro.org, dehrenberg@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 6 Jan 2016 10:13:57 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, Jan 6, 2016 at 9:37 AM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Wed, 6 Jan 2016 09:14:44 -0600
> > Rob Herring <robh@kernel.org> wrote:
> >
> >> On Tue, Jan 05, 2016 at 10:55:01AM +0530, Archit Taneja wrote:
> >> > Add DT bindings document for the Qualcomm NAND controller driver.
> >> >
> >> > Cc: devicetree@vger.kernel.org
> >> > Cc: Rob Herring <robh@kernel.org>
> >> > Signed-off-by: Archit Taneja <architt@codeaurora.org>
> >> > ---
> >> > v5:
> >> > - Make changes to incorporate chip select sub nodes (brcmnand taken as
> >> >   reference)
> >> >
> >> > v3:
> >> > - Don't use '0x' when specifying nand controller address space
> >> > - Add optional property for on-flash bbt usage
> >> >
> >> >  .../devicetree/bindings/mtd/qcom_nandc.txt         | 84 ++++++++++++++++++++++
> >> >  1 file changed, 84 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> >> > new file mode 100644
> >> > index 0000000..b2cf2d9
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> >> > @@ -0,0 +1,84 @@
> >> > +* Qualcomm NAND controller
> >> > +
> >> > +Required properties:
> >> > +- compatible:              should be "qcom,ebi2-nand" for IPQ806x
> >>
> >> More specific name please.
> >>
> >> > +- reg:                     MMIO address range
> >> > +- clocks:          must contain core clock and always on clock
> >> > +- clock-names:             must contain "core" for the core clock and "aon" for the
> >> > +                   always on clock
> >> > +- dmas:                    DMA specifier, consisting of a phandle to the ADM DMA
> >> > +                   controller node and the channel number to be used for
> >> > +                   NAND. Refer to dma.txt and qcom_adm.txt for more details
> >> > +- dma-names:               must be "rxtx"
> >> > +- qcom,cmd-crci:   must contain the ADM command type CRCI block instance
> >> > +                   number specified for the NAND controller on the given
> >> > +                   platform
> >> > +- qcom,data-crci:  must contain the ADM data type CRCI block instance
> >> > +                   number specified for the NAND controller on the given
> >> > +                   platform
> >> > +- #address-cells:  <1> - subnodes give the chip-select number
> >> > +- #size-cells:             <0>
> >> > +
> >> > +* NAND chip-select
> >> > +
> >> > +Each controller may contain one or more subnodes to represent enabled
> >> > +chip-selects which (may) contain NAND flash chips. Their properties are as
> >> > +follows.
> >> > +
> >> > +Required properties:
> >> > +- compatible:              should contain "qcom,nandcs"
> >> > +- reg:                     a single integer representing the chip-select
> >> > +                   number (e.g., 0, 1, 2, etc.)
> >> > +- #address-cells:  see partition.txt
> >> > +- #size-cells:             see partition.txt
> >> > +- nand-ecc-strength:       number of bits to correct per ECC step. Must be 4 or 8
> >> > +                   bits.
> >> > +- nand-ecc-step-size:      bytes of data per ECC step. Must be 512.
> >> > +
> >> > +Optional properties:
> >> > +- nand-bus-width:  bus width. Must be 8 or 16. If not present, 8 is chosen
> >> > +                   as default
> >> > +
> >> > +Each nandcs device node may optionally contain sub-nodes describing the flash
> >> > +partition mapping. See partition.txt for more detail.
> >>
> >> Can't the partitioning span across chip selects? After all, interleaving
> >> is how you get high performance.
> >
> > Hm, defining aggregated mtd devices in the DT is not supported, and
> > since, as I've been told many times ;), DT is supposed to represent the
> > HW not what we want to do with it, I'm not sure that's such a good idea.
> 
> What are partitions then?

It's definitely not describing the hardware, and I never said
describing partitions in the DT was following the number one rule:
"only describe your HW" ;-).
I'm generally not in favor of this kind of restrictions, I'm just
pointing the irony of the situation here :p.

> 
> > Note that the infrastructure to concatenate several MTD devices
> > already exists, but it's not used by the NAND layer.
> >
> > Also note that some NAND chips embed several dies and expose multiple
> > CS lines. The NAND framework already supports assigning different CS
> > lines to a single NAND device, so you could abuse this feature and
> > expose your different NAND devices as a single one (that will only work
> > for a cluster of identical chips connected to the same controller), but
> > I'd really like to avoid this kind of things.
> 
> What exactly the kernel supports ATM is irrelevant. I'm fully aware
> that the kernel's NAND support has huge gaps in its ability to support
> raw NAND at typical SSD speeds. My last employer had delusions about
> doing that. Fortunately, NAND manufacturers don't really want to sell
> you raw NAND anyway.
> 
> My point here was only that the partitions node may not be under the
> CS nodes, but at the same level. Or maybe partitions in DT just
> doesn't make sense at all for interleaved cases.

IMHO, if we had to support this aggregation feature, the NAND cluster
should be represented using a different node, outside of the nand
controller node.
Theoretically, you can perfectly have several NAND chips connected to
different NAND controllers, but still want to aggregate those chips
into a single entity.

Anyway, that's not the topic here, and since other bindings are already
describing partitions under the nand device node and not the nand
controller node, I think we can keep doing like this until we find a
better solution.

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
