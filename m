From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC 1/3] dt-binding: soc: qcom: Add binding for RFSA
Date: Sat, 29 Apr 2017 13:02:52 -0700
Message-ID: <20170429200252.GS15143@minitux>
References: <20170422173519.5782-1-bjorn.andersson@linaro.org>
 <20170428174239.x62opv5vzx2ce2wt@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170428174239.x62opv5vzx2ce2wt@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 28 Apr 10:42 PDT 2017, Rob Herring wrote:

> On Sat, Apr 22, 2017 at 10:35:17AM -0700, Bjorn Andersson wrote:
> > This adds the binding for describing shared memory buffers for
> > implementing the remote filesystem protocol.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > My initial attempt was to mimic the ramoops of just adding the compatible to
> > the reserved-memory node, but I have not been able to figure out a sane way of
> > getting hold of the base address in the case that the memory region is
> > described my a "size" only (done on some platforms).
> 
> I prefer the ramoops way.
> 

Me too :)

> > The problem is that we create the reserved_mem objects (and remove the
> > memblocks) while we're still operating on the flattened representation, so
> > without a phandle it doesn't seem like we have anything to perform the
> > comparison with later on.
> 
> I'm not sure I follow.
> 

In my first attempt I extended of_platform_default_populate_init() to
also probe my platform_driver and like ramoops acquired the values of
reg and memremap() these. This works fine.


But for some platforms the memory-region doesn't need a fixed location,
it's just required to be a consecutive chunk of physical ram. So I
replace the "reg = <>" with a "size = <>", this causes
__reserved_mem_alloc_size() to carve out a chunk of memory somewhere
and update the associated reserved_mem entry. The reserved_mem will be
populated with the phandle from the [flattened] of_node.

Later my platform_device is instantiated and I need to figure out the
base address that was picked earlier - so that I know which region to
memremap().

But as my "rfsa-node" stands on its own it will not have any "phandle",
so the reserved_mem->phandle will remain 0. Further more I only have the
unflattened of_node - so I can't just compare the address with the
flattened version previously used.

So the problem at hand is how to match my pdev->dev.of_node to an entry
in the reserved_mem array (in of_reserved_mem.c).

> > 
> >  .../devicetree/bindings/soc/qcom/qcom,rfsa.txt     | 43 ++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,rfsa.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rfsa.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,rfsa.txt
> > new file mode 100644
> > index 000000000000..b4de0de74e46
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rfsa.txt
> > @@ -0,0 +1,43 @@
> > +Qualcomm Remote File System Access binding
> > +
> > +This binding describes the Qualcomm RFSA, which serves the purpose of managing
> > +the shared memory region used for remote processors to access block device data
> > +using the Remote Filesystem protocol.
> > +
> > +- compatible:
> > +	Usage: required
> > +	Value type: <stringlist>
> > +	Definition: must be:
> > +		    "qcom,rfsa"
> 
> No versioning?
> 

The binding is used to describe a chunk of memory and an associated
client-id of this memory, so I'm not sure if we need a version.

> > +
> > +- memory-region:
> > +	Usage: required
> > +	Value type: <prop-encoded-array>
> > +	Definition: handle to memory reservation the associated rfsa region.
> > +
> > +- qcom,client-id:
> > +	Usage: required
> > +	Value type: <u32>
> > +	Definition: identifier of the client to use this region for buffers.
> 
> What determines these numbers?
> 

The bigger picture of this is that the remote processors (e.g. modem)
needs access to block storage, so it sends request to a service on the
system with storage access (i.e the application processor) which will
read and write from the file system, storing blocks of data in the
rfsa-memory.

So the client-id is the hard coded identifier of each such remote system
requesting IO - each one with its own memory carveout.


In later platforms we need to configure the SMMU for each remote in
order to give them access to these cerveouts, so I don't see that its
possible to mash them together in one chunk and handle the client-id
thing only in the application.

> > +
> > += EXAMPLE
> > +The following example shows the RFSA setup for APQ8016, with the RFSA region
> > +for the Hexagon DSP (id #1) located at 0x86700000.
> > +
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		rmtfs: rmtfs@86700000 {
> 
> I think you should have a compatible here even with the 2 node approach.
> 

I'm hoping we can figure out a way to fix the Linux implementation so
that we can describe it fully in one node.

> > +			reg = <0x0 0x86700000 0x0 0xe0000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	hexagon-rfsa {
> > +		compatible = "qcom,rfsa";
> > +		memory-region = <&rmtfs>;
> > +
> > +		qcom,client-id = <1>;
> > +	};
> > -- 
> > 2.12.0
> > 

Regards,
Bjorn
