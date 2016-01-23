From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v15 5/6] fpga: fpga-area and fpga-bus: device tree control
 for FPGA
Date: Sat, 23 Jan 2016 01:07:45 +0100
Message-ID: <CAAtXAHcvB9qxsUOrfRe4AAAbUSpCrykbsLn7DnZ7bKQeaCCf0g@mail.gmail.com>
References: <1453317867-10422-1-git-send-email-atull@opensource.altera.com>
	<1453317867-10422-6-git-send-email-atull@opensource.altera.com>
	<CAAtXAHd9zC3+25Hb0mRvSX4E3O3kts4K-g8qzUuA7AaDPXH1gA@mail.gmail.com>
	<alpine.DEB.2.02.1601221021130.1187@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1601221021130.1187@linuxheads99>
Sender: linux-doc-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Rob Herring <robh+dt@kernel.org>, Josh Cartwright <joshc@ni.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 22, 2016 at 5:37 PM, atull <atull@opensource.altera.com> wrote:
> On Fri, 22 Jan 2016, Moritz Fischer wrote:
>
>> Alan,
>>
>> On Wed, Jan 20, 2016 at 8:24 PM,  <atull@opensource.altera.com> wrote:
>>
>> > +static int fpga_area_probe(struct platform_device *pdev)
>> > +{
>> > +       struct device *dev = &pdev->dev;
>> > +       struct device_node *np = dev->of_node;
>> > +       struct fpga_area *area;
>> > +       int ret;
>> > +
>> > +       area = devm_kzalloc(dev, sizeof(*area), GFP_KERNEL);
>> > +       if (!area)
>> > +               return -ENOMEM;
>> > +
>> > +       INIT_LIST_HEAD(&area->bridge_list);
>> > +
>> > +       ret = fpga_bridge_register(dev, "FPGA Area", NULL, area);
>> > +       if (ret)
>> > +               return ret;
>> > +       area->br = dev_get_drvdata(dev);
>> > +
>> > +       if (of_property_read_string(np, "firmware-name",
>> > +                                   &area->firmware_name)) {
>> > +               of_platform_populate(np, of_default_bus_match_table, NULL, dev);
>> > +               return 0;
>> > +       }
>>
>> This is the use case where the bootloader loaded the fpga, and you
>> just want to populate
>> the devices in the fabric, right?
>
> Hi Moritz,
>
> Yes
>
>>
>> > +       if (of_property_read_bool(np, "partial-reconfig"))
>> > +               area->flags |= FPGA_MGR_PARTIAL_RECONFIG;
>> > +
>> > +       ret = fpga_area_get_bus(area);
>> > +       if (ret) {
>> > +               dev_dbg(dev, "Should be child of a FPGA Bus");
>> > +               goto err_unreg;
>> > +       }
>>
>> Looking at socfpga.dtsi, would that mean that the fpgamgr0 node would
>> need to become a subnode of fpgabus@0 at the same place?
>>
>> i.e. /soc/fpgamgr@ff706000 -> /soc/fpgabus@0/fpgamgr@ff706000
>>
>> and the ranges property would be used to translate to the fpga memory
>> mapped space?
>>
>> I know we're going back and forth on this. I think Rob brought up a
>> similar question:
>> "Does the bus really go thru the fpgamgr and then the bridge as this
>> implies? Or fpgamgr is a sideband controller?"
>>
>> To which I think the answer is 'sideband' controller, yet with the new
>> bindings it looks like
>> the bus goes through the fpgamgr.
>
> Yeah, let's get this right.  First, let's be clear on the reason for FPGA Bus to
> exist.  There may be >1 FPGA in a system.  I want the FPGA Bus bring together
> the bridges and manager that are associated with a certain FPGA.  This allows
> the system designer to specify which FPGA is getting programmed with which
> image/hardware.  So at minimum, we need some way of associating a FPGA Bus with
> a FPGA Manager.

I see your argument for the FPGA bus. I agree that we need to
distinguish different FPGAs,
and we need a way to associate an area with a manager (and potentially bridges).

> As far as the target path is concerned, in the case of no bridges, we could have
> the overlay target the FPGA Bus instead of the FPGA Manager.  That may be more
> logical.  This would just be a documentation change; I think fpga-area.c will
> work OK if you specify the FPGA bus as your target (the manager still has to
> be a child of the bus so the bus knows what manager to use).

Could the bus not just use a phandle to the manager? Or the area a
phandle to the bus?
Like that one could have potentially disjunct groups. Say I have a SPI
device that is in an FPGA area.
With our current system, I'd have a FPGA Manager that needs to be a
child of the bus as child of the SPI controller
with the memory addresses being addresses on the SOC's memory bus:

spi_ctrl@deadbeef {
        fpga_bus@0 {
                fpgamgr@f8007000 {
                    mgr regs etc...
                ... and now the SPI slaves ...
                    slave@42 {
                    };
                };
        };
};

(or something like that, maybe I'm confused)

with my proposed one it looks like it would work with any bus (maybe
then areas would have to register with
the manager or something like that...)

spi_ctrl@deadbeef {
        fpga_area {
                fpga-mgr = <&fpgamgr0>;
                slave0@42 {
                };
        };
};

I keep bringing up SPI because it's another bus with addresses, not
because I think we should particularly
optimize for that use case ;-)

Cheers,

Moritz

PS: Feel free to 'break' my suggestion above. It's just an idea
