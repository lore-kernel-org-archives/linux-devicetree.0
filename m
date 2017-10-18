From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/9] SOC: brcmstb: add memory API
Date: Tue, 17 Oct 2017 23:46:49 -0700
Message-ID: <20171018064649.GA7734@infradead.org>
References: <1507761269-7017-1-git-send-email-jim2101024@gmail.com>
 <1507761269-7017-2-git-send-email-jim2101024@gmail.com>
 <20171017082413.GA10574@infradead.org>
 <abdb1e9d-f8c9-8066-48c5-37b4e2474952@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <abdb1e9d-f8c9-8066-48c5-37b4e2474952@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jim Quinlan <jim2101024@gmail.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Gregory Fong <gregory.0xf0@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Brian Norris <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 09:12:22AM -0700, Florian Fainelli wrote:
> > Please move this into the arm arch code.
> 
> No, this needs to work on both ARM and ARM64, hence the reason why this
> is in a reasonably architecture neutral place.

So there is no other shared code between the ARM and ARM64 ports for
this SOC?

> >> +EXPORT_SYMBOL(brcmstb_memory_phys_addr_to_memc);
> > 
> >> +EXPORT_SYMBOL(brcmstb_memory_memc_size);
> > 
> > Why is this exported?
> 
> Because the PCIE RC driver can be built as a module.

Hmm, supporting PCIE RC as module sounds odd, but it seems like there
are a few others like that.  At least make it EXPORT_SYMBOL_GPL() then
to document the internal nature.
