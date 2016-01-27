From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v15 1/6] fpga: add bindings document for fpga area and
 fpga bus
Date: Wed, 27 Jan 2016 22:15:31 +0100
Message-ID: <CAAtXAHfj8YCHhnwyRf9AztHXgZRb-4UK9-m+4V++7vdCJ7g96g@mail.gmail.com>
References: <1453317867-10422-1-git-send-email-atull@opensource.altera.com>
	<1453317867-10422-2-git-send-email-atull@opensource.altera.com>
	<20160125165302.GA14212@rob-hp-laptop>
	<alpine.DEB.2.02.1601261637440.18055@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1601261637440.18055@linuxheads99>
Sender: linux-kernel-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Rob Herring <robh@kernel.org>, Josh Cartwright <joshc@ni.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jan 27, 2016 at 9:24 PM, atull <atull@opensource.altera.com> wrote:

>> I think I said this before, but you should not need simple-bus. Having
>> it is wrong if the bus requires some configuration before enumerating
>> the child nodes. The way you have it, the bridge driver could probe
>> before the FPGA manager or vice-versa. I'm guessing one way will work
>> and the other will not, and you are getting lucky. You should also test
>> will the overlay applied before boot (i.e. single dtb with all areas
>> populated). The simple rule is does the node (containing simple-bus)
>> require configuration for child nodes to be accessed? If yes, you can't
>> use simple-bus.
>
> Yes you did say that before.  Thanks for the explanation here, it
> clarifies a lot.  I'll work on something that implements this without
> relying on luck and simple-busses.
>
>>
>> Part of your problem is you may need a custom match table. Using
>> of_default_bus_match_table will only match the immediate child nodes of
>> the starting node. Alternatively, you need to make the bridge node the
>> starting node.
>>
>
> Not sure what you ment here, maybe you mean leaving out the fpga-bus?
> I'm using fpga-bus to bring the specific manager and bridges together
> needed to handle reprogramming cycles on a specific FPGA.

While I see the grouping argument I don't see binding wise why the manager
needs to move into the bus. If each area specifies the bridges by handle,
would that make more sense?

> I can see reasons for having the fpga manager and also the bridges
> specified by phandle within a fpga-bus.  So an fpga-bus will add the
> following propertities:
>
>         fpga-mgr = <fpgamgr0>;
>         fpga-bridges = <bridge0>, <bridge1>;
>
>>
>> > +                   compatible = "altr,socfpga-fpga-mgr";
>> > +                   reg = <0xff706000 0x1000
>> > +                          0xffb90000 0x1000>;
>> > +                   interrupts = <0 175 4>;
>> > +           };
>> > +
>> > +           bridge@0 {
>>
>> Same here. Doesn't this bridge have some associated address range.
>>
>> Essentially, the hierarchy from child devices up to the root should
>> reflect the address decoding at each step.
>
> Yes
>
>>
>> > +                   compatible = "altr,socfpga-lwhps2fpga-bridge",
>> > +                                "simple-bus";
>> > +                   resets = <&rst LWHPS2FPGA_RESET>;
>> > +                   reset-names = "lwhps2fpga";
>> > +                   clocks = <&l4_main_clk>;
>> > +                   #address-cells = <0x1>;
>> > +                   #size-cells = <0x1>;
>> > +                   ranges;
>> > +           };
>> > +
>> > +           bridge@1 {
>> > +                   compatible = "altr,socfpga-hps2fpga-bridge";
>> > +                   resets = <&rst HPS2FPGA_RESET>;
>> > +                   reset-names = "hps2fpga";
>> > +                   clocks = <&l4_main_clk>;
>> > +           };
>> > +   };
>> > +

>> How do you not have a bridge? There has to be something preventing
>> access. Do you really mean the bridge and fpga-mgr blocks are combined
>> into 1?
>
> In the Xilinx case, the manager and bridge are still two hardware
> blocks but handled together by the manager driver.  I didn't want to
> make Moritz write a FPGA Bridge when he already had code that handled
> his hardware bridges when he told his manager to do a write cycle.

If we all feel that as a good abstraction bridges are necessary, I can add that.
They're basically level shifters that you turn on and off, there's nothing smart
beyond that. If you disable the bridge and try to access stuff it just
doesn't work.

> This could be called fpga-area or fpga-region.  More on that below.


>> Are the number of areas software configurable? If not, then the areas
>> should be part of the base DT rather than the overlay.
>
> The number of areas is set by the FPGA image that creates the areas.
> A base FPGA image could be loaded by the bootloader or by the OS with
> a set number of area slots available.

Not a big fan of this idea. See below. Somehow the info needs. That
seems like an unnatural abstraction for an FPGA. See below:
>
> So this could be done differently, divided into something where the
> areas (some call them "regions") are created in the live DT when the
> base FPGA image is loaded.  Then the overlays would have something
> called 'personas' that plug into them.  The areas would contain the
> information of which bridges to control and which fpga manager.  Maybe
> this heirarchy (indexes are probably screwed up below).
>
> Below, the fpga manager and hardware fpga bridges are specified
> outside the fpga bus and are referred to by phandles.  Leaving out
> ranges, cells for brevity.
>
> Live tree (after base FPGA image is loaded):
> fpga-bus@0 {
>         compatible = "fpga-bus";
>         fpga-mgr = <fpgamgr@something>;
>         fpga-bridges = <..>, <..>;
>
>         fpga-area@0 {
>                 compatible = "fpga-area";
>                 bridges = <bridge@>;
>         };
>
>         fpga-area@... {
>                 compatible = "fpga-area";
>                 bridges = <bridge@...>;
>         };
> };

Where would we get this info from, though? There would have to be a
first overlay to update the live tree, I suppose. Or anything that updates
the live tree based on the non-inspectable bitstream / firmware.

How would the above make the connection between the address hierarchy
i.e. fpga-area and bus the FPGA logic is child of. In the same image
one area could be
connected via ... GMII and MDIO while another one is connected via AXI4 (mmio),
SPI or I2C.

I checked on socfpga you can also (as well as zynq) implement the e.g.
sgmii part
of a gigabit ethernet connection to an sfp connector in the FPGA.
In that case the address hierarchy would be (in my opinion) an
fpga-area as a child node of
your gigabit mac containing the phy.

Tell me if I'm crazy. Communication is hard :) Maybe I'm trying to
solve, too many
issues at the same time. And we should tackle this separately using
some sort of connector
mapping as Rob suggested in one of the last mails.

> The overlay would target one of the fpga-area's and contain
> the firmware-name and children.
>
> In the case of full reconfiguration, there would not be any
> fpga-areas.  The overlay would target the fpga-bus.

Or a single area for consistency reasons? Full reconfiguration is just
a special case of partial reconfiguration,
right?

Cheers,

Moritz
