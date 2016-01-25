From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v15 5/6] fpga: fpga-area and fpga-bus: device tree control
 for FPGA
Date: Mon, 25 Jan 2016 10:17:47 -0600
Message-ID: <CAL_Jsq+tB4O=Ja3F045yT5DTcAt8C=NkQn6KeCCz8xmdYFQ2oA@mail.gmail.com>
References: <1453317867-10422-1-git-send-email-atull@opensource.altera.com>
 <1453317867-10422-6-git-send-email-atull@opensource.altera.com>
 <CAAtXAHd9zC3+25Hb0mRvSX4E3O3kts4K-g8qzUuA7AaDPXH1gA@mail.gmail.com>
 <alpine.DEB.2.02.1601221021130.1187@linuxheads99> <CAAtXAHcvB9qxsUOrfRe4AAAbUSpCrykbsLn7DnZ7bKQeaCCf0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHcvB9qxsUOrfRe4AAAbUSpCrykbsLn7DnZ7bKQeaCCf0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: atull <atull@opensource.altera.com>, Josh Cartwright <joshc@ni.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 22, 2016 at 6:07 PM, Moritz Fischer
<moritz.fischer@ettus.com> wrote:
> On Fri, Jan 22, 2016 at 5:37 PM, atull <atull@opensource.altera.com> wrote:
>> On Fri, 22 Jan 2016, Moritz Fischer wrote:
>>
>>> Alan,
>>>
>>> On Wed, Jan 20, 2016 at 8:24 PM,  <atull@opensource.altera.com> wrote:
>>>
>>> > +static int fpga_area_probe(struct platform_device *pdev)
>>> > +{
>>> > +       struct device *dev = &pdev->dev;
>>> > +       struct device_node *np = dev->of_node;
>>> > +       struct fpga_area *area;
>>> > +       int ret;
>>> > +
>>> > +       area = devm_kzalloc(dev, sizeof(*area), GFP_KERNEL);
>>> > +       if (!area)
>>> > +               return -ENOMEM;
>>> > +
>>> > +       INIT_LIST_HEAD(&area->bridge_list);
>>> > +
>>> > +       ret = fpga_bridge_register(dev, "FPGA Area", NULL, area);
>>> > +       if (ret)
>>> > +               return ret;
>>> > +       area->br = dev_get_drvdata(dev);
>>> > +
>>> > +       if (of_property_read_string(np, "firmware-name",
>>> > +                                   &area->firmware_name)) {
>>> > +               of_platform_populate(np, of_default_bus_match_table, NULL, dev);
>>> > +               return 0;
>>> > +       }
>>>
>>> This is the use case where the bootloader loaded the fpga, and you
>>> just want to populate
>>> the devices in the fabric, right?
>>
>> Hi Moritz,
>>
>> Yes

That is very strange logic. It should be fine to just call
of_platform_populate unconditionally. If there are no children of np,
then it will be a nop.

>>> > +       if (of_property_read_bool(np, "partial-reconfig"))
>>> > +               area->flags |= FPGA_MGR_PARTIAL_RECONFIG;
>>> > +
>>> > +       ret = fpga_area_get_bus(area);
>>> > +       if (ret) {
>>> > +               dev_dbg(dev, "Should be child of a FPGA Bus");
>>> > +               goto err_unreg;
>>> > +       }
>>>
>>> Looking at socfpga.dtsi, would that mean that the fpgamgr0 node would
>>> need to become a subnode of fpgabus@0 at the same place?
>>>
>>> i.e. /soc/fpgamgr@ff706000 -> /soc/fpgabus@0/fpgamgr@ff706000
>>>
>>> and the ranges property would be used to translate to the fpga memory
>>> mapped space?
>>>
>>> I know we're going back and forth on this. I think Rob brought up a
>>> similar question:
>>> "Does the bus really go thru the fpgamgr and then the bridge as this
>>> implies? Or fpgamgr is a sideband controller?"
>>>
>>> To which I think the answer is 'sideband' controller, yet with the new
>>> bindings it looks like
>>> the bus goes through the fpgamgr.
>>
>> Yeah, let's get this right.  First, let's be clear on the reason for FPGA Bus to
>> exist.  There may be >1 FPGA in a system.  I want the FPGA Bus bring together
>> the bridges and manager that are associated with a certain FPGA.  This allows
>> the system designer to specify which FPGA is getting programmed with which
>> image/hardware.  So at minimum, we need some way of associating a FPGA Bus with
>> a FPGA Manager.
>
> I see your argument for the FPGA bus. I agree that we need to
> distinguish different FPGAs,
> and we need a way to associate an area with a manager (and potentially bridges).
>
>> As far as the target path is concerned, in the case of no bridges, we could have
>> the overlay target the FPGA Bus instead of the FPGA Manager.  That may be more
>> logical.  This would just be a documentation change; I think fpga-area.c will
>> work OK if you specify the FPGA bus as your target (the manager still has to
>> be a child of the bus so the bus knows what manager to use).
>
> Could the bus not just use a phandle to the manager? Or the area a
> phandle to the bus?

That may be better as it would avoid the virtual fpga-bus which is a
bit questionable. I'm okay with allowing it, but will happily take any
examples where it doesn't work. However, I'm not sure this case is
one.

> Like that one could have potentially disjunct groups. Say I have a SPI
> device that is in an FPGA area.
> With our current system, I'd have a FPGA Manager that needs to be a
> child of the bus as child of the SPI controller
> with the memory addresses being addresses on the SOC's memory bus:
>
> spi_ctrl@deadbeef {
>         fpga_bus@0 {
>                 fpgamgr@f8007000 {
>                     mgr regs etc...
>                 ... and now the SPI slaves ...
>                     slave@42 {
>                     };
>                 };
>         };
> };

I think Alan's assumption is there's always a memory mapped control
interface and the DT hierarchy follows that. While I see you could
have other interfaces like SPI, that would not be the control
interface related to FPGA programming AIUI. You could also have GPIOs,
I2C, or any other bus/interface we describe in DT in theory.

How to deal with additional connections like this is similar to
overlays for daughterboards (e.g. capes, hats, shields) where the need
for mapping slave devices on a connector to host controllers/buses
which can vary. In that case, you don't want to have to create a
different overlay for every host board just to change the parent
devices of each child. If there is a SPI connection to FPGA (or area),
then we need a way to map the host SPI bus to the FPGA. In this
example, the overlay should only say "slave@42" is connected to the
spi bus of the FPGA area and it would not have direct reference to
"spi_ctrl@deadbeef." There's some ideas around how to support these
usecases probably involving a connector node with mappings of
connector i/o's to host i/o's (paging Pantelis, where's your
proposal?). I think the same would work here, so I would suggest we
not try to address it immediately other than decide the requirements
here are similar enough to what is needed for connectors.

Rob
