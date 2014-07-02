From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v8 8/9] pci: Add support for creating a generic host_bridge from device tree
Date: Wed, 02 Jul 2014 21:09:06 +0200
Message-ID: <4233600.RyK6LJF6ZK@wuerfel>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com> <20140702172355.GQ2173@e106497-lin.cambridge.arm.com> <20140702173113.GJ24879@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140702173113.GJ24879@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, Device Tree ML <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 02 July 2014 18:31:13 Will Deacon wrote:
> > > > + err = of_pci_parse_bus_range(parent->of_node, bus_range);
> > > > + if (err) {
> > > > +         dev_info(parent, "No bus range for %s, using default [0-255]\n",
> > > > +                 parent->of_node->full_name);
> > > > +         bus_range->start = 0;
> > > > +         bus_range->end = 255;
> > > > +         bus_range->flags = IORESOURCE_BUS;
> > > 
> > > What about bus_range->name?
> > 
> > Don't know! Is anyone using it?
> 
> I guess /proc/iomem prints it out? I set it in my current driver, if you
> want to take a look.

I don't think the bus resources show up anywhere in procfs. Anyway, it's
always a good idea to give resources a name, if only for debugging purposes.

	Arnd
