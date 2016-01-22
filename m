From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v15 5/6] fpga: fpga-area and fpga-bus: device tree control
 for FPGA
Date: Fri, 22 Jan 2016 10:37:26 -0600
Message-ID: <alpine.DEB.2.02.1601221021130.1187@linuxheads99>
References: <1453317867-10422-1-git-send-email-atull@opensource.altera.com> <1453317867-10422-6-git-send-email-atull@opensource.altera.com> <CAAtXAHd9zC3+25Hb0mRvSX4E3O3kts4K-g8qzUuA7AaDPXH1gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHd9zC3+25Hb0mRvSX4E3O3kts4K-g8qzUuA7AaDPXH1gA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Rob Herring <robh+dt@kernel.org>, Josh Cartwright <joshc@ni.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Fri, 22 Jan 2016, Moritz Fischer wrote:

> Alan,
> 
> On Wed, Jan 20, 2016 at 8:24 PM,  <atull@opensource.altera.com> wrote:
> 
> > +static int fpga_area_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct device_node *np = dev->of_node;
> > +       struct fpga_area *area;
> > +       int ret;
> > +
> > +       area = devm_kzalloc(dev, sizeof(*area), GFP_KERNEL);
> > +       if (!area)
> > +               return -ENOMEM;
> > +
> > +       INIT_LIST_HEAD(&area->bridge_list);
> > +
> > +       ret = fpga_bridge_register(dev, "FPGA Area", NULL, area);
> > +       if (ret)
> > +               return ret;
> > +       area->br = dev_get_drvdata(dev);
> > +
> > +       if (of_property_read_string(np, "firmware-name",
> > +                                   &area->firmware_name)) {
> > +               of_platform_populate(np, of_default_bus_match_table, NULL, dev);
> > +               return 0;
> > +       }
> 
> This is the use case where the bootloader loaded the fpga, and you
> just want to populate
> the devices in the fabric, right?

Hi Moritz,

Yes

> 
> > +       if (of_property_read_bool(np, "partial-reconfig"))
> > +               area->flags |= FPGA_MGR_PARTIAL_RECONFIG;
> > +
> > +       ret = fpga_area_get_bus(area);
> > +       if (ret) {
> > +               dev_dbg(dev, "Should be child of a FPGA Bus");
> > +               goto err_unreg;
> > +       }
> 
> Looking at socfpga.dtsi, would that mean that the fpgamgr0 node would
> need to become a subnode of fpgabus@0 at the same place?
> 
> i.e. /soc/fpgamgr@ff706000 -> /soc/fpgabus@0/fpgamgr@ff706000
> 
> and the ranges property would be used to translate to the fpga memory
> mapped space?
> 
> I know we're going back and forth on this. I think Rob brought up a
> similar question:
> "Does the bus really go thru the fpgamgr and then the bridge as this
> implies? Or fpgamgr is a sideband controller?"
> 
> To which I think the answer is 'sideband' controller, yet with the new
> bindings it looks like
> the bus goes through the fpgamgr.

Yeah, let's get this right.  First, let's be clear on the reason for FPGA Bus to
exist.  There may be >1 FPGA in a system.  I want the FPGA Bus bring together
the bridges and manager that are associated with a certain FPGA.  This allows
the system designer to specify which FPGA is getting programmed with which
image/hardware.  So at minimum, we need some way of associating a FPGA Bus with
a FPGA Manager.

As far as the target path is concerned, in the case of no bridges, we could have
the overlay target the FPGA Bus instead of the FPGA Manager.  That may be more
logical.  This would just be a documentation change; I think fpga-area.c will
work OK if you specify the FPGA bus as your target (the manager still has to
be a child of the bus so the bus knows what manager to use).

Alan

> 
> Cheers,
> 
> Moritz
> 
