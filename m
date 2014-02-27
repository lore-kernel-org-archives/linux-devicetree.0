From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 4/4] pci: Add support for creating a generic
 host_bridge from device tree
Date: Thu, 27 Feb 2014 14:48:44 +0100
Message-ID: <7910042.azG0y0Ppv9@wuerfel>
References: <1393506402-11474-1-git-send-email-Liviu.Dudau@arm.com>
 <1393506402-11474-5-git-send-email-Liviu.Dudau@arm.com>
 <18746655.qWHLpMg2Yy@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <18746655.qWHLpMg2Yy@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linaro-kernel@lists.linaro.org
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 27 February 2014 14:38:32 Arnd Bergmann wrote:
> > +     pr_debug("Parsing ranges property...\n");
> > +     for_each_of_pci_range(&parser, &range) {
> > +             /* Read next ranges element */
> > +             pr_debug("pci_space: 0x%08x pci_addr:0x%016llx ",
> > +                             range.pci_space, range.pci_addr);
> > +             pr_debug("cpu_addr:0x%016llx size:0x%016llx\n",
> > +                                     range.cpu_addr, range.size);
> > +
> > +             /*
> > +              * If we failed translation or got a zero-sized region
> > +              * then skip this range
> > +              */
> > +             if (range.cpu_addr == OF_BAD_ADDR || range.size == 0)
> > +                     continue;
> > +
> > +             res = kzalloc(sizeof(struct resource), GFP_KERNEL);
> > +             if (!res) {
> > +                     err = -ENOMEM;
> > +                     goto bridge_ranges_nomem;
> > +             }
> > +
> > +             of_pci_range_to_resource(&range, dev, res);
> > +
> > +             if (resource_type(res) == IORESOURCE_IO)
> > +                     *io_base = range.cpu_addr;
> > +
> > +             pci_add_resource_offset(resources, res,
> > +                             res->start - range.pci_addr);
> > +     }
> 
> This is not the correct resource for I/O space at all. Please talk
> to Will, I've been over this with him in detail and he probably
> understands it now. I assume you are both working in the same
> building.
> 

Sorry, I initially missed part of your changes in patch 1.
I think it's actually correct now.

	Arnd
