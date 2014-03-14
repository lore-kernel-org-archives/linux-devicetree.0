From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v7 3/3] arm64: Add architecture support for PCI
Date: Fri, 14 Mar 2014 18:38:08 +0100
Message-ID: <201403141838.08900.arnd@arndb.de>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811258-1500-4-git-send-email-Liviu.Dudau@arm.com>
 <20140314171457.GK18126@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140314171457.GK18126@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, linux-pci <linux-pci@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, Grant Likely <grant.likely@secretlab.ca>, Tanmay Inamdar <tinamdar@apm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Friday 14 March 2014, Catalin Marinas wrote:
> On Fri, Mar 14, 2014 at 03:34:18PM +0000, Liviu Dudau wrote:
> > --- /dev/null
> > +++ b/arch/arm64/kernel/pci.c
> [...]
> > +int pci_register_io_range(phys_addr_t address, resource_size_t size)
> [...]
> > +unsigned long pci_address_to_pio(phys_addr_t address)
> [...]
> > +void pcibios_fixup_bus(struct pci_bus *bus)
> [ actually most of this file ]
> 
> Maybe it was raised before already but can we have __weak generic
> definitions of these functions? They don't seem to be arm64 specific in
> any way.
> 

I would definitely prefer that.

	Arnd
