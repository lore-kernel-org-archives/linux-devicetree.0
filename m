Return-Path: <SRS0=CBWg=M4=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20181010192315.26163-1-marex@denx.de> <CACRpkdbAWVWgmS-9vgqCV6Bp4wZSfnOOMJmx15vTx-HQBe0WoA@mail.gmail.com>
 <8e09ecc2-9757-4b59-bcf4-8c9ad62986d4@denx.de>
In-Reply-To: <8e09ecc2-9757-4b59-bcf4-8c9ad62986d4@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Oct 2018 09:37:56 +0200
Message-ID: <CACRpkdZkjL+V=DE2EC_o=5pkes-uXHe5tSgiz2M21i2PV41cGw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: altera-fpga-mgr: Add Altera FPGA
 manager GPIO bindings
Content-Type: text/plain; charset="UTF-8"
To: Marek Vasut <marex@denx.de>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 12, 2018 at 5:12 PM Marek Vasut <marex@denx.de> wrote:
> On 10/11/2018 10:44 AM, Linus Walleij wrote:
> > On Wed, Oct 10, 2018 at 9:23 PM Marek Vasut <marex@denx.de> wrote:
> >
> >> Add DT bindings for the GPI / GPO block in the Altera SoCFPGA FPGA manager.
> >> The GPIO block in the FPGA manager has two 32bit registers, one for setting
> >> 32 GPOs and another one for reading 32 GPIs, both of which can be mapped to
> >> separate physical pads.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> > (...)
> >
> >> +- gpio,syscon-dev: phandle/offset pair. The phandle to syscon used to
> >> +  access device state control registers and the offset of device's specific
> >> +  registers within device state control registers range.
> > (...)
> >> +               gpio,syscon-dev = <&fpgamgr0 0x10>;
> >
> > I didn't see that before.
> >
> > It is usually not a good idea to encode register offsets into the
> > device tree.
> >
> > I think the register offset should be in the driver and determined
> > from the compatible-string. If that is not possible, the compatible
> > strings do not really indicate compatibility, if you see what I mean.
> >
> > As for the name of the variable, why not just use:
> >
> > syscon = <&fpgamgr0>;
> >
> > It seems simple enough without any gpio,* prefix or explicitly
> > suffixing it with a "-dev" - every node in the device tree is a device
> > by definition so skip that.
>
> Isn't it better to just have one compatible string for all SoCFPGAs and
> handle the possible difference in offset where the registers are in DT?
> It's the same as "reg" property which we use to describe where a certain
> block is in the address space.

You have a point.

What about:

syscon = <&fpgamgr0>;
reg = <0x10>;
?

You can just parse out "reg" in the driver.

I mean reg is intuitively for that, so...

Yours,
Linus Walleij
