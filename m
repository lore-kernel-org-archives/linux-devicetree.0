MIME-Version: 1.0
Date: Wed, 17 Oct 2018 18:05:06 -0500
References: <20181010192315.26163-1-marex@denx.de>
	<CACRpkdbAWVWgmS-9vgqCV6Bp4wZSfnOOMJmx15vTx-HQBe0WoA@mail.gmail.com>
	<8e09ecc2-9757-4b59-bcf4-8c9ad62986d4@denx.de>
	<CACRpkdZkjL+V=DE2EC_o=5pkes-uXHe5tSgiz2M21i2PV41cGw@mail.gmail.com>
	<0fcdb6a1-f9c9-5af7-64b3-141d0f80c8fb@denx.de>
	<20181017195129.GA21054@bogus>
	<9d806bdb-cd58-c0c8-8752-ddad352fa52f@denx.de>
In-Reply-To: <9d806bdb-cd58-c0c8-8752-ddad352fa52f@denx.de>
Message-ID: <CAL_Jsq+1CaR8j=jo4sA=a9LS5m6ahe1kKQm1zK-u6GifsnTBxw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: altera-fpga-mgr: Add Altera FPGA
 manager GPIO bindings
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Oct 17, 2018 at 4:37 PM Marek Vasut <marex@denx.de> wrote:
>
> On 10/17/2018 09:51 PM, Rob Herring wrote:
> > On Tue, Oct 16, 2018 at 11:26:02AM +0200, Marek Vasut wrote:
> >> On 10/16/2018 09:37 AM, Linus Walleij wrote:
> >>> On Fri, Oct 12, 2018 at 5:12 PM Marek Vasut <marex@denx.de> wrote:
> >>>> On 10/11/2018 10:44 AM, Linus Walleij wrote:
> >>>>> On Wed, Oct 10, 2018 at 9:23 PM Marek Vasut <marex@denx.de> wrote:
> >>>>>
> >>>>>> Add DT bindings for the GPI / GPO block in the Altera SoCFPGA FPGA manager.
> >>>>>> The GPIO block in the FPGA manager has two 32bit registers, one for setting
> >>>>>> 32 GPOs and another one for reading 32 GPIs, both of which can be mapped to
> >>>>>> separate physical pads.
> >>>>>>
> >>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>>>> Cc: Rob Herring <robh+dt@kernel.org>
> >>>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>>>> (...)
> >>>>>
> >>>>>> +- gpio,syscon-dev: phandle/offset pair. The phandle to syscon used to
> >>>>>> +  access device state control registers and the offset of device's specific
> >>>>>> +  registers within device state control registers range.
> >>>>> (...)
> >>>>>> +               gpio,syscon-dev = <&fpgamgr0 0x10>;
> >>>>>
> >>>>> I didn't see that before.
> >>>>>
> >>>>> It is usually not a good idea to encode register offsets into the
> >>>>> device tree.
> >>>>>
> >>>>> I think the register offset should be in the driver and determined
> >>>>> from the compatible-string. If that is not possible, the compatible
> >>>>> strings do not really indicate compatibility, if you see what I mean.
> >>>>>
> >>>>> As for the name of the variable, why not just use:
> >>>>>
> >>>>> syscon = <&fpgamgr0>;
> >>>>>
> >>>>> It seems simple enough without any gpio,* prefix or explicitly
> >>>>> suffixing it with a "-dev" - every node in the device tree is a device
> >>>>> by definition so skip that.
> >>>>
> >>>> Isn't it better to just have one compatible string for all SoCFPGAs and
> >>>> handle the possible difference in offset where the registers are in DT?
> >>>> It's the same as "reg" property which we use to describe where a certain
> >>>> block is in the address space.
> >>>
> >>> You have a point.
> >>>
> >>> What about:
> >>>
> >>> syscon = <&fpgamgr0>;
> >>> reg = <0x10>;
> >>> ?
> >>>
> >>> You can just parse out "reg" in the driver.
> >>>
> >>> I mean reg is intuitively for that, so...
> >>
> >> But drivers/gpio/gpio-syscon.c already parses the gpio,syscon-dev
> >> binding, including the register offset. Why reinvent a new one if there
> >> already is one which fits perfectly ? :)
> >
> > Maybe so, but it is undocumented. And if you look at the Rockchip
> > addition to the driver, it was done a different way.
> >
> > Can't this be a child of the fpgamgr?
>
> We can, but won't it be easier to just reuse a binding which is already
> used by multiple compatibles ?

The gpio-syscon driver will lookup by compatible (of the syscon),
phandle (gpio,syscon-dev) or parent device. So I don't see any
difference in reuse. Unless there is some compelling reason to put
this node elsewhere, the most logical spot for a sub-function is under
its parent.

Rob
