From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845: Expand soc bus address range
Date: Wed, 16 Jan 2019 14:10:03 -0800
Message-ID: <20190116221003.GW9278@minitux>
References: <20190116071939.23136-1-bjorn.andersson@linaro.org>
 <154767410807.169631.11634052870112778681@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154767410807.169631.11634052870112778681@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Wed 16 Jan 13:28 PST 2019, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-01-15 23:19:39)
> > DMA addresses for devices on the soc bus must be constrained to the 36
> > address bits that the bus provides.  When no IOMMU is present then this
> > is easy--DMA addresses are just physical addresses and physical
> > addresses are (by definition) within the address bits of the bus.  When
> > an IOMMU is present, however, DMA addresses are virtual addresses.
> > Despite these addresses being virtual, however, they are still
> > constrained by the 36 address bits of the bus.
> > 
> > Unless dma-ranges is specified, which causes bus_dma_mask to be set, DMA
> > allocations for devices on the platform_bus will use all 48 address bits
> > available by the ARM SMMU. Causing addresses to be truncated on the bus.
> 
> I read it three times and still got confused by the statement that DMA
> addresses are virtual addresses. There are CPU virtual addresses, DMA
> addresses, IOVAs, and physical addresses. Stating that DMA addresses are
> virtual addresses makes it sound like we're talking about CPU virtual
> addresses.
> 

The addresses used behind the TBU are virtual and are referred to that
in the context of the SMMU. But I guess we can use one of the other
names for it, to distinguish it from the virtual addresses we normally
refer to my that name.

And you do it yourself in the first sentence below ;)


I'll grab a new cup of coffee and see what I can do to update this
section again...

> Maybe it would be clearer if it stated that DMA addresses are 1:1 with
> IOVAs (IO virtual addresses) when a device has an iommus property and
> 1:1 with physical addresses when that property is absent? When devices
> use an iommus property the DMA addresses that are generated in the
> absence of a dma-ranges property can have as many as 48 bits, as opposed
> to the default of 32 bits in the absence of an iommus property.
> Therefore we need to constrain the DMA addresses that devices which
> reside in the SoC node (including the SMMU) can use to be at most 36
> bits because that's the largest physical address the internal bus
> supports. This expands the size of DMA addresses that devices without an
> iommus property can use while also limiting the size that devices using
> SMMU can use.
> 

For devices not attached to the SMMU allocations are done from System
RAM, so afaict that means we use 33 address bits. So let's stick to some
form of "IOVA are physical addresses".

> > 
> > This patch increases the #size-cells to 2, in order to be able to define
> > dma-ranges describe the 36 bit DMA capability of the bus, and bumps
> 
> Did the commit text get cut off here?
> 

Looks like it, sorry about that.

> > 
> > While touching all reg properties, addresses are padded to 8 digits.
> > 
> 
> I liked the paint the way it was without the padding. It matched the
> unit address that way and didn't make anyone think they should pad that
> out in the node name with leading zeros so that 'reg' and unit address
> match.
> 

I agree with aesthetic aspect of this, but it does make sorting the
nodes faster - and I merely introduce what was already decided upon.

> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index c98b1937353b..fc01b1c93fe4 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -346,14 +346,15 @@
> >         };
> >  
> >         soc: soc {
> > -               #address-cells = <1>;
> > -               #size-cells = <1>;
> > -               ranges = <0 0 0 0xffffffff>;
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> 
> Do we need #size-cells = <2>? Maybe it could be #size-cells = <1> and we
> can avoid having to specify a second size entry that's always going to
> be 0 because we don't have devices with huge IO regions in the SoC. Or
> does it need to be 2 for the large size of the size element of
> dma-ranges and ranges here? Looking at the code I think we can rely on
> the size-cells of the parent node so I think it will work with size of 1
> here.
> 

The "length" part of dma-ranges is described using #size-cells number of
cells, so with 1 there's no way we can describe this being 36 bits.

As all hardware resides within the first 31 bits we could have stayed
with #address-cells = <1>, but that looks odd.

> > +               ranges = <0 0 0 0 0x10 0>;
> > +               dma-ranges = <0 0 0 0 0x10 0>;
> >                 compatible = "simple-bus";
> 
> It might also be a good idea to split the patch into two. The first
> patch would expand the reg properties and the second one would do the
> 0x10 change and add dma-ranges. Then if anything goes wrong with the
> second patch a quick revert is easier and smaller vs. the obviously good
> reg property expanding patch that should be a no-op.
> 

A revert of the dma-ranges comes with the result of all devices with an
iommu specified stops working, so the benefit would be to be able to
revert from a state that works in my testing to a state of e.g. not
working at all.

But splitting of the two concerns might bring clarity to the commit
message.

[..]
> >                 timer@17c90000 {
> > -                       #address-cells = <1>;
> > -                       #size-cells = <1>;
> > +                       #address-cells = <2>;
> > +                       #size-cells = <2>;
> >                         ranges;
> 
> These could be written with ranges to remap the child nodes into the
> address space of the parent. It would be nice to not change these
> wrapper nodes and reduce the diff in this patch by using different
> ranges properties.
> 

Do you mean to use ranges to map them down to 32-bits, or do you mean to
map them relative to the APPS_HM block?

If you mean the prior, I think the benefit of using the same addressing
format for all devices on the "platform bus" out weights the hassle of
changing these few lines.

The latter I would like to see as a separate commit regardless.

Regards,
Bjorn
