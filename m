From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Tue, 12 Jan 2016 23:52:48 +0100
Message-ID: <4731036.9QlepWb5cE@wuerfel>
References: <568912EE.9030009@huawei.com> <5694E9FF.6030904@huawei.com> <20160112151335.GS13633@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160112151335.GS13633@e106497-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: liviu.dudau@arm.com
Cc: Rongrong Zou <zourongrong@huawei.com>, Rongrong Zou <zourongrong@gmail.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Corey Minyard <minyard@acm.org>, gregkh@linuxfoundation.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linuxarm@huawei.com, benh@kernel.crashing.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 12 January 2016 15:13:35 liviu.dudau@arm.com wrote:
> > int of_address_to_resource(struct device_node *dev, int index,
> >                          struct resource *r)
> > {
> >       ...
> >       /* flags can be get here, without ranges property reqired.
> >        * if the reg = <0x0 0xe4 4>, I can get flag of IORESOURCE_MEM,
> >        * if the reg = <0x1 0xe4 4>, I can get flag of IORESOURCE_IO,
> 
> That is strange, the parent node has #address-cells = <2> so the first two numbers should be part
> of the address and not influence the flags. Can you add some debugging in of_get_address() and
> try to figure out what bus is used in  *flags = bus->get_flags(prop) ?
> 
> 

This is the standard ISA binding. The first cell is the address space
(IO or MEM), the second cell is the address within that space. This
is similar to how PCI works.

	Arnd
